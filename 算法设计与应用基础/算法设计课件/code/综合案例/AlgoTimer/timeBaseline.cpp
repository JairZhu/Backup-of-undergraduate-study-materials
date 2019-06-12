// "timeBaseline.cpp"
// 对sort算法应用统计方法计时，本程序获取其基准时间（开销时间）
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
	cout << "********************统计方法校准sort算法基准时间测定************************"
		<< endl;
	// 待排序向量长度
	unsigned long N;
	// 实验重复次数
	unsigned int reps;
	cout << "请输入向量大小N： ";
	cin >> N ;
	cout << "请输入迭代次数reps：";
	cin >> reps;

	// 待排序向量
	vector<int> A(N);
	// 待排序向量的副本，重复实验使用
	vector<int> B(N);
	// 初始化随机数发生器种子
	srand(time(0));
	// 利用rand()函数产生的随机数填充A向量
	generate(A.begin(),A.end(),rand);
	// 记录每次实验1s时间间隔内迭代次数

	vector<long> iterations;
	iterations.reserve(reps);
	// 标记试验的起始和结束时刻
	time_t start, finish;

	cout << "重复实验进行中，请等待……" << endl;
	while (iterations.size() < reps) {
		// 初始化计数器
		int count = 0;
		// 记录开始时刻
		start = time(0);
		// 循环执行满1s时间间隔
		do {
			++count;
			B = A;
			// sort(B.begin(), B.end());
			finish = time(0);
		}while (finish == start);
		// 记录1s内循环次数
		iterations.push_back(count);
	}
	
	// 输出结果
	cout << "各次试验迭代次数: " << endl;
	for (int k = 0; k < iterations.size(); ++k) 
		cout << iterations[k] << " ";
	cout << endl;

	// 对结果排序并输出
	sort(iterations.begin(), iterations.end());
	cout << "排好序的各次试验迭代次数: " << endl;
	for (int k = 0; k < iterations.size(); ++k) 
		cout << iterations[k] << " ";
	cout << endl;
	cout << "选取各次试验迭代次数的中位数: " 
		<< iterations[reps/2] << endl;
	cout << "sort算法执行时间为: " << 1000.0/iterations[reps/2]
	   << " ms " << endl;
	system("pause");
	return 0;
}
