#include <iostream>
#include <vector>
#include <algorithm>
#include <time.h>
using namespace std;


bool constraint_check(int board[30][30], int x, int y, int n) {
	//约束性检测，判断纵行和斜线上是否存在皇后
	int directions[3][2] = { {-1, -1}, {-1, 0}, {-1, 1} };
	for (int i = 0; i < 3; ++i)
		for (int nx = x, ny = y; nx < n && ny < n && nx >= 0 && ny >= 0; nx += directions[i][0], ny += directions[i][1])
			if (board[nx][ny])
				return false;
	return true;
}

bool backtracking(int board[30][30], int level, int n) {
	if (level == n) 
		//找到一个解，结束搜索
		return true;
	for (int i = 0; i < n; ++i)
		if (constraint_check(board, level, i, n)) {
			//满足约束条件，将皇后放置到该位置
			board[level][i] = 1;
			if (backtracking(board, level + 1, n))
				//深度优先搜索下一层位置
				return true;
			else 
				//下层返回false，表明不存在解，则将该位置的皇后移除
				board[level][i] = 0;
		}
	//未找到本层放置皇后的位置，返回false
	return false;
}

bool FCCheck(int domain[30][30], int level, int y, int n, bool recovery) {
	int directions[3][2] = { {1, -1}, {1, 0}, {1, 1} };
	for (int j = 0; j < 3; ++j)
		for (int nx = level + directions[j][0], ny = y + directions[j][1]; nx < n && ny < n && ny >= 0; nx += directions[j][0], ny += directions[j][1]) {
			if (!recovery)
				//在domain矩阵的相应位置+1，表示在取值范围中删除该值
				domain[nx][ny]++;
			else
				//在domain矩阵的相应位置-1，表值在取值范围中恢复该值
				domain[nx][ny]--;
		}
	if (recovery)
		//如果是恢复过程，则不需检测是否DWO
		return true;
	for (int i = 0; i < n; ++i) {
		bool empty = true;
		for (int j = 0; j < n; ++j) 
			if (domain[i][j] == 0) {
				empty = false;
				break;
			}
		if (empty) 
			//存在某个变量的取值范围为空集，返回DWO
			return false;
	}
	//不存在取值范围为空集的变量
	return true;
}

bool FC(int board[30][30], int domain[30][30], int level, int n) {
	if (level == n)
		//找到一个解，结束搜索
		return true;
	for (int i = 0; i < n; ++i) {
		if (domain[level][i] == 0) {
			//如果domain矩阵中相应位置的上的值为0，则可以放置皇后
			board[level][i] = 1;
			if (FCCheck(domain, level, i, n, false))
				//删除未赋值变量的取值范围中不满足约束的值，并检测DWO
				if (FC(board, domain, level + 1, n))
					//未检测到DWO，则深度优先搜索下一层位置
					return true;
			//检测到DWO，则将该位置的皇后移除
			board[level][i] = 0;
			//复原domain矩阵
			FCCheck(domain, level, i, n, true);
		}
	}
	//未找到本层放置皇后的位置，返回false
	return false;
}

void forwardchecking(int board[30][30], int n) {
	//声明domain矩阵，并将所有位置的值初始化为0
	int domain[30][30];
	memset(domain, 0, sizeof(domain));
	//运行向前检测算法
	FC(board, domain, 0, n);
}

int main() {
	int board[30][30], n;
	memset(board, 0, sizeof(board));
	cout << "请输入N：";
	cin >> n;

	double start_time = clock();
	backtracking(board, 0, n);
	double end_time = clock();
	cout << "Backtracking:" << endl
		<< "用时：" << end_time - start_time << "ms" << endl
		<< "其中一个解：\n";
	for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j)
			if (board[i][j])
				cout << 'W';
			else
				cout << 'o';
		cout << endl;
	}
	cout << endl;

	memset(board, 0, sizeof(board));
	start_time = clock();
	forwardchecking(board, n);
	end_time = clock();
	cout << "Forward-checking:" << endl
		<< "用时：" << end_time - start_time << "ms" << endl
		<< "其中一个解：\n";
	for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j)
			if (board[i][j])
				cout << 'W';
			else
				cout << 'o';
		cout << endl;
	}
	system("pause");
	return 0;
}