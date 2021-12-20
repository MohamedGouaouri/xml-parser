

xml: xml.l xml.y
	bison -d xml.y
	flex xml.l
	gcc xml.lex.c xml.tab.c -o xml

clean: xml.lex.c xml.tab.c xml
	rm xml.lex.c xml.tab.c xml