echo off
set name=%~n1
gcc  -c %name%.c -o %name%.o >gccmsg.txt
type gccmsg.txt

