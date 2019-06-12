
 1. About

    This is an enhanced clone of the MS-DOS/PC DOS DEBUG command which has
    many features not available in the original DEBUG.


 2. Files Overview

    The files in this distribution are:

    debug.com     the base executable.
    debugx.com    an extended version which is also DPMI aware.
    debug.txt     a reference guide.
    history.txt   list of changes.
    readme.txt    this file.
    dpmicl32.*    32-bit DPMI client sample program.

    The following files are also part of the distribution, but
    they're only needed if debug.com or debugx.com is to be rebuilt:

    debug.asm     Assembler source code for both debug.com and debugx.com.
                  Assemble with JWasm or MASM (see make.bat).
    debugtbl.inc  include file for debug.asm, contains tables for the
                  assemble and unassemble commands.
    fptostr.inc   include file for debug.asm, contains the routine to
                  convert a floating-point number to ASCII.
    instr.*       input data for mktables.
    mktables.c    C program to compile the internal instruction set
                  tables into source file debugtbl.inc.
    make.bat      batch file to build debug.com and debugx.com.
    makec.bat     batch file to build mktables.exe.


 3. Added/Missing Features

  a. This debugger extends MS-DOS DEBUG in the following ways:

   - The assembler and disassembler support all instructions including FPU
     instructions for Intel chips through the Pentium Pro (P6), except for the
     MMX instructions (as for DEBUGX, MMX is partially supported since v1.18).
     The assembler and disassembler inform you if any instruction is
     inappropriate for the current processor.

   - The current processor (for the purposes of assembler and disassembler
     warnings) can be declared to be something else via the following commands:

        m [x] set CPU/FPU mode.
              0 = 8086/8088, 1 = 80186/80188, 2 = 80286, 3 = 80386,
              4 = 80486, 5 = Pentium, 6 = Pentium Pro (or later).
              T = math coprocessor is a 80287 (only valid if current
                  processor is a 80386).
              N = math coprocessor is absent.
              no argument = print current CPU/FPU types.

   - 'd', 'p', 't' and 'u' are automatically repeated if a blank line is
     entered.

   - 'db', 'dw' and 'dd' displays bytes, words or dwords. The last display
     type selected is used for subsequent 'd' commands.

   - 'dm' displays the DOS memory control block (MCB) chain and the
     current PSP.

   - register names can be used anywhere where a number is expected as
     input. For example: "u cs:ip" or "d ds:si".

   - 'r cx 1234' may be used instead of having to put the '1234' on a
     separate line.

   - 'r register [value]' accepts 32-bit register names (for 80386+ CPU).

   - 'rn' displays FPU registers.

   - 'rx' switches between 16-bit and 32-bit register display (for 80386+ CPU).

   - 'h' can handle dword values.

   - 'iw', 'id', 'ow' and 'od' read/write a WORD or DWORD value from/to a port
     DWORD values require a 80386+ CPU.

   - 'pr' skips out of the current subroutine by proceeding past the next
     RET, RETF or IRET which is not nested without stopping.

   - 'tm 0|1' sets trace command mode, 0 = process INTs (default),
     1 = single-step INTs (the MS-DOS DEBUG compatible mode).

   - 'xr' allows reallocation of an EMS handle and 'xa' allows allocation of an
     "empty" EMS handle (with zero pages) - but only if an EMM v4.0 is present.

   - if DOS has set its InDOS flag, DEBUG will avoid using Int 21h
     internally, which allows single-stepping through DOS code.

   - When doing 'debug < file', debug will not hang if it reaches an end of
     file before encountering a 'q' command.

   - This debugger saves and restores the program's Control-C and critical
     error interrupts, providing for better isolation between the debugger
     and the program being debugged.

   - When a debugged program terminates, DEBUG will display the exit code
     obtained from Int 21h function 4Dh. The high byte is the exit type
     (0=normal, 1=Ctrl-C, 2=critical error, 3=TSR) and the low byte is the
     return code.

   - Video page flipping is supported. When the /F switch is used in text mode
     then the debugger will use page 1 while program output generally uses
     page 0. The 'v' command will show the program output on page 0.

  b. A DPMI aware version of the debugger, DEBUGX, is available, with the
     following additional features:

   - besides real-mode applications it can debug both 16-bit and 32-bit
     DPMI clients. To debug DPMI clients a DPMI host has to be installed.
     Tested with cwsdpmi, hdpmi, WinXP NTVDM, 32rtm. In DosEmu and
     Windows 95/98/ME DOS boxes it is required to single-step through
     the initial switch to protected-mode, else DEBUGX will lose control
     of the debuggee.

   - 'di': display interrupt vector(s)

   - 'dl': display LDT descriptor(s) (in protected-mode only)

   - 'dx': display extended memory (read via Int 15h, ah=87h). Requires a
     80286+ CPU. 'dx' is automatically repeated if a blank line is entered.

   - 'rm' displays MMX registers.

   - 'rn' displays FPU registers in "readable" format.

   - 'rnr' displays FPU registers in raw format.

  c. Optionally, one may build special-purpose versions of DEBUG.
     Run "make extra" to build them. The additional versions are:

   - DEBUGXD.COM: a version which doesn't hook Int 01 and Int 03. This
     allows to debug this version with a "normal" version of DEBUG.

   - DEBUGXE.COM: a version which hooks interrupts 06, 0Ch and 0Dh in
     real-mode. This is for rare cases when such exceptions may occur
     in real-mode applications.

   - DEBUGXF.COM: a version which hooks interrupt 31h in protected-mode
     and then rejects any attempt to modify exception vectors 01, 03,
     0Dh and 0Eh. This allows the debugging of DOS-extended applications
     that modify these vectors.

   - DEBUG.SYS: a version that is in DOS device driver format. This
     variant can be used to debug other device drivers. There are a few
     peculiarities: commands N and Q are rejected, commands L and W can't be
     used to load or write files and interrupt 06 (invalid opcode exception)
     is hooked.

  d. The following features of MS-DOS DEBUG are not implemented:

   - Loading of .HEX files.


 4. How to rebuild the DEBUG.COM/DEBUGX.COM binaries

    MAKE.BAT is intended for rebuilding the debugger binaries. The
    recommended tool for this is the JWasm assembler. Alternatively,
    MASM can be used, but then a 16-bit OMF linker will be needed.


 5. Copyright

    This program is copyrighted, but feel free to use it as you wish.
    For full copyright conditions, see the file debug.asm.

    Paul Vojta (1995-2003)
    Andreas Grech (2006-2011)
    Vernon Brooks (2013-2016)
