#include <stdio.h>

int main()
{
    freopen("data7.in","r",stdin);
    freopen("data7.out","w",stdout);
    
    int N, i, j, k, a, b;
    char str1[5], str2[5];
    
    for ( scanf("%d",&N), i = 0; i < N; i++ ) {
        scanf("%s%s",str1,str2);
        for ( a = j = 0; j < 4; j++ )
            if ( str1[j] == str2[j] )
                a++;
        for ( b = j = 0; j < 4; j++ )
            for ( k = 0; k < 4; k++ ) {
                if ( j == k )
                    continue;  
                if ( str1[j] == str2[k] ) {
                    b++;
                    break;
                }
            }
        printf("%dA%dB\n",a,b);
    }
    
    //system("PAUSE");
    return 0;
}
