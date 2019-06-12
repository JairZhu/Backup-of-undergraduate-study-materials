// Problem#: 7986
// Submission#: 2046718
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University
/*
 * =====================================================================================
 *
 *       Filename:  source.cpp
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  04/15/2013 01:04:54 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Zhujin Liang (LZJ), alfredtofu@gmail.com
 *   Organization:
 *
 * =====================================================================================
 */
#include <iostream>
#include <string>
#include <deque>
#include <fstream>
using namespace std;


enum CmpResult { _less = -1, _equal = 0, _greater = 1 };
enum Sign { _negative = -1, _zero = 0, _positive = 1 };


class Integer
{
public:
    Integer(int = 0);
    Integer(const string&);
    Integer(const Integer&);

    Integer& operator =(const Integer&);

    // 比较操作符 {
    friend const bool operator ==(const Integer&, const Integer&);
    friend const bool operator !=(const Integer&, const Integer&);
    friend const bool operator < (const Integer&, const Integer&);
    friend const bool operator <=(const Integer&, const Integer&);
    friend const bool operator > (const Integer&, const Integer&);
    friend const bool operator >=(const Integer&, const Integer&);
    // }


    // 算术运算符 {
    friend Integer operator +(const Integer&, const Integer&);
    friend Integer operator -(const Integer&, const Integer&);
    friend Integer operator *(const Integer&, const Integer&);
    friend Integer operator /(const Integer&, const Integer&);
    friend Integer operator %(const Integer&, const Integer&);
    // }


    // 负号 {
    Integer operator -() const;
    // }


    // 复合赋值操作符号 {
    Integer& operator +=(const Integer&);
    Integer& operator -=(const Integer&);
    Integer& operator *=(const Integer&);
    Integer& operator /=(const Integer&);
    Integer& operator %=(const Integer&);
    // }


    // 自增/自减运算符
    Integer& operator ++(   );
    Integer  operator ++(int);
    Integer& operator --(   );
    Integer  operator --(int);
    // }


    // 输入输出操作符 {
    friend ostream &operator <<(ostream &os, const Integer&);
    // }

private:
    // (*this).data = data_a + data_b;
    void add(const deque<int>& data_a, const deque<int>& data_b);

    // (*this).data = data_a - data_b;
    // 需要保证data_a >= data_b;
    void subtract(const deque<int>& data_a, const deque<int>& data_b);

    // 'return' = (*this).data / divisor
    // (*this).data = (*this).data % divisor
    deque<int> divide(const deque<int>& divisor);

    CmpResult cmpTo(const Integer& a) const;
    CmpResult cmpData(const deque<int>&, const deque<int>&) const;

    void removeLeadingZeros();

    deque<int> data;
    Sign sign;

};

Integer::Integer(int i)
{
    if (i == 0)
    {
        sign = _zero;
        return ;
    }

    sign = _positive;
    if (i < 0)
    {
        sign = _negative;
        i = -i;
    }

    while (i != 0)
    {
        data.push_back(i % 10);
        i /= 10;
    }
}

Integer::Integer(const string& s)
{

    for (int i = static_cast<int>(s.size()) - 1;
            i > 0; i--)
    {
        data.push_back(s[i] - '0');
    }

    if (s[0] == '-')
    {
        sign = _negative;
    }
    else
    {
        sign = _positive;
        data.push_back(s[0] - '0');
    }

    // 清除前导0
    removeLeadingZeros();
}

Integer::Integer(const Integer& a)
{
    sign = a.sign;
    data.clear();
    data = a.data;
}

Integer& Integer::operator =(const Integer& a)
{
    sign = a.sign;
    data.clear();
    data = a.data;
    return *this;
}


// 比较操作符 {
const bool operator ==(const Integer& a, const Integer& b)
{
    return ((a.sign == b.sign) && (a.data == b.data));
}

const bool operator !=(const Integer& a, const Integer& b)
{
    return !operator ==(a, b);
}

const bool operator < (const Integer& a, const Integer& b)
{
    return (a.cmpTo(b) == _less);
}

const bool operator <=(const Integer& a, const Integer& b)
{
    return (a.cmpTo(b) != _greater);
}

const bool operator > (const Integer& a, const Integer& b)
{
    return (a.cmpTo(b) == _greater);
}

const bool operator >=(const Integer& a, const Integer& b)
{
    return (a.cmpTo(b) != _less);
}

// }


// 算术运算符 {
Integer operator +(const Integer& a, const Integer& b)
{
    Integer ans(a);
    ans += b;
    return ans;
}

Integer operator -(const Integer& a, const Integer& b)
{
    Integer ans(a);
    ans -= b;
    return ans;
}

Integer operator *(const Integer& a, const Integer& b)
{
    Integer ans(a);
    ans *= b;
    return ans;
}
Integer operator /(const Integer& a, const Integer& b)
{
    Integer ans(a);
    ans /= b;
    return ans;
}

Integer operator %(const Integer& a, const Integer& b)
{
    Integer ans(a);
    ans %= b;
    return ans;
}

Integer Integer::operator -() const
{
    Integer ans = *this;
    ans.sign = Sign(-ans.sign);
    return ans;
}

Integer& Integer::operator +=(const Integer& a)
{
    if (sign == _zero)
    {
        (*this) = a;
        return *this;
    }
    if (a.sign == _zero)
    {
        return *this;
    }

    if (sign == a.sign)
    {
        add(deque<int>(data), a.data);
        return *this;
    }

    switch (cmpData(data, a.data))
    {
    case _equal:
        sign = _zero;
        data.clear();
        break;

    case _less:
        sign = a.sign;
        subtract(a.data, deque<int>(data));
        break;

    default:
        subtract(deque<int>(data), a.data);
        break;
    }
    return *this;
}

Integer& Integer::operator -=(const Integer& a)
{
    sign = Sign(-sign);
    (*this) += a;
    sign = Sign(-sign);
}

Integer& Integer::operator *=(const Integer& a)
{
    if (sign == _zero || a.sign == _zero)
    {
        sign = _zero;
        data.clear();
        return *this;
    }

    sign = (sign == a.sign) ? _positive : _negative;

    const deque<int>& data_a = a.data;
    int* tmp = new int[data.size() + data_a.size()];
    deque<int>::size_type i = 0, j = 0;
    for (; i < data.size() + data_a.size(); i++)
    {
        tmp[i] = 0;
    }

    int carry = 0;
    for (i = 0; i < data_a.size(); i++)
    {
        carry = 0;
        for (j = 0; j < data.size(); j++)
        {
            tmp[i + j] = tmp[i + j] + data[j] * data_a[i] + carry;
            carry = tmp[i + j] / 10;
            tmp[i + j] %= 10;
        }
        while (carry != 0)
        {
            tmp[i + j] = tmp[i + j] + carry;
            carry = tmp[i + j] / 10;
            tmp[i + j] %= 10;
            j++;
        }
    }
    data.resize(i + j - 1);
    data.assign(tmp, tmp + i + j - 1);
    return *this;
}

Integer& Integer::operator /=(const Integer& a)
{
    if (sign == _zero || a.sign == _zero)
    {
        sign = _zero;
        data.clear();
        return *this;
    }

    (*this).data = divide(a.data);
    removeLeadingZeros();
    return *this;
}

Integer& Integer::operator %=(const Integer& a)
{
    if (sign == _zero || a.sign == _zero)
    {
        return *this;
    }

    divide(a.data);
    removeLeadingZeros();
    return *this;
}

// 自增/自减运算符
Integer& Integer::operator ++(   )
{
    *this += 1;
    return *this;
}

Integer  Integer::operator ++(int)
{
    Integer tmp(*this);
    ++(*this);
    return tmp;
}

Integer& Integer::operator --(   )
{
    *this -= 1;
    return *this;
}

Integer  Integer::operator --(int)
{
    Integer tmp(*this);
    --(*this);
    return tmp;
}
// }

// 输入输出操作符 {
ostream &operator <<(ostream &os, const Integer& a)
{
    if (a.sign == _zero)
    {
        os << 0;
        return os;
    }

    if (a.sign == _negative)
    {
        os << '-';
    }

    for (deque<int>::const_reverse_iterator iter = a.data.rbegin();
            iter != a.data.rend(); iter++)
    {
        os << *iter;
    }
    return os;
}
// }

void Integer::add(const deque<int>& data_a, const deque<int>& data_b)
{
    data.clear();
    deque<int>::const_iterator iter_a = data_a.begin();
    deque<int>::const_iterator iter_b = data_b.begin();

    int carry = 0;
    for (; iter_a != data_a.end() && iter_b != data_b.end();
            iter_a++, iter_b++)
    {
        data.push_back((*iter_a) + (*iter_b) + carry);
        carry = data.back() / 10;
        data.back() %= 10;
    }

    deque<int>::const_iterator iter = iter_a;
    deque<int>::const_iterator iter_end = data_a.end();
    if (iter_b != data_b.end())
    {
        iter = iter_b;
        iter_end = data_b.end();
    }
    for (; iter != iter_end; iter++)
    {
        data.push_back((*iter) + carry);
        carry = data.back() / 10;
        data.back() %= 10;
    }
    if (carry != 0)
    {
        data.push_back(carry);
    }
}

void Integer::subtract(const deque<int>& data_a, const deque<int>& data_b)
{
    data.clear();
    int borrow = 0;
    deque<int>::const_iterator iter_a = data_a.begin();
    deque<int>::const_iterator iter_b = data_b.begin();
    for (; iter_b != data_b.end(); iter_a++, iter_b++)
    {
        if ((*iter_a) - borrow < (*iter_b))
        {
            data.push_back(10 + (*iter_a) - (*iter_b) - borrow);
            borrow = 1;
        }
        else
        {
            data.push_back((*iter_a) - (*iter_b) - borrow);
            borrow = 0;
        }
    }

    for (; iter_a != data_a.end(); iter_a++)
    {
        if ((borrow == 0) || ((*iter_a) != 0))
        {
            data.push_back((*iter_a) - borrow);
            iter_a++;
            data.insert(data.end(), iter_a, data_a.end());
            break;
        }
        data.push_back(9);
    }
    removeLeadingZeros();
}


CmpResult Integer::cmpTo(const Integer& a) const
{
    if (sign < a.sign)
    {
        return _less;
    }

    if (sign > a.sign)
    {
        return _greater;
    }

    switch (sign)
    {
    case _zero:
        return _equal;
    case _positive:
        return cmpData(data, a.data);
    default:
        return cmpData(a.data, data);
    }
}

CmpResult Integer::cmpData(const deque<int>& a, const deque<int>& b) const
{
    if (a.size() < b.size())
        return _less;
    if (a.size() > b.size())
        return _greater;
    for (int i = static_cast<int>(a.size()) - 1;
            i >= 0; i--)
    {
        if (a[i] < b[i])
        {
            return _less;
        }
        if (a[i] > b[i])
        {
            return _greater;
        }
    }

    return _equal;
}


void Integer::removeLeadingZeros()
{
    while (!data.empty())
    {
        if (data.back() != 0)
        {
            break;
        }
        data.pop_back();
    }

    if (data.empty())
    {
        sign = _zero;
    }
}

deque<int> Integer::divide(const deque<int>& divisor)
{
    deque<int> quotients;

    //若被除数少于除数，直接返回。
    if (cmpData(data, divisor) == _less)
    {
        return quotients;
    }

    Integer tmp;
    tmp.sign = _positive;
    while (cmpData(tmp.data, divisor) == _less)
    {
        tmp.data.push_front(data.back());
        data.pop_back();
    }

    quotients.push_front(0);
    while (cmpData(tmp.data, divisor) != _less)
    {
        tmp.subtract(deque<int>(tmp.data), divisor);
        quotients.front()++;
    }

    while (!data.empty())
    {
        tmp.data.push_front(data.back());
        data.pop_back();
        quotients.push_front(0);
        while (cmpData(tmp.data, divisor) != _less)
        {
            tmp.subtract(deque<int>(tmp.data), divisor);
            quotients.front()++;
        }
    }
    data = tmp.data;
    //while (cmpData(data, divisor) != _less)
    //{
    //    Integer tmp;
    //    tmp.sign = _positive;
    //    while (cmpData(tmp.data, divisor) == _less)
    //    {
    //        tmp.data.push_front(data.back());
    //        data.pop_back();
    //    }

    //    quotients.push_front(0);
    //    while (cmpData(tmp.data, divisor) != _less)
    //    {
    //        tmp.subtract(deque<int>(tmp.data), divisor);
    //        quotients.front()++;
    //    }

    //    while (!tmp.data.empty())
    //    {
    //        data.push_back(tmp.data.front());
    //        tmp.data.pop_front();
    //    }
    //}
    return quotients;
}           










int main(int argc, const char *argv[])
 
{
    ifstream infile;
    infile.open("testin.txt",fstream::in);
 	ofstream outfile;
 	outfile.open("othertestout.txt",fstream::out);
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
