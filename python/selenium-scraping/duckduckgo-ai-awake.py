from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Setup Chrome options (you can use headless mode if needed)
chrome_options = Options()
chrome_options.add_argument("--headless")  # Optional: Run in headless mode

# Use WebDriver Manager to automatically get the correct chromedriver path
driver_service = Service(ChromeDriverManager().install())

# Initialize WebDriver with the driver
driver = webdriver.Chrome(service=driver_service, options=chrome_options)

# Navigate to the specified URL
driver.get("http://duck.ai/")

# Click the first button
first_button = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/div/div[2]/div/button'))
)
first_button.click()

#
# TODO FIXME: it's crashing here, while waiting for this Radiobutton to respond. 
#

# Click the radio button
radio_button = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/div/div[3]/div/div/ul/li[1]/input'))
)
radio_button.click()

# Click the second button
second_button = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/div/div[3]/div/button'))
)
second_button.click()

# Click the third button
third_button = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/div/div[4]/div/div[2]/button'))
)
third_button.click()

# Type the question in the input box
input_box = WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/section[2]/div/div[2]/form/div[1]/div[2]/textarea'))
)
input_box.send_keys("Are you awake yet?")

# Click the submit button
submit_button = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/section[2]/div/div[2]/form/div[1]/div[3]/button'))
)
submit_button.click()

# Wait for the result to load
result_element = WebDriverWait(driver, 20).until(
    EC.presence_of_element_located((By.XPATH, '/html/body/div[2]/div[6]/div[4]/div/div[2]/main/div/section[2]/div/div[2]/div/div/div[2]'))
)

# Get the text from the result element
result_text = result_element.text

# Print the result text
print(result_text)

# Wait for 1 minute before quitting
time.sleep(60)  # Wait for 60 seconds

# Close the browser
driver.quit()


