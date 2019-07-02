#include <iostream>
#include <string>
#include <iomanip>
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

int main() {
	cin >> start;
	cin >> vn.num;
	for (int i = 0; i < vn.num; ++i)
		cin >> vn.vns[i];
	cin >> vt.num;
	for (int i = 0; i < vt.num; ++i)
		cin >> vt.vts[i];
	cin >> ps.num;
	int ss;
	for (int i = 0; i < ps.num; ++i) 
		cin >> ss >> ps.pl[i] >> ps.pr[i];
	int cnt = 1;
	for (int i = 1; i <= ps.num; ++i) 
		for (int j = 0; j <= ps.pr[i - 1].size(); ++j) 
			cout << setw(3) << cnt++ << setw(3) << i
			<< setw(3) << j << setw(3) << ps.pl[i - 1] 
			<< "   " << ps.pr[i - 1] << endl;
	return 0;
}