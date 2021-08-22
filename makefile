#PATH
IDIR = ./api_files/
SDIR = ./src_files/
TDIR = ./test_files/

#COMPILER	
CC = gcc
CFLAGS = -ansi -pedantic-errors -Wall -Wextra -g -lm -I$(IDIR)
RM = rm -rf

TARGETS := scheduler pqueue sorted_list uid dlist uid

.PHONY = all clean

all: scheduler

scheduler: $(SDIR)scheduler.c $(TDIR)scheduler_test.c $(SDIR)task.c $(SDIR)pqueue.c $(SDIR)UID.c $(SDIR)sorted_list.c $(SDIR)dlist.c
	$(CC) $(CFLAGS) -o $@ $^

pqueue: $(SDIR)pqueue.c $(TDIR)pqueue_test.c $(SDIR)sorted_list.c $(SDIR)dlist.c
	$(CC) $(CFLAGS) -o $@ $^

sorted_list: $(SDIR)sorted_list.c $(TDIR)sorted_list_test.c $(SDIR)dlist.c
	$(CC) $(CFLAGS) -o $@ $^
	
dlist: $(TDIR)dlist_test.c $(SDIR)dlist.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

uid: $(TDIR)UID_test.c $(SDIR)UID.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

clean:
	$(RM) *.o $(TARGETS)
