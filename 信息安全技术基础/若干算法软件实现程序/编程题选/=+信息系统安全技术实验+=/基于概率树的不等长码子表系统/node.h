#ifndef __node_h
#define __node_h

#include<string>
#include<iostream>
using namespace std;

struct Node{
	char letter;  //码字
	float probability;  //码字在文件中出现的概论
	string s;  //码字在概论树中的位置。左0右1

	Node *next;  
	Node *lchild;
	Node *rchild;

	Node(){
		next=NULL;
		lchild=NULL;
		rchild=NULL;
		letter='\0';
		s="";
	}
    


};

#endif
