# Przeróbka zadania z poprzedniej listy
# Zmiany:
# a) parse_into_index()
#    - output jest przekazywany jako argument zamiast być zwracany na końcu
#    - funkcja za pomocą locka jest zabezpieczona dla wielu wątków
#    - zamiast tworzenia listy słów, tworzymy mapę słowo -> lista url gdzie występuje (logika przeniesiona z create_index()
# b) create_index()
#    - funkcja wywołuje parse_into_index() w osobnym wątku dla każdego urla

import requests
import re
from bs4 import BeautifulSoup
import threading

# Pomocnicza funkcja do printowania aktywności wątków
def print_thread_activity(thread_name, action):
    print(f"Thread {thread_name} {action}")  


def get_text(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.text
    else:
        return None


def parse_into_index(responseText, output, lock, url):
    soup = BeautifulSoup(responseText, 'html.parser')
    text = soup.get_text()
    words = re.findall(r'\w+', text.lower())

    # lock zapewnia, że tylko jeden wątek na raz będzie modyfikował output
    with lock:
        for word in words:
            if word in output:
                output[word].append(url)
            else:
                output[word] = [url]


def mpw(index, w):
    if w in index:
        strony = index[w]
        maxIndex = max(strony, key=strony.count)
        return maxIndex
    else:
        return None

    
def create_index(urlList):
    output = {}
    lock = threading.Lock()
    threads = []
    
    for url in urlList:
        text = get_text(url)
        if text is not None:
            thread = threading.Thread(target=parse_into_index, args=(text, output, lock, url))
            threads.append(thread)
            print_thread_activity(thread.name, "started")  # Print when thread starts
            thread.start()

    for t in threads:
        t.join()
        print_thread_activity(t.name, "ended")

    return output



# Test:
urls = ["https://www.example.com", "https://www.sample.com", "https://www.traveler.com/"]
index = create_index(urls)
sl = "example"
mpwResult = mpw(index, sl)
print(mpwResult)