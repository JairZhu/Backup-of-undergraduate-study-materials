extern void getChar();
extern void cls();
extern void printChar();
extern void run();

char input, pro;

void print(char *str) {
	while(*str != '\0') {
		printChar(*str);
		str++;
	}
}

void getline(char *ptr, int length) {
	int count = 0;
	if (length == 0) {
		return;
	}
	else {
		getChar();
		while (input != 13) {
			printChar(input);
			ptr[count++] = input;
			if (count == length) {
				ptr[count] = '\0';
				print("\n\r");
				return;
			}
			getChar();
		}
		ptr[count] = '\0';
		print("\n\r");
		return;
	}
}

int strcmp(char *str1, char *str2) {
	while ((*str1) && (*str2)) {
		if (*str1 != *str2) {
			if (*str1 < *str2) return -1;
			return 1;
		}
		++str1;
		++str2;
	}
	return (*str1) - (*str2);
}

int strlen(char *str) {
	int i = 0;
	while(*(str++)) i++;
	return i;
}

int substr(char *src, char *sstr, int pos, int len) {
	int i = pos;
	for (; i < pos + len; ++i) {
		sstr[i - pos] = src[i];
	}
	sstr[pos + len] = '\0';
	return 1;
}

void initial() {
	cls();
	print("Welcome to MyOS by Jair Zhu (Zhu Zhiru -- 16337341)!\n\r");
	print("For supported shell commands type: help\n\r");
	print("Have fun!\n\n\r");
	return;
}

void ls() {
	print("Program 1 -- size: 1KB, sector number: 5th\n\r");
	print("Program 2 -- size: 1KB, sector number: 6th\n\r");
	print("Program 3 -- size: 1KB, sector number: 7th\n\r");
	print("Program 4 -- size: 1KB, sector number: 8th\n\r");
	print("Program 5 -- size: 1KB, sector number: 9th\n\n\r");
}

void help() {
	print("A list of all supported commands:\n\r");
	print("<cls> -- clean the screen\n\r");
	print("<ls> -- show the information of programs\n\r");
	print("<r> -- run user programs like r 1\n\r");
	print("<q> -- quit user program\n\r");
	print("<help> -- show all the supported shell commands\n\n\r");
}

void runprogram(char *comm) {
	int i;
	for (i = 1; i < strlen(comm); ++i) {
		if (comm[i] == ' ') continue;
		else if (comm[i] >= '1' && comm[i] <= '5') {
			pro = comm[i] - '0' + 4;
			run();
			return;
		}
		else {
			print("invalid program number: ");
			printChar(comm[i]);
			print("\n\n\r");
			return;
		}
	}
}

cmain() {	
	initial();
	while(1) {
		char commands[100];
		char tmp_char[10];
		print("root@MyOS:~#");
		getline(commands, 100);
		if (strcmp(commands, "help") == 0) help();
		else if (strcmp(commands, "cls") == 0) cls();
		else if (strcmp(commands, "ls") == 0) ls();
		else {
			substr(commands, tmp_char, 0, 1);
			if (strcmp(tmp_char, "r") == 0) {
				runprogram(commands);
			}
			else if (commands[0] == '\0') continue;
			else {
				print("Illegal command: ");
				print(commands);
				print("\n\n\r");
			}
		}
	}
}