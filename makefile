CFLAGS = -Wall -g

all: index

index: index.o main.o
	gcc $(CFLAGS) index.o main.o -o index
index.o: index.c
	gcc $(CFLAGS) -c index.c -o index.o
main.o: main.c
	gcc $(CFLAGS) -c main.c -o main.o
clean: 
	rm -f index
	rm -f *.o
       
