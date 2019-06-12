#include<iostream>
using namespace std;
#incude "source.cpp"

int main()
{
    //freopen("out.txt","w",stdout);
    Account a("a",1);
    cout<<a.getName()<<" "<<a.getBalance()<<endl;
    a.setName("aa");
    a.setBalance(11);
    cout<<a.getName()<<" "<<a.getBalance()<<endl;
    Account b("b",2);
    Account c("c",3);
    Account d("d",4);
    cout<<Account::getCount()<<endl;
    Account *ptr=new Account("e",2);
    cout<<Account::getCount()<<endl;
    delete ptr;
    cout<<Account::getCount()<<endl;
    return 0;
}
