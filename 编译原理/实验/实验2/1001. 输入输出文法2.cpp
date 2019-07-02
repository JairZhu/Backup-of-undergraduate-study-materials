#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

struct VN{
	int Nv;
	string VN[100];
};
VN Vns = { 0 };

struct VT{
	int Nt;
	string VT[100];
};
VT Vts = { 0 };

struct PS {
	int Np;
	string PL[200], PR[200];
};
PS ps = { 0 };

string S;

int main() {
	cin >> S;
	cin >> Vns.Nv;
	for (int i = 0; i < Vns.Nv; ++i) 
		cin >> Vns.VN[i];
	cin >> Vts.Nt;
	for (int i = 0; i < Vts.Nt; ++i) 
		cin >> Vts.VT[i];
	cin >> ps.Np;
	for (int i = 0; i < ps.Np; ++i) 
		cin >> ps.PL[i] >> ps.PR[i];
	
	vector<string> tmp;
	PS output = { 0 };
	for (int i = 0; i < ps.Np; ++i) 
		if (find(tmp.begin(), tmp.end(), ps.PL[i]) == tmp.end()) {
			tmp.push_back(ps.PL[i]);
			output.PL[output.Np] = ps.PL[i];
			output.PR[output.Np] = ps.PR[i];
			for (int j = i + 1; j < ps.Np; ++j) 
				if (ps.PL[i] == ps.PL[j]) 
					output.PR[output.Np] += " | " + ps.PR[j];
			output.Np++;
		}
	
	cout << "G[" << S << "]:" << endl;
	for (int i = 0; i < Vns.Nv; ++i) {
		for (int j = 0; j < output.Np; ++j) {
			if (output.PL[j] == Vns.VN[i]) {
				cout << output.PL[j] << "::=" << output.PR[j] << endl;
				break;
			}
		}
	}
	return 0;
}