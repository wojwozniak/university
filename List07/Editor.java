public class Editor {

    private Ksiazka ksiazka;

    public Editor(Ksiazka ksiazka) {
        this.ksiazka = ksiazka;
        editKsiazka();
    }

    public void editKsiazka() {
        System.out.println("Ksiazka");
        System.out.println("Przed zmianą:");
        System.out.println(ksiazka);
        System.out.println("Po zmianie:");
        KsiazkaEditor editor = new KsiazkaEditor(ksiazka);
        KsiazkaEditor.callEditor(ksiazka);
    }
}