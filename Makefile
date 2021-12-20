

xml: xml.l xml.y
	flex xml.l
	bison -d xml.y
	gcc xml.lex.c xml.tab.c -o xml

clean: xml.lex.c xml.tab.c xml
	rm xml.lex.c xml.tab.c xml