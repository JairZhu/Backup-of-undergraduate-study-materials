#ifndef BINARY_SEARCH_TREE_CLASS
#define BINARY_SEARCH_TREE_CLASS

#ifndef NULL
#include <cstddef>
#endif  // NULL

#include <iostream>
#include <iomanip>		// 用于 setw()
#include <string>		
#include <queue>
#include <utility>		// pair 类

#include "except.h"		// 异常（exception）类

using namespace std;

// 声明二叉树节点对象类 
template <typename T>
class BSTNode
{
   public:
		// BSTNode用于实现二叉搜索树类
		// 使数据公有以简化类函数的构建 

		T data;
			// 节点数据
		BSTNode<T> *left, *right, *parent;
            // 指向子节点的指针和指向浮节点的指针

		// 默认构造函数。数据项未被初始化，左、右指针以及父指针均为空 
		BSTNode():left(NULL),right(NULL),parent(NULL) 
		{}
        // 构造函数
		BSTNode (const T& item, BSTNode<T> *lptr = NULL, 
              BSTNode<T> *rptr = NULL, BSTNode<T> *pptr = NULL):
				data(item), left(lptr), right(rptr), parent(pptr)
		{}
};


template <typename T>
class BinSearchTree
{
	public:

// 包含迭代器嵌套类 
#include "BSTiterator.h"

		BinSearchTree();
			// 默认构造函数，初始化根root为NULL，size为0
		BinSearchTree(T *first, T *last);
			// 构造函数，将指针域[first, last)所指元素插入到树中
		BinSearchTree(const BinSearchTree<T>& tree);
			// 复制构造函数 
		~BinSearchTree();
			// 析构函数 
		BinSearchTree<T>& operator= (const BinSearchTree<T>& rhs);
			// 赋值运算符

		iterator find(const T& item);
			// 查找item. 如果找到，则返回树中指向它的迭代器，
            //否则返回end()
		const_iterator find(const T& item) const;
			// 查找算法的常量版本

		int empty() const;
			// 指出树是否为空
		int size() const;
			// 返回树中数据项的数目 

		pair<iterator, bool> insert(const T& item);
			// 如果item不在树中，则插入，并返回
			// pair对象，其迭代器分量指向item，布尔分量为true；
			//如果item在树中 ，返回的pair对象迭代器分量指向
            //已经存在的 item，布尔分量为假
			// 后置条件: 如果item不在树中，树的大小加1

		int erase(const T& item);
			// 如果item在树中，删除它，返回 1
			// 否则，返回 0
			// 后置条件: 如果item在树中，树的大小减1

		void erase(iterator pos);
			// 删除pos所指的项
			// 前提条件: 树非空，pos指向树中有效位置
			// 如果树空，函数抛出underflowError 异常
      		// 如果迭代器无效，函数抛出referenceError异常
			// 后置条件：树的大小减 1

		void erase(iterator first, iterator last);
			// 删除[first, last)域中所有项
			// 前提条件: 树非空
			// 如果树空，函数抛出underflowError 异常
			// 后置条件：树的大小减小[first, last)中元素的数目

		iterator begin();
			// 返回指向中序遍历的首项元素的迭代器
		const_iterator begin() const;
			// 常量版本 
		iterator end();
			// 返回指向树数据尾项之后的位置的迭代器
		const_iterator end() const;
			// 常量版本 

		void display(const int dataWidth, 
                               const int screenWidth);
			// 显示树的函数
            // dataWidth是输出节点值所需要的最大字符树
			// screenWidth是屏幕宽度

	private:
		BSTNode<T> *root;
			// 指向树根的指针
		int treeSize;
			// 树中元素的数目

		BSTNode<T> *getBSTNode(const T& item, BSTNode<T> *lptr,
                                    BSTNode<T> *rptr, BSTNode<T> *pptr);
			// 分配新节点，返回指向它的指针
			// 如果内存分配失败，函数抛出memoryAllocationError异常

		BSTNode<T> *copyTree(BSTNode<T> *t);
			// 供复制构造函数和递归运算符使用的递归函数
			// 以当前树作为副本赋给另一个树

		void deleteTree(BSTNode<T> *t);
			// 供析构函数和递归运算符使用的递归函数
			// 删除树中所有节点 

		BSTNode<T> *findNode(const T& item) const;
			// 在树中查找item，如果它在树中，返回指向它的节点的指针
			// 否则，返回NULL
			// 供find()和erase()使用 
			
		//辅助结构
		//存放display中节点坐标（x，y）的记录
		struct Info
		{
		    //默认构造函数 
		    Info() {} 
		    //初始化构造函数
		    Info(int indent, int level):xIndent(indent),yLevel(level)
			{}; 
		    int xIndent,yLevel;
		};
};

template <typename T>
BSTNode<T> *BinSearchTree<T>::getBSTNode(const T& item,
			BSTNode<T> *lptr,BSTNode<T> *rptr, BSTNode<T> *pptr)
{
	BSTNode<T> *newNode;

	// 初始化数据和所有指针项
	newNode = new BSTNode<T> (item, lptr, rptr, pptr);
	if (newNode == NULL)
		throw memoryAllocationError
          ("BinSearchTree: memory allocation failure");

	return newNode;
}

template <typename T>
BSTNode<T> *BinSearchTree<T>::copyTree(BSTNode<T> *t)
{
	BSTNode<T> *newlptr, *newrptr, *newNode;

	// 如果样本树为空，返回NULL
	if (t == NULL)
		return NULL;
  
	// 复制根t的左子树，子树根赋值给newlptr
	newlptr = copyTree(t->left);

	// 复制根t的右子树，子树根赋值给newrptr
	newrptr = copyTree(t->right);

	// 分配存储空间给当前根节点newNode，数据域赋值
	// 指针域使指向左、右子树
	// 当newNode父节点已经创建，父指针赋值
	// 如果newNode是整棵树根节点，父指针为NULL
	newNode = getBSTNode(t->data, newlptr, newrptr, NULL);

	// 当前节点是其任一非空子树的父节点
	if (newlptr != NULL)
		newlptr->parent = newNode;
	if (newrptr != NULL)
		newrptr->parent = newNode;

	return newNode;
}

// 删除当前对象存储的树
template <typename T>
void BinSearchTree<T>::deleteTree(BSTNode<T> *t)
{
	// 如果当前根节点非空，依后序遍历顺序删除各节点
	if (t != NULL)
	{
		deleteTree(t->left);
		deleteTree(t->right);
		delete t;
	}
}

// 在树中查找item，如果它在树中，返回指向它的节点的指针
// 否则，返回NULL
template <typename T>
BSTNode<T> *BinSearchTree<T>::findNode(const T& item) const
{   
	// 从根root开始，使t循环中序遍历树
	BSTNode<T> *t = root;

	// 遇空树时循环终止
	// 查找到目的节点时循环终止 
	while(t != NULL && !(item == t->data))
		if (item < t->data)
			t = t->left;
		else 
			t = t->right;

	// 返回节点指针，如未找到，返回NULL
	return t;
}

template <typename T>
BinSearchTree<T>::BinSearchTree(): root(NULL),treeSize(0)
{}

template <typename T>
BinSearchTree<T>::BinSearchTree(T *first, T *last)
                                  : root(NULL),treeSize(0)
{
	T *p = first;

	// 将[first, last)中各项插入树
	while (p != last)
	{
		insert(*p);
		p++;
	}
}

template <typename T>
BinSearchTree<T>::BinSearchTree(const BinSearchTree<T>& tree)
                                      : treeSize(tree.treeSize)
{
	// 复制树到当前对象
	root = copyTree(tree.root);
}

template <typename T>
BinSearchTree<T>::~BinSearchTree()
{
	// 从内存中释放树节点
	deleteTree(root);

	// 重置为空树 
	root = NULL;
	treeSize = 0;
}

template <typename T>BinSearchTree<T>& 
	BinSearchTree<T>::operator= (const BinSearchTree<T>& rhs)
{
	// 处理自我赋值的情况
	if (this == &rhs)
		return *this;

	// 释放现有树占内存，删除现有树
	deleteTree(root);

	// 复制树rhs到现有对象
	root = copyTree(rhs.root);

	// 设置树的大小 
	treeSize = rhs.treeSize;

	// 返回当前对象的引用 
	return *this;
}

template<typename T> 
    typename BinSearchTree<T>::iterator 
	    BinSearchTree<T>::find(const T& item)
{
	BSTNode<T> *curr;

	// 调用findNode函数查找目标项
	curr = findNode (item);

	// 如果查找成功，返回当前值的迭代器
	// 否则，返回end()
	if (curr != NULL)
		return iterator(curr, this);
	else
		return end();
}

template <typename T>
typename BinSearchTree<T>::const_iterator 
	BinSearchTree<T>::find(const T& item) const
{
	BSTNode<T> *curr;

	// 调用findNode函数查找目标项
	curr = findNode (item);

	// 如果查找成功，返回当前值的常量迭代器
	// 否则，返回end()
	if (curr != NULL)
		return const_iterator(curr, this);
	else
		return end();
}

template <typename T>
int BinSearchTree<T>::empty() const
{
	return root == NULL;
}

template <typename T>
int BinSearchTree<T>::size() const
{
	return treeSize;
}

template <typename T > 
     pair<typename BinSearchTree<T> ::iterator, bool  > 
		BinSearchTree<T>::insert(const T& item)
{                          
	// t是遍历的当前节点，parent是前一节点
	BSTNode<T> *t = root, *parent = NULL, *newNode;

	// 遇空树时终止
	while(t != NULL)
	{
		// 更新parent指针，然后去左子树或右子树
		parent = t;
		// 如果出现匹配，返回pair，
    	//迭代器分量指向树中item，布尔分量为false
		if (item == t->data)
			return pair<iterator, bool> (iterator(t, this), false);
		else if (item < t->data)
			t = t->left;
		else 
			t = t->right;
	}
    
	// 生成新的叶结点
	newNode = getBSTNode(item,NULL,NULL,parent);

	// 如果父节点为空，则插入节点作为根节点
	// 此种即是插入前为空树的情形 
	if (parent == NULL)
		root = newNode;
	else if (item < parent->data)                   
		// 作为左子节点插入
		parent->left = newNode;  
	else
		// 作为右子节点插入 
		parent->right = newNode;
  
	// 树的大小增 1 
	treeSize++;

	// 返回pair对象，迭代器分量指向新节点，布尔分量为true
	return pair<iterator, bool> (iterator(newNode, this), true);
}

template <typename T>
void BinSearchTree<T>::erase(iterator pos)
{
	// dNodePtr 指针指向将被删除的节点D
	// pNodePtr 指针指向节点 D的父节点P
	// rNodePtr 指针指向替换节点D的节点R
	BSTNode<T> *dNodePtr = pos.nodePtr, *pNodePtr, *rNodePtr;

	if (treeSize == 0)
 		throw
			underflowError("BinSearchTree erase(): tree is empty");

	if (dNodePtr == NULL)
 		throw
			referenceError("BinSearchTree erase(): invalid iterator");

	pNodePtr = dNodePtr->parent;

	// 如果D有一个子节点为空
	// 替换节点是另一个子节点
	if (dNodePtr->left == NULL || dNodePtr->right == NULL)
	{
		if (dNodePtr->right == NULL)
			rNodePtr = dNodePtr->left;
		else
			rNodePtr = dNodePtr->right;

		// 如果rNodePtr为NULL，则D节点是叶节点， 不用考虑替换 
		if (rNodePtr != NULL)
			// R的父节点更新为D的父节点
			rNodePtr->parent = pNodePtr;
	}
	// 节点D有左、右子树的情形 
	else
	{
		// 查找节点D的替换节点R，并使R脱离树： 
		// 我们选择右子树最左边的节点来替换， 
		// 这个节点值是大于D 的节点中最小的 
		// 找到后将该节点从树中断开 
		// unlink the node from the tree.
  
		// pOfRNodePtr 指针指向替换节点的父节点
		BSTNode<T> *pOfRNodePtr = dNodePtr;

		// 可能的替换节点在节点D的右子树
		rNodePtr = dNodePtr->right;

		// 沿着节点D右子节点的左子树下降
		// 下降过程中保留当前节点和它的父节点
		// 当到最左叶结点，停下，找到了替换节点
		while(rNodePtr->left != NULL)
		{
			pOfRNodePtr = rNodePtr;
			rNodePtr = rNodePtr->left;
		}
  
  		//D的右子节点不存在左子树的情形 
		if (pOfRNodePtr == dNodePtr)
		{
			// 所删除节点的右子节点是替换节点
			// 将D节点的左子树赋给R节点的左子树
			rNodePtr->left = dNodePtr->left;
			// R节点的父节点更新为D节点的父节点
			rNodePtr->parent = pNodePtr;
			// 将D的左子树与节点R连接
			dNodePtr->left->parent = rNodePtr;
		}
		else
		{
			// D节点的右子节点的左子树中非空的情形
			// 通过将R节点的右子树置为R节点的父节点的右子树，
			// 将R节点从树中断开连接
			pOfRNodePtr->left = rNodePtr->right;

			// R节点的右子节点的父节点更新为R节点的父节点
			if (rNodePtr->right != NULL)
				rNodePtr->right->parent = pOfRNodePtr;

			// 将替换节点R放置在原节点D的位置
			// 使D的子节点成为R的子节点
			rNodePtr->left = dNodePtr->left;
			rNodePtr->right = dNodePtr->right;
			// R节点的父节点置为D节点的父节点
			rNodePtr->parent = pNodePtr;
			// 使新关联的R节点的子节点的父节点指针指向节点R
			rNodePtr->left->parent = rNodePtr;
			rNodePtr->right->parent = rNodePtr;
		}
	}

	// 完成节点R到新的父节点的连接

	// 节点D是根节点的情形
	if (pNodePtr == NULL)
		root = rNodePtr;
	// 将R与P的正确分支关联
	else if (dNodePtr->data < pNodePtr->data)
		pNodePtr->left = rNodePtr;
	else
		pNodePtr->right = rNodePtr;
  
	// 从内存中删除节点D，树的大小减 1
	delete dNodePtr;
	treeSize--;
}

template <typename T>
int BinSearchTree<T>::erase(const T& item)
{
	int numberErased = 1;
	// 在树中查找目标项
	BSTNode<T> *p  = findNode(item);

	// 如果查找成功，删除
	if (p != NULL)
		erase(iterator(p,this));
	else
		numberErased = 0;

	return numberErased;
}

template <typename T>
void BinSearchTree<T>::erase(iterator first, iterator last)
{
	if (treeSize == 0)
 		throw
			underflowError("BinSearchTree erase(): tree is empty");

	iterator p = first;

	if (first == begin() && last == end())
	{
		// 我们被要求删除整棵树 
		deleteTree(root);

		// 树变为空 
		root = NULL;
		treeSize = 0;
	}
	else
		// 删除树的子区间的每个元素
		while (p != last)
			erase(p++);
}

template <typename T>
	typename BinSearchTree<T>::iterator 
		BinSearchTree<T>::begin()
{
	BSTNode<T> *curr = root;

	// 如果树非空，中序遍历的第一个节点是从距离根节点最左的节点
	if (curr != NULL)
		while (curr->left != NULL)
			curr = curr->left;

	// 通过私有构造函数生成返回值
	return iterator(curr, this);
}

template <typename T>
  typename BinSearchTree<T>::const_iterator 
    BinSearchTree<T>::begin() const
{
	const BSTNode<T> *curr = root;

	// 如果树非空，中序遍历的第一个节点是从距离根节点最左的节点
	if (curr != NULL)
		while (curr->left != NULL)
			curr = curr->left;

	// 通过私有构造函数生成返回值
	return const_iterator(curr, this);
}

template <typename T>
   typename BinSearchTree<T>::iterator 
   BinSearchTree<T>::end()
{
	// 以含值为NULL的BSTNode指针的迭代器指示容器结束位置
	return iterator(NULL, this);
}

template <typename T>
typename BinSearchTree<T>::const_iterator BinSearchTree<T>::end() const
{
	// 以含值为NULL的BSTNode指针的迭代器指示容器结束位置
	return const_iterator(NULL, this);
}



template <typename T>
void BinSearchTree<T>::display(const int dataWidth = 1,const int screenWidth=64)
{
	// 存储每个节点的队列
   queue<BSTNode<T> *> q;
   //存放节点打印信息的队列；    
   queue<Info>QI; 
   BSTNode<T> *currNode;
   Info currInfo; 
   int units (screenWidth/dataWidth); 
   int offset = units/2;
   //当前节点的列坐标  
   int currlevel = -1;
   //当前节点的同层的前一节点的行坐标 
   int preX;    
    
   //如果树为空，退出 
   if ((*this).empty())
      return;

   // 在队列q中插入根节点来初始化队列
   q.push(root);
   //在队列QI中插入根节点坐标初始化队列 
   QI.push(Info(offset,0));

   // 继续迭代过程，直到队列空 
   while(!q.empty())
   {
      // 从队列中删除前端节点，并访问节点
      currNode = q.front();
      q.pop();
      currInfo = QI.front();
      QI.pop(); 
      if( currInfo.yLevel != currlevel )
      {
           //换两行         
           cout<<"\n\n" ;     
          //新行，起始位置为0
          preX = 0;
          //子女节点的偏移量为 上层节点的1/2  
          offset /= 2;   
          //更新当前节点坐标层次 
          currlevel = currInfo.yLevel;       
      }
      
      //在相应位置输出节点队列头部元素的值，类型为T，
      //我们假定类型T定义了合适的<<操作符 
      cout<<setw((currInfo.xIndent-preX)*dataWidth)
          <<currNode->data;  
      
      if( currNode->left != NULL )
      {
          //左子节点入队
          q.push(currNode->left) ;
          //左子节点位置信息入队
          QI.push(Info(currInfo.xIndent-offset,currInfo.yLevel+1));
      }
      if( currNode->right != NULL )
      {
          //右子节点入队
          q.push(currNode->right) ;
          //右子节点位置信息入队
          QI.push(Info(currInfo.xIndent+offset,currInfo.yLevel+1));
      }      
      preX = currInfo.xIndent;
   } //while循环
}



#endif  // BINARY_SEARCH_TREE_CLASS
