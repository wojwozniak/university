# Top 10 Web Application Security Risks
Po aktualizacji z 2021

## 1. Broken Access Control
Użytkownik może uzyskać dostęp do zasobów, do których nie powinien mieć dostępu.
Może być wywołane np. przez:
- niepoprawne zarządzanie sesją
- edytowanie parametrów w URL
- niestosowanie w kodzie deny by default

## 2. Cryptographic Failures
Błędy w kryptografii

## 3. Injection
Wstrzykiwanie kodu do aplikacji, np. SQL Injection

## 4. Insecure Design
Błędy w projektowaniu aplikacji (np. brak uwzględnienia bezpieczeństwa). Różni się od pozostałych, ponieważ nie jest to błąd w kodzie, a w projekcie.

## 5. Security Misconfiguration
Błędy w konfiguracji aplikacji, np. nieaktualne biblioteki, niepoprawne ustawienia serwera

## 6. Vulnerable and Outdated Components
Używanie nieaktualnych bibliotek, które zawierają luki bezpieczeństwa

## 7. Identification and Authentication Failures
Błędy w procesie identyfikacji i uwierzytelniania użytkowników

## 8. Software and Data Integrity Failures
Błędy w procesie weryfikacji integralności oprogramowania i danych

## 9. Security Logging and Monitoring Failures
Błędy w procesie logowania i monitorowania aplikacji

## 10. Server-Side Request Forgery
Użytkownik może wykonać zapytanie do serwera, które nie powinno być możliwe

Co grozi nawet w tak małych aplikacjach jakie tworzymy?

1,3,5,6,7,8,9,10 - czyli praktycznie wszystko

W mniejszym stopniu tylko 2 i 4 - nie piszemy własnej kryptografii, a projektujemy tylko małe aplikacje (więc nie ma gdzie szukać błędów w wzorcach projektowych)