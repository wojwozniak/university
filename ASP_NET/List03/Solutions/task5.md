# Przechowywanie kontekstu dostępu do danych w kontenerze serwerowym

## Wybór kontenera serwerowego
Najbardziej odpowiednim kontenerem do przechowywania kontekstu dostępu do danych jest **Items**. Wynika to z faktu, że obiekty takie jak `SqlConnection` czy `DataContext` powinny być tworzone i wykorzystywane tylko na czas przetwarzania pojedynczego żądania, a następnie zwalniane.

## Skutki uboczne przechowywania w innych kontenerach
1. **Application** – Przechowywanie kontekstu w `Application` spowodowałoby, że ten sam obiekt dostępowy byłby współdzielony przez wiele równoczesnych żądań. Skutkuje to ryzykiem wyścigu danych oraz trudnościami w zarządzaniu zasobami, co może prowadzić do błędów lub nawet deadlocków.
2. **Session** – Przechowywanie kontekstu w `Session` przypisałoby ten sam obiekt dostępowy do całej sesji użytkownika. Mogłoby to prowadzić do wycieków pamięci, ponieważ obiekt `DataContext` nie byłby zwalniany po zakończeniu żądania.

## Przykład kodu – Pseudosingleton z `Items`

```csharp
public class DataContextProvider
{
    public static MyDataContext GetDataContext(HttpContext context)
    {
        if (context.Items["DataContext"] == null)
        {
            context.Items["DataContext"] = new MyDataContext();
        }
        return (MyDataContext)context.Items["DataContext"];
    }
}
```


## Zwalnianie zasobów

```csharp
public void Application_EndRequest(object sender, EventArgs e)
{
    var context = HttpContext.Current.Items["DataContext"] as IDisposable;
    context?.Dispose();
}
```