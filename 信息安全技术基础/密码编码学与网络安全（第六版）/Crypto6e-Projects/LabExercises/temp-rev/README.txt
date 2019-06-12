README

In this folder you will find the following files:

- clientsun: binary file of the client compiled on SUN
- serversun: binary file of the server compiled on SUN
- clientlin: binary file of the client compiled on LINUX
- serverlin: binary file of the server compiled on LINUX
- test.txt: Text file to be transfered from server to client

To execute these files, complete the following steps:

On linux:
1. Write in the command line: ./serverlin 9877 password test.txt
2. On a different terminal, Write in the command line: ./clientlin msee190pcXX.ecn.purdue.edu 9877 password password password test.recv
	Where XX is the number of the machine you are using at msee190.

On SUN:
1. Write in the command line: ./serversun 9877 password test.txt
2. On a different terminal, Write in the command line: ./clientsun shay.ecn.purdue.edu 9877 password password password test.recv

This test programs have an extra feature, a DEBUG option. To activate this option, do the following:
On Linux:
1. Write in the command line: ./serverlin 9877 password test.txt -DDEBUG
2.Write in the command line: ./clientlin msee190pcXX.ecn.purdue.edu 9877 password password password test.recv -DDEBUG
	Where XX is the number of the machine you are using at msee190.

On SUN:
Follow the same format as in Linux, using the correct binary files.
