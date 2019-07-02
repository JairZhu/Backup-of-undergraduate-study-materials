#include <iostream>
#include <string>
using namespace std;

struct { int number; string str[10]; } keywords = { 3,"int","main","return" }; //关键词
struct { int number; string str[10]; } operators = { 5,"+","*","=","+=","*=" }; //运算符
struct { int number; string str[10]; } boundaries = { 6,"(",")","{","}",",",";" }; //分界符
struct { int number; string str[100]; } identifieres = { 0 }; //标识符
struct { int number; string str[100]; } Unsigned_integer = { 0 }; //无符号整数

bool is_letter(char in) {
	return in >= 'a' && in <= 'z' || in >= 'A' && in <= 'Z';
}

int is_operator(char in) {
	for (int i = 0; i < operators.number; ++i) 
		if (in == operators.str[i][0])
			return i;
	return -1;
}

int is_boundary(char in) {
	for (int i = 0; i < boundaries.number; ++i) 
		if (in == boundaries.str[i][0])
			return i;
	return -1;
}

bool is_number(char in) {
	return in >= '0' && in <= '9';
}

int in_identifieres(string in) {
	for (int i = 0; i < identifieres.number; ++i) 
		if (in == identifieres.str[i])
			return i;
	return -1;
}

int is_keyword(string in) {
	for (int i = 0; i < keywords.number; ++i) 
		if (in == keywords.str[i])
			return i;
	return -1;
}

int in_Ui(string in) {
	for (int i = 0; i < Unsigned_integer.number; ++i) 
		if (in == Unsigned_integer.str[i])
			return i;
	return -1;
}

int main() {
	string source;
	while (true) {
		string input;
		getline(cin, input);
		if (input.empty()) break;
		source += input;
	}
	int i = 0;
	while (i < source.size()) {
		if (is_letter(source[i])) {
			string kword;
			kword += source[i++];
			while (is_letter(source[i]) || is_number(source[i])) 
				kword += source[i++];
			if (is_keyword(kword) != -1) {
				cout << "<1," << is_keyword(kword) << ">";
				continue;
			}
			if (in_identifieres(kword) != -1) 
				cout << "<4," << in_identifieres(kword) << ">";
			else {
				identifieres.str[identifieres.number++] = kword;
				cout << "<4," << in_identifieres(kword) << ">";
			}
			continue;
		}
		if (is_operator(source[i]) != -1) {
			cout << "<2," << is_operator(source[i++]) << ">";
			continue;
		}
		if (is_boundary(source[i]) != -1) {
			cout << "<3," << is_boundary(source[i++]) << ">";
			continue;
		}
		if (is_number(source[i])) {
			string number;
			number += source[i++];
			while (is_number(source[i])) 
				number += source[i++];
			if (in_Ui(number) != -1) 
				cout << "<5," << in_Ui(number) << ">";
			else {
				Unsigned_integer.str[Unsigned_integer.number++] = number;
				cout << "<5," << in_Ui(number) << ">";
			}
			continue;
		}
		if (source[i] == '#') break;
		i++;
	}
	cout << endl << "identifieres:";
	for (int j = 0; j < identifieres.number; ++j) 
		cout << identifieres.str[j] << ' ';
	cout << endl << "Unsigned_integer:";
	for (int j = 0; j < Unsigned_integer.number; ++j) 
		cout << Unsigned_integer.str[j] << ' ';
	return 0;
}