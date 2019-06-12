// FileName: Timer.h
// 定义Timer类用于分析算法性能

#include <iostream>
#include <iomanip>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

class Timer {
public:
	// 默认构造函数
	Timer(){ baseline = false; };  
	// 开始问题规模为N的r次系列实验
	void start(unsigned int r, unsigned long N);
	// 开始r次系列实验以确定基准时间
	void start_baseline(unsigned int r);
	// 如果试验结束返回true，否则返回false
	bool check();
	// 报告试验结果
	// 如果verbose为true，显示附加信息
	void report(bool verbose);
	// 返回供外部使用的结果
	const map<unsigned int, double>& results() const;
private:	
	// 重复试验的次数
	unsigned int reps;  
	// 用于存储每次重复试验的循环次数
	vector<long> iterations;
	// 用于存储每次试验的初始和终止时间
	time_t initial, final;
	// 用于计数每次试验循环迭代次数
	unsigned long count;
	// 用于存储当前试验的问题规模（N）
	unsigned int problem_size;
	// 用于存储(problem size, time)的节点对
	map<unsigned int, double> result_map;
	// 如果是基准时间计算，此成员为true，否则为false
	bool baseline;
	// 用于记录基准时间
	double baseline_time;
};

// 完成试验辅助和环境变量数据的初始化
void Timer::start(unsigned int r, unsigned long N) 
{
	reps = r;
	problem_size = N;
	count = 0;
	iterations.clear();
	iterations.reserve(reps);
	initial = time(0);
}

// 设置基准测试条件变量
void Timer::start_baseline(unsigned int r) 
{
	baseline = true;
	start(r, 0);
}
// 考查定时器是否工作满1s，若是，记录数据
bool Timer::check() 
{
	++count;
	final = time(0);
	if (initial < final) {
		iterations.push_back(count);  
		initial = final;
		count = 0;
	}
	return (iterations.size() < reps);
}

// 分析并报告统计试验的结果
void Timer::report(bool verbose)
{
	if (verbose) {
		for (unsigned int k = 0; k < iterations.size(); ++k) {
			cout << "各次试验迭代次数: " << endl;
			cout << iterations[k] << " ";
			// 每10个数据一组，换行
			if ((k+1) % 10 == 0)
				cout << endl;
		}
		cout << endl;
	}
	sort(iterations.begin(), iterations.end());
	if (verbose) {
		cout << "排好序的各次试验迭代次数: " << endl;
		for (unsigned int k = 0; k < iterations.size(); ++k) {
			cout << iterations[k] << " ";
			// 每10个数据一组，换行
			if ((k+1) % 10 == 0)
				cout << endl;
		}
		cout << endl;
	}
	// 选择计数结果的中值作为最精确值
	int selected_count = iterations[reps/2];
	if (verbose) 
		cout << "选取各次试验迭代次数的中位数: " 
			<< selected_count << endl;
	if (baseline) {
		baseline_time = 1000.0/selected_count;
		cout << setiosflags(ios::fixed) << setprecision(4)
			<< "基准时间为: " << baseline_time << endl;
		baseline = false;
	} 
	else {
		double calculated_time, growth_factor;
		result_map[problem_size] = calculated_time = 
			1000.0/selected_count - baseline_time;
		// 设置输出格式为固定浮点显示，精度为4
		cout << setiosflags(ios::fixed) << setprecision(4)
		 << "\t问题规模：" << problem_size << "\t算法时间："
		 << calculated_time << "ms";
		// 如果问题规模N的结果与N/2的结果都可用
		// 则计算增长因子，它是两者计算时间之比
		if (result_map.find(problem_size/2) != result_map.end()) {
			growth_factor = calculated_time / result_map[problem_size/2];
			cout << setiosflags(ios::fixed) << setprecision(4) 
			   << "\t增长因子：" << growth_factor;
		}
		cout << endl;
	}
}
// 返回包含问题规模与计时结果的映射
const map<unsigned int, double>& Timer::results() const
{
	return result_map;
}
