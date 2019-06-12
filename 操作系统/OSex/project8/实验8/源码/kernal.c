#include "PCB.h"

extern void getChar();
extern void cls();
extern void printChar();
extern void run_process();

char input, sector_number, sector_size;

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
	print("User Program 1 -- size: 1KB, sector number: 11th\n\r");
	print("User Program 2 -- size: 1KB, sector number: 12th\n\r");
	print("User Program 3 -- size: 1KB, sector number: 13th\n\r");
	print("User Program 4 -- size: 1KB, sector number: 14th\n\r");
	print("Test Program -- size: 1KB, sector number: 15th\n\n\r");
}

void help() {
	print("A list of all supported commands:\n\r");
	print("<cls>  -- clean the screen\n\r");
	print("<ls>   -- show the information of programs\n\r");
	print("<t>    -- test Multi-process cooperation\n\r");
	print("<r>    -- run user programs like r 1234\n\r");
	print("<help> -- show all the supported shell commands\n\n\r");
}

void create_process(char *comm) {
	int i, sum = 0, flag = 0;
	for (i = 1; i < strlen(comm); ++i) {
		if (comm[i] == ' ' || comm[i] >= '1' && comm[i] <= '4') continue;
		else {
			print("invalid program number: ");
			printChar(comm[i]);
			print("\n\n\r");
			return;
		}
	}
	for (i = 1; i < strlen(comm); ++i) {
		if (comm[i] != ' ') flag = 1;
	}
	if (flag == 0) {
		print("invalid input\n\n\r");
		return;
	}
	for (i = 1; i < strlen(comm) && sum < MAX_PCB_NUMBER; ++i) {
		if (comm[i] == ' ') continue;
		sum++;
		sector_number = comm[i] - '0' + 10;
		sector_size = 1;
		run_process();
	}
	PCB_initial(&PCB_LIST[0], 1, 0x1000);
	kernal_mode = 0;
}

void run_test() {
	sector_number = 15;
	sector_size = 2;
	run_process();
	kernal_mode = 0;
}

cmain() {
	initial_PCB_settings();
	initial();
	initsema();
	kernal_mode = 1;
	while(1) {
		char commands[100];
		print("root@MyOS:~#");
		getline(commands, 100);
		if (strcmp(commands, "help") == 0) help();
		else if (strcmp(commands, "cls") == 0) cls();
		else if (strcmp(commands, "ls") == 0) ls();
		else if (commands[0] == 'r') create_process(commands);
		else if (strcmp(commands, "t") == 0) run_test();
		else if (commands[0] == '\0') continue;
		else {
			print("Illegal command: ");
			print(commands);
			print("\n\n\r");
		}
	}
}