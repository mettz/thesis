SIMPLE=$(patsubst examples/%.sol,out/%,$(shell find examples/simple -name *.sol))
COMPLEX=$(patsubst examples/%.sol,out/%,$(shell find examples/complex -name *.sol))

all: simple complex

single: out/simple/SimpleStorage

simple: $(SIMPLE)

complex: $(COMPLEX)

cerco:
	./cerco -o cerco_out/fibonacci -d -asm-pretty fibonacci.c

out/%: examples/%.sol
	../solidity/cmake-build-debug/solc/solc --lb --ir --ir-optimized --experimental-via-ir --asm --bin --overwrite --optimize -o $@ $^ && node ./parse-evm.js $@

clean:
	rm -rf out cerco_out/* uncovered
	
.PHONY: clean echo cerco simple complex
