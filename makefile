SOURCEFILE = lex.yy.c minic.tab.c ast.c
HEADFILE = minic.tab.h def.h

all: $(SOURCEFILE) $(HEADFILE) 
	gcc -o minic $(SOURCEFILE) -w 

.PHONY: all clean

lex.yy.c: minic.l
	flex minic.l

minic.tab.h: minic.y
	bison -d -v minic.y

minic.tab.c: minic.y
	bison -d -v minic.y

FILE = minic lex.yy.c minic.tab.h minic.tab.c minic.output

clean:
	rm -rf $(FILE)

