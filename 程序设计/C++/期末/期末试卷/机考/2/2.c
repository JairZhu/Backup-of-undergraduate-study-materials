#include <stdio.h>

int main()
{
    int n,i,j;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
    {
        for(j=1;j<i;j++)
        {
            printf("%d\t",i*j);
        }
        printf("%d\n",i*i);
    }
    return 0;
}
