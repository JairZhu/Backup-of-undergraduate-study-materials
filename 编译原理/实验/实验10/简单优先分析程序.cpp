#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

struct NVS {
	int num;
	char nv[100];
} nvs;

struct VTS {
	int num;
	char vt[100];
} vts;

struct PS {
	int num;
	char pl[100];
	string pr[100];
} ps;

char s;
int matrix[100][100];

int main() {
	cin >> s;
	cin >> nvs.num;
	for (int i = 0; i < nvs.num; ++i)
		cin >> nvs.nv[i];
	cin >> vts.num;
	for (int i = 0; i < vts.num; ++i)
		cin >> vts.vt[i];
	cin >> ps.num;
	for (int i = 0; i < ps.num; ++i) {
		int No;
		cin >> No >> ps.pl[i] >> ps.pr[i];
	}
	vector<char> word(nvs.nv, nvs.nv + nvs.num);
	word.insert(word.end(), vts.vt, vts.vt + vts.num);
	word.push_back('#');
	int length;
	cin >> length;
	for (int i = 0; i < length; ++i)
		for (int j = 0; j < length; ++j)
			cin >> matrix[i][j];
	for (int i = 0; i < length; ++i) {
		matrix[i][length] = 3;
		matrix[length][i] = 1;
	}
	string expression;
	cin >> expression;
	string ss = "#";
	cout << ss << " & " << expression <<  endl;
	ss += expression[0];
	expression = expression.substr(1);
	while (true) {
		cout << ss << " & " << expression << endl;
		if (expression == "#" && ss == "#E")
			return 0;
		int x = find(word.begin(), word.end(), ss[ss.size() - 1]) - word.begin();
		int y = find(word.begin(), word.end(), expression[0]) - word.begin();
		if (matrix[x][y] == 1 || matrix[x][y] == 2) {
			ss += expression[0];
			expression = expression.substr(1);
		}
		else if (matrix[x][y] == 3) {
			int k = ss.size() - 1;
			y = find(word.begin(), word.end(), ss[k]) - word.begin();
			x = find(word.begin(), word.end(), ss[k - 1]) - word.begin();
			while (matrix[x][y] != 1) { 
				k--; 
				y = find(word.begin(), word.end(), ss[k]) - word.begin();
				x = find(word.begin(), word.end(), ss[k - 1]) - word.begin();
			}
			string str = ss.substr(k);
			ss = ss.substr(0, k);
			for (int i = 0; i < ps.num; ++i)
				if (ps.pr[i] == str)
					ss += ps.pl[i];
		}
	}
}