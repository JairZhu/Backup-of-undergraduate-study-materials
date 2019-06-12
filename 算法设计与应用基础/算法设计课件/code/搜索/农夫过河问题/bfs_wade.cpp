// 本程序采用广度优先搜索算法求解农夫过河问题
#include<iostream>
#include<queue>
#include<vector>
#include<bitset>
#include<deque>

using namespace std;

// 过河者，共4种对象
enum Wader
{
	cabbage,		// 默认为0
	goat,			// 默认为1
	wolf,			// 默认为2
	farmer			// 默认为3	
};

// 过河状态类型，4bit分别对应4种过河对象
typedef bitset<4> bitvec;

// 判断状态是否安全
bool is_safe( const bitvec&);
// 判断待过河的对象是否与农夫在河的同一侧
bool withFarmer(int, bitvec& );

// 求解得到可行性路径
void findRoute(vector<int> & path)
{
	// 待发现的各个状态
	queue<int> discovering;	
	// 过河的初始状态为 0000
	discovering.push(0x00);	
	// 初始状态路径初始化
	path[0]=0;
	// 只要还有下一个状态可以到达，并且尚未到达最终状态
	while (!discovering.empty() && (path[15] == -1))
	{	
		// 获取当前待发现状态
		// 隐式类型转换：int -> bitset<4>
		bitvec curState = discovering.front();
		// 队首元素弹出
		discovering.pop();
		// 农夫到河对岸，伴随农夫的对象
		// 依次尝试狼、白菜、羊
		for (int companion = 0; companion <= 3; ++companion)   
		{
			// 随农夫过河的只能是与农夫在同一河边的
			if (withFarmer(companion,curState))
			{
				// 农夫过河后的新状态
				bitvec nextState = curState;
				// 农夫必定过河
				nextState.flip(farmer);
				// 如果不是农夫单独过河的情形
				if(companion != farmer)					
					nextState.flip(companion);
				// 将状态矢量转换为整型以作为队列元素和路径下标
				int nextIndex = nextState.to_ulong();
				// 如果新状态是安全的，并且尚未被发现，
				// 则新状态进入下一状态队列
				if (is_safe(nextState) && ( path[nextIndex] == -1) )
				{
					// 建立当前状态与下一状态的联系
					path[nextIndex] = curState.to_ulong();
					// 将新状态入对列
					discovering.push(nextIndex);
				}//end if
			}// end if
		}//end for
	}// end while
	// 状态起点，没有前驱，设为-1；
	//path[0] = -1;
}

// 显示实际方案
// 从抽象状态变量转换为具体表达
void displayRoute(const vector<int>& path)
{
	// 如果“1111”状态没有前驱
	// 则没能够成功到达目的状态
	if (path[15] == -1)
	{
		cout << "该过河问题无解" << endl;
		return;
	}
	// 将整数表示的路径转换为布尔矢量表示的状态路径
	// 存储状态路径的容器
	deque<bitvec> statePath;
	for(int i=15; i >0; i=path[i])
		statePath.push_front(i);
			// 反向插入，完成路径从初始状态到目的状态的转换
			// 隐式类型转换：int -> bitset<4>
	// 将初始状态插入
	statePath.push_front(0);
	// 当前状态变量、下一状态变量与转换变量
	bitvec current,next,trans;
	bool crossed = true;
	int step =1;
	for(unsigned int i=1; i < statePath.size(); ++i)
	{
		current = statePath[i-1];
		next = statePath[i];
		// 状态变量中的变化位
		trans = current ^ next;
		// 获取状态发生变化的对象
		int wader = -1;
		for(int i=0;i<=2;++i)
		{	
			if( trans.test(i))
			{
				wader = i;
				break;
			}
		}
		cout << "步骤" << step++ << "： ";
		switch (wader)
		{
			case goat:
				cout << "农夫把羊带" << (crossed ? "到河彼岸" : "回河此岸") << endl;
				break;
			case cabbage:
				cout << "农夫把白菜带" << (crossed ? "到河彼岸" : "回河此岸")<< endl;
				break;
			case wolf:
				cout << "农夫把狼带" << (crossed ? "到河彼岸" : "回河此岸") << endl;
				break;
			case -1:
				cout << "农夫独自" << (crossed ? "到河彼岸" : "回河此岸")<< endl;
				break;

		}
		crossed = !crossed;
	}
	cout << "Congratulations！过河问题求解成功！" << endl;
}

// 判断状态是否安全
bool is_safe( const bitvec & state)
{
	// 羊吃白菜
	if ((state[cabbage] == state[goat]) && (state[farmer] != state[goat]) )
		return false;
	// 狼吃羊
	if ((state[goat] == state[wolf]) && (state[farmer] != state[wolf]))
		return false;
	// 其它状态为安全状态
	return true;
}

// 判断待过河的对象是否与农夫在河的同一侧
// state为当前状态
inline bool withFarmer(int wader,bitvec& state)
{
	return ( state[farmer] == state[wader] );
}

// 主函数
int main()
{
	// 记录已经探测状态及转移路径，初始化为-1
	vector<int> path(16, -1);	
	findRoute(path);
	displayRoute(path);
	system("pause");
	return 0;
}

