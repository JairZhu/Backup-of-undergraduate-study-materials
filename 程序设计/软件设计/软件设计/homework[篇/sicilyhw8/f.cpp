#include<windows.h>
#include<cmath>
#include<iostream>
using namespace std;

class Base
{
  protected:
       double result,a,b,step;
       int n;
  public:
       virtual double fun(double ) = 0;
       virtual void integrate(){}
       Base(double aa=0, double bb=0, int nn=100):a(aa),b(bb),n(nn),result(0.0){}
       void print()
       {
              cout<<result<<endl;
       }
};


class Ladder:public Base
{
      public:
        Ladder(double aa,double bb,int nn):Base(aa,bb,nn){}   
      virtual double fun(double x)
      {
             return sin(x);  
      }
      virtual void integrate()
      {
            step=(b-a)/n;
            for(double i=step;i<=(n-1)*step;i+=step)
            { 
                       result+=(2*fun(a+i));
            }
            result=result+fun(a)+fun(a+n*step);
            result*=(step/2);  
      }
       void print(){cout<<result<<endl;}
};
class Rectangle : public Base
{
      public:      
      Rectangle(double aa,double bb,int nn):Base(aa,bb,nn){}
      virtual double fun(double x)
      {
           return sin(x);    
      }
     
      virtual void integrate()
      {
           step=(b-a)/n;
           for(double i=a;i<=n*step;i+=step)
           {
                    result+=fun(a+i);
           }
             result*=step;
      }
      void print(){cout<<result<<endl;}
};

class Simpson:public Base
{
      public:
      Simpson(double aa=0,double bb=0,int nn=0):Base(aa,bb,nn){}
      virtual double fun(double x)
      {
             return sin(x);  
      }
      virtual void integrate()
      {
             double result1=0,result2=0,sum=0;
             step=(b-a)/n; 
             for(double i=1;i<=n-1;i+=2)
             { 
                        result1+=4*fun(a+i*step);
             }
             
             for(double i=2;i<=n-2;i+=2)
             {
                        result2+=2*fun(a+i*step);
             }
              sum=result1+result2+fun(a)+fun(b);
              result=sum*(step/3);  
      }
       void print(){cout<<result<<endl;}
};

int main()
{
    Base* bp;
    bp = new Rectangle(0.0, 3.14159/2.0, 100);
    bp-> integrate();
    bp->print();
 
    bp = new Ladder(0.0, 3.14159/2.0, 100);
    bp-> integrate();
    bp->print();
 
    bp = new Simpson(0.0, 3.14159/2.0, 100);
    bp-> integrate();
    bp->print();
 
    system("pause");
    return 0;
}
