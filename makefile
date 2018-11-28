OBJS = integer.o string.o real.o scanner.o sll.o dll.o stack.o queue.o bst.o gst.o avl.o
OOPTS = -Wall -Wextra -g -c -std=c99
LOPTS = -Wall -Wextra -g -std=c99

all : test-bst test-gst test-avl trees gst-0-2 avl-0-3

test-bst : test-bst.o $(OBJS)
	gcc $(LOPTS) test-bst.o $(OBJS) -o test-bst

test-gst : test-gst.o $(OBJS)
	gcc $(LOPTS) test-gst.o $(OBJS) -o test-gst

test-avl : test-avl.o $(OBJS)
	gcc $(LOPTS) test-avl.o $(OBJS) -o test-avl

gst-0-2 : gst-0-2.o $(OBJS)
	gcc $(LOPTS) gst-0-2.o $(OBJS) -o gst-0-2

avl-0-3 : avl-0-3.o $(OBJS)
	gcc $(LOPTS) avl-0-3.o $(OBJS) -o avl-0-3

trees : trees.o $(OBJS)
	gcc $(LOPTS) trees.o $(OBJS) -o trees

test-bst.o : test-bst.c bst.h sll.h queue.h integer.h string.h real.h scanner.h
	gcc $(OOPTS) test-bst.c

test-gst.o : test-gst.c gst.h bst.h sll.h queue.h integer.h string.h real.h scanner.h
	gcc $(OOPTS) test-gst.c

test-avl.o : test-avl.c avl.h bst.h sll.h queue.h integer.h string.h real.h scanner.h
	gcc $(OOPTS) test-avl.c

gst-0-2.o : gst-0-2.c gst.h bst.h sll.h queue.h integer.h string.h real.h scanner.h
	gcc $(OOPTS) gst-0-2.c

avl-0-3.o : avl-0-3.c gst.h bst.h sll.h queue.h integer.h string.h real.h scanner.h
	gcc $(OOPTS) avl-0-3.c

integer.o : integer.c integer.h
	gcc $(OOPTS) integer.c

string.o : string.c string.h
	gcc $(OOPTS) string.c

real.o : real.c real.h
	gcc $(OOPTS) real.c

scanner.o : scanner.c scanner.h
	gcc $(OOPTS) scanner.c

sll.o : sll.c sll.h
	gcc $(OOPTS) sll.c

dll.o : dll.c dll.h
	gcc $(OOPTS) dll.c

stack.o : stack.c stack.h
	gcc $(OOPTS) stack.c

queue.o : queue.c queue.h
	gcc $(OOPTS) queue.c

bst.o : bst.c bst.h
	gcc $(OOPTS) bst.c

gst.o : gst.c gst.h
	gcc $(OOPTS) gst.c

avl.o : avl.c avl.h
	gcc $(OOPTS) avl.c

trees.o : trees.c
	gcc $(OOPTS) trees.c

gst : all
	echo testing gst
	./gst-0-3
	echo

avl : all
	echo testing gst
	./avl-0-3
	echo

test : all
	echo testing gst
	./test-gst
	echo
	echo testing avl
	./test-avl
	echo

valgrind : all
	echo testing 
	valgrind --leak-check=full ./test-avl
	echo

clean :
	rm -f $(OBJS) test-*.o gst-0-2.o avl-0-3.o trees.o test-bst test-gst test-avl gst-0-2 avl-0-3 trees

#clean :
#	rm -f $(OBJS) test-*.o trees.o test-bst test-gst test-avl trees