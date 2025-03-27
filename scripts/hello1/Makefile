EXE=$(shell ocamlc -config-var ext_exe)
BINDIR=bin
ifndef LAUNCHER
export LAUNCHER=./BOING
export SRC=hello.perl
export INST=HELLO.PL
export INSTOTHER=hello.pl
endif

all:
	$(MAKE) setup
	env PATH="$(BINDIR):$(PATH)" $(MAKE) test

setup:
	ocamlfind ocamlc -package fmt,unix -linkall -linkpkg BOING.ml -o BOING$(EXE)
	./BOING true
	mkdir -p $(BINDIR)
	cp $(SRC) $(BINDIR)/$(INST)
	cp BOING$(EXE) $(BINDIR)/BOING$(EXE)
	ls -la . bin

test:
	@echo "==== START ===="
	./$(SRC)
	@echo "==============="
	$(INST) || echo "ERROR: cannot exec $(INST) (from bin)"
	@echo "==============="
	$(LAUNCHER) BOING true || echo "ERROR: launcher cannot exec BOING"
	@echo "==============="
	$(LAUNCHER) $(SRC) || echo "EXPECTED: PATH does not contain . in $(LAUNCHER)" 
	@echo "==============="
	$(LAUNCHER) $(INST) || echo "ERROR: $(LAUNCHER) cannot exec $(INST) (from bin)"
	@echo "==============="
	$(LAUNCHER) $(INSTOTHER) || echo "ERROR: $(LAUNCHER) cannot exec $(INSTOTHER) (from bin); Windows path-lookup should be case-insensitive"
	@echo "==============="

clean:
	rm -rf *.cm* *.exe BOING yadda* foobar $(BINDIR)
