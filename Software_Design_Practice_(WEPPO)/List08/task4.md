### Wszystkie o nazwie "example"

Ustawianie ciasteczek
```js
res.setHeader('Set-Cookie', 'example=HelloCookie');
```

Odczytywanie ciasteczek
```js
req.headers.cookie
```

Usuwanie ciasteczek
```js
res.setHeader('Set-Cookie', 'example=; Max-Age=0');
```

Można sprawdzić czy jest obsługiwane:
```js
if (navigator.cookieEnabled) {
  console.log('Przeglądarka obsługuje ciasteczka.');
} else {
  console.log('Przeglądarka nie obsługuje ciasteczek lub ich obsługa jest wyłączona.');
}
```