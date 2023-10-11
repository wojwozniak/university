void tabliczka(float x1, float x2, float y1, float y2, float skok) {
    // Na poczatku obliczam jaka szerokosc pola bedzie mi potrzebna
    float max_val = x2*y2;
    // w na starcie 4 - 1 bazowo, 2 miejsca po przecinku i kropka
    int w = 4;
    while(max_val >=10) {
        max_val/=10;
        w++;
    }
    // Wypisuje poczatkowe spacje przed pierwszym rzedem
    printf("%*s", w+2, "");
    // Pierwszy rzad
    for(float i=y1; i<y2; i+=skok) {
        printf("%*.2f ",w, i);
    }
    printf("\n");
    for(float i=x1; i<=x2; i+=skok) {
        // Wartosc w pierwszej kolumnie
        printf("%*.2f: ",w, i);
        for(float j=y1; j<=y2; j+=skok) {
            // Kolejne wartosci
            printf("%*.2f ",w, i*j);
        }
        printf("\n");
    }
}
