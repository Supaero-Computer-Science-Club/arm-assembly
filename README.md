# ARM assembly.
A little project to execute assembly code on a Raspberry pi 0, which has an embedded ARM microprocessor.

## Dependencies.
To compile and assemble the ARM codes, the `makefile` requires two main shell commands:
- `arm-linux-gnueabihf-as`: to assemble the assembly files.
- `arm-linux-gnueabihf-gcc-8`: to compile and link them into a single executable file.

## Run the code.
Simply run `make SRC=<path/to/source>`. This will:
- create `bin` and `out` directories to store the object binary `.o` files and the executable `.elf` files respectively.
- assemble and link the files, everything happening should get written on the screen.
- put the last executable in `./last.elf` to execute it more easily.
