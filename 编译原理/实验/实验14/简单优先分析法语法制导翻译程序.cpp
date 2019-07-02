#include <iostream>
#include <string>
#include <algorithm>
#include <vector>
using namespace std;

char start;

struct VN {
	int num;
	char vns[100];
} vn;

struct VT {
	int num;
	char vts[100];
} vt;

struct PS {
	int num;
	char pl[100];
	string pr[100];
	int action[100];
} ps;

int table[100][100];

int main() {
	cin >> start;
	cin >> vn.num;
	for (int i = 0; i < vn.num; ++i)
		cin >> vn.vns[i];
	cin >> vt.num;
	for (int i = 0; i < vt.num; ++i)
		cin >> vt.vts[i];
	int num, no;
	cin >> num;
	for (int i = 0; i < num; ++i)
		cin >> no;
	cin >> ps.num;
	for (int i = 0; i < ps.num; ++i) {
		cin >> no;
		cin >> ps.pl[no] >> ps.pr[no] >> ps.action[no];
	}
	string trans[100];
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> no;
		cin >> trans[no];
	}
	cin >> num;
	for (int i = 0; i < num; ++i)
		for (int j = 0; j < num; ++j)
			cin >> table[i][j];
	for (int i = 0; i < num; ++i) {
		table[i][num] = 3;
		table[num][i] = 1;
	}
	string exp;
	cin >> exp;
	vector<char> word_list(vn.vns, vn.vns + vn.num);
	word_list.insert(word_list.end(), vt.vts, vt.vts + vt.num);
	word_list.push_back('#');
	string stack = "#";
	while (true) {
		if (stack[stack.size() - 1] == start && exp[0] == '#')
			break;
		int x = find(word_list.begin(), word_list.end(), stack[stack.size() - 1]) - word_list.begin();
		int y = find(word_list.begin(), word_list.end(), exp[0]) - word_list.begin();
		int tmp = table[x][y];
		if (table[x][y] == 1 || table[x][y] == 2) {
			stack += exp[0];
			exp = exp.substr(1);
		}
		else if (table[x][y] == 3) {
			int k = stack.size() - 1;
			y = find(word_list.begin(), word_list.end(), stack[k]) - word_list.begin();
			x = find(word_list.begin(), word_list.end(), stack[k - 1]) - word_list.begin();
			while (table[x][y] != 1) {
				k--;
				y = find(word_list.begin(), word_list.end(), stack[k]) - word_list.begin();
				x = find(word_list.begin(), word_list.end(), stack[k - 1]) - word_list.begin();
			}
			string str = stack.substr(k);
			stack = stack.substr(0, k);
			for (int i = 1; i <= ps.num; ++i) 
				if (ps.pr[i] == str) {
					stack += ps.pl[i];
					if (ps.action[i] != 0)
						cout << ' ' << trans[ps.action[i]];
				}
		}
	}
	cout << endl;
	return 0;
}

//(0错误；1小于；2等于；3大于)