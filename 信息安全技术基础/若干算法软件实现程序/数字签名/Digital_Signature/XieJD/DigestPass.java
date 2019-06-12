import java.security.*; 
public class DigestPass { 
public static void main(String[] args) throws Exception{ 
String str="Hello,I sent to you 80 yuan."; 
MessageDigest md = MessageDigest.getInstance("MD5");//常用的有MD5,SHA算法等 
md.update(str.getBytes("UTF-8"));//传入原始字串 
byte[] re = md.digest();//计算消息摘要放入byte数组中 
//下面把消息摘要转换为字符串 
String result = ""; 
for(int i=0;i<re.length;i++){ 
result += Integer.toHexString((0x000000ff&re[i])|0xffffff00).substring(6); 
} 
System.out.println(result); 
} 
} 
