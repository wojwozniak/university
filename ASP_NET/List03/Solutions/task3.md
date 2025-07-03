### Podsumowanie dotyczące obiektów Request, Server i Response w ASP.NET

1. **Obiekt `Request`**:
   - Umożliwia dostęp do informacji o żądaniu HTTP.
   - Kluczowe właściwości:
     - `Request.QueryString`: dane z URL (GET).
     - `Request.Form`: dane z formularza (POST).
     - `Request.Cookies`: ciastka od klienta.
     - `Request.Headers`: nagłówki HTTP.
     - `Request.HttpMethod`: metoda HTTP żądania.
   - **Odczyt nagłówków**:
     ```csharp
     foreach (string header in Request.Headers)
     {
         string value = Request.Headers[header];
         Response.Write($"{header}: {value}<br/>");
     }
     ```

2. **Obiekt `Response`**:
   - Służy do zarządzania odpowiedziami HTTP.
   - Kluczowe właściwości i metody:
     - `Response.Cookies`: manipulacja ciastkami.
     - `Response.Headers`: nagłówki odpowiedzi.
     - `Response.Redirect`: przekierowanie klienta.
     - `Response.Write`: zapis danych do odpowiedzi.
   - **Tworzenie nagłówków**:
     ```csharp
     Response.Headers.Add("X-Custom-Header", "HeaderValue");
     ```

3. **Obiekt `Server`**:
   - Umożliwia operacje na serwerze, takie jak mapowanie ścieżek.
   - Kluczowa metoda:
     - `Server.MapPath`: konwertuje ścieżki wirtualne na fizyczne.
   - **Przykład**:
     ```csharp
     string filePath = Server.MapPath("~/folder/nazwa_pliku.txt");
     ```

4. **Właściwość `HttpContext.Current`**:
   - Umożliwia dostęp do bieżącego kontekstu HTTP w aplikacji.
   - Umożliwia łatwy dostęp do obiektów `Request`, `Response`, itp.
   - **Przykład użycia**:
     ```csharp
     string userIp = HttpContext.Current.Request.UserHostAddress;
     ```

### Wnioski:
- Odczytywanie nagłówków żądania i tworzenie własnych nagłówków odpowiedzi jest kluczowe dla zarządzania komunikacją w aplikacjach webowych.
- `Server.MapPath` jest niezbędne do zarządzania plikami na serwerze.
- `HttpContext.Current` jest przydatne w architekturze aplikacji, gdzie dostęp do bieżącego kontekstu jest konieczny, np. w klasach pomocniczych.
