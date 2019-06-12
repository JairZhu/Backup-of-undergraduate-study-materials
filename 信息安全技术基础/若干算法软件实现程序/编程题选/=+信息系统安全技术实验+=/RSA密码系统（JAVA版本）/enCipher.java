/**for Stream tools*/
import java.io.*;	
/**for ArrayList*/
import java.util.*;

/** 信息系统安全技术
 *<P> 这个类用于加密.
 * @author 软件学院 吴丹 00234015 
 * @version 1.0
*/
class enCipher 
{
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
	
	/**加密算法:
	 *<P>1,先读入加密的目标文件和公钥
	 *<P>2,用RSA算法对目标文件进行加密(每8个bit为一组，结果用long记录).
	 *<P>3,储存加密结果
	 *<P>pre:none
	 *<P>post:对文件加密
	*/
	enCipher()
	{
		String filename;
		ArrayList mem_buffer=new ArrayList();
		try{

			BufferedReader in1=new BufferedReader(
				new InputStreamReader(System.in));
			System.out.println("请输入要加密文件的文件名和(路径):");
			filename=in1.readLine();
			DataInputStream infile=new DataInputStream(
				new BufferedInputStream(
					new FileInputStream(filename)));
			System.out.println("请输入公钥的文件名(路径)");
			filename=in1.readLine();
			DataInputStream key=new DataInputStream(
				new BufferedInputStream(
					new FileInputStream(filename)));
			long e=key.readLong();
			long n=key.readLong();

			while(infile.available()>0)
			{
				byte temp=infile.readByte();
				long c=powMod(temp,e,n);
				mem_buffer.add(new Long(c));
			}
			System.out.println("读取完成.");
			System.out.println("请输入密文的存放文件名(路径):");
			filename=in1.readLine();

			DataOutputStream out1=new DataOutputStream(
				new BufferedOutputStream(
					new FileOutputStream(filename)));
			for(int i=0;i<mem_buffer.size();i++)
				out1.writeLong(((Long)mem_buffer.get(i)).longValue());
			System.out.println("加密完成");

		}catch(EOFException e){
			System.out.println("文件写入错误!");
		}
		catch(IOException e){
			System.err.println("文件读取写入出错，请检查文件名的输入是否正确，该文件是否存在！\n 正确格式：data.dat或c:\\data.dat");
			
		}
	}

	public static void main(String[] args) 
	{
		new enCipher();
	}
}
