// FileName:earlier.h
// 定义了函数对象earlier，用于构造multiset结构
#ifndef  EARLIER_H
#define  EARLIER_H

#include <algorithm>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <map>
#include <set>
using namespace std;

typedef map<string, string> PropertyMap;

struct earlier: binary_function<string, string, bool> 
{
	bool operator()(const string& name_lhs,
		const string& name_rhs) const 
	{
		return dateProp[name_lhs] < dateProp[name_rhs];
	}
	// dateProp[name] holds year in which Ph.D. degree was
	// granted to name
	static PropertyMap dateProp;
	// placeProp[name] holds institution that granted Ph.D.
	static PropertyMap placeProp;
};

// 静态成员变量的初始化
PropertyMap earlier::dateProp;
PropertyMap earlier::placeProp;

#endif