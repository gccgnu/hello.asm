## NASM Hello World Tutorial (Linux x86_64)

### Core concept
Print "Hello, World!" using syscall: 'write()' to stdout, then 'exit()'.

### Key Steps

1. **Define data section**
	- Create 'msg' with your string + newline ( 0xA and 10 )
	- 'msgLen equ $-msg' calculates lenght automatically

2. **Write syscall (rax=1)**
	```
	rdi=1 (stdout), rsi=msg address, rdx=msgLen
	syscall
	```

3. **Exit syscall (rax=60)**
	```
	rdi=0 (exit code), syscall
	```

4. **Build and Run**
	```
	nasm -f elf64 hello.asm -o hello.o  # Compiler
	ld hello.o -o hello	            # Link
	./hello	                            # Run
	```
### Register Matter
	- 'rax': syscall number
	- 'rdi/rsi/rdx': first 3 args (Linux x86_64 ABI)
