OCAMLBUILD=ocamlbuild
OCAMLBUILD_OPTS=-use-menhir -use-ocamlfind -menhir "menhir --explain" -pkg unix -pkg str

OCB_FLAGS = -I src

TARGET= src/twtl

.PHONY: all clean demo

all:
	$(OCAMLBUILD) $(OCAMLBUILD_OPTS) $(OCB_FLAGS) $(TARGET).native

clean:
	rm -f $(TARGET).native *~ \#*
	$(OCAMLBUILD) -clean
