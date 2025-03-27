EXE=$(shell ocamlc -config-var ext_exe)

all:
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	ls -la	
	./hello.pl
	hello.pl
	./BOING hello.pl

clean:
	rm -f *.cm* *.exe BOING yadda* foobar
