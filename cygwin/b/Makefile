ifndef INCL
INCL=../a
endif

all:
	ocamlc -I $(INCL) foo.cmo bar.ml -o foobar

clean::
	rm -f foobar *.cm*
