# Homebrew NES: Part I - Tooling
This is an example repository that contains tooling configuration for
Homebrew NES ROM development, described in **Homebrew NES: Part I - Tooling**,
found here:

https://evinowen.medium.com/homebrew-nes-part-i-tooling-531fba54364e

## Makefile
The content describes the creation of a Makefile for leveraging ca65 and ld65
for generating a .NES ROM file. There is no source defined for this part of
the process - `src/main.asm` is empty - the expected output of `make` is as follows:

```
ca65 -g -l ./project.lnk -t none src/main.asm -o ./project.o
ld65 -Ln ./project.lbl -m ./project.map -vm --dbgfile ./project.dbg -o ./project.nes -C ./nes.cfg ./project.o none.lib
ld65: Warning: ./nes.cfg(16): Segment 'HEADER' does not exist
ld65: Warning: ./nes.cfg(16): Segment 'PROGRAM' does not exist
ld65: Warning: ./nes.cfg(16): Segment 'LAYOUT' does not exist
ld65: Warning: ./nes.cfg(16): Segment 'VECTORS' does not exist
ld65: Warning: ./nes.cfg(16): Segment 'GRAPHICS' does not exist
```
