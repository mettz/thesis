EXAMPLES=Tries

all: $(EXAMPLES)

$(EXAMPLES):
	solc --ir --ir-optimized --asm --bin --overwrite --optimize -o out/$@ examples/$@.sol

clean:
	rm -rf out
	
.PHONY: $(EXAMPLES) clean