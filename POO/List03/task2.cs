// Zadanie 2 / Lista 3

// Dostajemy
public class ReportPrinter
{
  public String GetData();

  public void FormatDocument();

  public void PrintReport();
}

// Co łamie zasadę SRP

// Poprawmy - podzielmy na 3 klasy

public class ReportData
{
  public String GetData();
}

public class ReportFormatter
{
  public void FormatDocument();
}

public class ReportPrinter
{
  public void PrintReport();
}

// Teraz każda klasa ma jedną odpowiedzialność - docelowo 3 klasy

// Czy każda metoda zawsze musi trafić do osobnej klasy?

// Nie - chociażby przykład z wykładu - klasa Samochód która ma 
// metody rusza(), zatrzymuje(), pobieraOlej()
// Dzielimy odpowiedzialności na klasy które mają wspólny cel - 
// nie musimy każdej metody mieć w osobnej funkcji