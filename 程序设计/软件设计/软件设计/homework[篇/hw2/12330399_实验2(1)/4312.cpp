#include <iostream>
#include <math.h>

using namespace std;

int main()
{
    int n,a,b,j,k;
    cin>>n;
    while(n--){
        cin>>a>>b;
        j = k = 0;
        while(a > 0){
            j=j * 10 + a % 10;
            a=a / 10;
        }
        while(b > 0){
            k=k * 10+b % 10;
            b=b / 10;
        }
        cout<<j + k<<endl;
    }
    return 0;
}