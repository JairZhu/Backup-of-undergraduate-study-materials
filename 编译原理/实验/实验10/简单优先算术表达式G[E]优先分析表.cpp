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
int Equal[100][100], first[100][100], last[100][100], lequal[100][100], gequal[100][100], tlast[100][100], med[100][100];

void warshall(int matrix[100][100], int rows) {
	for (int i = 0; i < rows; ++i)
		for (int j = 0; j < rows; ++j)
			if (matrix[j][i] == 1)
				for (int k = 0; k < rows; ++k)
					if (matrix[i][k] == 1)
						matrix[j][k] = 1;
}

void matrix_mul(int lmatrix[100][100], int rmatrix[100][100], int result[100][100], int rows) {
	for (int i = 0; i < rows; ++i) 
		for (int j = 0; j < rows; ++j) {
			result[i][j] = 0;
			for (int k = 0; k < rows; ++k) 
				result[i][j] += lmatrix[i][k] * rmatrix[k][j];
		}
}

void matrix_trans(int s[100][100], int t[100][100], int rows) {
	for (int i = 0; i < rows; ++i)
		for (int j = 0; j < rows; ++j)
			t[j][i] = s[i][j];
}

void print_matrix(int matrix[100][100], vector<char> words, int length) {
	for (int i = -1; i < length; ++i) {
		for (int j = -1; j < length; ++j) {
			cout.setf(ios::right);
			cout.width(3);
			if (i == -1 && j == -1)
				cout << ' ';
			else if (i == -1)
				cout << words[j];
			else if (j == -1)
				cout << words[i];
			else
				cout << matrix[i][j];
		}
		cout << endl;
	}
}

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
	vector<char> words(nvs.nv, nvs.nv + nvs.num);
	words.insert(words.end(), vts.vt, vts.vt + vts.num);
	int length = nvs.num + vts.num;
	for (int i = 0; i < ps.num; ++i) 
		if (ps.pr[i].size() >= 2) {
			string prr = ps.pr[i];
			for (int j = 0; j < prr.size() - 1; ++j) {
				int x = find(words.begin(), words.end(), prr[j]) - words.begin();
				int y = find(words.begin(), words.end(), prr[j + 1]) - words.begin();
				Equal[x][y] = 1;
			}
		}
	for (int i = 0; i < ps.num; ++i) {
		string prr = ps.pr[i];
		int x = find(words.begin(), words.end(), ps.pl[i]) - words.begin();
		int y = find(words.begin(), words.end(), prr[0]) - words.begin();
		first[x][y] = 1;
		y = find(words.begin(), words.end(), prr[prr.size() - 1]) - words.begin();
		last[x][y] = 1;
	}
	warshall(first, length);
	warshall(last, length);
	matrix_mul(Equal, first, lequal, length);
	for (int i = 0; i < length; ++i)
		first[i][i] = 1;
	matrix_trans(last, tlast, length);
	matrix_mul(tlast, Equal, med, length);
	matrix_mul(med, first, gequal, length);
	cout << "EQUAL=" << endl;
	print_matrix(Equal, words, length);
	cout << "LEQUAL=" << endl;
	print_matrix(lequal, words, length);
	cout << "GEQUAL=" << endl;
	print_matrix(gequal, words, length);
	cout << "M[R]=" << endl;
	for (int i = -1; i < length; ++i) {
		for (int j = -1; j < length; ++j) {
			cout.setf(ios::right);
			cout.width(3);
			if (i == -1 && j == -1)
				cout << ' ';
			else if (i == -1)
				cout << words[j];
			else if (j == -1)
				cout << words[i];
			else  
				if (Equal[i][j])
					cout << '=';
				else if (lequal[i][j])
					cout << '<';
				else if (gequal[i][j])
					cout << '>';
				else
					cout << ' ';
		}
		cout << endl;
	}
	return 0;
}