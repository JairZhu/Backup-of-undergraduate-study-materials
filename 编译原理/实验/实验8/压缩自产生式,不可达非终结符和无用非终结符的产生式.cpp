#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <set>
using namespace std;

map<string, vector<string>> rps;
vector<string> vns;
vector<string> vts;
char s;

bool in_vts(string x) {
	for (int i = 0; i < vts.size(); ++i)
		if (x == vts[i])
			return true;
	return false;
}

bool unreached(string vn) {
	for (int j = 0; j < vns.size(); ++j)
		for (int x = 0; x < rps[vns[j]].size(); ++x) 
			if (rps[vns[j]][x].find(vn) != string::npos)
				return false;
	return true;
}

bool is_useful(string x, set<string> useset) {
	for (int i = 0; i < x.size(); ++i) 
		if (useset.count(string(1, x[i])) || in_vts(string(1, x[i])))
			return true;
	return false;
}

set<string> get_useful_set() {
	set<string> useful;
	int size = -1;
	while (size != useful.size()) {
		size = useful.size();
		for (int i = 0; i < vns.size(); ++i) 
			for (int j = 0; j < rps[vns[i]].size(); ++j) 
				if (is_useful(rps[vns[i]][j], useful)) 
					useful.insert(vns[i]);
	}
	return useful;
}

int main() {
	cin >> s;
	int num;
	string word;
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
		string pr;
		cin >> word >> pr;
		rps[word].push_back(pr);
	}
	for (int i = 0; i < vns.size(); ++i) 
		for (int j = 0; j < rps[vns[i]].size(); ++j) {
			if (string(vns[i]) == rps[vns[i]][j]) {
				cout << "delete self production:" << vns[i] << "::=" << rps[vns[i]][j] << endl;
				rps[vns[i]].erase(rps[vns[i]].begin() + j);
			}
		}
	bool change = true, flag;
	while (change) {
		change = false;
		do {
			flag = false;
			for (int i = 1; i < vns.size(); ++i)
				if (unreached(vns[i])) {
					change = flag = true;
					cout << "unreached Vn:" << vns[i] << endl
						<< "delete VN:" << vns[i] << endl;
					for (int j = 0; j < rps[vns[i]].size(); ++j)
						cout << "delete production:" << vns[i] << "::=" << rps[vns[i]][j] << endl;
					vns.erase(vns.begin() + i);
					break;
				}
		} while (flag);
		auto useful = get_useful_set();
		for (int i = vns.size() - 1; i > 0; --i) {
			if (!useful.count(vns[i])) {
				change = true;
				cout << "unusefulNv:" << vns[i] << endl
					<< "delete VN:" << vns[i] << endl;
				for (int j = 0; j < vns.size(); ++j) {
					if (vns[j] == vns[i])
						for (int x = 0; x < rps[vns[j]].size(); ++x)
							cout << "delete production:" << vns[j] << "::=" << rps[vns[j]][x] << endl;
					else
						do {
							flag = false;
							for (int x = 0; x < rps[vns[j]].size(); ++x)
								if (rps[vns[j]][x].find(vns[i]) != string::npos || rps[vns[j]][x] == vns[i]) {
									cout << "delete production:" << vns[j] << "::=" << rps[vns[j]][x] << endl;
									rps[vns[j]].erase(rps[vns[j]].begin() + x);
									flag = true;
									break;
								}
						} while (flag);
				}
				vns.erase(vns.begin() + i);
			}
		}
	}
	cout << "G[" << s << "]:" << endl;
	for (int i = 0; i < vns.size(); ++i) {
		cout << vns[i] << "::=" << rps[vns[i]][0];
		for (int j = 1; j < rps[vns[i]].size(); ++j) 
			cout << " | " << rps[vns[i]][j];
		cout << endl;
	}
	return 0;
}