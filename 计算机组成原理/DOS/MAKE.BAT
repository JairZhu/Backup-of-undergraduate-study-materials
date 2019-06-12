@echo off
if .%1==.dev goto dev
if .%1==.extra goto extra
if .%1==.link goto link

echo Building DEBUG.COM
jwasm -nologo -bin -W4 -D?PM=0 -Fo DEBUG.COM debug.asm
echo Building DEBUGX.COM
jwasm -nologo -bin -W4 -D?PM=1 -Fo DEBUGX.COM debug.asm
goto end

:extra
echo Building DEBUGXD.COM - debug version of debugx
jwasm -nologo -bin -W4 -D?PM=1 -Fo DEBUGXD.COM -DCATCHINT01=0 -DCATCHINT03=0 debug.asm

echo Building DEBUGXE.COM - hooks interrupts 06, 0C and 0D in real-mode
jwasm -nologo -bin -W4 -D?PM=1 -Fo DEBUGXE.COM -DCATCHINT06=1 -DCATCHINT0C=1 -DCATCHINT0D=1 debug.asm

echo Building DEBUGXF.COM - DPMI client cannot modify interrupts 01, 03, 0D and 0E
jwasm -nologo -bin -W4 -D?PM=1 -Fo DEBUGXF.COM -DCATCHINT31=1 debug.asm

:dev
echo Building DEBUG.SYS - device driver version of debug
jwasm -nologo -bin -W4 -D?PM=0 -Fo DEBUG.SYS -DDRIVER=1 -DCATCHINT06=1 debug.asm
goto end

:link
echo Building DEBUG.COM
jwasmd -nologo -W4 -D?PM=0 -Fo DEBUG.OBJ debug.asm
link /nologo /tiny debug;
echo Building DEBUGX.COM
jwasmd -nologo -W4 -D?PM=1 -Fo DEBUGX.OBJ debug.asm
link /nologo /tiny debugx;
del debug*.obj
goto end

rem To build with MASM:
rem ml /AT /nologo /W3 /D?PM=0 /Fe DEBUG.COM debug.asm
rem ml /AT /nologo /W3 /D?PM=1 /Fe DEBUGX.COM debug.asm
rem del debug*.obj
:end
