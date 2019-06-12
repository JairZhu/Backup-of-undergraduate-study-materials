#include<iostream>
#include<cstdlib>
#include<string>
using namespace std;

class Integer
{
public:
	Integer(){length=1;
	         for(int i=0;i<200;i++)
				 arr[i]=0;
			 sign=true;
	}
	Integer(const int a);
	Integer(const string& s);
	void copy(const Integer& a);
	void set_BigInt(const bool& s,const int& len,const int a[200]);

	Integer& operator=(const Integer& a);
	friend Integer operator-(const Integer& a);

	friend ostream& operator<<(ostream& out,const Integer& a);

	friend Integer operator+(const Integer& a,const Integer& b);
	friend Integer operator-(const Integer& a,const Integer& b);
	friend Integer operator*(const Integer& a,const Integer& b);
	friend Integer operator/(const Integer& a,const Integer& b);
	friend Integer operator%(const Integer& a,const Integer& b);

	void shift(int bit);

	Integer& operator+=(const Integer& a);
	Integer& operator-=(const Integer& a);
	Integer& operator*=(const Integer& a);
	Integer& operator/=(const Integer& a);
	Integer& operator%=(const Integer& a);

	friend bool operator==(const Integer& a,const Integer& b);
	friend bool operator!=(const Integer& a,const Integer& b);
	friend bool operator>(const Integer& a,const Integer& b);
	friend bool operator<(const Integer& a,const Integer& b);
	friend bool operator>=(const Integer& a,const Integer& b);
	friend bool operator<=(const Integer& a,const Integer& b);

	Integer operator++(int n);
	Integer& operator++();
	Integer operator--(int n);
	Integer& operator--();

private:
	int arr[200];
	bool sign;
    int length;
};
void Integer::set_BigInt(const bool& s,const int& len,const int a[200])
{
	int i;
	sign=s;
	length=len;
	for(i=0;i<length;i++)
		arr[i]=a[i];
}

Integer& Integer::operator=(const Integer& a)
{
    if(*this!= a)
		copy(a);
	return *this;

}

void Integer::copy(const Integer& a)
{
	sign=a.sign;
	length=a.length;
	for(int i=0;i<200;i++)
		arr[i]=a.arr[i];
}

Integer operator-(const Integer& a)
{
	Integer res;
	if(a==0)
		return a;
	res.set_BigInt(!a.sign,a.length,a.arr);
	return res;
}


ostream& operator<<(ostream& out,const Integer& a)
{
	int flag=0;
	if(a.sign==false)
		out << "-";

	for(int i=a.length-1;i>=0;i--)
	{
		if(a.arr[i]!=0)
		{
			flag=1;
		}
		if(flag == 1)
		   out << a.arr[i];
	}
	if(flag==0)
		out << a.arr[0];
    return out;
}


Integer::Integer(const int a)
{
	int i,num;
	for(i=0;i<200;i++)
		arr[i]=0;
	if(a==0)
	{
		length=1;
		sign=true;
		return;
	}
	if(a < 0)
	{
		sign = false;
		num = -a;
	}
	else
	{
		sign = true;
		num = a;
	}
	length=0;
	for(i=0;i<200 && num>0;i++)
	{
		this->arr[i]=num%10;
		num/=10;
		length++;
	}

}


Integer::Integer(const string& s)
{
	int i,j;
	if(s[0] != '-')
	{
		length = s.length();
		sign = true;
		for(i=length-1;i>=0;i--)
			arr[i]=(int)s[length-i-1]-48;
		for(i=0;i<200;i++)
		{
			if(s[i]!='0')
				break;
			else
				length--;
		}
		if(length==0)
		{
			length=1;
		}
		for(j=length;j<200;j++)
			arr[j]=0;
	}
	else
	{
		length = s.length() - 1;
		sign = false;
		for(i =0 ;i<length;i++)
			arr[i] =(int)s[length-i]-48;
		for(i=1;i<200;i++)
		{
			if(s[i]!='0')
				break;
			else
				length--;
		}
		if(length==0)
		{
			length=1;
		}
		for(j=length;j<200;j++)
			arr[j]=0;
    }

}


bool operator==(const Integer& a,const Integer& b)
{
    if(!(a>b)&&!(a<b))
		return true;
	else
		return false;
}

bool operator!=(const Integer& a,const Integer& b)
{
	return !(a==b);
}

bool operator>(const Integer& a,const Integer& b)
{
     int i;
	 if(a.sign==true&&b.sign==false)
		 return true;
	 else if(a.sign==false&&b.sign==true)
		 return false;
	 else if(a.sign==true&&b.sign==true)
	 {
		 for(i=199;i>=0;i--)
		 {
			 if(a.arr[i]>b.arr[i])
				 return true;
			 else if(a.arr[i]<b.arr[i])
				 return false;
		 }
	 } 
	 else if(a.sign==false&&b.sign==false)
	 {
		 for(i=199;i>=0;i--)
		 {
			 if(a.arr[i]>b.arr[i])
				 return false;
			 else if(a.arr[i]<b.arr[i])
				 return true;
		 }
	 } 
	 return false;
}

bool operator<(const Integer& a,const Integer& b)
{
     int i;
	 if(a.sign==true&&b.sign==false)
		 return false;
	 else if(a.sign==false&&b.sign==true)
		 return true;
	 else if(a.sign==true&&b.sign==true)
	 {
		 for(i=199;i>=0;i--)
		 {
			 if(a.arr[i]>b.arr[i])
				 return false;
			 else if(a.arr[i]<b.arr[i])
				 return true;
		 }
	 } 
	 else if(a.sign==false&&b.sign==false)
	 {
		 for(i=199;i>=0;i--)
		 {
			 if(a.arr[i]>b.arr[i])
				 return true;
			 else if(a.arr[i]<b.arr[i])
				 return false;
		 }
	 }
	 return false;
}

bool operator>=(const Integer& a,const Integer& b)
{
	bool flag = !(a<b);
	return flag;
}

bool operator<=(const Integer& a,const Integer& b)
{
	bool flag=!(a>b);
	return flag;
}


Integer operator+(const Integer& a,const Integer& b)
{
	if(a==0)
		return b;
	if(b==0)
		return a;
	Integer res;
	int arr[200],i;
	for(i=0;i<200;i++)
		arr[i]=0;
	bool sign;
	if(a.sign == b.sign)
	{
		int len,k,x=0;
	    k=(a.length>b.length)?a.length:b.length;  
		len = k;
		for(i = 0;i < k;i++)
		{
			x+=a.arr[i]+b.arr[i];
			arr[i]=x%10;
			x/=10;
		}
		if(x!=0)
		   arr[len++]=x;	
		sign=a.sign;
		res.set_BigInt(sign,len,arr);				
	}
	else
		res=a-(-b);

	return res;
}

Integer& Integer::operator+=(const Integer& a)
{
	return (*this)=(*this)+a;
}

Integer operator-(const Integer& a,const Integer& b)
{
    Integer res;
	if(a == b)
		return Integer(0);
	if(b==0)
		return a;
	if(a==0)
		return -b;
	if(a.sign==b.sign)
	{
	     bool sign;
	     int arr[200],len,i;
		 for(i=0;i<200;i++)
			 arr[i]=0;
	     const Integer *max,*min;
		 Integer x,y;
		 x.set_BigInt(true,a.length,a.arr);
		 y.set_BigInt(true,b.length,b.arr);
		 if(x>y){
			 max=&a;
			 min=&b;
			 sign=a.sign;
		 }
		 else{
			 max=&b;
			 min=&a;
			 sign=!a.sign;
		 }
		 len=max->length;
		 for(i=0;i<len;i++)
		 {
			 arr[i]+=max->arr[i] - min->arr[i];
			 if(arr[i] < 0)
			 {
				 arr[i]+=10;
				 --arr[i+1];
				 
			 }
		  }
		 while(len>1,!arr[len-1])
			 --len;
		 res.set_BigInt(sign,len,arr);
	}
	else
		res=a+(-b);
	return res;
}

Integer& Integer::operator-=(const Integer& a)
{
	return (*this)=(*this)-a;
}

Integer operator*(const Integer& a,const Integer& b)
{
	if(a==0||b==0)
		return Integer(0);
	Integer res;
	bool sign;
	int arr[200];
	int len=a.length+b.length,i,j;
	for(i=0;i<200;i++)
		arr[i]=0;
	for(i=0;i<a.length;i++)
	{
		for(j=0;j<b.length;j++)
			arr[i+j]+=a.arr[i]*b.arr[j];
	}
	for(i=0;i<len-1;i++)
	{
		arr[i+1]+=arr[i]/10;
		arr[i]%=10;
	}
    while(len>=1,!arr[len-1])
		 --len;
	sign=(a.sign==b.sign)?true:false;
	res.set_BigInt(sign,len,arr);
	return res;
}
Integer& Integer::operator*=(const Integer& a)
{
	return (*this)=(*this)*a;
}

void Integer::shift(int bit)
{
	if(bit >= 0)
	{
		for(int i=length+bit-1;i>=0;i--)
			arr[i]=(i>=bit)?arr[i-bit]:0;
	}
	else
	{
		for(int i=0;i<length;i++)
			arr[i]=((i-bit)<length)?arr[i-bit]:0;
	}
	length+=bit;
}


Integer operator/(const Integer& a,const Integer& b)
{
	Integer x,y,res;
	int i;
	if(b==0||a==0)
		return Integer(0);
	bool flag=true;
	x.set_BigInt(flag,a.length,a.arr);
	y.set_BigInt(flag,b.length,b.arr);
	if(y>x)
		return Integer(0);
	int m=a.length-b.length,len=1,arr[200];
	for(i=0;i<200;i++)
		arr[i]=0;
	y.shift(m);
	while(m>=0)
	{
		if(x>=y)
		{
			x-=y;
			arr[m]++;
		}
		else
		{
			m--;
			len++;
			y.shift(-1);
		}
	}
	while(len>1,!(arr[len-1]))
		 --len;
	res.set_BigInt(true,len,arr);
	return res;
}

Integer& Integer::operator/=(const Integer& a)
{
	return *this=*this/a;
}

Integer operator%(const Integer& a,const Integer& b)
{
	Integer res;
	res=a-b*(a/b);
	return res;
}

Integer& Integer::operator%=(const Integer& a)
{
	return (*this)=(*this)%a;
}

Integer& Integer::operator++()
{
	return *this+=1;
}

Integer Integer::operator++(int n)
{
	Integer temp=*this;
	*this+=1;
	return temp;
}

Integer& Integer::operator--()
{
    return *this-=1;
}

Integer Integer::operator--(int n)
{
	Integer temp=*this;
	*this-=1;
	return temp;
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
        cout << (i1+67854) << endl;
        cout << (12432+i2) << endl;
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






	




		   












    


	