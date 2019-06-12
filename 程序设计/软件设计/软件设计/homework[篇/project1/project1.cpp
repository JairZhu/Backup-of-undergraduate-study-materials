#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

class Integer{
public:
	Integer();
	Integer(const int a);
	Integer(const string& s);
	
	void setInt(const int& length, const bool& a, const int b[200]);
	void chg(int a);
	
	Integer& operator=(const Integer&);
	
	friend bool operator ==(const Integer&, const Integer&);
	friend bool operator > (const Integer&, const Integer&);
	friend bool operator < (const Integer&, const Integer&);
	friend bool operator !=(const Integer&, const Integer&);
	friend bool operator >=(const Integer&, const Integer&);
	friend bool operator <=(const Integer&, const Integer&);
	
	friend Integer operator +(const Integer&, const Integer&);
	friend Integer operator -(const Integer&, const Integer&);
	friend Integer operator *(const Integer&, const Integer&);
	friend Integer operator /(const Integer&, const Integer&);
	friend Integer operator %(const Integer&, const Integer&);
	
	friend Integer operator -(const Integer& a) ;
	
	Integer& operator +=(const Integer&);
	Integer& operator -=(const Integer&);
	Integer& operator *=(const Integer&);
	Integer& operator /=(const Integer&);
	Integer& operator %=(const Integer&);
	
	Integer& operator ++();
	Integer  operator ++(int);
	Integer& operator --();
	Integer  operator --(int);
	
	friend ostream& operator <<(ostream& out, const Integer&);
	
private:
	int arr[200];
	bool sign;
	int len;
	
};

Integer::Integer(){
	len = 1;
	sign = true;
	for(int i = 0;i < 200;i++)
		arr[i] = 0;
    }
Integer::Integer(const int a){
	int i, intrg;
	for (i = 0;i < 200;i++)
		arr[i] = 0;
	if(a == 0){
		len = 1;
		sign = true;
		return;
	}
	if (a > 0){
		sign = true;
		intrg = a;
	}
	else {
		sign = false;
		intrg = -a;
	}
	len = 0;
	for (i = 0;i < 200 && intrg > 0;i++){
		this->arr[i] = intrg % 10;
		intrg /= 10;
		len++;
	}
}

Integer::Integer(const string& s){
	int i,j;
	if(s[0] == '-'){
		sign = false;
		len = s.length() - 1;
		for (i = 0;i < len;i++)
			arr[i] = (int)s[len - i] - 48;
	
		for(i = 1;i < 200;i++){
			if (s[i] != '0')
				break;
			else
				len--;
		}
		if(len == 0)
			len++;
		for (j = len;j < 200;j++)
			arr[j] = 0;
	}
	else {
		sign = true;
		len = s.length();
		for(i = len - 1;i >= 0;i--)
			arr[i] = (int)s[len - i - 1] - 48;
		
		for (i = 0;i < 200;i++) {
			if (s[i] != '0')
				break;
			else
				len--;
		}
		if(len == 0)
			len++;
		for (j = len;j < 200;j++)
			arr[j] = 0;	
	}
}
ostream& operator<<(ostream& out,const Integer& a)
{
	int sign = 0;
	if(a.sign == false)
		out << "-";

	for(int i = a.len - 1;i >= 0;i--) {
		if(a.arr[i]!=0)
			sign = 1;
		if(sign == 1)
		   out << a.arr[i];
	}
	if(sign == 0)
		out << a.arr[0];
    return out;
}

void Integer::setInt(const int& length, const bool& a, const int b[200]){
	int i;
	len = length;
	sign = a;
	for (i = 0;i < len;i++)
		arr[i] = b[i];
}

void Integer::chg(int a) {
	if(a >= 0) {
		for(int i = len + a - 1;i >= 0;i--)
			arr[i] = (i >= a)?arr[i - a]:0;
	}
	else {
		for(int i = 0;i < len;i++)
			arr[i] = ((i - a) < len)?arr[i - a]:0;
	}
	len += a;
}
Integer operator-(const Integer& a)
{
	Integer ans;
	if(a == 0)
		return a;
	ans.setInt(a.len,!a.sign,a.arr);
	return ans;
}
Integer& Integer::operator=(const Integer& a){
	int i;
	if (*this != a) {
		len = a.len;
		sign = a.sign;
		for (i = 0;i < 200;i++)
			arr[i] = a.arr[i];
	}
	return *this;
}

bool operator ==(const Integer& a, const Integer& b) {
	return (!(a > b) && !(a < b));
}

bool operator !=(const Integer& a, const Integer& b) {
	return (!(a == b));
}

bool operator >(const Integer& a, const Integer& b) {
	int i;
	if (a.sign == true && b.sign == false)
		return true;
	else if (a.sign == false && b.sign == true)
		return false;
	else if (a.sign == true && b.sign == true) {
		 for(i = 199;i >= 0;i--) {
			if(a.arr[i] > b.arr[i])
				 return true;
			else if(a.arr[i] < b.arr[i])
				 return false;
		 }
	}
	else if (a.sign == false && b.sign == false) {
		for(i = 199;i >= 0;i--)
		 {
			 if(a.arr[i] > b.arr[i])
				return false;
			 else if(a.arr[i] < b.arr[i])
				return true;
		 }
	}
	return false;
}

bool operator <(const Integer& a, const Integer& b) {
	int i;
	if (a.sign == true && b.sign == false)
		return false;
	else if (a.sign == false && b.sign == true)
		return true;
	else if (a.sign == true && b.sign == true) {
		for(i = 199;i >= 0;i--) {
			if(a.arr[i] > b.arr[i])
				return false;
			else if(a.arr[i] < b.arr[i])
				return true;
		 }
	}
	else if (a.sign == false && b.sign == false) {
		for(i = 199;i >= 0;i--) {
			if(a.arr[i] > b.arr[i])
				return true;
			else if(a.arr[i] < b.arr[i])
				return false;
		 }
	}
	return false;
}

bool operator >=(const Integer& a, const Integer& b) {
	return (!(a < b));
}

bool operator <=(const Integer& a, const Integer& b) {
	return (!(a > b));
}

Integer operator +(const Integer& a, const Integer& b) {
	if (a == 0)
		return b;
	if (b == 0)
		return a;
	Integer ans;
	int arr[200], i;
	bool sign;
	for (i = 0;i < 200;i++)
		arr[i] = 0;
	if (a.sign == b.sign) {
		int length,lentmp,anstmp;
		anstmp = 0;
		if (a.len > b.len)
			lentmp = a.len;
		else 
			lentmp = b.len;
		length = lentmp;
		for(i = 0;i < lentmp;i++) {
			anstmp += a.arr[i] + b.arr[i];
			arr[i] = anstmp % 10;
			anstmp /= 10;
		}
		if(anstmp != 0)
		   arr[length++] = anstmp;	
		sign=a.sign;
		ans.setInt(length,sign,arr);				
	}
	else
		ans = a - (-b);
	return ans;
}

Integer& Integer::operator +=(const Integer& a) {
	return (*this) = (*this) + a;
}

Integer operator -(const Integer& a, const Integer& b) {
	if (a == b)
		return Integer(0);
	if (a == 0)
		return -b;
	if (b == 0)
		return a;
	Integer ans;
	if (a.sign == b.sign) {
		Integer m, n;
		const Integer *bignum, *smanum;
		int arr[200], i, length;
		bool sign;
		for (i = 0;i < 200;i++)
			arr[i] = 0;
		m.setInt(a.len,true,a.arr);
		n.setInt(b.len,true,b.arr);
		if (m > n){
			bignum = &a;
			smanum = &b;
			sign = a.sign;
		}
		else {
			bignum = &b;
			smanum = &a;
			sign = !a.sign;
		}
		length = bignum->len;
		for(i = 0;i < length;i++) {
			arr[i] += bignum->arr[i] - smanum->arr[i];
			if(arr[i] < 0) {
				 arr[i] += 10;
				 --arr[i + 1];
			}
		}
		 while(length > 1,!arr[length - 1])
			 --length;
		 ans.setInt(length,sign,arr);
	}
	else
		ans = a + (-b);
	return ans;
}

Integer& Integer::operator -=(const Integer& a) {
	return (*this) = (*this) - a;
}

Integer operator *(const Integer& a, const Integer& b) {
	if (a == 0 ||b == 0)
		return Integer(0);
	Integer ans;
	bool sign;
	int arr[200],length, i, j;
	length = a.len + b.len;
	for (i = 0;i < 200;i++)
		arr[i] = 0;
	for(i = 0;i < a.len;i++) {
		for(j = 0;j < b.len;j++)
			arr[i + j] += a.arr[i] * b.arr[j];
	}
	for (i = 0;i < length - 1;i++){
		arr[i + 1] += arr[i] / 10;
		arr[i] = arr[i] % 10;
	}
	while(length >= 1,!arr[length - 1])
		 --length;
	sign = (a.sign == b.sign)?true:false;
	ans.setInt(length,sign,arr);
	return ans;
}

Integer&Integer:: operator *=(const Integer& a) {
	return (*this) = (*this) * a;
}

Integer operator /(const Integer& a, const Integer& b) {
	if (a ==0 ||b == 0)
		return Integer(0);
	Integer m,n,ans;
	int i,sign = true;
	m.setInt(a.len,sign,a.arr);
	n.setInt(b.len,sign,b.arr);
	if(n > m)
		return Integer(0);
	int lentmp = a.len - b.len ,length, arr[200];
	length = 1;
	for(i = 0;i < 200;i++)
		arr[i]=0;
	n.chg(lentmp);
	while(lentmp >= 0) {
		if(m >= n) {
			m -= n;
			arr[lentmp]++;
		}
		else{
			lentmp--;
			length++;
			n.chg(-1);
		}
	}
	while(length > 1,!(arr[length - 1]))
		 --length;
	ans.setInt(length,true,arr);
	return ans;
}

Integer& Integer::operator /=(const Integer& a) {
	return (*this) = (*this) / a;
}

Integer operator %(const Integer& a,const Integer& b) {
	return (a - b * (a / b));
}

Integer& Integer::operator%=(const Integer& a) {
	return (*this) = (*this) % a;
}

Integer& Integer::operator++()
{
	return *this += 1;
}

Integer Integer::operator++(int n)
{
	Integer tmp =* this;
	*this+=1;
	return tmp;
}

Integer& Integer::operator--()
{
    return *this-=1;
}

Integer Integer::operator--(int n)
{
	Integer tmp=*this;
	*this-=1;
	return tmp;
}


int main(int argc, const char *argv[])
{
    int cases = 1;
    cin >> cases;
 
    string s1, s2;
    while (cases--)
    {
        cin >> s1 >> s2;
        Integer i1(s1);
        Integer i2(s2);
 
        // 测试构造函数 {
        cout << i1 << endl;
        cout << i2 << endl;
        // }
 
        // 测试关系操作符 {
        cout << i1 << " == " << i2 << " = " << (i1 == i2) << endl;
        cout << i1 << " != " << i2 << " = " << (i1 != i2) << endl;
        cout << i1 << " <  " << i2 << " = " << (i1 <  i2) << endl;
        cout << i1 << " <= " << i2 << " = " << (i1 <= i2) << endl;
        cout << i1 << " >  " << i2 << " = " << (i1 >  i2) << endl;
        cout << i1 << " >= " << i2 << " = " << (i1 >= i2) << endl;
        // }
 
        // 测试算术运算符 {
        cout << i1 << " + " << i2 << " = " << (i1 + i2) << endl;
        cout << i1 << " - " << i2 << " = " << (i1 - i2) << endl;
        cout << i1 << " * " << i2 << " = " << (i1 * i2) << endl;
        if (i1 >= 0 && i2 >= 0)
        {
            cout << i1 << " / " << i2 << " = " << (i1 / i2) << endl;
            cout << i1 << " % " << i2 << " = " << (i1 % i2) << endl;
        }
        // }
 
        // 测试负号 {
        cout << "-" << i1 << " = " << (-i1) << endl;
        // }
 
        // 测试赋值操作符 {
        Integer tmp = i1;
        i1 += i2;
        cout << tmp << " += " << i2 << " : " << i1 << endl;
        i1 = tmp;
 
        tmp = i1;
        i1 -= i2;
        cout << tmp << " -= " << i2 << " : " << i1 << endl;
        i1 = tmp;
 
        tmp = i1;
        i1 *= i2;
        cout << tmp << " *= " << i2 << " : " << i1 << endl;
        i1 = tmp;
 
        if (i1 >= 0 && i2 >= 0)
        {
            tmp = i1;
            i1 /= i2;
            cout << tmp << " /= " << i2 << " : " << i1 << endl;
            i1 = tmp;
 
            tmp = i1;
            i1 %= i2;
            cout << tmp << " %= " << i2 << " : " << i1 << endl;
            i1 = tmp;
        }
        // }
 
        // 测试自增/自减 {
        tmp = i1;
        cout << i1 << "++" << endl;
        i2 = i1++;
        cout << i1 << endl;
        cout << i2 << endl;
        i1 = tmp;
 
        tmp = i1;
        cout << "++" << i1 << endl;
        i2 = ++i1;
        cout << i1 << endl;
        cout << i2 << endl;
        i1 = tmp;
 
        tmp = i1;
        cout << i1 << "--" << endl;
        i2 = i1--;
        cout << i1 << endl;
        cout << i2 << endl;
        i1 = tmp;
 
        tmp = i1;
        cout << "--" << i1 << endl;
        i2 = (--i1);
        cout << i1 << endl;
        cout << i2 << endl;
 
        // }
    }
 
    //测试混合类型表达式 {
    Integer i1(1111111);
    cout << (i1  + 123) << endl;
    cout << (123 + i1)  << endl;
    //}
 
    return 0;
}