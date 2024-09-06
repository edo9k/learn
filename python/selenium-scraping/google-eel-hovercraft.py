from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Setup Chrome options (you can use headless mode if needed)
chrome_options = Options()
chrome_options.add_argument("--headless")  # Optional: Run in headless mode

# Use WebDriver Manager to automatically get the correct chromedriver path
driver_service = Service(ChromeDriverManager().install())

# Initialize WebDriver with the driver
driver = webdriver.Chrome(service=driver_service, options=chrome_options)

# Navigate to Google
driver.get("https://www.google.com")

# Wait for the search box to be available
search_box = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.NAME, "q"))
)

# Type "my hovercraft is full of eels" into the search box
search_box.send_keys("my hovercraft is full of eels")

# Submit the search form
search_box.submit()

# Wait for the search results to load and find the first result
first_result = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CSS_SELECTOR, "div.g"))
)

# Get the text of the first result
first_result_text = first_result.text[:256]  # Get the first 256 characters of the result

# Print the result
print(first_result_text)

# Close the browser
driver.quit()

