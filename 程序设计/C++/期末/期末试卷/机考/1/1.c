#include <stdio.h>

int main()
{
    freopen("data1.in","r",stdin);
    freopen("data1.out","w",stdout);
    
    int i;
    double sum, pm;
    
    for ( sum = i = 0; i < 12; i++ ) {
        scanf("%lf",&pm);
        sum += pm;
    }
    printf("%.2lf\n",sum/12);
    
    //system("PAUSE");
    return 0;
}
