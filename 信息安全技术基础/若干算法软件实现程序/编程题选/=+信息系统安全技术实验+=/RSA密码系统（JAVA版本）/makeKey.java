/**for Stream tools*/
import java.io.*;	

/** 信息系统安全技术作业
 *<P> 这个类用于产生公钥和私钥并存于用户指定的文件.本算法的流程由构造函数控制所以所有mothod的pre都是none.
 * @author 软件学院 吴丹 00234015
 * @version 1.0
*/
class makeKey 
{
	/**RSA算法中的数据元素
	*pub_n->n
	*pub_q->q
	*pub_p->p
	*pub_e->e
	*pub_d->d
	*/
	long pub_n,pub_q,pub_p,pub_e,pub_d;

	
	/** witness算法(用来检测一个元素是否是素数
	 *<P>pre:none.
	 *<P>post:dicide whether the number inputed is a element number.
	 *@param n the number to test.
	*/
	boolean witness(long n)
	{
		//测试次数的计数器
		int counter=0;
		//将n-1转化程二进制字符串b
		String b=Long.toBinaryString(n-1);

		while(true)
		{
			//随机产生一个a
			long a=(long)((n-1)*Math.random()+1);
			long d=1;
			
			for(int i=b.length()-1;i>=0;i--)
			{
				long x=d;
				d=(x*x)%n;
				if(d==1&&x!=1&&x!=n-1)
					return false;
			    /**测试代码
				System.out.println("i="+i+" x="+x+" d="+d+" b"+i+"="+b.charAt(b.length()-1-i));
				*/
				if(b.charAt(b.length()-1-i)=='1')
					d=(d*a)%n;
			}
			if(d==1)
				counter++;
			else return false;

			//如果连续100个a都通过检测，则假设n是一个素数。(经试验这种算法安全)
			//如果假设错误，在构造函数中还有一层保护
			if(counter>=100)
				return true;
		}
	}
	
	/**返回一个指定大小的素数(与参数最接近)
	 *<P>pre:None.
	 *<P>post:return a element number that approximate the parameter.
	 *@param max_num to limit,or to say confin,the generating number.
	*/
	long eleGenerator(long max_num)
	{
		long p=(long)(Math.random()*max_num+1);
		//使p为奇数
		p=p%2==0?p+1:p;
		//用witness算法检p是否为素数
		while(!witness(p))
			p-=2;
		return p;
	}
	
	/**产生RSA中的p、q、n and e
	 *<P>pre:None.
	 *<P>post:generate "p、q、n、e" in RSA.
	*/
	void PQNEDGenerator()
	{
	//p的范围定在2^30这个数量级(eleGenerator的具体内容见上)
		pub_p=eleGenerator((long)(Math.random()*Math.pow(2,30)));
	//q的范围定在2^20这个数量级,与p大概相隔4个十进制以避免受到攻击(eleGenerator的具体内容见上)
		pub_q=eleGenerator((long)(Math.random()*Math.pow(2,20)));
	//生成n
		pub_n=pub_p*pub_q;
	//e的生成
		pub_e=(long)((pub_p-1)*(pub_q-1)*Math.random());
		//使e为奇数
		pub_e=pub_e%2==0?pub_e-1:pub_e;
		pub_d=stein(pub_e,(pub_p-1)*(pub_q-1));
		while(pub_d==-999)
		{
			pub_e-=2;
			pub_d=stein(pub_e,(pub_p-1)*(pub_q-1));
		}
	}

	/**Stein算法(计算(e,m),又在(e,m)=1的情况下算出e对于模m的逆元)
	 *<P>pre:none.
	 *<P>post:判断(e,m)是否等于1。如果不等于1返回-999，如果等于1返回e对于模m的逆元。
	 *@param e Stein算法中的"e".
	 *@param m Stein算法中的"m".
	*/
	long stein(long e,long m)
	{
		long s0,s,r,r0,x,y,u,v;
		s0=s=e;
		r0=r=m;
		x=v=0;
		y=u=1;

		while(r!=0)
		{
			/**调试代码
			System.out.println("r="+r);
			System.out.println("u="+u);
			*/
			if(r%2==1)
			{
				if(s>r)
				{
					long temp=s;s=r;r=temp;
					temp=x;x=u;u=temp;
					temp=y;y=v;v=temp;
				}
				r-=s;x-=u;y-=v;
			}
			else
				if(y%2==0)
				{
					r/=2;x/=2;y/=2;
				}
				else
				{
					if(y<0)
					{
						r/=2;
						y=(y+s0)/2;
						x=(x-r0)/2;
					}
					else
					{
						r/=2;
						y=(y-s0)/2;
						x=(x+r0)/2;
					}
				}
		}
		if(s==1)
			return u%m<0?u%m+m:u%m;
		else return -999;
	}
	/**计算有可能溢出的模m的整数幂的算法
	 *<P>pre:none.
	 *<P>post:返回a^t(mod n);
	 *@param a a^t(mod n)中的a
	 *@param t a^t(mod n)中的t
	 *@param n a^t(mod n)中的n
	*/
	long powMod(long a,long t,long n)
	{
		long c=0;
		long d=1;
		String b=Long.toBinaryString(t);
		
		for(int i=b.length()-1;i>=0;i--)
		{
			c*=2;
			d=(d*d)%n;
			if(b.charAt((b.length()-1-i))=='1')
			{
				c+=1;
				d=(d*a)%n;
			}
			/**调试代码
			System.out.print("i="+i);
			System.out.print(" c="+c);
			System.out.print(" d="+d);
			System.out.println();
			*/
		}
		return d;
	}
		

	/**构造函数
	 *<P>作用是控制程序的流程，依次作了以下工作：
	 *<P>1,模拟加密解密50次，以防止p,q不是素数(witness算法的不足性).
	 *<P>2,产生RSA算法中的p,q,r,s.
	 *<P>3,保存公钥(e和n)，私钥(d和n).
	*/
	makeKey()
	{
		/**witness函数的测试代码
		long test=(long)(Math.pow(2,13)-1);
		System.out.println(witness(test));
		*/

		/**elementGenerator函数的测试代码
		long test=eleGenerator((long)(Math.random()*Math.pow(2,30)));
		System.out.println(test);
		System.out.println(witness(test));
		*/
		
		/**PQNEDGenerator函数的测试代码
		PQNEDGenerator();
		System.out.println("p="+pub_p);
		System.out.println("q="+pub_q);
		System.out.println("n="+pub_n);
		System.out.println("e="+pub_e);
		System.out.println("d="+pub_d);
		*/
				
		/**stein函数的测试代码
		System.out.println(stein(5,96));
		*/
		
		//模拟加密解密50次，以防止p,q不是素数(witness算法的不足性)
		boolean secure=false;
		while(!secure)
		{
			PQNEDGenerator();
			for(int i=0;i<50;i++)
			{
				long test=(long)(Math.pow(2,20)*Math.random());
				long c=powMod(test,pub_e,pub_n);
				long m=powMod(c,pub_d,pub_n);
				if(test==m)
				{
					secure=true;
				}
				else 
				{
					secure=false;
					break;
				}
			}
		}
		System.out.println("密钥成功产生");
		
		//以下是保存公钥私钥的io操作
		String filename=" ";
		try{
			BufferedReader in1=new BufferedReader(
				new InputStreamReader(System.in));

			System.out.println("请输入公钥存放的文件名:");
			filename=in1.readLine();
			DataOutputStream key=new DataOutputStream(
				new BufferedOutputStream(
					new FileOutputStream(filename)));
			key.writeLong(pub_e);
			key.writeLong(pub_n);
			key.close();
			System.out.println("公钥已保存!");

			System.out.println("请输入私钥存放的文件名:");
			filename=in1.readLine();
			key=new DataOutputStream(
				new BufferedOutputStream(
					new FileOutputStream(filename)));
			key.writeLong(pub_d);
			key.writeLong(pub_n);
			key.close();

			System.out.println("公钥和私钥生成完毕");
		}
		catch(IOException e){
			System.err.println("文件写入错误，请检查输入格式!\n正确格式：data.dat或c:\\data.dat");
		}
	}

	public static void main(String args[])
	{
		new makeKey();
	}
}
