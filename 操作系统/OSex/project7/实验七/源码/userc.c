extern int fork();
extern int wait();
extern void exit();

#include "user_lib.h"

char str[80] = "129djwqhdsajd128dw9i39ie93i8494urjoiew98kdkd";
int LetterNr = 0;

void main() 
{
	int pid;
	print("\r\n\r\ncount string: ");
	print(str);
	print("\r\n");
	print("In the user: before fork\r\n");
	pid = fork();
	print("In the user: after fork\r\n");
	print("The pid is: ");
	printInt(pid);
	print("\r\n");
	if(pid == -1) {
		print("error in fork!\r\n");
		exit(-1);
	} 
	if(pid) {
		print("In the user: before wait\r\n");
		wait();
		print("In the user: after wait\r\n");
		print("LetterNr = ");
		printInt(LetterNr);
		print("\r\n");
		print("In the user: process exit\r\n");
		exit(0);
	}
	else {
		print("In the user: sub process is counting\r\n");
		LetterNr = strlen(str);
		print("In the user: sub process exit\r\n");
		exit(0);
	}
}