#include<iostream>
using namespace std;

int arr[11];
int c[11];

int lowbit(int x)
{
    return x&(-x);
}

void update(int pos,int val) 
{
     for(int i = pos; i <= 10; i += lowbit(i))
             c[i] += val;
}

int getsum(int pos)      // arr[1]+arr[2]+...+arr[pos]
{
    int s = 0;
    for(int i = pos; i > 0; i -= lowbit(i))
            s += c[i];
    return s;
}

int main()
{
    for(int i = 1; i <= 10; i ++) arr[i] = i;
    
    /* construct array c[]*/
    for(int i = 1; i <= 10; i ++) update(i,arr[i]);
    
    for(int i = 1; i <= 10; i ++)
            cout<<i<<" "<<c[i]<<endl;
    
    update(3,10);
    cout<<getsum(10)<<endl;
    
    int l = 2;
    int r = 6;
    
    cout<<getsum(r)-getsum(l-1)<<endl;
    
    getchar();
}
