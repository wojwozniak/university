import requests
import re
from bs4 import BeautifulSoup

# Pobranie zawartości strony za pomocą requests
def get_text(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.text
    else:
        return None

# Przetworzenie zawartości strony za pomocą BeautifulSoup
def parse_into_index(responseText):
    soup = BeautifulSoup(responseText, 'html.parser')
    text = soup.get_text()
    # Znalezienie słów regexem (+ konwersja na małe litery)
    words = re.findall(r'\w+', text.lower())
    return words

# Najpopularniejsza strona dla danego słowa
def mpw(index, w):
    if w in index:
        strony = index[w]
        maxIndex = max(strony, key=strony.count)
        return maxIndex
    else:
        return None
    

# Utworzenie indeksu
def create_index(urlList):
    output = {}
    for url in urlList:
        text = get_text(url)
        if text is not None:
            words = parse_into_index(text)
            for word in words:
                if word in output:
                    output[word].append(url)
                else:
                    output[word] = [url]
    return output



# Test:
urls = ["https://www.example.com", "https://www.sample.com", "https://www.traveler.com/"]
index = create_index(urls)
sl = "example"
mpwResult = mpw(index, sl)
print(mpwResult)