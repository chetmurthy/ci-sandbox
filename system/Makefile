EXE=$(shell ocamlc -config-var ext_exe)

all:
	ocamlfind ocamlc -verbose -package fmt -linkall -linkpkg foobar.ml -o foobar$(EXE)
	cp foobar$(EXE) yadda$(EXE)
	cp foobar$(EXE) yadda.opt$(EXE)
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	./BOING yadda -verbose foo
	./BOING yadda.opt -verbose foo

clean:
	rm -f *.cm* *.exe BOING yadda* foobar
