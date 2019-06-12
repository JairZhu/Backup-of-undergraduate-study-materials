#include<iostream>

using namespace std;

inline int add( int a, int b = 0) {
	return a + b;
}

int main()
{
	cout<<add(1,2)<<endl;
	return 0;
}