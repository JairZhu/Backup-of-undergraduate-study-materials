@echo off
set name1=%~n1
set name2=%~n2
set name3=%~n3
tlink /3  /t %name1%.obj %name2%.obj %name3%.obj,%name1%.com,,  > lkmsg.txt
type lkmsg.txt |find "Error"
type lkmsg.txt |find "Warn"

