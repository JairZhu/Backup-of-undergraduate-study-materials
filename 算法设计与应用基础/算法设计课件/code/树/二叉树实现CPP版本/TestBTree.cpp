// File: testBTree.cpp

// 此程序演示二叉树的各种算法
// 首先构建一棵二叉树，在屏幕上垂直输出
// 中序、后序及层次遍历二叉树 
// 计算树的高度，并计算叶节点个数
// 并验证了复制、删除二叉树的操作 

#include <iostream>

#include "BTNode.h"		// BTNode类 
#include "BTreelib.h"	// BTNode库 

using namespace std;

//实用函数makeCharTree，生成一棵以字符为节点数据的二叉树
BTNode<char> *makeCharTree();

//遍历算法的visit函数，输出节点数据值 
void printChar(char& elem)
{
    string seperator = "  "; 
    cout <<  elem << seperator;
} 

int main()
{
	//二叉树的根 
    BTNode<char> *root1, *root2;

	// 构造二叉树 
	root1 = makeCharTree();

	// 显示树
	cout << "原始树的图示：" << endl;
	const int charWidth=1;
	const int ScreenWidth=64;
	displayTree(root1, charWidth,ScreenWidth);
	cout << endl << endl;
	
	//节点的中序遍历
    cout << "中序遍历：" ;
    inOrder(root1, printChar);
    cout << endl;
    
   	//节点的后序遍历
    cout << "后序遍历：" ;
    postOrder(root1, printChar);
    cout << endl;
    
   	//节点的层次遍历
    cout << "层次遍历：" ;
    levelOrder(root1, printChar);
    cout << endl<<endl;
    
    //叶结点计数
    int leafCount = 0;
    countLeaf(root1, leafCount);
    cout << "叶节点数目是："
         << leafCount << endl; 
    cout << "树的深度是："
         << depth (root1) <<endl; 

	//生成root1的副本，根为root2
	root2 = copyTree(root1);

	// 显示树的副本 
	cout << "原始树的副本的图示：" << endl;
	displayTree(root2, charWidth,ScreenWidth);
	cout << endl;

	// 清空两棵树
	clearTree(root1);
	clearTree(root2);
	
	cout << "对root1调用的clearTree之后的图示：" << endl;
	displayTree(root1, charWidth,ScreenWidth);
	cout << endl << endl;

    cout<<"按回车键结束程序:" << endl;
    cin.get(); 
	return 0;
}


BTNode<char> *makeCharTree()
{
	// 9 BTNode 指针，指向9个节点项
	BTNode<char> *root, *b, *c, *d, *e, *f, *g, *h, *i;
	g = new BTNode<char> ('G');
	h = new BTNode<char> ('H');
	i = new BTNode<char> ('I');
	d = new BTNode<char> ('D',(BTNode<char> *)NULL, g);
	e = new BTNode<char> ('E',h, i);
	f = new BTNode<char> ('F');
	b = new BTNode<char> ('B',d, (BTNode<char> *)NULL);
	c = new BTNode<char> ('C',e, f);
	root = new BTNode<char> ('A',b, c);
	return root;
}
