#include <iostream>
#include <time.h>
#include <vector>
#include <algorithm>
#include <random>
#include <unordered_map>
#include <fstream>
#include <string>
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

struct state {
	char board[8][8];
	pair<int, int> action;
	state(char raw[8][8], pair<int, int> newaction = pair<int, int>()) {
		for (int i = 0; i < 8; ++i)
			for (int j = 0; j < 8; j++)
				board[i][j] = raw[i][j];
		action = newaction;
	}
	bool operator == (const state & rs) const {
		for (int i = 0; i < 8; ++i)
			for (int j = 0; j < 8; j++)
				if (board[i][j] != rs.board[i][j])
					return false;
		return action == rs.action;
	}
	state operator = (const state & raw) {
		for (int i = 0; i < 8; ++i)
			for (int j = 0; j < 8; j++)
				board[i][j] = raw.board[i][j];
		action = raw.action;
		return *this;
	}
};

namespace std {
	template <>
	struct hash<state> {
		std::size_t operator()(const state & p) const {
			using std::hash;
			using std::string;
			string tmp;
			for (int i = 0; i < 8; ++i) 
				tmp.append(string(p.board[i]));
			return ((hash<string>()(tmp) ^ (hash<int>()(p.action.first) << 1)) >> 1) ^ (hash<int>()(p.action.second) << 1);
		}
	};
}

int square_weights[8][8] = {
	{1000, -300, 11, 8, 8, 11, -300, 1000},
	{-300, -600, -4, 1, 1, -4, -600, -300},
	{11, -4, 2, 2, 2, 2, -4, 11},
	{8, 1, 2, -3, -3, 2, 1, 8},
	{8, 1, 2, -3, -3, 2, 1, 8},
	{11, -4, 2, 2, 2, 2, -4, 11},
	{-300, -600, -4, 1, 1, -4, -600, -300},
	{1000, -300, 11, 8, 8, 11, -300, 1000},
};
int direction[8][2] = { {0, 1}, {0, -1}, {1, 1}, {1, 0}, {1, -1}, {-1, 0}, {-1, 1}, {-1, -1} };
int limit;
double weights[7] = { 0.02, 1.0, 6.0, 8.0, 0.2, 4.0, 8.0 };
unordered_map<state, double> Sarsa_Q;
unordered_map<state, double> Q;



void init_board(char board[8][8]) {
	for (int i = 0; i < 8; ++i)
		memset(board[i], ' ', 8);
	board[3][4] = board[4][3] = '@';
	board[3][3] = board[4][4] = 'O';
}

bool is_on_board(int row, int col) {
	// 判断是否在棋盘上
	return row < 8 && row >= 0 && col < 8 && col >= 0;
}

vector<int> flip_dirs(char board[8][8], pair<int, int> pos, char color) {
	// 判断翻转方向
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


void flip(char board[8][8], pair<int, int> action, char color) {
	// 执行翻转操作
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

void move(char board[8][8], pair<int, int> action, char color) {
	board[action.first][action.second] = color;
	flip(board, action, color);
}

void print_board(char board[8][8], vector<pair<int, int>> next_step = vector<pair<int, int>>{}) {
	// 打印棋盘，参数board：棋盘，next_step：可下子位置
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

vector<pair<int, int>> show_places(char board[8][8], char turn) {
	// 寻找可下子位置，参数board：棋盘，turn：黑棋落子或白棋落子
	vector<pair<int, int>> next_step;
	char item = turn == '@' ? '@' : 'O', opp = turn == '@' ? 'O' : '@';
	for (int i = 0; i < 8; ++i)
		for (int j = 0; j < 8; ++j)
			if (board[i][j] == ' ' && !flip_dirs(board, make_pair(i, j), item).empty())
				next_step.push_back(make_pair(i, j));
	return next_step;
}

bool is_over(char board[8][8]) {
	// 判断比赛是否结束
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

bool is_stable(char board[8][8], int x, int y) {
	for (int i = 0; i < 8; ++i)
		for (int nx = x + direction[i][0], ny = y + direction[i][1]; is_on_board(nx, ny); nx += direction[i][0], ny += direction[i][1])
			if (board[nx][ny] == ' ')
				return false;
	return true;
}

vector<double> evaluate_vector(char board[8][8], char color) {
	int sideVal[8] = { 10, 20, 30, 40, 50, 60, 70, 80 };
	int corner_pos[4][2] = { {0, 0}, {0, 7}, {7, 0}, {7, 7} };
	int mystonecount = 0, opstonecount = 0, mystable = 0, oppstable = 0;
	double score = 0, rateeval = 0, moveeval = 0, sidestableeval = 0, cornereval = 0, stableeval = 0, neareval = 0;
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
		
	//靠近角的估计值
	int mynear = 0, oppnear = 0;
	for (int i = 0; i < 4; ++i) {
		int x = corner_pos[i][0], y = corner_pos[i][1];
		if (board[x][y] == ' ')
			for (int j = 0; j < 8; ++j) {
				int nx = x + direction[j][0], ny = y + direction[j][1];
				if (is_on_board(nx, ny))
					if (board[nx][ny] == color)
						mynear++;
					else if (board[nx][ny] == opp)
						oppnear++;
			}
	}
	neareval = -24.5 * (mynear - oppnear);


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
		
	//计算内部稳定子估计值
	for (int i = 0; i < 8; ++i)
		for (int j = 0; j < 8; ++j)
			if (board[i][j] != ' ' && is_stable(board, i, j))
				if (board[i][j] == color)
					mystable++;
				else
					oppstable++;
	stableeval = 12.5 * (mystable - oppstable);
		
	//计算边界稳定点估计值
	int myside = 0, opside = 0, myconer = 0, opconer = 0;
	for (int i = 0; i < 4; ++i)
		if (board[corner_pos[i][0]][corner_pos[i][1]] == color) {
			myconer++;
			for (int j = 0; j < 8; ++j)
				if (board[corner_pos[i][0]][j] == color)
					myside += sideVal[j];
				else
					break;
			for (int j = 0; j < 8; ++j)
				if (board[j][corner_pos[i][1]] == color)
					myside += sideVal[j];
				else
					break;
		}
		else if (board[corner_pos[i][0]][corner_pos[i][1]] == opp) {
			opconer++;
			for (int j = 0; j < 8; ++j)
				if (board[corner_pos[i][0]][j] == opp)
					opside += sideVal[j];
				else
					break;
			for (int j = 0; j < 8; ++j)
				if (board[j][corner_pos[i][1]] == opp)
					opside += sideVal[j];
				else
					break;
		}
	sidestableeval = 2.5 * (myside - opside);
	cornereval = 25 * (myconer - opconer);
		
	//计算整个棋局估计值
	return vector<double>({ score, moveeval, sidestableeval, cornereval, rateeval, stableeval, neareval });
}

double evaluate(char board[8][8], char color) {
	auto eval = evaluate_vector(board, color);
	double reward = eval[0] * weights[0] + eval[1] * weights[1] + eval[2] * weights[2] + eval[3] * weights[3] + eval[4] * weights[4] + eval[5] * weights[5] + eval[6] * weights[6];
	if (is_over(board)) {
		int count = 0;
		for (int i = 0; i < 8; i++)
			for (int j = 0; j < 8; j++)
				if (board[i][j] == color)
					count++;
		if (count > 64 - count)
			reward += 1000000;
		else
			reward -= 1000000;
	}
	return reward;
}

void random_play(char board[8][8], char color) {
	auto places = show_places(board, color);
	int index = rand() % places.size();
	move(board, places[index], color);
}

double alphabetapruning(Node &root, char ai, char player, int mode, int depth, double alpha, double beta, int limit) {
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
				newnode.score = alphabetapruning(newnode, ai, player, oppmode, depth - 1, alpha, beta, limit);
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
				v = max(v, alphabetapruning(newnode, ai, player, oppmode, depth - 1, alpha, beta, limit));
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
				v = min(v, alphabetapruning(newnode, ai, player, oppmode, depth - 1, alpha, beta, limit));
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
	return v;
}

void ai_play(char board[8][8], char color, int depth, int limit) {
	char opp = color == '@' ? 'O' : '@';
	Node root = Node(board, 2);
	cout << "\nIDIOT正在思考...\n";
	double starttime = clock();
	int index = alphabetapruning(root, color, opp, 1, depth, -100000.0, 100000.0, limit);
	cout << "IDIOT的下子位置为：" << char(root.children[index].action.second + 'A') << root.children[index].action.first + 1 << endl;
	double endtime = clock();
	cout << "IDIOT思考用时：" << (endtime - starttime) / 1000 << 's' << endl;
	move(board, root.children[index].action, color);
	root.children.clear();
	cout << endl;
}

void ai_training(char board[8][8], char color) {
	ai_play(board, color, 3, 3);
}

void Sarsa(char board[8][8], char color, void (* function)(char board[8][8], char)) {
	char opp = color == '@' ? 'O' : '@';
	double alpha = 0.8, gama = 0.5;
	state pre = state(board);
	default_random_engine e;
	uniform_real_distribution<double> u(0.0, 1.0);
	double epsilon = u(e);
	auto next_step = show_places(board, color);
	// 根据Epsilon-greedy算法选择动作
	if (1 - epsilon < 0.5) {
		// 以1 – epsilon概率进行“exploit”（利用），在已经探索过的动作中选择收益最大的
		double best_value = -10000000;
		pre.action = next_step[0];
		for (int i = 0; i < next_step.size(); ++i) {
			auto index = state(pre.board, next_step[i]);
			if (Sarsa_Q.find(index) == Sarsa_Q.end())
				continue;
			else if (Sarsa_Q[index] > best_value) {
				best_value = Sarsa_Q[index];
				pre.action = next_step[i];
			}
		}
	}
	else
		// 以epsilon概率进行“explore”（探索），在所有的动作种随机选择一个
		pre.action = next_step[rand() % next_step.size()];
	// 进入循环
	while (!is_over(board)) {
		// 执行已选好的动作
		move(board, pre.action, color);
		if (!show_places(board, opp).empty() && !show_places(board, opp).empty()) 
			function(board, opp);
		while (!is_over(board) && show_places(board, color).empty()) 
			function(board, opp);
		// 得到下一个状态
		state S = state(board);
		// 得到下一个状态的即时回报
		double reward = evaluate(board, color);
		epsilon = u(e);
		next_step = show_places(board, color);
		// 根据Epsilon-greedy算法选择动作
		if (!next_step.empty()) 
			if (1 - epsilon < 0.5) {
				// 以1 – epsilon概率进行“exploit”（利用）
				double best_value = -10000000;
				S.action = next_step[0];
				for (int i = 0; i < next_step.size(); ++i) {
					auto index = state(board, next_step[i]);
					if (Sarsa_Q.find(index) == Sarsa_Q.end())
						continue;
					else if (Sarsa_Q[index] > best_value) {
						best_value = Sarsa_Q[index];
						S.action = next_step[i];
					}
				}
			}
			else
				// 以epsilon概率进行“explore”（探索）
				S.action = next_step[rand() % next_step.size()];
		double new_q = 0, old_q = 0;
		if (Sarsa_Q.find(pre) != Sarsa_Q.end())
			old_q = Sarsa_Q[pre];
		if (Sarsa_Q.find(S) != Sarsa_Q.end())
			new_q = Sarsa_Q[S];
		// 更新表Q
		Sarsa_Q[pre] = old_q + alpha * (reward + gama * new_q - old_q);
		pre = S;
	}
}

void Q_learning(char board[8][8], char color, void(*function)(char board[8][8], char)) {
	char opp = color == '@' ? 'O' : '@';
	double alpha = 0.8, gama = 0.5;
	state pre = state(board);
	default_random_engine e;
	uniform_real_distribution<double> u(0.0, 1.0);
	double epsilon = u(e);
	auto next_step = show_places(board, color);
	// 根据Epsilon-greedy算法选择动作
	if (1 - epsilon < 0.5) {
		// 以1 – epsilon概率进行“exploit”（利用），在已经探索过的动作中选择收益最大的
		double best_value = -10000000;
		pre.action = next_step[0];
		for (int i = 0; i < next_step.size(); ++i) {
			auto index = state(pre.board, next_step[i]);
			if (Q.find(index) == Q.end())
				continue;
			else if (Q[index] > best_value) {
				best_value = Q[index];
				pre.action = next_step[i];
			}
		}
	}
	else
		// 以epsilon概率进行“explore”（探索），在所有的动作种随机选择一个
		pre.action = next_step[rand() % next_step.size()];
	//进入循环
	while (!is_over(board)) {
		// 执行选好的动作
		move(board, pre.action, color);
		if (!show_places(board, opp).empty() && !show_places(board, opp).empty()) 
			function(board, opp);
		while (!is_over(board) && show_places(board, color).empty()) 
			function(board, opp);
		// 得到下一个状态
		state S = state(board);
		// 得到下一个状态的即时回报
		double reward = evaluate(board, color);
		next_step = show_places(board, color);
		// 在下一个状态下找到具有最大Q值的动作
		if (!next_step.empty()) {
			double best_value = -10000000;
			S.action = next_step[0];
			for (int i = 0; i < next_step.size(); ++i) {
				auto index = state(board, next_step[i]);
				if (Q.find(index) == Q.end())
					continue;
				else if (Q[index] > best_value) {
					best_value = Q[index];
					S.action = next_step[i];
				}
			}			
		}
		double new_q = 0, old_q = 0;
		if (Q.find(pre) != Q.end()) 
			old_q = Q[pre];
		if (Q.find(S) != Q.end()) 
			new_q = Q[S];
		// 更新表Q
		Q[pre] = old_q + alpha * (reward + gama * new_q - old_q);
		// 以epsilon概率进行“explore”（探索）
		epsilon = u(e);
		if (!next_step.empty() && epsilon < 0.5)
			S.action = next_step[rand() % next_step.size()];
		pre = S;
	}
}

void Sarsa_training(int times, char color) {
	char board[8][8];
	for (int i = 0; i < times; ++i) {
		init_board(board);
		Sarsa(board, color, random_play);
		print_board(board);
	}
	cout << "Sarsa_Q表的大小:" << Q.size() << endl;
}

void Q_learning_training(int times, char color) {
	char board[8][8];
	for (int i = 0; i < times; ++i) {
		init_board(board);
		Q_learning(board, color, random_play);
		print_board(board);
	}
	cout << "Q表的大小:" << Q.size() << endl;
}

void RL_Q_learning_play(char board[8][8], char color) {
	auto next_step = show_places(board, color);
	int best_index = rand() % next_step.size();
	double best_value = -100000000;
	for (int i = 0; i < next_step.size(); ++i) {
		auto key = state(board, next_step[i]);
		if (Q.find(key) == Q.end())
			continue;
		else if (Q[key] > best_value) {
			best_value = Q[key];
			best_index = i;
			cout << "Q击中" << endl;
		}
	}
	cout << "RL Q-Learning下子位置:" << next_step[best_index].first + 1 << next_step[best_index].second + 1 << endl;
	move(board, next_step[best_index], color);
}

void RL_Sarsa_play(char board[8][8], char color) {
	auto next_step = show_places(board, color);
	int best_index = rand() % next_step.size();
	double best_value = -100000000;
	for (int i = 0; i < next_step.size(); ++i) {
		auto key = state(board, next_step[i]);
		if (Sarsa_Q.find(key) == Sarsa_Q.end())
			continue;
		else if (Sarsa_Q[key] > best_value) {
			best_value = Sarsa_Q[key];
			best_index = i;
			cout << "Sarsa_Q击中" << endl;
		}
	}
	cout << "RL Sarsa下子位置:" << next_step[best_index].first + 1 << next_step[best_index].second + 1 << endl;
	move(board, next_step[best_index], color);
}

int game_run(int limit) {
	//cout << "请选择（1为黑棋，2为白棋）：";
	int choose = 1;
	//cin >> choose;
	char player = choose == 1 ? '@' : 'O', ai = choose == 1 ? 'O' : '@';
	//cout << "\n游戏开始！\n@为黑棋，O为白棋,*为可落子位置\n\n";
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
			//print_board(board, next_step);
			ai_play(board, player, limit, limit);
			//RL_Q_learning_play(board, player);
			//RL_Sarsa_play(board, player);
			//cout << "\n轮到玩家！";
			//player_play(board, next_step, current_turn);
			//random_play(board, player);
		}
		else {
			//print_board(board, next_step);
			random_play(board, ai);
			//ai_play(board, ai, limit, limit);
		}
		next_step.clear();
		current_turn = current_turn == '@' ? 'O' : '@';
	}
	auto nums = count_number(board);
	print_board(board, next_step);
	cout << "游戏结束！" << endl;
	if (nums.first > nums.second) {
		cout << "黑棋胜利！" << endl;
		return 1;
	}
	else if (nums.first < nums.second) {
		cout << "白棋胜利！" << endl;
		return 0;
	}
	else {
		cout << "平局！" << endl;
		return 0;
	}
}

void save_Q() {
	ofstream ofile("Q.txt");
	for (auto it = Q.begin(); it != Q.end(); ++it) {
		for (int i = 0; i < 8; ++i) {
			for (int j = 0; j < 8; ++j) 
				ofile << it->first.board[i][j];
			ofile << "\n";
		}
		ofile << it->first.action.first << " " << it->first.action.second << "\n";
		ofile << it->second << "\n";
	}
	ofile.close();
}

void load_Q() {
	ifstream ifile("Q.txt");
	string line;
	int line_number = 0;
	while (ifile.peek() != EOF) {
		char board[8][8];
		for (int i = 0; i < 8; ++i) {
			getline(ifile, line);
			for (int j = 0; j < 8; ++j) 
				board[i][j] = line[j];
		}
		getline(ifile, line);
		pair<int, int> action = make_pair(line[0] - '0', line[2] - '0');
		getline(ifile, line);
		Q[state(board, action)] = stod(line);
	}
}

void save_SQ() {
	ofstream ofile("SQ.txt");
	for (auto it = Sarsa_Q.begin(); it != Sarsa_Q.end(); ++it) {
		for (int i = 0; i < 8; ++i) {
			for (int j = 0; j < 8; ++j)
				ofile << it->first.board[i][j];
			ofile << "\n";
		}
		ofile << it->first.action.first << " " << it->first.action.second << "\n";
		ofile << it->second << "\n";
	}
	ofile.close();
}

void load_SQ() {
	ifstream ifile("SQ.txt");
	string line;
	int line_number = 0;
	while (ifile.peek() != EOF) {
		char board[8][8];
		for (int i = 0; i < 8; ++i) {
			getline(ifile, line);
			for (int j = 0; j < 8; ++j)
				board[i][j] = line[j];
		}
		getline(ifile, line);
		pair<int, int> action = make_pair(line[0] - '0', line[2] - '0');
		getline(ifile, line);
		Sarsa_Q[state(board, action)] = stod(line);
	}
}


int main() {
	//load_SQ();
	int count = 0;
	for (int i = 0; i < 100; ++i) 
		count += game_run(6);
	//cout << Sarsa_Q.size() << endl;
	cout << "胜率：" << 1.0 * count / 100.0 << endl;
	system("pause");
	return 0;
}