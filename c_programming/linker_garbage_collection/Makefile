.PHONY = demo-simple demo-gc analyze-gc analyze-simple

default:
	@echo "make gc -> to analyze the result with linker garbage collection"
	@echo "make simple -> to analyze the result without linker garbage collection"

gc: demo-gc
	objdump -t build/main_gc.o | grep "used"	
	objdump -t build/main_gc.exe | grep "used"

simple: demo-simple
	objdump -t build/main_simple.o | grep "used"	
	objdump -t build/main_simple.exe | grep "used"

demo-simple:
	@mkdir -p build
	gcc -c main.c -o build/main_simple.o
	gcc main.c -o build/main_simple.exe	

demo-gc:
	@mkdir -p build
	gcc -c main.c -fdata-sections -ffunction-sections -o build/main_gc.o
	gcc build/main_gc.o -lc -Wl,--gc-sections -o build/main_gc.exe


