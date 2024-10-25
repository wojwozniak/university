# Kontenery serwerowe w ASP.NET

## 1. Różnice między kontenerami `Application`, `Session`, `Items`
- **Application** – Jest współdzielony przez wszystkie sesje i użytkowników aplikacji. Dane są dostępne przez cały cykl życia aplikacji.
- **Session** – Przechowuje dane specyficzne dla danej sesji użytkownika. Dane dostępne są tylko przez czas trwania jednej sesji.
- **Items** – Przechowuje dane dla jednego żądania HTTP i jest zwalniany po jego zakończeniu.

## 2. Przykładowe użycie w kodzie

```csharp
// Application scope
HttpContext.Application["appKey"] = "GlobalValue";

// Session scope
HttpContext.Session["sessionKey"] = "UserSpecificValue";

// Items scope
HttpContext.Items["requestKey"] = "RequestSpecificValue";

```
## 3. Technika pseudosingletów
W technice pseudosingletów obiekt, którego czas życia kontrolowany jest przez kontener serwerowy (np. `Application`), może być traktowany jak singleton przez udostępnienie go za pomocą właściwości statycznej lub metody. Zapewnia to dostęp do danych globalnych bez potrzeby tworzenia klasy singletonu.

## 4. Konieczność ochrony dostępu z wieloma wątkami
`Application` wymaga dodatkowej ochrony - dajemy lock na get

## 5. Kontener, który można pominąć
`Items` - działa jak zmienne lokalne
