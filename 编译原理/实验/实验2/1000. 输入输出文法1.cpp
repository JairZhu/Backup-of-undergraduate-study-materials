#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

struct {
	int Nv;
	string VN[10];
} Vns = {3, "E", "T", "F"};

struct {
	int Nt; 
	string VT[10];
} Vts = { 7, "+", "-", "*", "/", "(", ")", "i" };

struct PS{
	int Np;
	string PL[20], PR[20];
};

PS ps = { 0 };

string S = "E";

int main() {
	cin >> ps.Np;
	for (int i = 0; i < ps.Np; ++i) {
		cin >> ps.PL[i] >> ps.PR[i];
	}
	vector<string> tmp;
	PS output = { 0 };
	for (int i = 0; i < ps.Np; ++i) {
		if (find(tmp.begin(), tmp.end(), ps.PL[i]) == tmp.end()) {
			tmp.push_back(ps.PL[i]);
			output.PL[output.Np] = ps.PL[i];
			output.PR[output.Np] = ps.PR[i];
			for (int j = i + 1; j < ps.Np; ++j) {
				if (ps.PL[i] == ps.PL[j]) {
					output.PR[output.Np] += " | " + ps.PR[j];
				}
			}
			output.Np++;
		}
	}
	cout << "G[E]:" << endl;
	for (int i = 0; i < output.Np; ++i) {
		cout << output.PL[i] << "::=" << output.PR[i] << endl;
	}
	return 0;
}