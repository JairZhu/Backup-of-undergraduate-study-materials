// Read the TCS Genealogical Database file and display its tree structure
// using indentation, with names ordered by Ph.D. date.
#include <algorithm>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <map>
#include <set>
#include "earlier.h"
using namespace std;

typedef string Name;
typedef string Year;
typedef string Place;
typedef map<string, string> PropertyMap;
typedef multiset<string, earlier> DateOrderedMset;
typedef map<string, DateOrderedMset> AcademicRelation;
typedef DateOrderedMset::iterator IterMset;
typedef AcademicRelation::iterator IterRel;

// 进入界面
void welcome()
{
	cout << "************ 树状显示SIGACT 理论计算机科学家谱系图*************\n";
}


// 获取数据源文件句柄放于ifs参数
void getDataSource(ifstream& ifs)
{
	// 源数据文件名称
	string file_name;
	// 输入文件名称
	cout << "请输入包含族谱数据的文件名称: " ;
	cin >> file_name;
	// 打开文件
	ifs.open(file_name.c_str());
	// 如果打开失败，报告异常，退出
	if (!ifs.is_open()) 
	{
		cout << "异常：文件"<< file_name << "没有找到 " 
			<< endl;
		exit(1);
	}
}

// 构造数据关系模型
void modelView(AcademicRelation& advisors, 
			   AcademicRelation& students,
			   ifstream& ifs)
{
	string name, advisor, place, year;
	// 析取数据源并建立合适结构
	while(ifs)
		// 如果未到文件末尾
	{
		// 忽略注释
		if (ifs.peek() == '#')
		{
			getline(ifs,name,'\n');
			continue;
		}
		// 逐行读取4个域
		getline(ifs, name, '\t');
		getline(ifs, advisor, '\t');
		getline(ifs, place, '\t');
		getline(ifs, year ,'\n');
			// 一行结束，间隔符为换行符
		// 构造博士毕业时间、地点属性结构
		earlier::placeProp[name] = place;
		earlier::dateProp[name] = year;
		// 不确定的导师信息统一用"---"表示
		if (advisor == "?")
			advisor = "---";
		// 构造导师--学生关系结构
		students[advisor].insert(name);
		advisors[name].insert(advisor);
	}
	// 关闭源数据文件
	ifs.close();
}

// 构造族谱森林的根节点集合
// 没有导师信息的科学家为根节点
DateOrderedMset& setupRootSet( AcademicRelation& advisors, 
							   AcademicRelation& students)
{
	// 初始化根节点集合为导师信息为"---"的学生
	DateOrderedMset& roots = students["---"];
	// 定义遍历导师映射的迭代器
	IterRel iter_rel;
	// 定义遍历各个学生对应导师集合的迭代器
	IterMset iter_set; 
	// 是否存在导师信息？
	bool existAdvisor;
	// 遍历导师映射
	for (iter_rel = advisors.begin(); iter_rel != advisors.end(); ++iter_rel) 
	{
		existAdvisor = false;
		// 当前学生的导师集合容器开始迭代器
		IterMset iter_set_b = iter_rel->second.begin(); 
		// 当前学生的导师集合容器结束迭代器
		IterMset iter_set_e = iter_rel->second.end(); 
		for (iter_set = iter_set_b; iter_set != iter_set_e; ++iter_set)
		{
			// 如果该学生的导师为---（未知），则初始化时已经在根集合中
			// 如果该学生的导师在数据库中查找出来，则该学生肯定不属于根集合
			// 以上两种情况下，将existAdvisor设为true，不予后续处理
			if (*iter_set == string("---") || 
				advisors.find(*iter_set) != advisors.end())
				existAdvisor = true;
		}
		// 如果不存在导师（信息）
		if (!existAdvisor) 
		{
			string first_advisor = *(iter_rel->second.begin());
			// 检查它是否已经存在于根集合中:
			//   因为multiset roots是依据name的日期属性排序
			//   因此这个find操作是线性时间复杂度
			//   对于当前问题规模，这不是一个麻烦 
			if ( find(roots.begin(), roots.end(), first_advisor)
				 == roots.end())
			roots.insert(first_advisor);
				// 如果不在根集合中，则插入根集合
		}
	}
	return roots;
}

// 打印以root_name为根的学术树
// 以合适的缩进格式表示师承关系
// 显示他（她）的所有后代师承
// 递归调用
void tree_view(const string& root_name, 
			   AcademicRelation& students,
			   PropertyMap& placeProp, 
			   PropertyMap& dateProp,
			   ostream& out,
			   int indentation_level = 0)
{
	// 根据缩进层次显示合适的行缩进量
	for (int k = 0; k != indentation_level; ++k)
		out << "      ";
	// 打印学生的博士学位信息
	// 格式如： Brian Kernighan (Princeton 1969）
	out << root_name << " (" << placeProp[root_name] << " " 
		<< dateProp[root_name]<< ")" << endl;
	DateOrderedMset& L = students[root_name];
	DateOrderedMset::const_iterator j;
	// 打印该科学家的所有学生信息
	// 遍历他的整个学生集合
	// 按照日期顺序，并增加一层缩进
	for (j = L.begin(); j != L.end(); ++j)
		// 递归调用
		tree_view (*j, students, placeProp, dateProp, out,
					indentation_level+1);
}

// 显示根节点集合代表的各棵树
void forest_view(const DateOrderedMset& roots,
				 AcademicRelation& students)
{
	DateOrderedMset::const_iterator iter;
	//遍历根节点集合，输出各个根对应树
	cout << "请选择输出SIGACT 理论计算机科学家谱系图" << endl
		<< "1. 输出到屏幕\n" << "2. 输出到文件\n"
		<< "请输入1或2选择：";
	int selector;
	cin >> selector;
	if (selector == 1)
		// 输出到屏幕
		for (iter = roots.begin(); iter != roots.end(); ++iter)	
		{
			tree_view(*iter, students, earlier::placeProp, earlier::dateProp, cout);
			system("pause");
			cout << endl;
		}
	else
		//输出到文件
	{
		cout << "请给出输出文件名" << endl;
		string viewName;
		cin >> viewName;
		ofstream ofs(viewName.c_str());
		cout << "文件创建中..." << endl;
		for (iter = roots.begin(); iter != roots.end(); ++iter)
			// 输出到文件
			tree_view(*iter, students, earlier::placeProp, earlier::dateProp, ofs);
		// 关闭文件
		ofs.close();
		cout << "文件创建成功！" << endl;
	}	
}


int main()
{
	// 程序进入界面，说明程序功能
	welcome();
	// 获取数据源文件句柄
	ifstream ifs;
	getDataSource(ifs);	 
	// 定义师生关系映射变量
	AcademicRelation advisors, students;
	// 从数据源构建各科学家关系和属性
	modelView(advisors,students,ifs);
	// 初始化根节点集合为导师信息为"---"的学生
	DateOrderedMset roots = setupRootSet(advisors,students);
	// 显示整个结果集合
	forest_view(roots,students);
	return 0;
}
