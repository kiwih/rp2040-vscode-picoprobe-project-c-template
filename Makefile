.PHONY: build flash

ELF = build/main.elf

dummy:
	@echo "Please specify a target to build"

build: clean
	@echo "Building the project"
	cd build;cmake ..;make -j8

prep:
	mkdir build;cd build;rm -rf *;cmake ..

flash: build ${ELF}
	@echo "Flashing the project"
	@echo "Please make sure the board is connected to the picoprobe"
	./flash ${ELF}

clean:
	-@rm -rf build
	-@mkdir build
	-@rm *~ || true

allow:
	# alternate:  source envrc	
