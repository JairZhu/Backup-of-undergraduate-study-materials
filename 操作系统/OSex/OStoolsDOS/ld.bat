@echo off
set name1=%~n1
set name2=%~n2
set name3=%~n3
ld -s  %name1%.o %name2%.o %name3%.o -o %name1%.com  > lkmsg.txt
type lkmsg.txt |find "Error"
type lkmsg.txt |find "Warn"

