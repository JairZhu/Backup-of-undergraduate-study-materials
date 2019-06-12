// FileName:eval_stable_sort.cpp
// 随机向量stable_sort算法时间测定
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <vector>
#include <algorithm>
#include "Timer.h"
using namespace std;

int main()
{
	cout << "****************随机向量stable_sort算法时间测定*******************"
		<< endl;
	// N1和N2分别为向量初始大小和最终大小
	// N用来迭代各个规模大小的向量
	unsigned long N, N1, N2;
	unsigned int reps;
	cout << "请输入向量初始大小： ";
	cin >> N1;
	cout << "请输入向量最终大小： ";
	cin >> N2;
	cout << "请输入重复试验次数：";
	cin >> reps;

	// 待排序向量
	vector<int> v;
	// 待排序向量的副本，重复实验使用
	vector<int> v0;
	// 初始化随机数发生器种子
	srand(time(0));
	// 算法定时器
	Timer tim;

	for ( N=N1; N <= N2; N*=2){
		// 清空v向量
		v.clear();
		// 调整v大小为上次的2倍
		v.resize(N);
		// 利用rand()函数产生的随机数填充A向量
		generate(v.begin(),v.end(),rand);
		// 备份v到v0，以用于重复试验
		v0 = v;

		// 计算问题规模为N时的基准时间
		tim.start_baseline(reps);
		do { 
			// 在基准时间中包含向量赋值动作
			v = v0;
		} while (tim.check());
		// 报告基准时间
		tim.report(false);
		// 计算问题规模为N时的总体算法时间
		tim.start(reps, N);
		do {
			v = v0;    
				// 修复v0到v
			stable_sort(v.begin(), v.end());
		}while (tim.check());
		// 报告算法时间性能分析结果
		tim.report(false);
		}
	system("pause");
	return 0;
}
