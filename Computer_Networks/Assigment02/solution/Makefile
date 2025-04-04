TARGET = router

CC = gcc

CFLAGS = -Wall -g -std=gnu99 -Wextra

SOURCES = main.c setup.c routing_table.c time_util.c send.c receive.c

OBJECTS = $(SOURCES:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS)

distclean: clean
	rm -f $(TARGET)

.PHONY: all clean distclean