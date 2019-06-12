// 银行服务模拟多服务员的顾客排队模型

#include <iostream>
#include <queue>
#include <time.h>
#include "customer.h"

using namespace std;

const int MAX_CASHIERS = 6;   // 考察的最大服务员数

void sim(int cashiers, double probOfArrival, int serviceTime, int lastTime);

int main()
{
    // 顾客的到达概率 
	double probOfArrival;
	// 每名顾客接受服务所需的时间
	int serviceTime;
	// 程序模拟持续的总时间
	int lastTime;
	
	cout << "*****这个程序是对银行多服务员的顾客排队模型的模拟***********\n" << endl;
	// 模拟初始化——输入参数
	cout << "请输入顾客的到达概率: ";
	cin >> probOfArrival ;
    cout << "请输入每个顾客接受服务所需要的时间(单位：分):  "; 
    cin >> serviceTime; 
	cout << "请输入仿真持续的总时间（单位：分）: ";
	cin >> lastTime;
	cout << endl;   

	// 针对服务员的个数进行仿真，
    // 得出不同个数服务员时顾客接受服务（包括排队）的情况 
	for ( int cashiers = 1; cashiers <= MAX_CASHIERS; ++cashiers )
		sim(cashiers, probOfArrival, serviceTime, lastTime);
	system("pause"); 
	return 0;
}

//  模拟函数
void sim(int cashiers, double probOfArrival, int serviceTime, int lastTime)
{
    // 用于存储顾客到达和离去的时间
	Customer customer;				
	// 顾客排队队列
	queue<Customer> waitQueue;		
	// 接受了服务的顾客总数
	int servedCustomers;            
	// 所有接受了服务的顾客的等待时间组成的向量
	vector<int> waitTime;           
	// 总共的服务时间
	int totalServiceTime = 0;       
    // 服务员的空闲时间（随时更新） 
	int cashierTime[MAX_CASHIERS];
	
	// 随机数种子初始化
	srand(time(NULL));
	// 产生随机数
	double rnd;	

	int count;
	// 对每个服务员的时间进行初始化
	for (count = 0; count < cashiers; ++count)
		cashierTime[count] = 0;
		
	//下面开始进行仿真，针对每个单位时间扫描一次
	for ( int t = 0; t < lastTime; t += 1)
	{
		// 小于到达概率，说明顾客到达，将顾客入队
		if ((rnd = (rand()%1000)/1000.0 ) <= probOfArrival)
		{
			customer.setArrivalTime(t);
			waitQueue.push(customer);
		}
			
		// 对服务员进行逐一扫描，判断其是否有空, 并且队列是否非空
		for (count = 0; count < cashiers; ++count)
		{
			if ( (cashierTime[count] <= t) && !waitQueue.empty() 
				  && (cashierTime[count] < lastTime) )
			{
				// 顾客出队，并马上得到服务
				customer = waitQueue.front();
				waitQueue.pop();
				int finishService = t + serviceTime;
				// 设置顾客离去时间
				customer.setDepartureTime(finishService);
				// 顾客等待时间
				waitTime.push_back( t - customer.getArrivalTime());
				// 顾客所花费的总时间
				totalServiceTime += customer.totalTime();
				// 设置该服务员下一个空闲时刻
				cashierTime[count] = finishService;
			}//end if 
		}// end for
	}// end for
	// 接受了服务的顾客总数
	servedCustomers = waitTime.size();
	// 下面求出接受了服务的顾客的最大等待时间
	int i = 0, maxWaitTime = waitTime[0];
	for (; i < servedCustomers; i++)
		if (waitTime[i] > maxWaitTime)
			maxWaitTime = waitTime[i];

	double averageWaitTime = (double) totalServiceTime / servedCustomers - serviceTime;
	// 输出显示
	cout << "当服务员个数为                       " << cashiers << " 时：" << endl;	
	cout << "得到服务的顾客数为                   " << servedCustomers << endl;
	cout << "平均每名服务员接待的顾客数为         " << servedCustomers / cashiers << endl;
	cout << "得到服务的顾客中最大的等待时间为     " << maxWaitTime << endl;
	cout << "得到服务的顾客所需要的平均等待时间为 " << averageWaitTime << endl;
	cout << "此时尚未得到服务的顾客数为           "  << waitQueue.size() << endl;
	cout << endl;
}
