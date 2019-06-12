#include <iostream>
#include <cmath>
#include <string>
using namespace std;

class MyException 
{
    public:
         MyException(const string msg = "") : message(msg) 
        { }
        string what()
        {     
            return message;    
        }
    private:
        string message;
};
 
double mySqrt(double dnum)
{
     if (dnum < 0)
          throw MyException("invalid argument");

     return sqrt(dnum); //对合法参数进行处理
}
int main() 
{   
    double dnum;
    cout << "Enter a real number(Ctrl-Z to end):";
    while (cin >> dnum)
    {
        try 
        {
        	double result = mySqrt(dnum);
        	cout << "The square root of " << dnum << " is " << result << endl; 
        }
        catch(MyException e)
        {
    	   cout << "Exception: " << e.what() << endl;
        }
    	
        cout << "Enter a integer(Ctrl-Z to end):";
     } 
     system("pause");
     return 0;
} 
