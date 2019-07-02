#include <iostream>
using namespace std;

int main() {
	int rows;
	int matrix[100][100];
	cin >> rows;
	for (int i = 0; i < rows; ++i) 
		for (int j = 0; j < rows; ++j) 
			cin >> matrix[i][j];
	for (int i = 0; i < rows; ++i) 
		for (int j = 0; j < rows; ++j) 
			if (matrix[j][i] == 1) 
				for (int k = 0; k < rows; ++k) 
					if (matrix[i][k] == 1) 
						matrix[j][k] = 1;
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < rows; ++j) {
			cout.setf(ios::right);
			cout.width(3);
			cout << matrix[i][j];
		}
		cout << endl;
	}
	return 0;
}