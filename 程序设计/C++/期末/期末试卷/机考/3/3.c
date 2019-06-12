#include <stdio.h>

void swap( int *a, int *b )
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main()
{
    freopen("data3.in","r",stdin);
    freopen("data3.out","w",stdout);
    
    int a, b, n, i, f1, f2, f3;
    
    while ( scanf("%d%d%d",&a,&b,&n), (a||b||n) ) {
        for ( f1 = f2 = 1, i = 3; i <= n; i++ ) {
            f3 = (b*f1+a*f2) % 7;
            swap(&f1,&f2);
            swap(&f2,&f3);
        }
        printf("%d\n",f2);
    }
    
    //system("PAUSE");
    return 0;
}
