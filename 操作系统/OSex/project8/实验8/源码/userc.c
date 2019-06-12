#include "user_lib.h"

char words[100];
int be_change = 0, fruit_disk, rand = 0;

void write(char *p) {
	int i = 0;
	while(*p != '\0') {
		words[i++] = *p;
		p++;
	}
}

void putfruit() {
	fruit_disk = rand++ % 10;
}

main() {
   int s, tmp;
   s = semaGet(0);
   print("\r\nUser: forking...\r\n");
   tmp = fork();
   if(tmp) {
	   while(1) {
		   semaP(s);
		   semaP(s);
		   if(be_change) {
			   print(words);
			   be_change = 0;
		   }
		   print("Father enjoy the fruit ");
		   printInt(fruit_disk);
		   print("\r\n");
		   fruit_disk = 0;
		}
   }
   else {
	   print("User: forking again...\r\n");
	   tmp = fork();
	   if(tmp) {
		   while(1) {
			   be_change = 1;
			   write("Father will live one year after anther forever!\r\n");
			   semaV(s);
			   delay(5000);
		   }
	   }
	   else {
		   while(1) {
			   putfruit();
			   semaV(s);
			   delay(5000);
		   }
	   }
   }
}

