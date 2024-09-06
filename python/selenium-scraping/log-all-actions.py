from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options

# Setup Chrome options
chrome_options = Options()
chrome_options.add_argument("--start-maximized")  # Start maximized for visibility

# Use WebDriver Manager to get the correct chromedriver path
driver_service = Service(ChromeDriverManager().install())

# Initialize WebDriver with the driver
driver = webdriver.Chrome(service=driver_service, options=chrome_options)

# Navigate to the specified URL
driver.get("https://duck.ai") 

# JavaScript to log interactions
script = """
let interactions = [];

// Function to compute the full XPath of an element
function getElementXPath(element) {
    if (!element) {
        return '';
    }
    if (element.id) {
        return 'id("'+element.id+'")';
    }
    if (element === document.body) {
        return '/html';
    }
    var ix = 0;
    var siblings = element.parentNode ? element.parentNode.childNodes : [];
    for (var i = 0; i < siblings.length; i++) {
        var sibling = siblings[i];
        if (sibling.nodeType === 1 && sibling.tagName === element.tagName) {
            ix++;
        }
        if (sibling === element) {
            return getElementXPath(element.parentNode) + '/' + element.tagName.toLowerCase() + '[' + ix + ']';
        }
    }
    return ''; // Return empty if element is not found
}



function generatePythonCode(interactions) {
    let pythonCode = `from selenium import webdriver\\nfrom selenium.webdriver.common.by import By\\n\\n`;
    pythonCode += `# Initialize WebDriver\\n`;
    pythonCode += `driver = webdriver.Chrome()\\n\\n`;

    interactions.forEach(interaction => {
        const xpath = interaction.xpath;
        if (interaction.type === 'click') {
            pythonCode += `# Click on element with XPath: "${xpath}"\\n`;
            pythonCode += `element = driver.find_element(By.XPATH, "${xpath}")\\n`;
            pythonCode += `element.click()\\n\\n`;
        } else if (interaction.type === 'input') {
            pythonCode += `# Input text into element with XPath: "${xpath}"\\n`;
            pythonCode += `element = driver.find_element(By.XPATH, "${xpath}")\\n`;
            pythonCode += `element.send_keys("Sample Text")\\n\\n`;
        } else if (interaction.type === 'scroll') {
            pythonCode += `# Scroll to element with XPath: "${xpath}"\\n`;
            pythonCode += `element = driver.find_element(By.XPATH, "${xpath}")\\n`;
            pythonCode += `driver.execute_script("arguments[0].scrollIntoView();", element)\\n\\n`;
        }
    });

    pythonCode += `\\n# Close the WebDriver\\n`;
    pythonCode += `driver.quit()`;

    return pythonCode;
}

function logInteraction(eventType, element) {
    const xpath = getElementXPath(element);
    const interactionDetail = {
        'type': eventType,
        'xpath': xpath,
        'tag': element.tagName,
        'classes': element.className,
        'id': element.id
    };

    interactions.push(interactionDetail);

    // Generate Python code after each interaction
    const pythonCode = generatePythonCode(interactions);
    console.clear();  // Clear previous output for clarity
    console.log('Generated Python Code:\\n', pythonCode);  // Output the Python code
}

// Attach event listeners
document.addEventListener('click', function(event) {
    logInteraction('click', event.target);
});
document.addEventListener('input', function(event) {
    logInteraction('input', event.target);
});
document.addEventListener('scroll', function(event) {
    logInteraction('scroll', event.target);
});

"""

# Inject JavaScript into the page
driver.execute_script(script)

# Wait for input and terminate script
input("Press [Enter] to terminate the script.")
driver.quit()

