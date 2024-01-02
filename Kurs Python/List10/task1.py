import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np
import keyboard


# Główna klasa gry
class Snake:
    # Konstruktor. Przyjmujemy rozmiar planszy i tickrate
    def __init__(self, size=15, tps=15):
        self.size = size
        self.tps = tps
        
        # Przechowujemy wszystkie pozycje węża w liście par (x, y)
        # Zaczynamy w lewym dolnym rogu, wąż ma długość 1
        self.snake = [(0, 0)]
        self.food = self.gen_food()
        
        # Zaczynamy od ruchu w prawo
        self.direction = (1, 0)
        self.game_over = False

    # Funkcja generująca pozycję nowego jedzenia
    def gen_food(self):
        
        # Losujemy pozycję dopóki nie znajdziemy legalnej (nie wewnątrz węża)
        while True:
            food = (
                np.random.randint(0, self.size),
                np.random.randint(0, self.size)
            )
            if food not in self.snake:
                return food

    # Funkcja wykonująca ruch węża (wywoływana co krok)
    def move(self):
        # Wyznaczamy nową pozycję głowy
        head = self.snake[0]
        new_head = (head[0] + self.direction[0], head[1] + self.direction[1])

        # Sprawdzamy, czy wąż nie zjadł samego siebie lub nie wyszedł poza planszę
        if (
            new_head in self.snake
            or new_head[0] < 0
            or new_head[0] >= self.size
            or new_head[1] < 0
            or new_head[1] >= self.size
        ):
            self.game_over = True
            return

        # Dodajemy nową pozycję głowy na początek listy
        self.snake.insert(0, new_head)

        # Jeśli zjadł jedzenie, to nie usuwamy ostatniego segmentu - dzięki temu rośnie
        if new_head == self.food:
            self.food = self.gen_food()
        else:
            self.snake.pop()

    def display(self):
        # Inicjalizacja wykresu - usuwamy poprzednią zawartość i osie
        plt.clf()
        plt.axis("off")

        # Rysujemy siatkę
        for i in range(self.size + 1):
            plt.axhline(y=i, color="black", linestyle="-", linewidth=0.5)
            plt.axvline(x=i, color="black", linestyle="-", linewidth=0.5)
            
        plt.text(0, -1, "Sterowanie strzałkami, wyłączenie Esc", fontsize=10)

        # Rysujemy węża
        for segment in self.snake:
            plt.gca().add_patch(patches.Rectangle((segment[0], segment[1]), 1, 1, fc="blue"))

        # Rysujemy jedzenie
        plt.gca().add_patch(patches.Rectangle((self.food[0], self.food[1]), 1, 1, fc="green"))

        # Dodajemy granicę na dół i na prawo
        plt.axhline(y=0.06, color="black", linestyle="-", linewidth=0.5)
        plt.axvline(x=self.size-0.04, color="black", linestyle="-", linewidth=0.5)

        # Ustawiamy zakresy osi
        plt.xlim(0, self.size)
        plt.ylim(0, self.size)
        
        plt.draw()
        
        # Tickrate - 1 / tps daje nam czas pomiędzy tickami
        plt.pause(1/self.tps)

    # Funkcja uruchamiająca grę - pętla rejestrująca klawisze i wywołująca funkcje move i display
    def play(self):
        while not self.game_over:
            if keyboard.is_pressed("up"):
                self.direction = (0, 1)
            elif keyboard.is_pressed("down"):
                self.direction = (0, -1)
            elif keyboard.is_pressed("left"):
                self.direction = (-1, 0)
            elif keyboard.is_pressed("right"):
                self.direction = (1, 0)
            elif keyboard.is_pressed("esc"):
                self.game_over = True

            self.move()
            self.display()

# Tworzymy obiekt gry i uruchamiamy - można dostosować rozmiar planszy i tickrate
# (domyślnie 15 i 15)
snake = Snake(size=15, tps=15)
snake.play()