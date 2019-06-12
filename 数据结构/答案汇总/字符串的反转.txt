#include<iostream>
#include<string>
#include<algorithm>
using namespace std;

string reverseWords(string s) {
    if(s.size()==0) return "";
    int key=0;
    for(int i=0;i<s.size();++i){
        if(s[i]==' '){
            reverse(s.begin()+key,s.begin()+i);
            key=i+1;
        }
    }
    reverse(s.begin()+key,s.end());
    return s;
}

int main(){
    string s;
    getline(cin,s);
    //cout<<s;
    cout<<reverseWords(s);
}
