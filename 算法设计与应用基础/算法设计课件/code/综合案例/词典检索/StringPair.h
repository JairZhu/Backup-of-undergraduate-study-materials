// FileName: StringPair.h
// 定义基于pair<string, string>的StringPair类，
// 提供了增强的功能，并定义了此类型的相关函数

#ifndef STRING_PAIR
#define	STRING_PAIR

#include <functional>		// For sort
#include <utility>			// For pair
using namespace std;

struct StringPair : public pair<string, string> 
{
	// 默认构造函数
	StringPair() : pair<string, string>(string(), string())
	{
		 //
	}
	// 构造函数，pair的first成员是second成员的排序结果
	// 实现了由string类型到StringPair类型的转换
	StringPair(const string& s) : pair<string, string>(s, s) 
	{
		sort(first.begin(), first.end());
	}

	// 用户自定义类型转换为函数
	// 合适场合将StringPair转换为string
	operator string() const 
	{ 
		return second; 
	}
};

// 运算符“<”重载
// 定义StringPair的小于含义
bool operator<(const StringPair& p,const StringPair& q) 
{
	return p.first < q.first;
}

// 运算符“==”重载
// 定义StringPair的相等含义
bool operator==(const StringPair& p,const StringPair& q) 
{
	return p.first == q.first;
}


#endif /* STRING_PAIR */ 
