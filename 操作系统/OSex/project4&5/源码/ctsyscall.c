#include "stdio.c"

cmain() {
	cls();
	while (1) {
		char IN[100];
		print("Please input something(input 'q' to quit): ");
		getline(IN, 100);
		if (strcmp(IN, "q") == 0) break;
		print("\n\rYour input is ");
		print(IN);
		print("\n\n\r");
	}
}