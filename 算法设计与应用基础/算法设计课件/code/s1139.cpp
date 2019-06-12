// Problem#: 1139 电路稳定性 
#include<iostream>
#include<string>
#include <cstdio>
using namespace std;

string s;
double p[26+5];
double stab(int& start,int& end);
int main(){
    int num;
    cin>>num;
    cin>>s;
    int r=s.size();
    int l=0;
    for(int i=0;i<num;i++){
        cin>>p[i];
    }
    printf("%.4lf\n",stab(l,r));
    return 0;
}
double stab(int& start,int& end){
    int i,j,k,cnt;
    double res=1.0;
    double tmp;
    for ( i=start;i<end;){
        if (s[i]>='A'&&s[i]<='Z'){
            res*=(1.0-p[s[i]-'A']);
            i=i+2;
            continue;
        }
        tmp=1.0;
        for(j=i;j<end;){
            if (s[j]==',')break;
            cnt=1;
            for(k=j+1;k<end;k++){
                if (s[k]=='(') cnt++;
                if(s[k]==')') cnt--;
                if (cnt==0)break;
            }
            j++;
            tmp*=stab(j,k);
            j=k+1;
        }
        res*=(1.0-tmp);
        i=j+1;  
    }
    return 1.0-res;
}                                 
