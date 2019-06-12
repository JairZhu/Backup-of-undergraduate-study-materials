#include <stdio.h>
int same(char c,char d)
{
    if(c==d) return 1;
    return 0;
}
int max(int a,int b,int c)
{
    if(a>=b&&a>=c) return a;
    if(b>=c) return b;
    return c;
}
int main()
{
    freopen("data8.in","r",stdin);
    freopen("out.txt","w",stdout);
    int n,i,j,f[12][12],alen,blen;
    char a[11],b[11];
    scanf("%d",&n);
    while(n--)
    {
        scanf("%s%s",a,b);
        alen=strlen(a);
        blen=strlen(b);
        for(i=0;i<=alen;i++)
        {
            f[i][blen]=0;
        }
        for(i=0;i<=blen;i++)
        {
            f[alen][i]=0;
        }
        for(i=alen-1;i>=0;i--) 
        {
            for(j=blen-1;j>=0;j--) 
            {
                f[i][j]=max(f[i+1][j+1]+same(a[i],b[j]),f[i+1][j],f[i][j+1]);
            }
        }
        printf("%d\n",f[0][0]);
    }
       
    return 0;
}
