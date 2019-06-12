/* 定义一个大整数加法类*/

#include<list>
#include<string>
#include<iomanip>

using namespace std;

class BigIntAdd
{
 public:
	 friend istream & operator>>(istream & in,BigIntAdd & number);
	 friend ostream & operator<<(ostream & out,const BigIntAdd & number);
	 friend BigIntAdd operator+(BigIntAdd & addend1,BigIntAdd & addend2);
 private:
	 //声明一个表对象,用来存储整数
	 list<short int> myInt;
};

//整数输入函数
istream & operator>>(istream & in,BigIntAdd & number)
{
	string str;    
	in>>str;      //用字符串存储整数
	size_t len=str.length();
	size_t q,r,first;

    //if对应于构造符号结点和其位数小于三的结点
    if(isdigit(str[0]))   //对应无符号数
	{   
        //建立无符号数的符号结点，无符号数作为正数处理
		number.myInt.push_back(1);
		//分组，若r==0,则确定了q个组，也即q个结点
		//若r!=0，则确定了q+1个结点
		q=len/3;    
		r=len%3;    
		first=r;
		if(r!=0)
		{
			int nodeValue(0);
			size_t i=0;
			for(;i<=r-1;i++)
				nodeValue=10*nodeValue+(str[i]-'0');
              //注意此处的表达式对应r!=0的那个结点值
			number.myInt.push_back(nodeValue);
		}

	}
	else    //对应有符号数
	{
		//建立有符号数符号结点
		if(str[0]=='-')
			number.myInt.push_back(-1);
		else 
			number.myInt.push_back(1);
        //此处有符号数需从第二元素开始处理
		q=(len-1)/3;
		r=(len-1)%3;
		first=r+1;
		if(r!=0)
		{   
            int nodeValue(0);
			size_t i=1;
			for(;i<=r;i++)
				nodeValue=10*nodeValue+(str[i]-'0');
			number.myInt.push_back(nodeValue);
		}
	}

    //for循环对应于含完整的位数的结点
	for(size_t j=0;j<q;j++)
	{
		int nodeValue(0);  
        //每次有三位，即一个结点的递增量
		size_t index=first+3*j;  
		for(int i=0;i<=2;i++)
			nodeValue=10*nodeValue+(str[index+i]-'0');
		number.myInt.push_back(nodeValue);
	}
	return in;
}

//整数输出函数
ostream & operator<<(ostream & out,const BigIntAdd & number)
{
	list<short int>::const_iterator iter=number.myInt.begin();
	  //指向符号结点
    if(*iter==-1)
		out<<'-';   //若为负数则输出“-”，正数不输出符号
	if(++iter==number.myInt.end())
		out<<0;     //对应的数为零
	else            //输出每个结点对应的数
	{
		out<<*iter;
		for(iter++;iter!=number.myInt.end();++iter)
			out<<setw(3)
               <<setfill('0')
               <<*iter;
	}
	return out;
}

//整数加法函数
BigIntAdd operator+(BigIntAdd & add1,BigIntAdd& add2)
{
    //取两个数的符号
	list<short int>::iterator iter1=add1.myInt.begin();
	list<short int>::iterator iter2=add2.myInt.begin();
	short sign1=*iter1,sign2=*iter2;

	short sumSign;                    //存结果符号
	size_t sz1=add1.myInt.size()-1;   //add1数值部分的结点数
	size_t sz2=add2.myInt.size()-1;   //add2数值部分的结点数

	//确定运算结果的符号
	if(sign1*sign2>0)                 //两数符号相同
	{
		if(sign1==-1)                 //两数均为负数
		{
			sumSign=-1;
			sign1=1;
			sign2=1;
		}
		else                          //两数均为正数
			sumSign=1;

	}
	else                              //两数符号不同
		if(sign1*sign2<0)
			if(sz1==sz2)              //两数位数相等
			{
                //从第一个数值结点，即最高位
				for(iter1++,iter2++;iter1!=add1.myInt.end();iter1++,iter2++)
				{
					if(*iter1*sign1+*iter2*sign2<0)//负数的绝对值大
					{
						sumSign=-1;
						sign1=-sign1;
						sign2=-sign2;
						break;
					}
					if((*iter1*sign1)+(*iter2*sign2)>0)//正数的绝对值大
					{
						sumSign=1;
						break;
					}
				}
				if(iter1==add1.myInt.end())//绝对值相等
					sumSign=1;
			}
			else                         //两数位数不等
				if(sz1*sign1+sz2*sign2<0)//负数的位数多
				{
					sumSign=-1;
					sign1=-sign1; 
					sign2=-sign2;
				}
				else                     //正数的位数多
					sumSign=1;

    //确定运算结果的数值部分
	list<short int>::reverse_iterator riter1=add1.myInt.rbegin();
    list<short int>::reverse_iterator riter2=add2.myInt.rbegin();
      //定义两个反向迭代器
    BigIntAdd sum;           //存储运算结果
	short carry=0;           //存储进位值
    //两个数对应相加部分都不为零
	while(riter1!=--add1.myInt.rend()&&riter2!=--add2.myInt.rend())
	{
		short temp=(*riter1*sign1)+(*riter2*sign2)+carry;
		if(temp<0)           //运算值为负
		{
			temp+=short(1000);
			carry=-1;
		}
		else                 //运算值为正
		{
			carry=temp/short(1000);
			temp%=1000;
		}
		sum.myInt.push_front(temp);
		riter1++;
		riter2++;
	}
    //add2的对应相加部分为零
	while(riter1!=--add1.myInt.rend())
	{
		short temp=*riter1+carry;
		if(temp<0)         //运算值为负
		{
			temp+=short(1000);
			carry=-1;
		}
		else               //运算值为正
		{
			carry=temp/1000;
			temp%=1000;
		}
		sum.myInt.push_front(temp);
		riter1++;
	}
    //add1对应相加部分为零
	while(riter2!=--add2.myInt.rend())
	{
		short temp=*riter2+carry;
		if(temp<0)          //运算值为负
		{
			temp+=short(1000);
			carry=-1;
		}
		else                //运算值为正
		{
			carry=temp/1000;
			temp%=1000;
		}
		sum.myInt.push_front(temp);
		riter2++;
	}
    
	if(carry!=0)  //最后一个对应结点的运算结果有进位
		sum.myInt.push_front(carry);
    
	while(*sum.myInt.begin()==0)
		sum.myInt.pop_front();
      //最高位对应结点没有有效数值时，删除该结点
	sum.myInt.push_front(sumSign);
      //给结果链表加运算结果的符号
	return sum;
}
