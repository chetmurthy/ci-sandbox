EXE=$(shell ocamlc -config-var ext_exe)
BINDIR=bin
LAUNCHER=./BOING

all:
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	./BOING true
	mkdir -p $(BINDIR)
	cp hello.pl $(BINDIR)/HELLO.PL
	cp BOING$(EXE) $(BINDIR)/BOING$(EXE)
	ls -la . bin
	@echo "==== START ===="
	./hello.pl
	$(LAUNCHER) hello.pl || echo "EXPECTED: PATH does not contain . in BOING" 
	PATH="$(BINDIR):$(PATH)" $(LAUNCHER) BOING true || echo "ERROR: launcher cannot exec BOING"
	PATH="$(BINDIR):$(PATH)" HELLO.PL || echo "ERROR: cannot exec HELLO.PL (from bin)"
	PATH="$(BINDIR):$(PATH)" $(LAUNCHER) HELLO.PL || echo "ERROR: launcher cannot exec HELLO.PL (from bin)"

clean:
	rm -rf *.cm* *.exe BOING yadda* foobar $(BINDIR)
