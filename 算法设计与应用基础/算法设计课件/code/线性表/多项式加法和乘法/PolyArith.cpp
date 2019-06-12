/* 多项式加法和乘法示例 */  
#include <list> 
#include <iostream> 
#include <cassert>  

using namespace std; 

//定义多项式的项类 
class term { 
public: 	
	int coef;          //多项式系数 	
	int exp; 	       //多项式指数 
    //初始化项的系数和指数	
	term( int c=0,int e=0):coef(c),exp(e){}	 
}; 

//定义多项式类
class PolyArith {
private:
	list<term> m_poly_list_first;      //存储第一个多项式	    
    list<term> m_poly_list_second;     //存储第二个多项式
    list<term> m_poly_list_result;     //用以存储运算结果
    //多项式私有成员函数,用以乘法时的调用	
    list<term> Poly_add(list<term>&poly_list_first,\
	list<term>&poly_list_second) 	
    { 
		list<term> poly_list_result;      //用以存储运算结果 		
        list<term>::iterator iter_first  = poly_list_first.begin(); 		
	    list<term>::iterator iter_second = poly_list_second.begin();
	    //该while循环针对两个链表迭代器都没有指到结尾的情形 		
		while(iter_first != poly_list_first.end()&&\
			iter_second != poly_list_second.end()) 		
		{
		term t_temp; 			
		term t_first = (term)*iter_first; 			
		term t_second = (term)*iter_second; 			
		if(t_first.exp>t_second.exp) 			
		{ 
			poly_list_result.push_back(t_first); 				
			iter_first++; 			
		} 			
		else if(t_second.exp>t_first.exp) 			
		{
			poly_list_result.push_back(t_second); 				
			iter_second++; 			
		} 			
		else
		{
			t_temp.coef=t_first.coef+t_second.coef;
			t_temp.exp=t_first.coef;		
			poly_list_result.push_back(t_temp); 				
			iter_first++; 				
			iter_second++; 			
		} 
		} 
		//该for循环针对第一个多项式的迭代器没有指到结尾
		//第二个指到结尾的情形	
		for(;iter_first != poly_list_first.end();iter_first++) 		
		{
			poly_list_result.push_back(*iter_first);	 		
		}
		//该for循环针对第二个多项式的迭代器没有指到结尾
		//第一个指到结尾的情形	 		
		for(;iter_second != poly_list_second.end();iter_second++) 		
		{ 
			poly_list_result.push_back(*iter_second); 		
		} 		
		return poly_list_result;
    }
public:
	//输入函数，用以输入多项式 
	void Poly_input() 	    
	{ 
		int n; 		
		cout<<"请输入第一个多项式的项数："<<endl; 		
		cin>>n; 		
		cout<<"按降幂输入第一个多项式的每一项的系数和指数：";
		cout<<endl; 		
		for(int i=1;i<=n;i++) 		
		{
			term t_temp; 			
			cout<<"请输入第"<<i <<"项系数和指数,以'enter'为界：";
			cout<<endl; 			
			cin>>t_temp.coef; 			
			cin>>t_temp.exp;  			
			m_poly_list_first.push_back(t_temp); 		
		}  		
		n = 0; 		
		cout<<"请输入第二个多项式的项数："<<endl; 		
		cin>>n; 		
		cout<<"按降幂输入第二个多项式的每一项的系数和指数：";
		cout<<endl; 		
		for(int j=1;j<=n;j++) 		
		{ 			
			term t_temp; 			
			cout<<"请输入第"<<j <<"项系数和指数，以'enter'为界：";
			cout<<endl;
			cin>>t_temp.coef; 			
			cin>>t_temp.exp; 			
			m_poly_list_second.push_back(t_temp); 		
		} 	
	}
	//输出函数，用以输出多项式	       
	void Poly_output()       
	{
		//用以指向输出多项式的第一个元素
		list<term>::iterator iter = m_poly_list_result.begin();
		//输出多项式的每一项			
		for(;iter!=m_poly_list_result.end();) 		
		{ 			
			term t_temp=*iter; 			
			cout<<t_temp.coef<<"x^"<<t_temp.exp; 			
			if(++iter!=m_poly_list_result.end()) 				
				cout<<"+"; 		
		} 		
		cout<<endl; 			 	
	} 
	//加法函数，其基本思想同上边的私有成员函数Poly_add()
	//此处不带参数，多项式运算对象为私有数据成员		
	void Poly_add()         	
	{ 		
		list<term>::iterator iter_first = m_poly_list_first.begin(); 						
		list<term>::iterator iter_second =\
		m_poly_list_second.begin(); 		
		while(iter_first != m_poly_list_first.end()&&\
			iter_second != m_poly_list_second.end()) 		
		{ 			 			
			term t_temp; 			
			term t_first = (term)*iter_first; 			
			term t_second = (term)*iter_second;         	
			if(t_first.exp>t_second.exp) 			
			{ 				
				m_poly_list_result.push_back(t_first); 				
				iter_first++; 			
			} 			
			else if(t_second.exp>t_first.exp) 			
			{ 				
				m_poly_list_result.push_back(t_second); 				
				iter_second++; 			
			} 		    
			else 			
			{ 				
				t_temp.coef=t_first.coef+t_second.coef; 
				t_temp.exp=t_first.exp;
				m_poly_list_result.push_back(t_temp); 				
				iter_first++; 				
				iter_second++; 			
			}  		
		} 		
		for(;iter_first != m_poly_list_first.end();iter_first++) 		
		{ 			
			m_poly_list_result.push_back(*iter_first);	 		
		} 		
		for(;iter_second != m_poly_list_second.end();iter_second++) 		
		{ 			
			m_poly_list_result.push_back(*iter_second); 		
		}  	
	}
	//乘法函数，用以作多项式乘法 	 	
	void Poly_multi()        	
	{ 		
		list<term> poly_list_result; 		
		list<term>::iterator iter_first = m_poly_list_first.begin(); 				
		for(;iter_first!=m_poly_list_first.end();iter_first++) 		
		{ 	
			list<term> poly_list_temp; //用以存储多项式的中间运算结果
			list<term>::iterator iter_second =\
			m_poly_list_second.begin(); 				
			for(;iter_second!=m_poly_list_second.end();\
				iter_second++) 			
			{ 						
				term t_temp;           //用以存储项的中间运算结果				
				term t_first = (term)*iter_first; 				
				term t_second = (term)*iter_second;
				//此处实现多项式项的相乘
				t_temp.coef = t_first.coef*t_second.coef;   //系数相乘 				
				t_temp.exp = t_first.exp + t_second.exp;    //指数相加		
				poly_list_temp.push_back(t_temp); 			
			}
			//此处调用私有成员函数Poly_add（）
			poly_list_result =\
			Poly_add(poly_list_temp,poly_list_result); 		
		}
		//将运算结果赋值给私有数据成员，用以输出			
		m_poly_list_result = poly_list_result;
	} 
};  

//测试函数
int main() 
{ 	
	cout<<"************本程序实现多项式的加法与乘法************";
	cout<<endl;
	PolyArith poly_a; 	
	poly_a.Poly_input();        //输入多项式 	
	poly_a.Poly_add();          //多项式加法
    cout<<"多项式加法的运算结果："<<endl;	
	poly_a.Poly_output();       //输出多项式	
	cout<<endl; 	
	poly_a.Poly_multi();        //多项式乘法
    cout<<"多项式乘法的运算结果："<<endl; 	
	poly_a.Poly_output();        	
	system("pause"); 
	return 0; 
} 