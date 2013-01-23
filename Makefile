CFLAGS = -c -ggdb
INST = /usr/local
LIBS = stack.c buffer.c crustache.c houdini_html.c
OBJS = $(LIBS:%.c=%.o)

all: libcrustache.a

libcrustache.a:	objs
	rm -f $@
	ar cq $@ $(OBJS)

objs:
	$(CC) $(CFLAGS) $(LIBS)

clean:
	rm -f $(OBJS) libcrustache.a

install: all
	cp libcrustache.a $(INST)/lib
	cp crustache.h $(INST)/include

deinstall:
	rm $(INST)/lib/libcrustache.a
	rm $(INST)/include/crustache.h
