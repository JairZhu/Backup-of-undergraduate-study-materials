// Problem#: 3726
// Submission#: 926441
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University
#include <iostream>
#include <queue>
#include <cstdio>
using namespace std;

struct Node
{
       int elem;
       Node *left;
       Node *right;
};

void insert(int x,Node * &t)
{
     if(t==NULL)
     {
         t=new Node;
         t->elem=x;
         t->left=NULL;
         t->right=NULL;
     }
     else if(x<t->elem)
         insert(x,t->left);
     else if(x>t->elem)
         insert(x,t->right);
}

void orderPrintTree(Node *t)    
{
     if(t!=NULL)
     {
         orderPrintTree(t->left);
         cout<<t->elem<<" ";
         orderPrintTree(t->right);
     }
     else return;
} 

void prePrintTree(Node *t)
{
     if(t!=NULL)
     {
         cout<<t->elem<<" ";
         prePrintTree(t->left);
         prePrintTree(t->right);
     }
     else return;
}

int main()
{
    int m;
    scanf("%d",&m);
    while(m != 0)
    {
        int aa[m];
        Node *head=new Node;
        head=NULL;
        for(int i=0;i<m;++i)
        {
            scanf("%d",&aa[i]);
            insert(aa[i],head);
        }    
        orderPrintTree(head);
        printf("\n");
        prePrintTree(head);
        printf("\n");
        scanf("%d",&m);
    }
    //system("pause");
    return 0;
}