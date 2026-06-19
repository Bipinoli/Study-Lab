help:
	@echo "without-dedup: see the result without deduplication"
	@echo "with-clang-icf: see how lld --icf help in deduplicating"

define analyze_elf
	objdump -t $(1) | grep "func"
	@echo ""
	@objdump -t $(1) | grep "func" | awk '{print "Function", $$6, "exists in address", $$1}'
	@echo ""
	objdump -t $(1) | grep "func1" | awk '{print $$1}' | xargs -I? objdump -d $(1) --start-address=0x? > build/tmp1
	objdump -t $(1) | grep "func2" | awk '{print $$1}' | xargs -I? objdump -d $(1) --start-address=0x? > build/tmp2
	@echo ""
	diff -u build/tmp1 build/tmp2
	@echo ""
endef

ELF_WO := build/main-wo.exe
ELF_ICF := build/main-icf.exe
ELF_GC := build/main-gc.exe

without-dedup: compile-normal
	gcc $(shell ls build/objs/ | xargs -I? realpath build/objs/?) -o $(ELF_WO)
	$(call analyze_elf,$(ELF_WO))

with-clang-icf: compile-normal
	gcc $(shell ls build/objs/ | xargs -I? realpath build/objs/?) \
		-fuse-ld=lld \
		-Wl,--icf=all \
		-o $(ELF_ICF)
	$(call analyze_elf,$(ELF_ICF))

compile-normal:
	mkdir -p build/objs/
	gcc -c file1.c -o build/objs/file1.o
	gcc -c file2.c -o build/objs/file2.o
	gcc -c main.c -o build/objs/main.o

