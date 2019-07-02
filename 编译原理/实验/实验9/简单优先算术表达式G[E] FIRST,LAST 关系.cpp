#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

vector<string> nvs;
vector<string> nts;
map<string, vector<string>> rps;
string s;

void warshall(int matrix[100][100], int width) {
	for (int i = 0; i < width; ++i)
		for (int j = 0; j < width; ++j)
			if (matrix[j][i] == 1)
				for (int k = 0; k < width; ++k)
					if (matrix[i][k] == 1)
						matrix[j][k] = 1;
}

void print_matrix(int matrix[100][100], int width, vector<string> vc) {
	for (int i = -1; i < width; ++i) {
		for (int j = -1; j < width; ++j) {
			cout.width(3);
			cout.setf(ios::right);
			if (i == -1 && j == -1)
				cout << ' ';
			else if (i == -1)
				cout << vc[j];
			else if (j == -1)
				cout << vc[i];
			else 
				cout << matrix[i][j];
		}
		cout << endl;
	}
}

void initial(int matrix[100][100]) {
	for (int i = 0; i < 100; ++i)
		for (int j = 0; j < 100; ++j)
			matrix[i][j] = 0;
}

int main() {
	cin >> s;
	int num;
	string word;
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> word;
		nvs.push_back(word);
	}
	cin >> num;
	for (int i = 0; i < num; ++i) {
		cin >> word;
		nts.push_back(word);
	}
	cin >> num;
	for (int i = 0; i < num; ++i) {
		int tmp;
		string rp;
		cin >> tmp >> word >> rp;
		rps[word].push_back(rp);
	}
	vector<string> vec = nvs;
	vec.insert(vec.end(), nts.begin(), nts.end());
	int width = vec.size();
	int first[100][100];
	int last[100][100];
	initial(first);
	initial(last);
	for (int i = 0; i < nvs.size(); ++i) {
		auto rights = rps[nvs[i]];
		for (int j = 0; j < rights.size(); ++j) {
			string letter = string(1, rights[j][0]);
			int index = find(vec.begin(), vec.end(), letter) - vec.begin();
			first[i][index] = 1;
			letter = string(1, rights[j][rights[j].size() - 1]);
			index = find(vec.begin(), vec.end(), letter) - vec.begin();
			last[i][index] = 1;
		}
	}
	cout << "FIRST=" << endl;
	print_matrix(first, width, vec);
	cout << "LAST=" << endl;
	print_matrix(last, width, vec);
	warshall(first, width);
	warshall(last, width);
	cout << "FIRST+=" << endl;
	print_matrix(first, width, vec);
	cout << "LAST+=" << endl;
	print_matrix(last, width, vec);
	return 0;
}