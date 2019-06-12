#include<fstream>
#include<iostream>

using namespace std;

int main()
{
    char ch;
    ifstream file("old.txt");
    ofstream file1("new.txt");
    while(file.get(ch)) {
        cout<<ch;
        file1<<ch;
    }
    file.close();
    file1.close();
    cout<<endl;
	
    return 0;
}
