EXE=$(shell ocamlc -config-var ext_exe)

all:
	ocamlfind ocamlc -verbose -package fmt -linkall -linkpkg foobar.ml -o foobar$(EXE)
	cp foobar$(EXE) yadda$(EXE)
	cp foobar$(EXE) yadda.opt$(EXE)
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	ls -la
	./BOING yadda -verbose foo || echo yadda failed
	./BOING yadda.exe -verbose foo || echo yadda.exe failed
	./BOING yadda.opt -verbose foo || echo yadda.opt failed
	./BOING yadda.opt.exe -verbose foo || echo yadda.opt.exe failed

clean:
	rm -f *.cm* *.exe BOING yadda* foobar
