#include <iostream>
using namespace std;
#define endl "\r\n";

char priority[100][100];
int rows;
char vts[100];
int edges[200][200];
int counts[200];

void print_matrix(int matrix[200][200], int rows, int counts[200]) {
	for (int i = 0; i < rows; ++i) {
		counts[i] = 0;
		for (int j = 0; j < rows; ++j)
			if (matrix[i][j] == 1)
				counts[i]++;
		cout.setf(ios::right);
		cout.width(3);
		cout << counts[i];
		for (int j = 0; j < rows; ++j) {
			cout.setf(ios::right);
			cout.width(3);
			cout << matrix[i][j];
		}
		cout << endl;
	}
}

void warshall(int matrix[200][200], int rows) {
	for (int i = 0; i < rows; ++i)
		for (int j = 0; j < rows; ++j)
			if (matrix[j][i] == 1)
				for (int k = 0; k < rows; ++k)
					if (matrix[i][k] == 1)
						matrix[j][k] = 1;
}

int main() {
	cin >> rows;
	for (int i = 0; i < rows; ++i)
		cin >> vts[i];
	for (int i = 0; i < rows; ++i)
		for (int j = 0; j < rows; ++j)
			cin >> priority[i][j];
	for (int i = 0; i < rows; ++i)
		for (int j = 0; j < rows; ++j) 
			if (priority[i][j] == '>') 
				edges[i][rows + j] = 1;
			else if (priority[i][j] == '<') 
				edges[rows + j][i] = 1;
			else if (priority[i][j] == '=') {
				edges[i][rows + j] = 1;
				edges[rows + j][i] = 1;
			}
	warshall(edges, rows * 2);
	for (int i = 0; i < rows * 2; ++i)
		edges[i][i] = 1;
	print_matrix(edges, rows * 2, counts);
	cout.setf(ios::right);
	cout.width(3);
	cout << ' ';
	for (int i = 0; i < rows; ++i) {
		cout.setf(ios::right);
		cout.width(3);
		cout << vts[i];
	}
	cout << endl;
	cout.setf(ios::right);
	cout.width(3);
	cout << 'f';
	for (int i = 0; i < rows; ++i) {
		cout.setf(ios::right);
		cout.width(3);
		cout << counts[i];
	}
	cout << endl;
	cout.setf(ios::right);
	cout.width(3);
	cout << 'g';
	for (int i = 0; i < rows; ++i) {
		cout.setf(ios::right);
		cout.width(3);
		cout << counts[rows + i];
	}
	cout << endl;
	return 0;
}