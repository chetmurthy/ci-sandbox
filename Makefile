
all:
	./doit.sh
	OPT= EXE= OCAMLN=ocaml MODE=S COMPWITH=old CAMLP5N=camlp5 ./camlp5_comm.sh versdep.ml -o versdep.ppo
