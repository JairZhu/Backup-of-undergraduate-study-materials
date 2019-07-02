#include <iostream>
#include <string>
using namespace std;

struct VN {
	int nv;
	string vn[100];
} vns;

struct VT {
	int nt;
	string vt[100];
} vts;

struct PS {
	int np;
	string pl[100];
	string pr[100];
} ps;

struct LLtable {
	int size;
	string row[100];
	string col[100];
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
	vts.vt[vts.nt++] = "#";
	cin >> ps.np;
	int no;
	for (int i = 0; i < ps.np; ++i)
		cin >> no >> ps.pl[i] >> ps.pr[i];
	cin >> lltable.size;
	for (int i = 0; i < lltable.size; ++i)
		cin >> no >> lltable.row[i] >> lltable.col[i] >> lltable.No[i];
	cout << "     ";
	for (int i = 0; i < vts.nt; ++i) {
		cout.setf(ios::right);
		cout.width(5);
		cout << vts.vt[i];
	}
	cout << endl;
	for (int i = 0; i < vns.nv; ++i) {
		for (int j = -1; j < vts.nt; ++j) {
			cout.setf(ios::right);
			cout.width(5);
			if (j == -1) 
				cout << vns.vn[i];
			else {
				int index = -1;
				for (int x = 0; x < lltable.size; ++x) {
					if (lltable.row[x] == vns.vn[i] && lltable.col[x] == vts.vt[j]) {
						index = lltable.No[x] - 1;
					}
				}
				if (index == -1)
					cout << ' ';
				else
					cout << ps.pr[index];
			}
		}
		cout << endl;
	}
	return 0;
}