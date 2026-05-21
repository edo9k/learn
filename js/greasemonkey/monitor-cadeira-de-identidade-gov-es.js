// ==UserScript==
// @name         Monitor de Vagas - SPA (URL fixa)
// @namespace    https://agenda.es.gov.br
// @version      2.4
// @description  Verifica cidades, envia e-mail com cooldown e logs para Axiom. Credenciais salvas no localStorage. Inclui verificação de sessão.
// @author       Who Knows
// @match        https://agenda.es.gov.br/agendamento/7e1a8426-f5cb-4d0a-81dd-a8e670b1b9fe
// @require      https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js
// @grant        GM_notification
// @grant        GM_setValue
// @grant        GM_getValue
// @grant        unsafeWindow
// ==/UserScript==

(function() {
    'use strict';

    // ========== SITE CONFIGURATION (hardcoded) ==========
    const CITIES = [
        { name: "Serra", selector: "#appAgendamento > div > section:nth-child(3) > div > div:nth-child(4) > div:nth-child(5) > div" },
        { name: "Vitoria", selector: "#appAgendamento > div > section:nth-child(3) > div > div:nth-child(4) > div:nth-child(8) > div" },
        { name: "Linhares", selector: "#appAgendamento > div > section:nth-child(3) > div > div:nth-child(5) > div:nth-child(9) > div" },
        { name: "Aracruz", selector: "#appAgendamento > div > section:nth-child(3) > div > div:nth-child(5) > div:nth-child(3) > div" },
        { name: "Vila Velha", selector: "#appAgendamento > div > section:nth-child(3) > div > div:nth-child(4) > div:nth-child(7) > div" }
    ];

    const TARGET_TEXT = "não possui mais vagas";
    const SESSION_CHECK_TEXT = "Consulte as vagas nos municípios abaixo";
    const TIME_AFTER_CLICK_MS = 4000;
    const TIME_BETWEEN_CITIES_MS = 3000;
    const BACK_BUTTON_SELECTOR = "#appAgendamento > div > section.es-section.es-bg-light-2.container-fluid > div > div > div > div > div.ag-breadcrumb.d-none.d-sm-flex > div.ag-breadcrumb-item.item-definido > i";
    const MORNING_INTERVAL_MS = 5 * 60 * 1000;   // 5 minutes
    const NORMAL_INTERVAL_MS = 45 * 60 * 1000;  // 45 minutes
    const EMAIL_COOLDOWN_MS = 60 * 60 * 3000;   // 3 hour cooldown

    // ========== LOCALSTORAGE KEYS ==========
    const STORAGE_KEYS = {
        EMAILJS_PUBLIC_KEY: 'monitor_emailjs_public_key',
        EMAILJS_SERVICE_ID: 'monitor_emailjs_service_id',
        EMAILJS_TEMPLATE_ID: 'monitor_emailjs_template_id',
        AXIOM_TOKEN: 'monitor_axiom_token',
        AXIOM_DATASET: 'monitor_axiom_dataset',
        LAST_EMAIL_TIMESTAMP: 'monitor_last_email_timestamp'
    };

    // ========== GLOBAL VARIABLES ==========
    let emailjsConfig = null;
    let axiomConfig = null;
    let citiesWithVacancies = [];
    let pendingLogs = [];

    // ========== CREDENTIALS MANAGEMENT ==========
    function loadCredentials() {
        return {
            emailjs: {
                publicKey: localStorage.getItem(STORAGE_KEYS.EMAILJS_PUBLIC_KEY),
                serviceID: localStorage.getItem(STORAGE_KEYS.EMAILJS_SERVICE_ID),
                templateID: localStorage.getItem(STORAGE_KEYS.EMAILJS_TEMPLATE_ID)
            },
            axiom: {
                token: localStorage.getItem(STORAGE_KEYS.AXIOM_TOKEN),
                dataset: localStorage.getItem(STORAGE_KEYS.AXIOM_DATASET) || 'monitor-vagas'
            }
        };
    }

    function saveCredentials(emailjs, axiomToken, axiomDataset) {
        localStorage.setItem(STORAGE_KEYS.EMAILJS_PUBLIC_KEY, emailjs.publicKey);
        localStorage.setItem(STORAGE_KEYS.EMAILJS_SERVICE_ID, emailjs.serviceID);
        localStorage.setItem(STORAGE_KEYS.EMAILJS_TEMPLATE_ID, emailjs.templateID);
        localStorage.setItem(STORAGE_KEYS.AXIOM_TOKEN, axiomToken);
        localStorage.setItem(STORAGE_KEYS.AXIOM_DATASET, axiomDataset);
    }

    function configureCredentials() {
        const publicKey = prompt("Enter your EmailJS Public Key:", localStorage.getItem(STORAGE_KEYS.EMAILJS_PUBLIC_KEY) || "");
        if (!publicKey) return false;
        const serviceID = prompt("Enter your EmailJS Service ID:", localStorage.getItem(STORAGE_KEYS.EMAILJS_SERVICE_ID) || "");
        if (!serviceID) return false;
        const templateID = prompt("Enter your EmailJS Template ID:", localStorage.getItem(STORAGE_KEYS.EMAILJS_TEMPLATE_ID) || "");
        if (!templateID) return false;
        const axiomToken = prompt("Enter your Axiom API Token (starts with xaat-):", localStorage.getItem(STORAGE_KEYS.AXIOM_TOKEN) || "");
        if (!axiomToken) return false;
        const axiomDataset = prompt("Enter your Axiom Dataset name (default: monitor-vagas):", localStorage.getItem(STORAGE_KEYS.AXIOM_DATASET) || "monitor-vagas");

        saveCredentials({ publicKey, serviceID, templateID }, axiomToken, axiomDataset);
        alert("Credentials saved successfully! The page will reload.");
        location.reload();
        return true;
    }

    // ========== INITIALIZATION ==========
    function initialize() {
        const creds = loadCredentials();
        if (!creds.emailjs.publicKey || !creds.emailjs.serviceID || !creds.emailjs.templateID || !creds.axiom.token) {
            console.warn("Credentials not found. Please configure now.");
            const configured = configureCredentials();
            if (!configured) {
                alert("Configuration cancelled. Script will not run.");
                return false;
            }
            const newCreds = loadCredentials();
            emailjsConfig = newCreds.emailjs;
            axiomConfig = {
                dataset: newCreds.axiom.dataset,
                token: newCreds.axiom.token,
                endpoint: `https://api.axiom.co/v1/datasets/${newCreds.axiom.dataset}/ingest`
            };
        } else {
            emailjsConfig = creds.emailjs;
            axiomConfig = {
                dataset: creds.axiom.dataset,
                token: creds.axiom.token,
                endpoint: `https://api.axiom.co/v1/datasets/${creds.axiom.dataset}/ingest`
            };
        }
        emailjs.init(emailjsConfig.publicKey);
        return true;
    }

    // ========== COOLDOWN MANAGEMENT ==========
    function getLastEmailTimestamp() {
        const ts = localStorage.getItem(STORAGE_KEYS.LAST_EMAIL_TIMESTAMP);
        return ts ? parseInt(ts) : 0;
    }

    function setLastEmailTimestamp() {
        localStorage.setItem(STORAGE_KEYS.LAST_EMAIL_TIMESTAMP, Date.now());
    }

    function shouldSendEmail() {
        const lastSent = getLastEmailTimestamp();
        const now = Date.now();
        if (now - lastSent < EMAIL_COOLDOWN_MS) {
            const remainingMinutes = Math.ceil((EMAIL_COOLDOWN_MS - (now - lastSent)) / 60000);
            console.log(`Email cooldown active. ${remainingMinutes} minutes remaining.`);
            return false;
        }
        return true;
    }

    // ========== LOGGING TO AXIOM ==========
    async function sendLogToAxiom(level, message, data = {}) {
        if (!axiomConfig || !axiomConfig.token) return;
        const logEntry = {
            _time: new Date().toISOString(),
            level: level,
            message: message,
            ...data
        };
        console[level === 'error' ? 'error' : (level === 'warn' ? 'warn' : 'log')](`[${level.toUpperCase()}] ${message}`, data);
        try {
            const response = await fetch(axiomConfig.endpoint, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${axiomConfig.token}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify([logEntry])
            });
            if (!response.ok) {
                const errorText = await response.text();
                console.warn(`Failed to send log to Axiom: ${response.status} - ${errorText}`);
            }
        } catch (error) {
            console.warn(`Network error while sending log: ${error.message}`);
            pendingLogs.push(logEntry);
        }
    }

    // ========== SESSION VERIFICATION ==========
    async function verifySessionAfterReturn() {
        await wait(2000);
        const pageText = document.body.innerText;
        const sessionValid = pageText.includes(SESSION_CHECK_TEXT);
        if (!sessionValid) {
            const errorMsg = "Session expired or user logged out. Missing text: '" + SESSION_CHECK_TEXT + "'";
            console.error(errorMsg);
            await sendLogToAxiom('error', errorMsg, { expected_text: SESSION_CHECK_TEXT, url: window.location.href });
            GM_notification({
                title: "⚠️ Session Expired!",
                text: "You have been logged out. The script will continue but checks may fail.",
                timeout: 10000
            });
        } else {
            await sendLogToAxiom('info', 'Session is valid', { session_text_found: true });
        }
        return sessionValid;
    }

    // ========== EMAIL NOTIFICATION (with cooldown) ==========
    async function sendEmail() {
        if (citiesWithVacancies.length === 0) return;

        // Check cooldown before sending
        if (!shouldSendEmail()) {
            const lastSent = getLastEmailTimestamp();
            const lastSentDate = new Date(lastSent).toLocaleString();
            await sendLogToAxiom('info', 'Email not sent due to cooldown', {
                cities_with_vacancies: citiesWithVacancies,
                last_email_sent: lastSentDate,
                cooldown_minutes: EMAIL_COOLDOWN_MS / 60000
            });
            return;
        }

        const list = citiesWithVacancies.join("\n");
        const templateParams = {
            cidades: citiesWithVacancies.length,
            lista: list,
            url: window.location.href,
            data_hora: new Date().toLocaleString()
        };
        try {
            await emailjs.send(emailjsConfig.serviceID, emailjsConfig.templateID, templateParams);
            setLastEmailTimestamp(); // Update cooldown timestamp
            await sendLogToAxiom('info', 'Email sent successfully', { cities_with_vacancies: citiesWithVacancies });
        } catch (error) {
            console.error("❌ Failed to send email:", error);
            await sendLogToAxiom('error', 'Failed to send email', { error: error.message });
        }
    }

    function wait(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    // ========== CITY CHECK LOGIC ==========
    async function checkCity(city) {
        await sendLogToAxiom('info', `Checking city: ${city.name}`);
        const element = document.querySelector(city.selector);
        if (!element) {
            const errorMsg = `Selector not found for ${city.name}: ${city.selector}`;
            console.error(errorMsg);
            await sendLogToAxiom('error', errorMsg);
            return false;
        }
        element.click();
        await wait(TIME_AFTER_CLICK_MS);

        const pageText = document.body.innerText;
        const hasVacancy = !pageText.includes(TARGET_TEXT);
        if (hasVacancy) {
            console.log(`✅ ${city.name}: HAS VACANCY!`);
            citiesWithVacancies.push(city.name);
            await sendLogToAxiom('info', `Vacancy detected in ${city.name}`, { city: city.name, vacancies_available: true });
        } else {
            await sendLogToAxiom('info', `No vacancy in ${city.name}`, { city: city.name, vacancies_available: false });
        }

        // Return to city list (homepage)
        if (BACK_BUTTON_SELECTOR) {
            const backButton = document.querySelector(BACK_BUTTON_SELECTOR);
            if (backButton) {
                backButton.click();
                await wait(TIME_BETWEEN_CITIES_MS);
                await verifySessionAfterReturn();
            } else {
                console.warn("Back button not found. Reloading page...");
                await sendLogToAxiom('warn', 'Back button not found, reloading page');
                location.reload();
                await wait(3000);
                await verifySessionAfterReturn();
            }
        } else {
            location.reload();
            await wait(3000);
            await verifySessionAfterReturn();
        }
        return hasVacancy;
    }

    function getNextReloadInterval() {
        const now = new Date();
        const hour = now.getHours();
        if (hour >= 5 && hour < 9) {
            return MORNING_INTERVAL_MS;
        } else {
            return NORMAL_INTERVAL_MS;
        }
    }

    async function startMonitoring() {
        await verifySessionAfterReturn();
        await sendLogToAxiom('info', '🚀 Starting city check', { cities: CITIES.map(c => c.name) });
        citiesWithVacancies = [];
        for (let city of CITIES) {
            await checkCity(city);
        }
        await generateReport();
    }

    async function generateReport() {
        const result = {
            cities_with_vacancies: citiesWithVacancies,
            total_with_vacancies: citiesWithVacancies.length,
            cities_checked: CITIES.map(c => ({ name: c.name, has_vacancy: citiesWithVacancies.includes(c.name) }))
        };

        if (citiesWithVacancies.length > 0) {
            const list = citiesWithVacancies.join("\n");
            GM_notification({
                title: "🚨 VACANCIES AVAILABLE!",
                text: `${citiesWithVacancies.length} city(ies) with vacancies. Click to view.`,
                timeout: 30000,
                onclick: () => window.focus()
            });
            alert(`VACANCIES AVAILABLE:\n${list}\n\nGo to the site immediately!`);
            await sendEmail(); // Cooldown check inside
        } else {
            //GM_notification({
            //    title: "Vacancy Monitor",
            //    text: "No vacancies found in this run.",
            //    timeout: 5000
            //});
            await sendLogToAxiom('info', "No vancancies found in this run.");
        }

        await sendLogToAxiom('info', 'Check completed', result);

        if (pendingLogs.length > 0) {
            await sendLogToAxiom('info', `Reprocessing ${pendingLogs.length} pending logs`);
            pendingLogs = [];
        }

        const intervalMs = getNextReloadInterval();
        const minutes = intervalMs / 60000;
        await sendLogToAxiom('info', `⏰ Next check in ${minutes} minute(s)`);
        setTimeout(() => {
            location.reload();
        }, intervalMs);
    }

    // ========== ENTRY POINT ==========
    window.addEventListener('load', () => {
        const initialized = initialize();
        if (initialized !== false) {
            setTimeout(startMonitoring, 2000);
        } else {
            console.error("Script not initialized due to missing credentials.");
        }
    });
})();
