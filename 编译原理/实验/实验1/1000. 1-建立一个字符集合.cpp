#include <iostream>
#include <string>
using namespace std;

bool isin(string set, char x) {
	for (int i = 0; i < set.size(); ++i) {
		if (set[i] == x)
			return true;
	}
	return false;
}

int main() {
	string input;
	string set;
	cin >> input;
	for (int i = 0; i < input.size(); ++i) {
		if (isin(set, input[i]))
			continue;
		set += input[i];
	}
	for (int i = 0; i < set.size(); ++i) {
		for (int j = i + 1; j < set.size(); ++j) {
			if (set[i] > set[j]) {
				char tmp = set[i];
				set[i] = set[j];
				set[j] = tmp;
			}
		}
	}
	cout << set << endl;
	return 0;
}