// 本程序实现对一个序列进行基数排序操作
#include <iostream>
#include <vector>
#include <queue>

using namespace std;
// 对序列ivec进行 d 位的基数排序的函数声明
void radixSort(vector<int> &ivec, int d);

// 主函数
int main()
{
	vector<int> ivec;
	int i = 0, tmp, d;
	// 输入待进行基数排序的序列，并用一个向量保存
	cout << "请输入需要进行基数排序的序列（用空格隔开，最后输入0表示完成输入）\n";
	cin >> tmp;
	while ( tmp != 0 )
	{
		ivec.push_back(tmp);
		cin >> tmp;
	}
	cout << "\n请输入需要进行基数排序的最大位数：" << endl;
	cin >> d;
	// 输入序列回显
	cout << "\n输入的待进行基数排序的序列是：" << endl;
	for ( i = 0; i < ivec.size(); ++i)
		cout << ivec[i] << "  ";
	cout << endl;
	// 调用radixSort函数进行基数排序
	radixSort(ivec, d);
	// 经过排序后的序列显示
	cout << "\n经过基数排序后得到的序列为：" << endl;
	for ( i = 0; i < ivec.size(); ++i)
		cout << ivec[i] << "  ";
	system("pause"); 
	return 0;
}

// 对序列ivec进行 d 位的基数排序
void radixSort(vector<int> &ivec, int d)
{
	int i, j;
	int digit = 1;			
    // 10个对应于位的队列 		
	queue<int> digitQueue[10];
	for ( i = 0; i < d; ++i)		
	{
		// 将向量中的数依次进入相应位的队列中
		for (j = 0; j < ivec.size(); j++)
			digitQueue[(ivec[j] / digit) % 10].push(ivec[j]);
			
		// 将队列空间回收，用向量来保存排序后的序列
        j = 0;
		for (int digitVal = 0; digitVal < 10; ++digitVal)
			while (!digitQueue[digitVal].empty())
			{
				ivec[j] = digitQueue[digitVal].front();
				digitQueue[digitVal].pop();
				j++;
			}
			
		// 每进行一位基数排序，就将中间结果输出显示
		cout << "经过第 " << i << "次排序后得到的序列：" << endl;
		for ( j = 0; j < ivec.size(); ++j)
			cout << ivec[j] << "  ";
		cout << endl;
		
		// 从个位数开始，直到第d位数
		digit *= 10;
	}
}
