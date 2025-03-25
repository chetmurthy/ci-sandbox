
OCAMLC=ocamlfind ocamlc -verbose

all: cygwin-absolute-path dos-relative-path cygwin-relative-path dos-unix-absolute-path
	ls -al *.exe

cygwin-absolute-path::
	$(OCAMLC) -I `pwd`/../a foo.cmo -o cygwin-absolute-path.exe || true

dos-relative-path::
	$(OCAMLC) -I "..\\a" foo.cmo -o dos-relative-path.exe || true

cygwin-relative-path::
	$(OCAMLC) -I ../a foo.cmo -o cygwin-relative-path.exe || true

DOSUNIXABSPATH=$(shell ./dos-unix-absolute-path.pl)

dos-unix-absolute-path::
	$(OCAMLC) -I $(DOSUNIXABSPATH)/../a foo.cmo -o dos-unix-absolute-path.exe || true

DOSABSPATH=$(shell ./dos-absolute-path.pl)

dos-unix-absolute-path::
	$(OCAMLC) -I $(DOSABSPATH)"\\..\\a" foo.cmo -o dos-absolute-path.exe || true


clean::
	rm -f *.exe
