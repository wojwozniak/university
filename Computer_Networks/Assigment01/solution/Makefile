TARGET = traceroute

CC = gcc

CFLAGS = -Wall -g

SOURCES = main.c validate.c send.c time_util.c traceroute.c receive.c

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