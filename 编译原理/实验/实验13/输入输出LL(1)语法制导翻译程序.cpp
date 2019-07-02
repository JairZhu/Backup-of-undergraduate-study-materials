#include <iostream>
#include <string>
#include <algorithm>
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
} ps;

int table[100][100];

int find_vn(char s) {
	for (int i = 0; i < vn.num; ++i)
		if (s == vn.vns[i])
			return i;
	return -1;
}

int find_vt(char x) {
	for (int i = 0; i < vt.num; ++i)
		if (x == vt.vts[i])
			return i;
	return -1;
}

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
		cin >> ps.pl[no] >> ps.pr[no];
	}
	string trans[100];
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> no;
		cin >> trans[no];
	}
	cin >> num;
	for (int i = 0; i < num; ++i) {
		char r, c;
		cin >> no >> r >> c >> no;
		table[find_vn(r)][find_vt(c)] = no;
	}
	string exp;
	cin >> exp;
	string stack = "E";
	while (stack.size() != 0) {
		char top = stack[stack.size() - 1];
		stack = stack.substr(0, stack.size() - 1);
		if (top == exp[0]) {
			exp = exp.substr(1);
		}
		else if (top >= '1' && top <= '7') {
			cout << ' ' << trans[top - '0'];
		}
		else if (top == 'k') {
			continue;
		}
		else {
			string pr = ps.pr[table[find_vn(top)][find_vt(exp[0])]];
			reverse(pr.begin(), pr.end());
			stack += pr;
		}
	}
	cout << endl;
	return 0;
}