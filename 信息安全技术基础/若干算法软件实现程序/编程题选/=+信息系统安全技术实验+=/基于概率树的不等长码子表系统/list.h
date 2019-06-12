#ifndef __list_h
#define __list_h

#include"node.h"

class SortedList{
public:
	SortedList();
//	~SortedList();

	bool remove(int position,Node *&x);
	bool insert(Node *x);
	int size()const;
	bool empty()const;
	void clear(Node *root);
	Node *head; 
protected:
	int count;
};
///////////////////////////////////////////////////////
SortedList::SortedList()
{
	head=NULL;
	count=0;
}
/*
SortedList::~SortedList()
{
	clear(head);
}
*/
////////////////////////////////////////////////////////
int SortedList::size()const
{
	return count;
}

void  SortedList::clear(Node *root)
{
	if(root!=NULL){
		Node *l=root->lchild;
		Node *r=root->rchild;
		delete root;
		clear(l);
		clear(r);
	}
}
/*
void SortedList::clear()
{
	Node *p=head;
	while(head!=NULL){
		p=head;
        head=head->next;
		delete p;
	}
	count=0;
}
*/
bool SortedList::empty()const
{
	return count==0; 
}

/////////////////////////////////////////////////////////
bool SortedList::insert(Node *x)
{
	Node *first,*second;   
	//若空链或要插入的节点为最小，插入表头
	if(count==0){ 
		head = x;
	}else if(x->probability<=head->probability ){
        x->next = head;
		head = x;
	}else{
	//要不然就插入到链表中合适位置
		first=head;
		//找到表中合适位置
		while(first!=NULL&&x->probability > first->probability){
			second=first;
			first=first->next;
		}
		//插入
		second->next =x;
		x->next=first;
	}
	count++;
	return true;
}

bool SortedList::remove(int position,Node *&x)
{
	Node *p;
//若表中无节点或删除位置超过范围，出错
	if(count==0||position<0||position>=count)
		return false;
//删除第一个节点
	if(position==0){
		x=head;
		head=head->next;
		x->next=NULL;
		count--;
		return true;
	}	
//删除中间节点
	//找到删除的位置
	Node *previous;
	p = head;
    for(int i=0;i<position;i++){
		previous = p;
		p= p->next;
	}
	//删除节点
	previous->next=p->next;
	x=p;
	x->next=NULL;
	count--;
	return true;
}

#endif

