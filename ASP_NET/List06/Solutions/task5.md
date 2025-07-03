## Pokazywanie po stronie klienta

Pokazywać można na przykład za pomocą Data Annotations - tak jak zrobiłem to na liście piątej :

```cs
public class Student
    {
        [Required(ErrorMessage = "Index is required.")]
        [StringLength(6, ErrorMessage = "Index cannot be longer than 6 characters.")]
        public string Index { get; set; }
    }
```

lub poprzez użycie

```cs
@Html.ValidationMessageFor
```
w modelu strony


Musimy mieć JQuery (które jest domyślnie zaimportowane w _Layout)


## Walidator PESEL:

```cs
public class PeselAttribute : ValidationAttribute
{
    public PeselAttribute() : base("Niepoprawny numer PESEL.")
    {
    }

    public override bool IsValid(object value)
    {
        if (value == null) return false;

        var pesel = value.ToString();
        if (pesel.Length != 11) return false;

        // Walidacja formatu (11 cyfr)
        if (!Regex.IsMatch(pesel, @"^\d{11}$")) return false;

        // Walidacja daty urodzenia
        string year = pesel.Substring(0, 2);
        string month = pesel.Substring(2, 2);
        string day = pesel.Substring(4, 2);

        int yearInt = int.Parse(year);
        int monthInt = int.Parse(month);
        int dayInt = int.Parse(day);

        // Sprawdzanie poprawności daty
        try
        {
            DateTime birthDate = new DateTime(1900 + yearInt, monthInt, dayInt);
        }
        catch
        {
            return false;
        }

        // Walidacja sumy kontrolnej PESEL
        int[] peselWeights = { 1, 3, 7, 9, 1, 3, 7, 9, 1, 3, 1 };
        int sum = 0;

        for (int i = 0; i < 10; i++)
        {
            sum += (pesel[i] - '0') * peselWeights[i];
        }

        int checkDigit = (10 - (sum % 10)) % 10;

        return pesel[10] - '0' == checkDigit;
    }
}
```

## Walidator 

```cs
public class LatinLettersAndDigitsAttribute : ValidationAttribute
{
    public LatinLettersAndDigitsAttribute() : base("Dopuszczalne są tylko litery alfabetu łacińskiego, polskie litery, cyfry i białe znaki.")
    {
    }

    public override bool IsValid(object value)
    {
        if (value == null) return false;

        var regex = new Regex(@"^[a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ0-9\s]*$");

        return regex.IsMatch(input);
    }
}
```