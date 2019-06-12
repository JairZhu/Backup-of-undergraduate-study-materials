#include<string>
#include<iostream>
#include<sstream>
#include<fstream>
using namespace std;
class Integer{
	friend ostream& operator<<(ostream& out,const Integer&);
public:
	Integer();
	Integer(const int&);
	Integer(const string&);
	Integer(const Integer&);

	Integer operator+(const Integer&);
	Integer operator-(const Integer&);
	Integer operator*(const Integer&);
	Integer operator/(const Integer&);
	Integer operator%(const Integer&);

	Integer& operator+=(const Integer&);
	Integer& operator-=(const Integer&);
	Integer& operator*=(const Integer&);
	Integer& operator/=(const Integer&);
	Integer& operator%=(const Integer&);

	Integer& operator++();
	Integer& operator--();
	Integer operator++(int);
	Integer operator--(int);

	bool operator==(const Integer&);
	bool operator!=(const Integer&);
	bool operator>(const Integer&);
	bool operator<(const Integer&);
	bool operator>=(const Integer&);
	bool operator<=(const Integer&);

	Integer operator-();
private:
	int toInt(const char&);
	Integer Abs(const Integer&);
	int compare(const Integer&);

	int sign,len,data[3000];
};

int Integer::toInt(const char& x){
	return x-'0';
}
Integer Integer::Abs(const Integer& x){
	Integer y(x);
	y.sign = 0;
	return y;
}
int Integer::compare(const Integer& x){
	if(len > x.len) return  1;
	if(len < x.len) return -1;
	int i = len - 1;
	while(i>0&&data[i] == x.data[i])i--;
	return data[i]-x.data[i];
}

ostream& operator<<(ostream& out,const Integer& x){
	if (x.sign&&x.data[x.len-1]) out<<'-';
	for(int i = x.len - 1;i >= 0;i--) out<<x.data[i];
	return out;
}

Integer::Integer(){
	sign = 0;
	len = 1;
	data[0] = 0;
}
Integer::Integer(const int& x){
	stringstream sin;
	sin<<x;
	string s = sin.str();
	len = s.size();
	for(int i = 0;i < len - 1;i++) data[i] = toInt(s[len-i-1]);
	if(s[0]=='-'){
		sign = 1;
		len--;
	}
	else{
		sign = 0;
		data[len-1] = toInt(s[0]);
	}
	while(len>0&&data[len-1]==0)
		len--;
	if(len==0){
		len = 1;
		sign = 0;
	}
}
Integer::Integer(const string& s){
	len = s.size();
	for(int i = 0;i < len - 1;i++) data[i] = toInt(s[len-i-1]);
	if(s[0]=='-'){
		sign = 1;
		len--;
	}
	else{
		sign = 0;
		data[len-1] = toInt(s[0]);
	}
	while(len>0&&data[len-1]==0)
		len--;
	if(len==0){
		len = 1;
		sign = 0;
	}
}
Integer::Integer(const Integer& x){
	sign = x.sign;
	len = x.len;
	for(int i = 0;i < len;i++) data[i] = x.data[i];
}

Integer Integer::operator+(const Integer& x){
	Integer a(Abs(*this));
	Integer b(Abs(x));
	if(sign==x.sign){
		Integer c;
		int i;
		c.sign = sign;
		c.len = 0;
		for(i = 0;i < a.len||i < b.len||c.data[i];i++){
			if(i < a.len) c.data[i] += a.data[i];
			if(i < b.len) c.data[i] += b.data[i];
			c.data[i+1] = c.data[i]/10;
			c.data[i] %= 10;
		}
		c.len = i;
		if(!c.len) c.len = 1;
		return c;
	}
	else{
		if(a>b){
			Integer c(a-b);
			c.sign = sign;
			return c;
		}
		else{
			Integer c(b-a);
			c.sign = x.sign;
			return c;
		}
	}
}
Integer Integer::operator-(const Integer& x){
	Integer a(Abs(*this));
	Integer b(Abs(x));
	int i,j;
	if(*this==x){
		Integer c;
		return c;
	}
	if(sign==x.sign){
		if(a>b){
			Integer c;
			c.sign = sign;
			for(i = 0,j = 0;i < a.len;i++){
				c.data[i] = a.data[i] - j;
				if(i < b.len) c.data[i] -= b.data[i];
				if(c.data[i] < 0){
					j = 1;
					c.data[i] += 10;
				}
				else
					j = 0;
			}
			c.len = a.len;
			while(c.len>0&&!c.data[c.len - 1]) c.len--;
			if(!c.len){
				c.len = 1;
				c.data[0] = 0;
			}
			return c;
		}
		if(a<b){
			Integer c(b-a);
			if(sign)
				c.sign = 0;
			else
				c.sign = 1;
			return c;
		}
	}
	Integer c(a+b);
	c.sign = sign;
	return c;
}
Integer Integer::operator*(const Integer& x){
	Integer a(Abs(*this));
	Integer b(Abs(x));
	Integer c;
	int i,j;
	c.len = a.len + b.len;
	if(sign!=x.sign)
		c.sign = 1;
	else
		c.sign = 0;
	for(i = 0;i < c.len;i++) c.data[i] = 0;
	for(i = 0;i < a.len;i++) for(j = 0;j < b.len;j++)
		c.data[i+j] += a.data[i] * b.data[j];
	for(i = 0;i < c.len - 1;i++){
		c.data[i+1] += c.data[i] / 10;
		c.data[i] %= 10;
	}
	i = c.len - 1;
	while(c.data[i]==0&&i!=0){
		c.len--;
		i--;
	}
	return c;
}
Integer Integer::operator/(const Integer& x)
{
	Integer a(Abs(*this));
	Integer b(Abs(x));
	
	Integer c,d;
	int i,j;
	
	if(b.len == 1 && !b.data[0])
		return c;
	for(i = a.len - 1;i >= 0;i--)
    {
		if(!(d.len == 1 && d.data[0] == 0))
        {
			for(j = d.len;j > 0;j--)
                d.data[j] = d.data[j - 1];
                
			d.len++;
		}
		
		d.data[0] = a.data[i];
		c.data[i] = 0;
		
		while((j = d.compare(b)) >= 0)
        {
			d = d - b;
			c.data[i]++;
			
			if(!j)
                break;
		}
	}
	
	c.len = a.len;
	i = c.len - 1;
	
	while(!c.data[i] && i)
    {
		c.len--;
		i--;
	}
	
	return c;
}
Integer Integer::operator%(const Integer& x){
	Integer a(Abs(*this));
	Integer b(Abs(x));
	Integer d;
	int i,j;
	if(b.len==1&&!b.data[0]){
		return a;
	}
	for(i = a.len - 1;i >= 0;i--){
		if(!(d.len==1&&d.data[0]==0)){
			for(j = d.len;j > 0;j--) d.data[j] = d.data[j-1];
			d.len++;
		}
		d.data[0] = a.data[i];
		while((j = d.compare(b))>=0){
			d = d - b;
			if(!j) break;
		}
	}
	if(d.len == 0){
		d.len = 1;
		d.data[0] = 0;
	}
	return d;
}

Integer& Integer::operator+=(const Integer& x){
	*this = *this + x;
	return *this;
}
Integer& Integer::operator-=(const Integer& x){
	*this = *this - x;
	return *this;
}
Integer& Integer::operator*=(const Integer& x){
	*this = *this * x;
	return *this;
}
Integer& Integer::operator/=(const Integer& x){
	*this = *this / x;
	return *this;
}
Integer& Integer::operator%=(const Integer& x){
	*this = *this % x;
	return *this;
}

Integer& Integer::operator++(){
	Integer x(1);
	(*this) += x;
	return *this;
}
Integer& Integer::operator--(){
	Integer x(1);
	(*this) -= x;
	return *this;
}
Integer Integer::operator++(int){
	Integer x(*this);
	Integer y(1);
	(*this) += y;
	return x;
}
Integer Integer::operator--(int){
	Integer x(*this);
	Integer y(1);
	(*this) -= y;
	return x;
}

bool Integer::operator==(const Integer& x){
	if(sign!=x.sign) return false;
	if(len!=x.len) return false;
	for(int i = 0;i < len;i++) if(data[i]!=x.data[i])
		return false;
	return true;
}
bool Integer::operator!=(const Integer& x){
	return !(*this==x);
}
bool Integer::operator> (const Integer& x){
	if(sign==0&&x.sign==1)
		return true;
	if(sign==1&&x.sign==0)
		return false;
	if(sign==x.sign&&sign==1)
		return Abs(*this)<Abs(x);
	if(len>x.len)
		return true;
	if(len<x.len)
		return false;
	if(len==x.len){
		for(int i = len - 1;i >= 0;i--){
			if(data[i]>x.data[i])
				return true;
			if(data[i]<x.data[i])
				return false;
		}
	}
	return false;
}
bool Integer::operator< (const Integer& x){
	if(sign==0&&x.sign==1)
		return false;
	if(sign==1&&x.sign==0)
		return true;
	if(sign==x.sign&&sign==1)
		return Abs(*this)>Abs(x);
	if(len<x.len)
		return true;
	if(len>x.len)
		return false;
	if(len==x.len){
		for(int i = len - 1;i >= 0;i--){
			if(data[i]<x.data[i])
				return true;
			if(data[i]>x.data[i])
				return false;
		}
	}
	return false;
}
bool Integer::operator>=(const Integer& x){
	return (*this>x||*this==x);
}
bool Integer::operator<=(const Integer& x){
	return (*this<x||*this==x);
}

Integer Integer::operator-() {
	Integer y(*this);
	if(sign==0)
		y.sign = 1;
	else
		y.sign = 0;
	return y;
}

Integer operator+(int x,Integer a){
	Integer b(x);
	return a+b;
}
Integer operator+(Integer a,int x){
	Integer b(x);
	return a+b;
}
Integer operator-(int x,Integer b){
	Integer a(x);
	return a-b;
}
Integer operator-(Integer a,int x){
	Integer b(x);
	return a-b;
}
Integer operator*(int x,Integer a){
	Integer b(x);
	return a*b;
}
Integer operator*(Integer a,int x){
	Integer b(x);
	return a*b;
}
Integer operator/(int x,Integer b){
	Integer a(x);
	return a/b;
}
Integer operator/(Integer a,int x){
	Integer b(x);
	return a/b;
}
Integer operator%(int x,Integer b){
	Integer a(x);
	return a%b;
}
Integer operator%(Integer a,int x){
	Integer b(x);
	return a%b;
}
 
Integer operator+=(int x,Integer a){
	Integer b(x);
	return a+b;
}
Integer operator+=(Integer a,int x){
	Integer b(x);
	return a+b;
}
Integer operator-=(int x,Integer b){
	Integer a(x);
	return a-b;
}
Integer operator-=(Integer a,int x){
	Integer b(x);
	return a-b;
}
Integer operator*=(int x,Integer a){
	Integer b(x);
	return a*b;
}
Integer operator*=(Integer a,int x){
	Integer b(x);
	return a*b;
}
Integer operator/=(int x,Integer b){
	Integer a(x);
	return a/b;
}
Integer operator/=(Integer a,int x){
	Integer b(x);
	return a/b;
}
Integer operator%=(int x,Integer b){
	Integer a(x);
	return a%b;
}
Integer operator%=(Integer a,int x){
	Integer b(x);
	return a%b;
}

bool operator==(int x,Integer b){
	Integer a(x);
	return a==b;
}
bool operator==(Integer a,int x){
	Integer b(x);
	return a==b;
}
bool operator!=(int x,Integer b){
	Integer a(x);
	return a!=b;
}
bool operator!=(Integer a,int x){
	Integer b(x);
	return a!=b;
}
bool operator>=(int x,Integer b){
	Integer a(x);
	return a>=b;
}
bool operator>=(Integer a,int x){
	Integer b(x);
	return a>=b;
}
bool operator<=(int x,Integer b){
	Integer a(x);
	return a<=b;
}
bool operator<=(Integer a,int x){
	Integer b(x);
	return a<=b;
}
bool operator<(int x,Integer b){
	Integer a(x);
	return a<b;
}
bool operator<(Integer a,int x){
	Integer b(x);
	return a<b;
}
bool operator>(int x,Integer b){
	Integer a(x);
	return a>b;
}
bool operator>(Integer a,int x){
	Integer b(x);
	return a>b;
}

int main(int argc, const char *argv[])
 
{
    ifstream infile;
    infile.open("in.txt",fstream::in);
 	ofstream outfile;
 	outfile.open("out.txt",fstream::out);
    int cases = 1;
 
    infile >> cases;
 
 
 
    string s1, s2;
 
    while (cases--)
 
    {
 
        infile >> s1 >> s2;
 
        Integer i1(s1);
 
        Integer i2(s2);
 
 
 
        // ?????? {
 
        outfile << i1 << endl;
 
        outfile << i2 << endl;
 
        // }
 
 
 
        // ??????? {
 
        outfile << i1 << " == " << i2 << " = " << (i1 == i2) << endl;
 
        outfile << i1 << " != " << i2 << " = " << (i1 != i2) << endl;
 
        outfile << i1 << " <  " << i2 << " = " << (i1 <  i2) << endl;
 
        outfile << i1 << " <= " << i2 << " = " << (i1 <= i2) << endl;
 
        outfile << i1 << " >  " << i2 << " = " << (i1 >  i2) << endl;
 
        outfile << i1 << " >= " << i2 << " = " << (i1 >= i2) << endl;
 
        // }
 
 
 
        // ??????? {
 
        outfile << i1 << " + " << i2 << " = " << (i1 + i2) << endl;
 
        outfile << i1 << " - " << i2 << " = " << (i1 - i2) << endl;
 
        outfile << i1 << " * " << i2 << " = " << (i1 * i2) << endl;
 
        if (i1 >= 0 && i2 >= 0)
 
        {
 
            outfile << i1 << " / " << i2 << " = " << (i1 / i2) << endl;
 
            outfile << i1 << " % " << i2 << " = " << (i1 % i2) << endl;
 
        }
 
        // }
 
 
 
        // ???? {
 
       outfile << "-" << i1 << " = " << (-i1) << endl;
 
        // }
 
 
 
        // ??????? {
 
        Integer tmp = i1;
 
        i1 += i2;
 
        outfile << tmp << " += " << i2 << " : " << i1 << endl;
 
        i1 = tmp;
 
 
 
        tmp = i1;
 
        i1 -= i2;
 
        outfile << tmp << " -= " << i2 << " : " << i1 << endl;
 
        i1 = tmp;
 
 
 
        tmp = i1;
 
        i1 *= i2;
 
        outfile << tmp << " *= " << i2 << " : " << i1 << endl;
 
        i1 = tmp;
 
 
 
        if (i1 >= 0 && i2 >= 0)
 
        {
 
            tmp = i1;
 
            i1 /= i2;
 
            outfile << tmp << " /= " << i2 << " : " << i1 << endl;
 
            i1 = tmp;
 
 
 
            tmp = i1;
 
            i1 %= i2;
 
            outfile << tmp << " %= " << i2 << " : " << i1 << endl;
 
            i1 = tmp;
 
        }
 
        // }
 
 
 
        // ????/?? {
 
        tmp = i1;
 
        outfile << i1 << "++" << endl;
 
        i2 = i1++;
 
        outfile << i1 << endl;
 
        outfile << i2 << endl;
 
        i1 = tmp;
 
 
 
        tmp = i1;
 
        outfile << "++" << i1 << endl;
 
        i2 = ++i1;
 
        outfile << i1 << endl;
 
        outfile << i2 << endl;
 
        i1 = tmp;
 
 
 
        tmp = i1;
 
        outfile << i1 << "--" << endl;
 
        i2 = i1--;
 
        outfile << i1 << endl;
 
        outfile << i2 << endl;
 
        i1 = tmp;
 
 
 
        tmp = i1;
 
        outfile << "--" << i1 << endl;
 
        i2 = --i1;
 
        outfile << i1 << endl;
 
       outfile << i2 << endl;
 
        // }
 
    }
 
 
 
    //????????? {
 
    Integer i1(1111111);
 
    outfile << (i1  + 123) << endl;
 
    outfile << (123 + i1)  << endl;
 
    //}
 
 
    outfile.close();
    infile.close();
    return 0;
 
}
