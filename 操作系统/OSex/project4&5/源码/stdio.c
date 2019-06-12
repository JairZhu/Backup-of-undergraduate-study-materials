#ifndef STDIO
#define STDIO

char input;

extern void getChar();
extern void printChar();
extern void cls();
extern void sleep();

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

#endif