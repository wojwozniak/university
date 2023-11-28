# Dane na temat inflacji pobrałem ręcznie - API 
# stat.gov.pl wymaga wysłania formularza i oczekiwania na odpowiedź,
# a nigdzie indziej nie znalazłem darmowego api z tymi danymi.
# Zamiast tego pobiorę z api inne dane do części z przewidywaniem inflacji na 2023 rok.
from inflation import data_2021, data_2022
from matplotlib import pyplot as plt
from private import apikey
import aiohttp
import asyncio

# Funkcja do pobierania danych z API
async def fetch_data(url, headers):
    async with aiohttp.ClientSession() as session:
        try:
            async with session.get(url, headers=headers) as response:
                response.raise_for_status()
                data = await response.text()
                return data
        except aiohttp.ClientResponseError as e:
            print(e)
            return None


# Generowanie wykresu
def generate_plot():
    plt.figure(figsize=(8, 6)) # Rozmiar wykresu
    plt.title("Inflacja w Polsce w latach 2021-2022 i predykcja na 2023 rok")
    plt.xlabel("Miesiąc")
    plt.ylabel("Wartość inflacji [%]")
    plt.grid() # Dodajemy siatkę w tle
    miesiace = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] # Ciąg do osi X
    plt.xticks(miesiace) # Wyświetlamy każdy miesiąc zamiast co drugiego jak domyślnie
    plt.plot(miesiace, data_2021, label="Inflacja w kolejnych miesiącach 2021 roku", color="blue")
    plt.plot(miesiace, data_2022, label="Inflacja w kolejnych miesiącach 2022 roku", color="red") 
    plt.legend() # Wygenerowanie legendy
    plt.savefig("List09/result.png") # Zapisanie wykresu do pliku
    plt.show() # Wyświetlenie wykresu w oknie
    
#generate_plot()