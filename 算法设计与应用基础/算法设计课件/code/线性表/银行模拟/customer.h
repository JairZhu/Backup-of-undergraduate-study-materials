// 用户类 Customer声明
#ifndef CUSTOMER_H_
#define CUSTOMER_H_

class Customer
{
	public:
		// 设置到达时刻
		void setArrivalTime(int arrives) 
		{arrivalTime = arrives; }
		// 读出到达时刻
		int getArrivalTime() const {return arrivalTime;}
		// 设置离去时刻
		void setDepartureTime(int departs) 
		{departureTime = departs;}
		// 求出总共花费的时间
		int totalTime() 
		{return departureTime - arrivalTime;}
	private:
		int arrivalTime, departureTime;
};
#endif
