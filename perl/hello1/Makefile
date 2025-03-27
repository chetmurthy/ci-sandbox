EXE=$(shell ocamlc -config-var ext_exe)
BINDIR=bin

all:
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	./BOING true
	mkdir -p $(BINDIR)
	cp hello.pl $(BINDIR)/HELLO.PL
	ls -la . bin
	echo "==== START ===="
	./hello.pl
	./BOING hello.pl || echo "PATH does not contain . in BOING" 
	PATH="$(BINDIR):$(PATH)" ./BOING HELLO.PL

clean:
	rm -rf *.cm* *.exe BOING yadda* foobar $(BINDIR)
