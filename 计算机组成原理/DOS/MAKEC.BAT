@echo off
rem Builds mktables.exe. Open Watcom's C compiler is used.
rem This step is only required if one of the following files were modified:
rem 1) instr.set
rem 2) instr.key
rem 3) instr.ord
rem 4) mktables.c
wcl -ox -3 mktables.c
rem To build with Microsoft C compiler use the following line:
rem cl /Ox /W3 mktables.c
