# Bardzo prosty kod lecący po kolei po wszystkich możliwych liczbach rekurencyjnym backtrackingiem


# Funkcja rozwiązująca sudoku
def rozwiązanie_sudoku(s):
    if rozwiaz_sudoku(s):
        return s
    else:
        return None
    
# Funkcja rozwiązująca sudoku (algorytm rekurencyjny)
def rozwiaz_sudoku(s):
    puste_pole = znajdz_puste_pole(s)
    if not puste_pole:
        return True

    row, col = puste_pole
    
    for num in range(1, 10):
        if czy_mozna_wstawic(s, row, col, num):
            s[row][col] = num

            if rozwiaz_sudoku(s):
                return True

            s[row][col] = 0

    return False

# Funkcja wyświetlająca diagram sudoku
def wyświetl_diagram(diagram):
    for i in range(9):
        row = ""
        for j in range(9):
            row += str(diagram[i][j]) + " "
            if (j + 1) % 3 == 0 and j < 8:
                row += "| "
        print(row)
        if (i + 1) % 3 == 0 and i < 8:
            print("------+-------+------")

# Funkcja znajdująca puste pole w diagramie
def znajdz_puste_pole(s):
    for i in range(9):
        for j in range(9):
            if s[i][j] == 0:
                return (i, j)
    return None

# Funkcja sprawdzająca, czy można wstawić liczbę num do danego pola
def czy_mozna_wstawic(s, row, col, num):
    return (
        not czy_num_wierszu(s, row, num)
        and not czy_num_kolumnie(s, col, num)
        and not czy_num_w_kwadracie(s, row - (row % 3), col - (col % 3), num)
    )

# Funkcja sprawdzająca, czy liczba num występuje w danym wierszu
def czy_num_wierszu(s, row, num):
    return num in s[row]

# Funkcja sprawdzająca, czy liczba num występuje w danej kolumnie
def czy_num_kolumnie(s, col, num):
    for i in range(9):
        if s[i][col] == num:
            return True
    return False

# Funkcja sprawdzająca, czy liczba num występuje w danym kwadracie 3x3
def czy_num_w_kwadracie(s, start_row, start_col, num):
    for i in range(3):
        for j in range(3):
            if s[start_row + i][start_col + j] == num:
                return True
    return False

# Funkcja testująca rozwiązanie sudoku
def test(diagram):
    print("Diagram startowy:")
    wyświetl_diagram(diagram)

    if rozwiązanie_sudoku(diagram):
        print("\nRozwiązanie:")
        wyświetl_diagram(diagram)
    else:
        print("\nBrak rozwiązania.")


# Przykładowy diagram sudoku do testu
diagram_startowy = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
]

# Wywołanie funkcji test
test(diagram_startowy)