#include <iostream>	
#include <string>
#include <algorithm>
#include <vector>
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
	string pl[100], pr[100];
} ps;

string s;

bool reachable(PS source, string vn) {
	for (int i = 0; i < source.np; ++i) 
		if (source.pr[i].find(vn) != string::npos)
			return true;
	return false;
}

bool is_unreached(VN unreached, string vn) {
	for (int i = 0; i < unreached.nv; ++i) 
		if (unreached.vn[i] == vn)
			return true;
	return false;
}

int main() {
	cin >> s >> vns.nv;
	for (int i = 0; i < vns.nv; ++i)
		cin >> vns.vn[i];
	cin >> vts.nt;
	for (int i = 0; i < vts.nt; ++i)
		cin >> vts.vt[i];
	cin >> ps.np;
	for (int i = 0; i < ps.np; ++i)
		cin >> ps.pl[i] >> ps.pr[i];
	PS update = { 0 };
	for (int i = 0; i < ps.np; ++i) {
		if (ps.pl[i] == ps.pr[i]) {
			cout << "delete self production:" << ps.pl[i] << "::=" << ps.pr[i] << endl;
		}
		else {
			update.pl[update.np] = ps.pl[i];
			update.pr[update.np] = ps.pr[i];
			update.np++;
		}
	}
	VN unreached = { 0 };
	for (int i = 0; i < vns.nv; ++i) {
		if (vns.vn[i] != s && !reachable(update, vns.vn[i])) {
			unreached.vn[unreached.nv++] = vns.vn[i];
			cout << "unreached Vn:" << vns.vn[i] << endl;
		}
	}
	PS final = { 0 }, output = { 0 };
	for (int i = 0; i < unreached.nv; ++i) {
		for (int j = 0; j < update.np; ++j) {
			if (update.pl[j] == unreached.vn[i]) {
				cout << "delete production:" << update.pl[j] << "::=" << update.pr[j] << endl;
			}
		}
	}
	for (int i = 0; i < unreached.nv; ++i) {
		cout << "delete VN:" << unreached.vn[i] << endl;
	}
	for (int i = 0; i < update.np; ++i) {
		if (!is_unreached(unreached, update.pl[i])) {
			final.pl[final.np] = update.pl[i];
			final.pr[final.np] = update.pr[i];
			final.np++;
		}
	}
	vector<string> tmp;
	for (int i = 0; i < final.np; ++i) {
		if (find(tmp.begin(), tmp.end(), final.pl[i]) == tmp.end()) {
			tmp.push_back(final.pl[i]);
			output.pl[output.np] = final.pl[i];
			output.pr[output.np] = final.pr[i];
			for (int j = i + 1; j < final.np; ++j) {
				if (final.pl[i] == final.pl[j]) {
					output.pr[output.np] += " | " + final.pr[j];
				}
			}
			output.np++;
		}
	}
	cout << "G[" << s << "]:" << endl;
	for (int i = 0; i < vns.nv; ++i) {
		if (!is_unreached(unreached, vns.vn[i])) {
			for (int j = 0; j < output.np; ++j) {
				if (output.pl[j] == vns.vn[i]) {
					cout << output.pl[j] << "::=" << output.pr[j] << endl;
					break;
				}
			}
		}
	}
	return 0;
}