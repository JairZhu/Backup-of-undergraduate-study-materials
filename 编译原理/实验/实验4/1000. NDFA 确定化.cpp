#include <iostream>	
#include <string>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

int n, state_row, mapping_row, state[100][3], ccount = 0;
char mapping[100][3];
string start, endd;
char str[100];

vector<string> dfastate;
vector<string> ffstate;
queue<string> rstate;
string dmapping[100][3];

void createnewstate(string newstate) {
	dfastate.push_back(newstate);
	for (int k = 0; k < n; ++k) {
		string newstringstate;
		for (int i = 0; i < newstate.size(); ++i) {
			for (int j = 0; j < mapping_row; ++j) {
				if (mapping[j][0] == newstate[i] && mapping[j][2] == str[k]) {
					if (newstringstate.find(mapping[j][1]) == string::npos) {
						newstringstate += mapping[j][1];
					}
				}
			}
		}
		if (!newstringstate.empty()) {
			dmapping[ccount][0] = newstate;
			dmapping[ccount][1] = newstringstate;
			dmapping[ccount][2] = str[k];
			ccount++;
			if (find(dfastate.begin(), dfastate.end(), newstringstate) == dfastate.end() && find(ffstate.begin(), ffstate.end(), newstringstate) == ffstate.end()) {
					ffstate.push_back(newstringstate);
					rstate.push(newstringstate);
			}
		}
	}
}

bool is_endstate(string lstate) {
	for (int i = 0; i < lstate.size(); ++i) {
		if (endd.find(lstate[i]) != string::npos)
			return true;
	}
	return false;
}

int main() {
	cin >> n;
	for (int i = 0; i < n; ++i) 
		cin >> str[i];
	cin >> state_row;
	for (int i = 0; i < state_row; ++i) {
		for (int j = 0; j < 3; ++j) {
			cin >> state[i][j];
			if (j == 1 && state[i][j] == 1) 
				start += to_string(state[i][0]);
			if (j == 2 && state[i][j] == 1)
				endd += to_string(state[i][0]);
		}
	}
	cin >> mapping_row;
	for (int i = 0; i < mapping_row; ++i)
		for (int j = 0; j < 3; ++j)
			cin >> mapping[i][j];
	createnewstate(start);
	while (!rstate.empty()) {
		createnewstate(rstate.front());
		rstate.pop();
	}
	vector<string> endstate;
	for (int i = 0; i < dfastate.size(); ++i) {
		if (is_endstate(dfastate[i]))
			endstate.push_back(dfastate[i]);
	}
	cout << "Determine State:" << endl;
	for (int i = 0; i < dfastate.size(); ++i) {
		if (dfastate[i] == start)
			cout << i << ' ' << 1 << ' ' << 0 << ' ' << '[' << dfastate[i] << ']' << endl;
		else if (find(endstate.begin(), endstate.end(), dfastate[i]) != endstate.end())
			cout << i << ' ' << 0 << ' ' << 1 << ' ' << '[' << dfastate[i] << ']' << endl;
		else
			cout << i << ' ' << 0 << ' ' << 0 << ' ' << '[' << dfastate[i] << ']' << endl;
	}
	cout << "Determine Mapping:" << endl;
	for (int i = 0; i < ccount; ++i) {
		auto pos1 = distance(dfastate.begin(), find(dfastate.begin(), dfastate.end(), dmapping[i][0]));
		auto pos2 = distance(dfastate.begin(), find(dfastate.begin(), dfastate.end(), dmapping[i][1]));
		cout << pos1 << ' ' << pos2 << ' ' << dmapping[i][2] << " (" << i << endl;
	}
	return 0;
}