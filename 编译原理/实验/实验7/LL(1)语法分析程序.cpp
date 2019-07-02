#include <iostream>
#include <string>
using namespace std;

struct VN {
	int nv;
	char vn[100];
} vns;

struct VT {
	int nt;
	char vt[100];
} vts;

struct PS {
	int np;
	char pl[100];
	string pr[100];
} ps;

struct LLtable {
	int size;
	char row[100];
	char col[100];
	int No[100];
} lltable;

string s;

int main() {
	cin >> s >> vns.nv;
	for (int i = 0; i < vns.nv; ++i)
		cin >> vns.vn[i];
	cin >> vts.nt;
	for (int i = 0; i < vts.nt; ++i)
		cin >> vts.vt[i];
	vts.vt[vts.nt++] = '#';
	cin >> ps.np;
	int no;
	for (int i = 0; i < ps.np; ++i)
		cin >> no >> ps.pl[i] >> ps.pr[i];
	cin >> lltable.size;
	for (int i = 0; i < lltable.size; ++i)
		cin >> no >> lltable.row[i] >> lltable.col[i] >> lltable.No[i];
	string expression;
	cin >> expression;
	string states = s;
	string syn;
	for (int i = 0; i < expression.size(); ++i) {
		while (expression[i] != states[0]) {
			if (expression[i] == '#' && states.empty()) {
				cout << '#' << syn << " & " << states << '#' << endl;
				return 0;
			}
			if (states[0] == 'k') {
				states.erase(0, 1);
				continue;
			}
			cout << '#' << syn << " & " << states << '#' << endl;
			int index = -1;
			for (int x = 0; x < lltable.size; ++x)
				if (lltable.row[x] == states[0] && lltable.col[x] == expression[i])
					index = lltable.No[x] - 1;
			states.erase(0, 1);
			states = ps.pr[index] + states;
		}
		cout << '#' << syn << " & " << states << '#' << endl;
		syn = expression.substr(0, i + 1);
		states.erase(0, 1);
	}
}