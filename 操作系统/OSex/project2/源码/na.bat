@echo off
set name=%~n1
nasm -f bin %name%.asm -o %name%.com  > amsg.txt
type amsg.txt |find "Error"
type amsg.txt |find "Warn"

