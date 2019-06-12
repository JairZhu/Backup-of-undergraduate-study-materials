// FileName: BSTAsFilter.cpp

// 此程序用整数数组arr的值初始化向量v，其中包含重复元素
// 用参数v调用filterDup()函数消除重复项
// 最后程序输出过滤去重复元素之后的向量元素


#include <iostream>
#include <vector>
#include "BinSearchTree.h"	// BinSearchTree类库

using namespace std;

// 从向量v中消除重复元素
// 并将排好序的元素剩余元素存储在v中
template <typename T>
void filterDup(vector<T>& v);

// 屏幕输出向量v
template <typename T>
void writeVector(const vector<T>& v);


int main()
{
	int arr[] = {3, 6, 3, 33, 55, 5, 55, 15, 25, 3, 5, 2, 5, 3, 55};
	int arrSize = sizeof(arr)/sizeof(int);
	vector<int> v(arr, arr+arrSize);

	// 输出原始向量内容
	cout << "原始向量内容：\n";
	writeVector(v);
	// 消除重复元素并排序
	filterDup(v);
	// 输出过滤并排序后的向量内容
	cout << "过滤并排序之后向量内容：\n";
	writeVector(v);
	cout << endl;
	system("pause");
	return 0;
}

template <typename T>
void filterDup(vector<T>& v)
{
	// 二叉搜索树t用作过滤器
	BinSearchTree<T> t;
	BinSearchTree<T>::iterator treeIter;
	vector<T>::iterator vectorIter;

	// 将向量数据插入到二叉搜索树t中
	// 忽略重复值
	vectorIter = v.begin();
	while (vectorIter != v.end())
	{
		t.insert(*vectorIter);
		vectorIter++;
	}

	// 清空向量v
	v.resize(0);

	// 升序遍历树
	// 元素逐个用push_back()函数压入向量末尾
	treeIter = t.begin();

	while (treeIter != t.end())
	{
		v.push_back(*treeIter);
		treeIter++;
	}
}

template <typename T>
void writeVector(const vector<T>& v)
{
	vector<T>::const_iterator iter;
	for(iter = v.begin(); iter != v.end(); ++iter )
	{
		cout << *iter << "  ";
	}
	cout << endl;
}
/*
Run:

2  3  5  6  15  25  33  55
*/
