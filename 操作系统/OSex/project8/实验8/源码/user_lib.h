extern void cls();
extern char getchar();
extern void printchar();
extern void delay();
extern int fork();
extern int wait();
extern void exit();
extern void semaP();
extern void semaV();
extern int semaGet();

void reverse(char str[],int len) {
	int i;
    char t_char[100];
	for(i = 0;i < len;++i) {
		t_char[i] = str[len-i-1];
	}
	for(i = 0;i < len;++i) {
		str[i] = t_char[i];
	}
}

int strlen(char str[]) {
	int i = 0;
	while(str[i] != '\0') {
		i++;
	}
	return i;
}

void print(char *p) {
	while(*p != '\0') {
		printChar(*p);
		p++;
	}
}

int getline(char arr[],int maxLen) {
	int i = 0;
	char in;
	if(maxLen == 0) {
		return 0;
	}
	in = getchar();
	while(in != '\n'&& in != '\r') {
		int k = in;
		if(k == 8) {
			i--;
			in = getchar();
			continue;
		}
		printChar(in);
		arr[i++] = in;
		if(i == maxLen) {
			arr[i] = '\0';
			printChar('\n');
			return 0;
		}
		in = getchar();
	}
	arr[i] = '\0';
	print("\n\r");
    return 1;
}

void printInt(int ans) {
	int i = 0;
    char output[100];
	if(ans == 0) {
		output[0] = '0';
		i++;
	}
	while(ans) {
		int t = ans%10;
		output[i++] = '0'+t;
		ans/=10;
	}
	reverse(output,i);
	output[i] = '\0';
	print(output);
}
