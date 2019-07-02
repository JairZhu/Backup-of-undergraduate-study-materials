#include <iostream>
#include <vector>
#include <string>
#include <set>
using namespace std;

vector<string> rps[100];
vector<char> vns;
vector<char> vts;
char s;

int no_of_vns(char x) {
	for (int i = 0; i < vns.size(); ++i)
		if (x == vns[i])
			return i;
	return -1;
}

bool in_vts(char x) {
	for (int i = 0; i < vts.size(); ++i)
		if (x == vts[i])
			return true;
	return false;
}

bool can_reach_k(string x) {
	if (x == "k")
		return true;
	if (in_vts(x[0]))
		return false;
	for (int j = 0; j < rps[no_of_vns(x[0])].size(); ++j) {
		string rp = rps[no_of_vns(x[0])][j];
		string tmp = x;
		tmp.erase(0, 1);
		tmp.insert(0, rp);
		if (can_reach_k(tmp))
			return true;
	}
	return false;
}

set<char> get_first(char x) {
	set<char> first;
	if (in_vts(x) || x == 'k')
		first.insert(x);
	else {
		int index = no_of_vns(x);
		for (int i = 0; i < rps[index].size(); ++i) {
			string rp = rps[index][i];
			if (in_vts(rp[0]) || rp[0] == 'k')
				first.insert(rp[0]);
			else {
				auto tmp = get_first(rp[0]);
				tmp.erase('k');
				first.insert(tmp.begin(), tmp.end());
				for (int j = 1; j < rp.size(); ++j) {
					if (can_reach_k(rp.substr(0, j))) {
						tmp = get_first(rp[j]);
						tmp.erase('k');
						first.insert(tmp.begin(), tmp.end());
					}
					else
						break;
				}
				if (can_reach_k(rp))
					first.insert('k');
			}
		}
	}
	return first;
}

int main() {
	cin >> s;
	int num;
	char word;
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> word;
		vns.push_back(word);
	}
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> word;
		vts.push_back(word);
	}
	cin >> num;
	for (int i = 0; i < num; ++i) {
		int no;
		char lp;
		string rp;
		cin >> no >> lp >> rp;
		rps[no_of_vns(lp)].push_back(rp);
	}
	cout << "FIRST(VT)" << "\r\n";
	for (int i = 0; i < vns.size(); ++i) {
		cout << vns[i] << ' ';
		auto first = get_first(vns[i]);
		for (auto it = first.begin(); it != first.end(); ++it) 
			cout << *it;
		cout << "\r\n";
	}
	return 0;
}