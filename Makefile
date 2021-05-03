EXAMPLES=$(shell find examples -name *.sol)
OUTPUTS=$(patsubst examples/%.sol,out/%,$(EXAMPLES))

all: $(OUTPUTS)

out/%: examples/%.sol
	solc --ir --ir-optimized --asm --bin --overwrite --optimize -o $@ $^

clean:
	rm -rf out
	
.PHONY: clean echo