// Problem#: 1028. Hanoi Tower Sequence
#include <iostream>
using namespace std;

const int base=10;

inline int digit(char x)
{
    if ('0'<=x && x<='9') return x-'0';
    return x-'A'+10;
}

inline char symbol(int d)
{
    if (0<=d && d<=9) return '0'+d;
    return d-10+'A';
}

class bignum
{
public:
    bignum(int x=0)
    {
        d="";
        while (x)
        {
            d=symbol(x%base)+d;
            x/=base;
        }
        if (d=="") d="0";
    }
    bignum(string x)
    {
        d=x;
    
        while (d[0]=='0' && d.length()>1) d.erase(0,1);
        if (d=="") d="0";
    }
    int length() const
    {
        return d=="0"?0:d.length();
    }
    string d;
};

bool operator<(const bignum&, const bignum&);
bool operator>(const bignum&, const bignum&);
bool operator<=(const bignum&, const bignum&);
bool operator>=(const bignum&, const bignum&);
bool operator==(const bignum&, const bignum&);
bool operator!=(const bignum&, const bignum&);
bignum operator+(const bignum&, const bignum&);
bignum operator-(const bignum&, const bignum&);
bignum operator+=(bignum&, const bignum&);
bignum operator-=(bignum&, const bignum&);

istream& operator>>(istream& s, bignum& x)
{
    s>>x.d;
    return s;
}

ostream& operator<<(ostream& s, const bignum& x)
{
    s<<x.d;
    return s;
}

bool operator<(const bignum& A, const bignum& B)
{
    const string& a=A.d;
    const string& b=B.d;
    
    if (a.length()<b.length()) return 1;
    if (a.length()==b.length())
    {
        int len=a.length();
        for (int i=0; i<len; i++)
        {
            if (a[i]<b[i]) return 1;
            if (a[i]>b[i]) return 0;
        }
        return 0;
    }
    return 0;
}

bool operator>(const bignum& A, const bignum& B)
{
    return B<A;
}

bool operator==(const bignum& A, const bignum& B)
{
    return !(A>B || A<B);
}

bool operator!=(const bignum& A, const bignum& B)
{
    return !(A==B);
}

bool operator<=(const bignum& A, const bignum& B)
{
    return !(A>B);
}

bool operator>=(const bignum& A, const bignum& B)
{
    return !(A<B);
}

bignum operator+(const bignum& A, const bignum& B)
{
    const string& a=A.d;
    const string& b=B.d;
    
    int lena=a.length();
    int lenb=b.length();
    int len=max(lena, lenb);
    int carry=0;
    string r;
    for (int i=0; i<len; i++)
    {
        carry+=(lena-1-i>=0?digit(a[lena-1-i]):0)+(lenb-1-i>=0?digit(b[lenb-1-i]):0);
        r=symbol(carry%base)+r;
        carry/=base;
    }
    if (carry) r=symbol(carry%base)+r;
    return bignum(r);
}

bignum operator-(const bignum& A, const bignum& B)
{
    const string& a=A.d;
    const string& b=B.d;
    
    int lena=a.length();
    int lenb=b.length();
    int len=max(lena, lenb);
    int carry=0;
    string r;
    for (int i=0; i<len; i++)
    {
        carry+=(lena-1-i>=0?digit(a[lena-1-i]):0)-(lenb-1-i>=0?digit(b[lenb-1-i]):0);
        r=symbol((base+carry)%base)+r;
        carry = carry<0?-1:0;
    }
    while (r[0]=='0' && r.length()>1) r.erase(0,1);
    return bignum(r);
}

bignum operator-=(bignum& a, const bignum& b)
{
    a=a-b;
    return a;
}

const int N=350;
const bignum P('1'+string(100,'0'));

bignum f[N];
int n;

int e(bignum p)
{
    int k=n-1;
    while (k>=0)
    {
        if (p==f[k]) return k+1;
        if (p>f[k]) p-=f[k];
        k--;
    }
}

int main()
{
    //freopen("1028.in","r",stdin);
    
    f[0]=1;
    for (n=1; f[n-1]<=P; n++)
        f[n]=f[n-1]+f[n-1];
    
    int T; cin>>T;
    for (int t=1; t<=T; t++)
    {
        bignum p;
        cin>>p;
        cout<<"Case "<<t<<": "<<e(p)<<endl;
        
        if (t<T) cout<<endl;
    }
    
    //while (1);    
    return 0;
}                                 
