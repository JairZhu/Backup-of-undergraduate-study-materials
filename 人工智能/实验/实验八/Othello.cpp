#include <iostream>
#include <time.h>
#include <vector>
#include <stdlib.h>
#include <algorithm>
#include <map>
using namespace std;

struct Node {
	int mode;
	char board[8][8];
	double score;
	pair<int, int> action;
	vector<Node> children;
	Node(char raw_board[8][8], int cur_mode) {
		mode = cur_mode;
		for (int i = 0; i < 8; i++)
			for (int j = 0; j < 8; j++)
				board[i][j] = raw_board[i][j];
	}
};

class Othello {
private:
	int square_weights[8][8] = {
		{20, -3, 11, 8, 8, 11, -3, 20},
		{-3, -7, -4, 1, 1, -4, -7, -3},
		{11, -4, 2, 2, 2, 2, -4, 11},
		{8, 1, 2, -3, -3, 2, 1, 8},
		{8, 1, 2, -3, -3, 2, 1, 8},
		{11, -4, 2, 2, 2, 2, -4, 11},
		{-3, -7, -4, 1, 1, -4, -7, -3},
		{20, -3, 11, 8, 8, 11, -3, 20},
	};
	int direction[8][2] = { {0, 1}, {0, -1}, {1, 1}, {1, 0}, {1, -1}, {-1, 0}, {-1, 1}, {-1, -1} };
	int limit;

public:
	Othello(int depth) { limit = depth; }

	void init_board(char board[8][8]) {
		for (int i = 0; i < 8; ++i)
			memset(board[i], ' ', 8);
		board[3][4] = board[4][3] = '@';
		board[3][3] = board[4][4] = 'O';
	}

	void print_board(char board[8][8], vector<pair<int, int>> next_step) {
		char col = 'A';
		cout << endl << ' ';
		for (char i = 0; i < 8; i++)
			cout << ' ' << char(col + i);
		cout << endl;
		for (int i = 0; i < 8; i++) {
			cout << i + 1 << ' ';
			for (int j = 0; j < 8; ++j)
				if (find(next_step.begin(), next_step.end(), make_pair(i, j)) == next_step.end())
					cout << board[i][j] << ' ';
				else
					cout << "* ";
			cout << endl;
		}
		auto nums = count_number(board);
		cout << "黑棋:白棋 = " << nums.first << ':' << nums.second << endl;
	}

	bool is_on_board(int row, int col) {
		return row < 8 && row >= 0 && col < 8 && col >= 0;
	}

	vector<pair<int, int>> show_places(char board[8][8], char turn) {
		vector<pair<int, int>> next_step;
		char item = turn == '@' ? '@' : 'O', opp = turn == '@' ? 'O' : '@';
		for (int i = 0; i < 8; ++i)
			for (int j = 0; j < 8; ++j)
				if (board[i][j] == ' ' && !flip_dirs(board, make_pair(i, j), item).empty())
					next_step.push_back(make_pair(i, j));
		return next_step;
	}

	vector<int> flip_dirs(char board[8][8], pair<int, int> pos, char color) {
		int x = pos.first, y = pos.second;
		vector<int> dirs;
		char opp = color == '@' ? 'O' : '@';
		for (int i = 0; i < 8; ++i) {
			x += direction[i][0];
			y += direction[i][1];
			if (is_on_board(x, y) && board[x][y] == opp) {
				while (is_on_board(x, y) && board[x][y] == opp) {
					x += direction[i][0];
					y += direction[i][1];
				}
				if (is_on_board(x, y) && board[x][y] == color) dirs.push_back(i);
			}
			x = pos.first;
			y = pos.second;
		}
		return dirs;
	}

	void flip(char board[8][8], pair<int, int> action, char color) {
		vector<int> dirs = flip_dirs(board, action, color);
		char opp = color == '@' ? 'O' : '@';
		int x = action.first, y = action.second;
		for (int i = 0; i < dirs.size(); ++i) {
			x += direction[dirs[i]][0];
			y += direction[dirs[i]][1];
			while (is_on_board(x, y) && board[x][y] == opp) {
				board[x][y] = color;
				x += direction[dirs[i]][0];
				y += direction[dirs[i]][1];
			}
			x = action.first;
			y = action.second;
		}
	}

	bool is_over(char board[8][8]) {
		auto list1 = show_places(board, '@');
		auto list2 = show_places(board, 'O');
		return list1.empty() && list2.empty();
	}

	void player_play(char board[8][8], vector<pair<int, int>> next_step, char turn) {
		cout << "请输入坐标（例如：A1）：";
		while (true) {
			char col, row;
			cin >> col >> row;
			if (col >= 'A' && col <= 'H' && row >= '1' && row <= '8') {
				auto action = make_pair(row - '1', col - 'A');
				if (find(next_step.begin(), next_step.end(), action) != next_step.end()) {
					move(board, action, turn);
					break;
				}
			}
			cout << "无效位置,请重新输入（例如：A1）：";
		}
		cout << endl;
	}

	double evaluate(char board[8][8], char color) {
		int sideVal[9] = { 1, 1, 1, 2, 3, 4, 6, 7 };
		int mystonecount = 0, opstonecount = 0;
		double score = 0, rateeval = 0, moveeval = 0, sidestableeval = 0, cornereval = 0;
		char opp = color == '@' ? 'O' : '@';
		//计算位置特征估计值
		for (int i = 0; i < 8; ++i)
			for (int j = 0; j < 8; ++j)
				if (board[i][j] == color) {
					score += square_weights[i][j];
					mystonecount++;
				}
				else if (board[i][j] == opp) {
					score -= square_weights[i][j];
					opstonecount++;
				}
		//计算黑白子比例估计值
		if (mystonecount > opstonecount)
			rateeval = 100.0 * mystonecount / (mystonecount + opstonecount);
		else if (mystonecount < opstonecount)
			rateeval = -100.0 * opstonecount / (mystonecount + opstonecount);
		else
			rateeval = 0;
		//计算行动力估计值
		int mymove = show_places(board, color).size();
		int opmove = show_places(board, opp).size();
		//如果我方没有地方下子，那么设定特低的行动力估计值
		if (mymove == 0)
			moveeval = -450;
		//如果对方没有地方下子，那么设定特高的行动力估计值
		else if (opmove == 0)
			moveeval = 150;
		else if (mymove > opmove)
			moveeval = (100.0 * mymove) / (mymove + opmove);
		else if (mymove < opmove)
			moveeval = -(100.0 * opmove) / (mymove + opmove);
		else
			moveeval = 0;
		//计算边界稳定点估计值
		int myside = 0, opside = 0, myconer = 0, opconer = 0;
		int corner_pos[4][2] = { {0, 0}, {0, 7}, {7, 0}, {7, 7} };
		for (int i = 0; i < 4; ++i)
			if (board[corner_pos[i][0]][corner_pos[i][1]] == color) {
				myconer++;
				for (int j = 0; j < 8; ++j)
					if (board[corner_pos[i][0]][j] == color)
						myside += sideVal[i];
					else
						break;
				for (int j = 0; j < 8; ++j)
					if (board[j][corner_pos[i][1]] == color)
						myside += sideVal[i];
					else
						break;
			}
			else if (board[corner_pos[i][0]][corner_pos[i][1]] == opp) {
				opconer++;
				for (int j = 0; j < 8; ++j)
					if (board[corner_pos[i][0]][j] == opp)
						opside += sideVal[i];
					else
						break;
				for (int j = 0; j < 8; ++j)
					if (board[j][corner_pos[i][1]] == opp)
						opside += sideVal[i];
					else
						break;
			}
		sidestableeval = 2.5 * (myside - opside);
		cornereval = 25 * (myconer - opconer);
		//计算整个棋局估计值
		return score * 0.02 + moveeval * 1 + sidestableeval * 6.0 + cornereval * 8.0 + rateeval * 0.2;
	}

	void move(char board[8][8], pair<int, int> action, char color) {
		board[action.first][action.second] = color;
		flip(board, action, color);
	}

	pair<int, int> count_number(char board[8][8]) {
		int b_num = 0, w_num = 0;
		for (int i = 0; i < 8; ++i)
			for (int j = 0; j < 8; ++j)
				if (board[i][j] == '@')
					b_num++;
				else if (board[i][j] == 'O')
					w_num++;
		return make_pair(b_num, w_num);
	}

	void random_play(char board[8][8], char color) {
		auto places = show_places(board, color);
		int index = rand() % places.size();
		move(board, places[index], color);
	}

	void ai_play(char board[8][8], char color, int depth) {
		char opp = color == '@' ? 'O' : '@';
		Node root = Node(board, 2);
		cout << "\nIDIOT正在思考...\n";
		double starttime = clock();
		int index = alphabetapruning(root, color, opp, 1, depth, -100000.0, 100000.0);
		cout << "IDIOT的下子位置为：" << char(root.children[index].action.second + 'A') << root.children[index].action.first + 1 << endl;
		double endtime = clock();
		cout << "IDIOT思考用时：" << (endtime - starttime) / 1000 << 's' << endl;
		move(board, root.children[index].action, color);
		root.children.clear();
		cout << endl;
	}

	double alphabetapruning(Node &root, char ai, char player, int mode, int depth, double alpha, double beta) {
		//mode=0时表示MAX层节点，mode=1时表示MIN层节点
		char color = mode == 1 ? ai : player, opp = color == '@' ? 'O' : '@';
		auto avaiplaces = show_places(root.board, color);	//得到可下子的位置
		double v;
		if (depth == limit) {
			for (int i = 0; i < avaiplaces.size(); ++i) {
				Node newnode = Node(root.board, mode);		//新建子节点
				newnode.action = avaiplaces[i];				//记录该节点下子的位置
				move(newnode.board, avaiplaces[i], color);	//下子后棋盘发生变化
				int oppmode = mode == 1 ? 0 : 1;			//进入下一种mode
				auto places = show_places(newnode.board, opp);	//得到对方可下子的位置
				if (places.size() != 0)
					//如果对方还有可下子的位置，则递归搜索
					newnode.score = alphabetapruning(newnode, ai, player, oppmode, depth - 1, alpha, beta);
				else
					//如果对方没有地方下子，则评估当前棋局
					newnode.score = evaluate(newnode.board, color);
				root.children.push_back(newnode);			//加入新的子节点
			}
			int index;
			double max = -100000.0;
			//得到估价值最高的走法
			for (int i = 0; i < root.children.size(); ++i)
				if (root.children[i].score > max) {
					index = i;
					max = root.children[i].score;
				}
			cout << "IDIOT的走法及对应的估计值：";
			for (int i = 0; i < root.children.size(); ++i) {
				cout << char(root.children[i].action.second + 'A') << root.children[i].action.first + 1 << ':' << root.children[i].score << "  ";
			}
			cout << endl;
			//返回估价值最高的走法
			return index;
		}
		if (mode == 0) {
			//MAX层节点
			v = -100000.0;
			for (int i = 0; i < avaiplaces.size(); ++i) {
				Node newnode = Node(root.board, mode);		//新建子节点
				newnode.action = avaiplaces[i];				//记录该节点下子的位置
				move(newnode.board, avaiplaces[i], color);	//下子后棋盘发生变化
				int oppmode = mode == 1 ? 0 : 1;			//进入下一种mode
				auto places = show_places(newnode.board, opp);	//得到对方可下子的位置
				if (depth != 1 && places.size() != 0) {
					//未到达深度限制且对方有地方下子，则递归搜索并更新v和alpha值
					v = max(v, alphabetapruning(newnode, ai, player, oppmode, depth - 1, alpha, beta));
					alpha = max(alpha, v);
					if (beta <= alpha)	//alpha剪枝
						break;
				}
				else {
					//到达深度限制或对方无子可下，则评估当前棋局并更新v值
					newnode.score = evaluate(newnode.board, ai);
					v = max(v, newnode.score);
				}
			}
		}
		else {
			//MIN层节点
			v = 100000.0;
			for (int i = 0; i < avaiplaces.size(); ++i) {
				Node newnode = Node(root.board, mode);		//新建子节点
				newnode.action = avaiplaces[i];;			//记录该节点下子的位置
				move(newnode.board, avaiplaces[i], color);	//下子后棋盘发生变化
				int oppmode = mode == 1 ? 0 : 1;			//进入下一种mode
				auto places = show_places(newnode.board, opp);	//得到对方可下子的位置
				if (depth != 1 && places.size() != 0) {
					//未到达深度限制且对方有地方下子，则递归搜索并更新v和beta值
					v = min(v, alphabetapruning(newnode, ai, player, oppmode, depth - 1, alpha, beta));
					beta = min(beta, v);
					if (beta <= alpha)	//beta剪枝
						break;
				}
				else {
					//到达深度限制或对方无子可下，则评估当前棋局并更新v值
					newnode.score = evaluate(newnode.board, ai);
					v = min(v, newnode.score);
				}
			}
		}
		//回溯时清空占用的内存
		root.children.clear();
		return v;
	}

	int game_run() {
		cout << "请选择（1为黑棋，2为白棋）：";
		int choose = 1;
		cin >> choose;
		char player = choose == 1 ? '@' : 'O', ai = choose == 1 ? 'O' : '@';
		cout << "\n游戏开始！\n@为黑棋，O为白棋,*为可落子位置\n\n";
		char current_turn = '@';
		char board[8][8];
		vector<pair<int, int>> next_step;
		init_board(board);
		while (!is_over(board)) {
			next_step = show_places(board, current_turn);
			if (next_step.empty()) {
				current_turn = current_turn == '@' ? 'O' : '@';
				next_step.clear();
				continue;
			}
			if (current_turn == player) {
				print_board(board, next_step);
				cout << "\n轮到玩家！";
				player_play(board, next_step, current_turn);
				//random_play(board, player);
			}
			else {
				print_board(board, next_step);
				ai_play(board, ai, limit);
			}
			next_step.clear();
			current_turn = current_turn == '@' ? 'O' : '@';
		}
		auto nums = count_number(board);
		print_board(board, next_step);
		cout << "游戏结束！" << endl;
		if (nums.first > nums.second) {
			cout << "黑棋胜利！" << endl;
			return 0;
		}
		else if (nums.first < nums.second) {
			cout << "白棋胜利！" << endl;
			return 1;
		}
		else {
			cout << "平局！" << endl;
			return 0;
		}
	}
};


int main() {
	auto tmp = Othello(4);
	tmp.game_run();
	system("pause");
	return 0;
}