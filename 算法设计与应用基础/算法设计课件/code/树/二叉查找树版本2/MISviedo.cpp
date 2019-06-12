// FileName MISvideo.cpp
// 小型音像商店事务管理系统
// 设计Video类存储电影名称和副本数目，并提供基本的操作接口
// Video类重载相等与比较操作符，这是作为二叉搜索树必须满足的条件
// 程序架构如下：
// 首先，函数setupInventory()从"films.dat"文件读取电影名称，生成Video对象
//       并将这些对象放置于BinSearchTree对象inventory中
//       列出inventory中的所有影片
// 之后，进入一个交互循环，店员输入顾客请求：rent影片或return影片
//       或者输入Done以结束一天工作
//       如果是租借，则调用rentalTransaction()
//       如果是归还，则调用returnTransaction()

#include <iostream>
#include <fstream>
#include <string>
#include <utility>				// for pair class

#include "BinSearchTree.h"		// BinSearchTree class
#include "Video.h"				// Video class


using namespace std;

// 从文件"films.dat"初始化inventory表
void setupInventory(BinSearchTree<Video>& inventory);

// 处理影片归还事务
void returnTransaction(BinSearchTree<Video>& inventory,
			  BinSearchTree<Video>& rentals, const string& filmName);

// 处理影片借出事务
void rentalTransaction(BinSearchTree<Video>& inventory,
			  BinSearchTree<Video>& rentals, const string& filmName);

//遍历输出二叉搜索树
template <typename T>
void writeBSTree(const BinSearchTree<T>& t, const string& separator);

int main()
{
	// 库存和出借清单
	BinSearchTree<Video> inventory, rentals;
	// find()的返回值赋值给filmIter
	BinSearchTree<Video>::iterator filmIter;
	// 来自店员的输入：事务类型
	// transactionType = "Rent", "Return",或 "Done"
	string transactionType;

	// 顾客请求的电影
	string filmName;

	// 读入并输出库存文件
	setupInventory(inventory);
	cout << "初始库存清单:" << endl;
	writeBSTree(inventory, "\n");
	cout << endl;

	// 根据到达顾客的请求，输入"Rental" 或 "Return" 接影片名称，
	// 或输入“Done”以终止程序。
	// 对于 "Rent"事务, 将库存副本数目减少1，副本加到借出数据库
	// 对于"Return"事务,将副本移出借出数据库，库存的副本数加1
	cout << "请输入事务类型 (Rent, Return, Done)并接以空格：" << endl;
	cout << "并继续输入影片名称，输完后请回车确认" << endl << endl;
	while (true)
	{
		// 输入事务类型，事务类型必须以空格终止
		cout << "事务: ";
		getline(cin, transactionType, ' ');
		// 如果是 "Done", 终止循环
		if (transactionType == "Done")
			break;

		// 读取影片名称
		getline(cin, filmName,'\n');

		if (transactionType == "Return")
			returnTransaction(inventory, rentals, filmName);
		else
			rentalTransaction(inventory, rentals, filmName);
	}
	cout << endl;

	// 输出最终的借出电影和库存清单
	cout << "已借出的电影: " << endl << endl;
	writeBSTree(rentals, "\n");
	cout << endl;
	cout << "保留在库存中的电影:" << endl << endl;
	writeBSTree(inventory, "\n");

	system("pause");
	return 0;
}

void setupInventory(BinSearchTree<Video>& inventory)
{
	ifstream filmFile;		// 输入流
	string filmName;		// 用于记录电影名称
	// 与BinSearchTree insert()一起使用
	pair<BinSearchTree<Video>::iterator, bool> p;

	// 打开文件 "films.dat"
	filmFile.open("films.dat");
	if (!filmFile)
	{
		cerr << "文件'films.dat'未找到!" << endl;
		exit(1);
	}

	// 读取各行直到遇到EOF；
	// 在inventory列表中插入电影名称
	while(true)
	{
		getline(filmFile,filmName,'\n');
		if (!filmFile)
			break;

		// 尝试插入，副本数取默认值1
		p = inventory.insert(Video(filmName));
		// 查看Video对象是否已存在inventory中
		if (p.second == false)
			// 已经在inventory中，副本数增加1
			(*(p.first)).updateCopies(1);
	}
}

void returnTransaction(BinSearchTree<Video>& inventory,
			  BinSearchTree<Video>& rentals, const string& filmName)
{
	BinSearchTree<Video>::iterator filmIter;

	// locate the film in the return database
	filmIter = rentals.find(Video(filmName));
	// if there is only 1 copy left, erase the entry;
	// otherwise, decrease the number of rented copies
	// by 1
	if ((*filmIter).getCopies() == 1)
		rentals.erase(filmIter);
	else
		(*filmIter).updateCopies(-1);

	// locate the film in the inventory and increase the
	// number of copies available by 1
	filmIter = inventory.find(Video(filmName));
	(*filmIter).updateCopies(1);
	cout << "影片 《" << filmName << "》成功归还" << endl ;

}

void rentalTransaction(BinSearchTree<Video>& inventory,
			  BinSearchTree<Video>& rentals, const string& filmName)
{
	BinSearchTree<Video>::iterator filmIter;
	// pObj与BinSearchTree的insert()一起使用
	pair<BinSearchTree<Video>::iterator,bool> pObj;

	// 影片可借么?
	filmIter = inventory.find(Video(filmName));
	if ( filmIter == inventory.end())
	{
		// 影片不在商店的库存清单中
		cout << "影片 《" << filmName << "》不在商店库存清单中——" 
		 << "此次租借失败" << endl;
	}
	else if ((*filmIter).getCopies() == 0)
	{
		// 所有副本都已被借出
		cout << "影片 《" << filmName << "》的所有副本都被借出——" 
			<< "此次租借失败" << endl;
	}
	else
	{
		// 将库存中的副本数目减1
		(*filmIter).updateCopies(-1);
		// 尝试将影片插入rentalList
		// 如果成功插入，则rental中这部影片副本的数目为1
		pObj = rentals.insert(Video(filmName));
		// 如果未插入，则将已借出副本数目加1
		if (pObj.second == false)
			(*(pObj.first)).updateCopies(1);
		cout << "影片 《"<< filmName << "》成功借出" << endl;
	}
}


//遍历输出二叉搜索树
template <typename T>
void writeBSTree(const BinSearchTree<T>& t, const string& separator = "  ")
{
	BinSearchTree<T>::const_iterator iter = t.begin();

	while (iter != t.end())
	{
		cout << *iter << separator;
		iter++;
	}
}
/*
Run:

Initial inventory list:
Frequency (1)
Gladiator (2)
Lord of the Rings (4)
U-571 (2)

Transactions: Enter type (Rent, Return, Done)
followed by film name or space if done

Transaction: Rent Gladiator
Transaction: Rent Frequency
Transaction: Rent Shaft
Film Shaft is not in inventory
Transaction: Rent Frequency
All copies of Frequency are checked out
Transaction: Done

Rented Films:

Frequency (1)
Gladiator (1)

Films Remaining in Inventory:

Frequency (0)
Gladiator (1)
Lord of the Rings (4)
U-571 (2)
*/
