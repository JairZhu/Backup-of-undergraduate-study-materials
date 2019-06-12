#include <stdio.h>

struct book {
    char name[30];
    double price;
};
struct book arr[1010];

int cmp( const void *a, const void *b )
{
    if ( ((struct book*)a)->price == ((struct book*)b)->price )
        return strcmp(((struct book*)a)->name, ((struct book*)b)->name );
    if ( ((struct book*)a)->price < ((struct book*)b)->price )
        return -1;
    return 1;
}

int main()
{
    freopen("data5.in","r",stdin);
    freopen("data5.out","w",stdout);
    
    int N, i;
    
    for ( scanf("%d",&N), i = 0; i < N; i++ ) {
        scanf("%s%lf",arr[i].name,&arr[i].price);
    }
    
    qsort(arr,N,sizeof(arr[0]),cmp);
    
    for ( i = 0; i < N; i++ )
        printf("%s %.2lf\n",arr[i].name,arr[i].price);
    
    //system("PAUSE");
    return 0;
}
