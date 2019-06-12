#include <stdio.h>

int main()
{
    int grade,h[110],i,j;
    for(i=0;i<=100;i++)
    {
        h[i]=0;
    }
    while(scanf("%d",&grade)!=EOF)
    {
        h[grade]++;
    }
    
    for(i=0;i<=100;i++)
    {
        if(h[i]!=0) 
        {
            printf("%d\t",i);
            for(j=0;j<h[i];j++) 
            {
                printf("*");
            }
            printf("\n");
        }
    }
    return 0;
}
