EXAMPLES=SimpleStorage Ballot
	# solc --ir --ir-optimized --asm --bin --overwrite --optimize -o out/SimpleStorage examples/SimpleStorage.sol

all: $(EXAMPLES)

$(EXAMPLES):
	solc --ir --ir-optimized --asm --bin --overwrite --optimize -o out/$@ examples/$@.sol
	
.PHONY: $(EXAMPLES)