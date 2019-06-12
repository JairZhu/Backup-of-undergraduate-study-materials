// Problem#: 1935 ¶þ²æÊ÷ÖØ½¨ 
#include<iostream>
#include<string>
#include<queue>
using namespace std;

class tree{
public:
    char c;
    tree* left;
    tree* right;
};

tree* built(string p,string s)
{
    tree* root=NULL;
    if(p.length()>0){
    root=new tree;
    char c=p.at(0);
    int temp=s.find(c);
    root->c=c;
    root->left=built(p.substr(1,temp),s.substr(0,temp));
    root->right=built(p.substr(temp+1),s.substr(temp+1));
    }
    return root;
}

void bfs(tree* t)
{
    queue<tree*> q;
    tree* current=t;
    q.push(current);
    while(!q.empty())
    {
        current=q.front();
        cout<<current->c;
        q.pop();
        if(current->left!=NULL)
        q.push(current->left);
        if(current->right!=NULL)
        q.push(current->right);
    }
    cout<<endl;
}

int main()
{
    string p,s;
    int n;cin >>n;
    while(n--)
    {
        cin >> p>>s;
        tree *t=built(p,s);
        bfs(t);
    }
    return 0;


}                                 
