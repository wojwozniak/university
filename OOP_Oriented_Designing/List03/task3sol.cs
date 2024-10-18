// Zad 3 / Lista 3 - w pliku task3 jest treść i bazowy kod,
// a tu moja poprawiona na rzecz OCP wersja
public class TaxCalculator
{
  public Decimal CalculateTax(decimal Price, decimal VatRate) { return Price * VatRate; }
}
public class Item
{
  public decimal Price { get { ... } }
  public string Name { get { ... } }
  private decimal _vatRate = 0.22;
  public decimal VatRate { get { return _vatRate; }; set { _vatRate = value; } }
}

public class CashRegister
{
  public TaxCalculator taxCalc = new TaxCalculator();
  public decimal CalculatePrice(Item[] Items)
  {
    decimal _price = 0;
    foreach (Item item in Items)
    {
      _price += itemPrice + taxCalc.CalculateTax(item.Price, item.VatRate);
    }
    return _price;
  }
  public string PrintBill(Item[] Items, bool sort = false, function itemComparator)
  {
    if (sort)
      Array.Sort(Items, itemComparator);

    foreach (var item in Items)
      Console.WriteLine("towar {0} : cena {1} + podatek {2}",
      item.Name, item.Price, taxCalc.CalculateTax(item.Price));
  }
}

// Teraz klasa CashRegister jest otwarta na modyfikacje - możemy zmieniać wartość vatu,
// wypisywać na inne sposoby PrintBill (np. sortowania)

// Przykładowe rozszerzenie - sortowanie po cenie

public class ItemPriceComparator : IComparer<Item>
{
  public int Compare(Item x, Item y)
  {
    return x.Price.CompareTo(y.Price);
  }
}

// Użycie
CashRegister cr = new CashRegister();
cr.PrintBill(Items, true, new ItemPriceComparator());

// Przykładowe rozszerzenie - zmiana wartości vatu

Item item = new Item();
item.VatRate = 0.23;
Items.Add(item);

// Użycie
CashRegister cr = new CashRegister();
cr.CalculatePrice(Items);
cr.PrintBill(Items);