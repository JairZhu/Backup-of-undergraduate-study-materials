// Problem#: 3405
// Submission#: 871020
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University
#include <iostream>
#include <list>
using namespace std;

struct Node
{
    int right;
};

int main()
{
    int t,n,m;
    cin>>t;
    while(t--)
    {
        cin>>n>>m;
        if(m==1) 
        {
            cout<<n<<endl;
            continue;
        }
        Node *pp=new Node[n+1];
        for(int i=1;i<n;++i)
            pp[i].right=i+1;
        pp[n].right=1;
        int q=1;
        for(int i=0;i<n-1;++i)
        {
            for(int j=0;j<m-2;++j)
                q=pp[q].right;
            pp[q].right=pp[pp[q].right].right;
            q=pp[q].right;
        }
        cout<<q<<endl;
    }           
    return 0;
}