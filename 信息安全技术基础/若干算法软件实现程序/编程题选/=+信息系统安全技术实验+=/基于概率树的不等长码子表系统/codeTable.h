#include<iostream>
#include<fstream>
#include<string>
using namespace std;

#ifndef __codeTable_h
#define __codeTable_h

#include"node.h"
#include"list.h"

const int NUM=128;

class CodeTable{
public:
	CodeTable(ifstream *infile,ofstream *outfile);
	~CodeTable();
	void  buildCodeTable();  //生成码字表
private:
	void buildList();    //生成码字的概率链
	void buildTree();    //由码字的概率链生成码字的概率树
	//遍历概率树来循环生成码字表
	void recursiveBuildCodeTable(Node *tree);
	void add(Node *root,string s);
	void clear(Node *root);

	SortedList probabilityList;  //码字的概率链
	Node *tree;     //树根
	ifstream *plaintext;  //明文
	ofstream *codeTable;  //码字表
};
//////////////////////////////////////////////////////////////
CodeTable::CodeTable(ifstream *infile,ofstream *outfile)
{
	plaintext=infile;
	codeTable=outfile;
	tree=NULL;
}

CodeTable::~CodeTable()
{
    clear(tree);
//	plaintext=NULL;
//	codeTable=NULL;
}

void  CodeTable::buildCodeTable()
{
	buildList();
	buildTree();
	recursiveBuildCodeTable(tree);
}
	

//////////////////////////////////////////////////////////////
void CodeTable::buildList()
{
//统计明文的码字的概率
	int p[NUM];
	int num=0;
	char letter;
	Node *x;

	for(int i=0;i<NUM;i++)
		p[i]=0;
	while(plaintext->peek()!=EOF){
		plaintext->get(letter);
		p[int(letter)]++;
        num++;
	}
//统计结果插入概率链
	for(int j=0;j<NUM;j++){
		//找到文件中出现的字符
		if(p[j]!=0){
			x=new Node();//新结点
			x->letter=j;  //码字
			x->probability=(p[j]/float(num) );  //概率
			//插入概率链
		    probabilityList.insert(x);
		}
		
	}		
}
void CodeTable::buildTree()
{
	Node *r,*l,*n;
	if(probabilityList.size()<=1)
		tree=probabilityList.head;
	else{
	  while(probabilityList.size()>1){
		n=new Node();
		probabilityList.remove(0,l);
		probabilityList.remove(0,r);
		n->lchild = l;
		n->rchild = r;
		n->probability=l->probability+r->probability;
		probabilityList.insert(n);
	  }
	  tree = n;
	  add(tree->lchild,"0");
	  add(tree->rchild,"1");
	}
		
}
void CodeTable::recursiveBuildCodeTable(Node *tree)
{
	if(tree!=NULL){
		//向码字表输出码字及对应的0/1字符串
		if(tree->lchild==NULL&&tree->rchild==NULL)
		    (*codeTable)<<tree->letter<<' '<<tree->s<<endl;
		recursiveBuildCodeTable(tree->lchild);
		recursiveBuildCodeTable(tree->rchild);
//		delete tree;
	}
}

void  CodeTable::add(Node *root,string s)
{//左子树叶子的字符串加0,右子树叶子的字符串加1
		  if(root != NULL){
			  	root->s = s;
			    string c1,c2;
				c1=s+"0";
				c2=s+"1";				
				add(root->lchild,c1);
				add(root->rchild,c2);
		  }
}

void  CodeTable::clear(Node *root)
{
	if(root!=NULL){
		Node *l=root->lchild;
		Node *r=root->rchild;
		delete root;
		clear(l);
		clear(r);
	}
}

#endif