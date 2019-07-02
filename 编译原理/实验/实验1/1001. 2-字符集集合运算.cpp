#include <iostream>
#include <string>
#include <vector>
using namespace std;

bool isin(string set, char x) {
	for (int i = 0; i < set.size(); ++i) {
		if (set[i] == x)
			return true;
	}
	return false;
}

int main() {
	int n;
	cin >> n;
	string input[1000];
	string set[1000];
	for (int i = 0; i < n; ++i) {
		cin >> input[i];
		for (int j = 0; j < input[i].size(); ++j) {
			if (isin(set[i], input[i][j]))
				continue;
			set[i] += input[i][j];
		}
		for (int x = 0; x < set[i].size(); ++x) {
			for (int y = x + 1; y < set[i].size(); ++y) {
				if (set[i][x] > set[i][y]) {
					char tmp = set[i][x];
					set[i][x] = set[i][y];
					set[i][y] = tmp;
				}
			}
		}
	}
	vector<int> out;
	for (int i = 0; i < n; ++i) {
		bool in = false;
		for (int j = 0; j < i; ++j) {
			if (set[i] == set[j]) {
				in = true;
			}
		}
		if (!in) out.push_back(i);
	}
	for (int i = 0; i < out.size() - 1; ++i)
		cout << set[out[i]] << endl;
	cout << set[out[out.size() - 1]];
	return 0;
}