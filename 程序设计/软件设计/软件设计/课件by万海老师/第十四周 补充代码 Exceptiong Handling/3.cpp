#include <iostream>
using namespace std;

class MyException
{
    public:
    	MyException(string s): message(s) {}
    	string getMessage() 
        {
             return message; 
        }
    private:
    	string message;
};

class LogicError1: public MyException
{
    public:
    	LogicError1(string s): MyException(s) {}
};
    
class LogicError2: public MyException
{
    public:
    	LogicError2(string s): MyException(s) {}
};

/*void numberValidation(int num) 
{
    throw( LogicError1, LogicError2);
}*/

void numberValidation(int num)
{
	if (num < 0)
		throw LogicError1("negative number");
	else if (num == 0)
		throw LogicError2("zero");
}

int main()  
{	
    int num;
	cin >> num;

	try
	{
		numberValidation(num);
	}
	catch (LogicError1 e)
	{
	     cout << num << ": " << e.getMessage() << endl;
	}
	catch (LogicError2 e)
	{
	     cout << num << ": " << e.getMessage() << endl;
	}
    system("pause");
    return 0;
}
