#include <iostream>

using namespace std;

class A
{
    public:
        A(int i){
            a = i;
        }
        virtual ~A(){
            cout << "A::a = " <<a<<endl;
        }
        int a;
};
class B:virtual public A
{
    public:
        B(int i,int j):A(i){
            b = j;
        }
        ~B(){
            cout <<"A::a = "<<a<<endl;
            cout <<"B::b = "<<b<<endl;
        }
        int b;
};
class C:virtual public A
{
    public:
        C(int i,int k):A(i){
            c = k;
        }
        ~C(){
			cout <<"A::a = "<<a<<endl;
			cout <<"C::c = "<<c<<endl;
		}
        int c;
};
class D:public B,public C{
    public:
        D(int i,int j, int k, int l):A(i),B(i,j),C(i,k){
            d = l;
        }
		~D(){
			cout <<"A::a = "<<a<<endl;
			cout <<"B::b = "<<b<<endl;
			cout <<"C::c = "<<c<<endl;
			cout <<"D::d = "<<d<<endl;
		}
        int d;
};                         

int main(int argc, const char *argv[])
{
    A* a = new A(1);
    delete a;
    cout << endl << endl;
 
    a = new B(2, 3);
    delete a;
    cout << endl << endl;
 
    a = new C(4, 5);
    delete a;
    cout << endl << endl;
 
    a = new D(6, 7, 8, 9);
    delete a;
 
    return 0;
}   