import requests
from bs4 import BeautifulSoup

URL = "https://g1.globo.com/ultimas-noticias/"

def fetch_headlines():
    response = requests.get(URL, headers={"User-Agent": "Mozilla/5.0"})
    response.raise_for_status()
    soup = BeautifulSoup(response.text, "html.parser")

    # Extract all headlines
    headline_divs = soup.select("div.feed-post-body-title")
    headlines = [div.get_text(strip=True) for div in headline_divs if div.get_text(strip=True)]

    # Sort and print
    for headline in sorted(headlines, key=str.casefold):
        print(f"{headline}\n") 

if __name__ == "__main__":
    fetch_headlines()

