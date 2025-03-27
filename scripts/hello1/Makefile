EXE=$(shell ocamlc -config-var ext_exe)
BINDIR=bin
ifndef LAUNCHER
export LAUNCHER=./BOING
endif

all:
	$(MAKE) setup
	env PATH="$(BINDIR):$(PATH)" $(MAKE) test

setup:
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	./BOING true
	mkdir -p $(BINDIR)
	cp hello.pl $(BINDIR)/HELLO.PL
	cp BOING$(EXE) $(BINDIR)/BOING$(EXE)
	ls -la . bin

test:
	@echo "==== START ===="
	./hello.pl
	HELLO.PL || echo "ERROR: cannot exec HELLO.PL (from bin)"
	$(LAUNCHER) hello.pl || echo "EXPECTED: PATH does not contain . in $(LAUNCHER)" 
	$(LAUNCHER) BOING true || echo "ERROR: launcher cannot exec $(LAUNCHER)"
	$(LAUNCHER) HELLO.PL || echo "ERROR: $(LAUNCHER) cannot exec HELLO.PL (from bin)"

clean:
	rm -rf *.cm* *.exe BOING yadda* foobar $(BINDIR)
