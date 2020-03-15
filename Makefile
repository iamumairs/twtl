OCAMLBUILD=ocamlbuild
OCAMLBUILD_OPTS=-use-menhir -use-ocamlfind -menhir "menhir --explain" -pkg unix -pkg str

TARGET=twtl

.PHONY: all clean demo

all:
	$(OCAMLBUILD) $(OCAMLBUILD_OPTS) $(TARGET).native

clean:
	rm -f $(TARGET).native *~ \#*
	$(OCAMLBUILD) -clean
