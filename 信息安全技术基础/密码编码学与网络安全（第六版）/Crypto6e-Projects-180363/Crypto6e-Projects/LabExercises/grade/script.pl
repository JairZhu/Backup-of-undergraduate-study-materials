#!/usr/local/bin/perl

#Script to test codes for lab1.
#Before executing
#To execute, just write "./script.pl" in the command line.

#Test case 1, file name
	my($group) = "sanjay.rtorresg";	#MODIFY TO YOUR C FILE NAME
	printf("\n$group\n");
	my($file) = $group . "." . "des.c";

#Test Case 2, compilation
	printf("\nFILE compilation\n");
	system("gcc", "-o", $file . "." . "cmp", "$file", "-lcrypto");

	my($exec) = $file . "." . "cmp";
	my($output1) = $file . "." . "txt1";
	my($output2) = $file . "." . "txt2";

#Test Case 3a, Encryption of file multiple of 64 bits
	printf("\nENCRYPTION - file multiple of 64 bits - input file is test1.txt, output file is $output1\n");
	system(".\/$exec","0f1e2d3cb4a59687","a1b3c4d6e9f12345","test1.txt",$output1);

#Test Case 4a, Encryption of an arbitrary file
	printf("\nENCRYPTION - arbitrary file - input file is test1.txt, output file is $output2\n");
	system(".\/$exec","0f1e2d3cb4a59687","a1b3c4d6e9f12345","test2.txt",$output2);

#Test Case 3b, Prove that output file for test case 2 is equal to test file "test1.des"
	printf("\nDIFF - file multiple of 64 bits  - $output1 vs test1.des\n");
	printf("##Expected output is a blank line\n");
	system("diff",$output1,"test1.des");

#Test Case 4b, Prove that output file for test case 2 is equal to test file "test2.des"
	printf("\nDIFF - arbitrary file - $output2 vs test2.des\n");
	printf("##Expected output is a blank line\n");
	system("diff",$output2,"test2.des");

#Test Case 5, Verify bad key
	printf("\nVERIFY bad key\n");
	printf("##Expected output is any message that tells the user the key is wrong\n");
	system(".\/$exec","0f1e2d3cb4a59687","a1b3c4d6e9f12344","test1.txt",$output1);

#Test Case 6, Verify bad IV
	printf("\nVERIFY bad IV\n");
	printf("##Expected output is any message that tells the user the IV is wrong\n");
	system(".\/$exec","0f1e2d3cba59687","a1b3c4d6e9f12345","test1.txt",$output1);
