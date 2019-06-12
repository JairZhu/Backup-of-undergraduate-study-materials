#include <stdio.h>

int main()
{
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    int t,n,i,f[50];
    scanf("%d",&t);
    while(t--)
    {
        scanf("%d",&n);
        f[1]=1;
        f[2]=2;
        for(i=3;i<=n;i++)
        {
            f[i]=f[i-1]+f[i-2];
        }
        printf("%d\n",f[n]);
    }
    return 0;
}
