.PHONY = run

run:
	find . -name "*.c" | xargs sh -c 'gcc $$@ -o main.exe' _ && \
	./main.exe

analyze:
	@echo ""
	@echo "--------------------------------------------------------"
	@printf "Checking if start and stop symbols are created by linker\n"
	nm main.exe | grep "myfuncs"
	@echo "--------------------------------------------------------"
	@printf "\nChecking the location of individual functions from obj files\n"
	objdump -s -d main.exe -j .text | grep -A 7 "func"
	@echo "--------------------------------------------------------"
	@printf "\nChecking the created linker set which should hold the address of the functions\n"
	objdump -s main.exe -j myfuncs
	@echo "--------------------------------------------------------"
	@printf "Be careful of the endianness when viewing bytes in memory\n"
	@echo ""
	@echo ""


