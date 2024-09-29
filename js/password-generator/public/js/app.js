const $ = selector => document.querySelector(selector);

function generatePassword() {
  const length = $('#length').value || 12;
  const includeSymbols = $('#include-symbols').checked;
  const includeNumbers = $('#include-numbers').checked;
  const includeUppercase = $('#include-uppercase').checked;

  let charset = "abcdefghijklmnopqrstuvwxyz";
  if (includeUppercase) charset += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  if (includeNumbers) charset += "0123456789";
  if (includeSymbols) charset += "!@#$%^&*()_+[]{}|;:,.<>?";

  let password = "";
  for (let i = 0; i < length; i++) {
    password += charset.charAt(Math.floor(Math.random() * charset.length));
  }

  $('#password').value = password;
  saveSettings();
}

function toggleSettings() {
  $('.settings').classList.toggle('hidden');
}

function saveSettings() {
  const settings = {
    length: $('#length').value,
    includeSymbols: $('#include-symbols').checked,
    includeNumbers: $('#include-numbers').checked,
    includeUppercase: $('#include-uppercase').checked
  };
  localStorage.setItem('passwordSettings', JSON.stringify(settings));
}

function loadSettings() {
  const savedSettings = JSON.parse(localStorage.getItem('passwordSettings'));
  if (savedSettings) {
    $('#length').value = savedSettings.length;
    $('#include-symbols').checked = savedSettings.includeSymbols;
    $('#include-numbers').checked = savedSettings.includeNumbers;
    $('#include-uppercase').checked = savedSettings.includeUppercase;
  }
}

document.addEventListener('DOMContentLoaded', loadSettings);

