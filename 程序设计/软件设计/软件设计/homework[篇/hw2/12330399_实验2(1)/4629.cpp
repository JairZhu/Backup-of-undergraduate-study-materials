#include<iostream>

using namespace std;
 
int gcd(int a,int b){
	if(a < b)
		return gcd(b,a);
	if(a % b == 0)
		return b;
		return gcd(b,a % b);
}
int main()
{
	int n;
	int a,b,c,d,e,f,i;
	cin>>n;
	while (n--){
		cin>>a>>b>>c>>d;
		e = a * d + b * c;
		f = b * d;
		i = gcd(e,f);
		e = e / i;
		f = f / i;
		if (f == 1)
			cout<<e<<endl;
		else if(f != 1)
			cout<<e<<'/'<<f<<endl;
	}
	return 0;
}
