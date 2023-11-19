# Type Challenges - Easy
Posortowane po numerach z repozytorium - mam wrażenie, że najprostsze mają wyższe numery

## 4. Pick

```typescript
type MyPick<T, K> = any
type MyPick<T, K extends keyof T> = { [P in K]: T[P] };
```

W miarę self-explanatory

## 7. Readonly

```typescript
type MyReadonly<T> = any
type MyReadonly<T> = { readonly [K in keyof T]: T[K] };
```

-,,-

## 11. Tuple to Object

```typescript
type TupleToObject<T extends readonly any[]> = any
type TupleToObject<T extends readonly PropertyKey[]> = { [K in T[number]]: K };
```

## 14. First of Array

```typescript
type First<T extends any[]> = any
type First<T extends any[]> = T extends [] ? never : T[0];
```
Sprawdzamy czy lista jest pusta, w.p.p. bierzemy pierwszy element

## 18. Length of Tuple

```typescript
type Length<T> = any
// nie można jako 
type Length<T extends { length: number }> = T["length"];
// bo zadziała dla każdego obiektu z polem length, nie tylko dla tablic
type Length<T extends readonly any[]> = T["length"];
```


## 43. Exclude

```typescript
type MyExclude<T, U> = any
type MyExclude<T, U> = T extends U ? never : T;
```

## 189. Avaited

```typescript
type MyAwaited<T> = any
// pomysł to coś takiego
type Awaited<T> = T extends Promise<string> ? string : T;
// ale musi być dla wszystkich typów. Rekurencja, bo zwracalibyśmy Promise<Promise<R>>
type Awaited<T> = T extends Promise<infer R> ? Awaited<R> : T;
```

## 533. Concat

```typescript
type Concat<T, U> = any
// pomysł to 
type Concat<T, U> = [...T, ...U];
// ale jeszcze mówimy kompilatorowi że to są tablice
type Concat<T extends unknown[], U extends unknown[]> = [...T, ...U];
```

## 3057. Push

```typescript
type Push<T, U> = any
type Push<T extends unknown[], U> = [...T, U];
```