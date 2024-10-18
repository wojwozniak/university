// GRASP1 - Creator
// W naszym przypadku klasa ProduktFactory jest odpowiedzialna za tworzenie obiektów klasy Produkt - ma dane potrzebne do stworzenia obiektu (możnaby też zrobić listę pointerów do każdego z obiektów)
class Produkt {
  constructor(nazwa, cena, sortIndex) {
    this.sortIndex = sortIndex;
    this.nazwa = nazwa;
    this.cena = cena;
  }
}

class ProduktFactory {
  constructor() {
    this.iterator = 0;
  }

  createProdukt(nazwa, cena) {
    return new Produkt(nazwa, cena, ++this.iterator);
  }
}

const factory = new ProduktFactory();
const var1 = factory.createProdukt("Telefon", 1000);
const var2 = factory.createProdukt("Laptop", 2000);
console.log(var1.sortIndex, var2.sortIndex);

// Dla powyższego kodu zachodzi też GRASP2
//GRASP2 - Information Expert
// Klasa Produkt jest odpowiedzialna za przechowywanie informacji o produkcie, więc jest ona ekspertem w tej dziedzinie

// GRASP3 - Controller
// Klasa KoszykController jest odpowiedzialna za obsługę koszyka - dodawanie, usuwanie, zmiana ilości produktów
// Trzebaby jeszcze na potrzeby zadania zrobić html i przycisk do dodawania produktów do koszyka
class KoszykController {
  addToCart(produkt) {
    // Tu byłaby logika dodawania produktu do koszyka
    console.log(`Dodano ${produkt.nazwa} do koszyka.`);
  }
}

const koszykCtrl = new KoszykController();
koszykCtrl.addToCart(var1);