// File: testBinSearchTree.cpp

// 此程序演示二叉搜索树类的基本功能
// 首先利用构造函数构建一棵二叉搜索树，其内容是"insight"
// 之后对该树操作，包括insert()、erase()、display()



#include "BinSearchTree.h"	// BinSearchTree类库

int main()
{
	cout <<"********************演示二叉搜索树功能的应用程序************************"<<endl;

	//此部分演示树的构建过程
	char* ch = "insight";
	BinSearchTree<char> t(ch, ch+7);
	BinSearchTree<char>::iterator iter;
	const int charWidth=1;
	const int ScreenWidth=80;
	cout << "初始树:" << endl;
	t.display(charWidth,ScreenWidth);
	cout << endl << endl;
	cout << "二叉搜索树的元素为:"<<endl;
	for(iter = t.begin();iter !=t.end();iter++)
		cout<< *iter;
	cout <<endl;

	//此部分演示树的插入操作
	BinSearchTree<char>::iterator tIter;
	pair<BinSearchTree<char>::iterator, bool> p;
	string str = "coding" ;
	cout << "开始插入"<<str <<"操作……"<<endl;
	for( unsigned int i = 0; i < str.length(); i++ )
	{
		p = t.insert(str[i]);
		if(p.second == false)
			cout << str[i] << "是重复字母" << endl;
	}
	cout << "此时树为：" << endl;
	t.display(charWidth,ScreenWidth);
	cout << endl <<endl;
		cout << "二叉搜索树此时的元素为："<<endl;
	for(iter = t.begin();iter !=t.end();iter++)
		cout<< *iter;
	cout <<endl;

	//此部分演示树的删除过程
	cout <<"逐个节点删除,直到树为空，开始……"<<endl;
	iter = t.begin();
	while(iter != t.end())
	{
		cout << *iter<<"被删除后的树"<<endl; 		 
		t.erase(iter++);
		t.display(charWidth,ScreenWidth);
		cout<<endl<<endl;
	}

	cout<<"请按回车键结束程序:" ;
	cin.get();
	return 0;
}
