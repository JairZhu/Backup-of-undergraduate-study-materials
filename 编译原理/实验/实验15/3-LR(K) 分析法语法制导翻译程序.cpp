#include <iostream>
#include <string>
using namespace std;

char s;
struct VN {
	char vns[100];
	int num;
} vn;
struct VT {
	char vts[100];
	int num;
} vt;
struct PS {
	int num;
	char left[100];
	string right[100];
	int no[100];
} ps;
struct TABLE {
	int rows;
	int action_column;
	int goto_column;
	char action[100][100];
	int action_num[100][100];
	int goto_num[100][100];
} table;
string expresssion;
string actions[100];

int find_vt_index(char x) {
	for (int i = 0; i < vt.num; ++i)
		if (vt.vts[i] == x)
			return i;
	return -1;
}

int find_vn_index(char x) {
	for (int i = 0; i < vn.num; ++i)
		if (vn.vns[i] == x)
			return i;
	return -1;
}

int main() {
	cin >> s;
	cin >> vn.num;
	for (int i = 0; i < vn.num; ++i)
		cin >> vn.vns[i];
	cin >> vt.num;
	for (int i = 0; i < vt.num; ++i)
		cin >> vt.vts[i];
	int num, count;
	cin >> num;
	for (int i = 0; i < num; ++i)
		cin >> count;
	cin >> ps.num;
	for (int i = 0; i < ps.num; ++i) 
		cin >> count >> ps.left[i] >> ps.right[i] >> ps.no[i];
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> count;
		cin >> actions[count];
	}
	cin >> table.rows >> table.action_column >> table.goto_column;
	for (int i = 0; i < table.rows; ++i) {
		cin >> count;
		for (int j = 0; j < table.action_column + table.goto_column; ++j) {
			if (j < table.action_column)
				cin >> table.action[i][j] >> table.action_num[i][j];
			else
				cin >> table.goto_num[i][j - table.action_column];
		}
	}
	cin >> expresssion;
	string stack = "#0";
	while (true) {
		int state = stack[stack.size() - 1] - '0';
		int index = find_vt_index(expresssion[0]);
		char action = table.action[state][index];
		int no = table.action_num[state][index];
		switch (action) {
		case 'A':
			cout << " ";
			return 0;
		case 's':
			stack.push_back(expresssion[0]);
			stack.push_back('0' + no);
			expresssion = expresssion.substr(1);
			break;
		case 'r':
			int i = stack.size() - 2;
			string pop = string(1, stack[i]);
			while (ps.right[no] != pop) {
				i -= 2;
				pop.insert(pop.begin(), stack[i]);
			}
			if (ps.no[no] != 0)
				cout << " " << actions[ps.no[no]];
			stack = stack.substr(0, i);
			stack.push_back(ps.left[no]);
			stack.push_back('0' + table.goto_num[stack[i - 1] - '0'][find_vn_index(ps.left[no])]);
			break;
		}
	}
}