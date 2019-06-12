#include <iostream>
#include <string>

using namespace std;

template< class T >
void swap1(T& a,T& b){
	T tmp;
	tmp = a;
	a = b;
	b = tmp;
}
int main()
{
	int int1, int2;
	cin >> int1 >> int2;
	swap1(int1,int2);
	cout << int1 << ' ' << int2 << endl;
	
	float f1, f2;
	cin >> f1 >> f2;
	swap1(f1,f2);
	cout << f1 << ' ' << f2 << endl;
	
	string s1,s2;
	cin >> s1 >> s2;
	swap1(s1,s2);
	cout << s1 << ' ' << s2 << endl;
	system("pause");
	return 0;
}
