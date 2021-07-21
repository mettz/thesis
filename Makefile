EXAMPLES=$(shell find examples -name *.sol)
OUTPUTS=$(patsubst examples/%.sol,out/%,$(EXAMPLES))

all: $(OUTPUTS)

examples: out/BlindAuction out/ReceiveAndFallback out/Recursion

cerco:
	./cerco -o cerco_out/fibonacci -d -asm-pretty fibonacci.c

out/%: examples/%.sol
	../solidity/build/solc/solc --lb --ir --ir-optimized --asm --bin --overwrite --optimize -o $@ $^

clean:
	rm -rf out cerco_out/*
	
.PHONY: clean echo cerco examples
