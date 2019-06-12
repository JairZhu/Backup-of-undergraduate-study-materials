

#include<iostream.h>


void create_key()

{
	cout<<"RSA公钥制加密算法的演示程序。"<<endl<<endl;
	cout<<"算法将生成公钥和私钥。"<<endl;
	cout<<"请输入两个足够大的素数：";
	long int p,q;
	cin>>p >>q;

    long int n=p*q;
	long int m=(p-1)*(q-1);

	//用扩展的Euclid算法求公钥和私钥
	bool select_again=true;
	while(select_again){
    	long int k,r,u,v,x,y,s,t;
     	long int a;
    	cout<<"请输入一个供测试的密钥e ";
    	cin>> a;

	    k=a;
	    r=m;
    	u=1;
	    v=0;
    	x=0;
	    y=1;

	    while(r!=0){
		   q=k/r;
		   s=u-q*x;
		   t=v-q*y;
		   k=r;
		   r=a*s+m*t;
		   u=x;
		   v=y;
		   x=s;
		   y=t;
		}

	   if(k>1){
		   cout<<"输入不合法,请重新输入：";

	   }
	   else{
		   select_again=false;
		   cout<<"公钥:("<<a<<","<<n<<").私钥:"<<"d＝";
		   if(u%m<0)cout<<u%m+m;
		   else cout<<u%m;
	   }
	   }

}

