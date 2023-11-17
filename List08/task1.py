import aiohttp
import asyncio
from private import apikey1, apikey2


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


async def main():
    url1 = "https://odds.p.rapidapi.com"
    endpoint1 = "/v4/sports?all=true"
    urlfull1 = url1 + endpoint1
    url2 = 'https://alpha-vantage.p.rapidapi.com'
    endpoint2 = "/query?keywords=microsoft&function=SYMBOL_SEARCH&datatype=json"
    urlfull2 = url2 + endpoint2
    
    headers1 = {
        "X-RapidAPI-Key": apikey1,
        "X-RapidAPI-Host": url1
    }
    
    headers2 = {
        "X-RapidAPI-Key": apikey2,
        "X-RapidAPI-Host": url2
    }

    tasks = [
        fetch_data(urlfull1, headers1),
        fetch_data(urlfull2, headers2)
    ]

    r = await asyncio.gather(*tasks)

    print("1:", r[0])
    print("2:", r[1])

asyncio.run(main())