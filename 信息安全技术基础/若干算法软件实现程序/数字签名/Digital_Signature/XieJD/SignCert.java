
import java.io.*;

import java.security.*;

import java.security.cert.*;

import java.util.*;

import java.math.*;

import sun.security.x509.*;

/**
* <p>Description: 该程序根据签发者（CA）的证书信息（即CA的私钥）来对被签发者
* <p/>
* 的证书进行签名，过程即是使用CA的证书和被签证书来重构形成一个新的证书</p>
*
* @author abnerchai
* @version 1.0
*/

public class SignCert {

public static void main(String[] args) throws Exception {

char[] storepass = "100200".toCharArray();//存放CA证书和被签证书的证书库的访问密码

char[] cakeypass = "200100".toCharArray();//CA数字证书条目的访问密码

String alias = "rootCA";//CA证书在证书库中的别名，这个CA的证书用来签名其它的证书

String name = "rootCALib";//存放CA证书和被签证书的证书库的名字

String newLib = "SignedLib";//新证书库的名字，如果需要将签名后的证书放入新库，这是新库的名字

char[] newLibPass = "100200".toCharArray();//设置新库的访问密码

String cerFileName = "eagleCA.cer";//被签证书的证书文件名

String aliasName = "eagleCA";//被签证书在证书库中的alias别名

char[] namePass = "200100".toCharArray();//被签证书的条目在证书库的私钥密码

int n = 3; //被签证书的有效期，以年为单位，以当前时间开始计算

int sn = 200406001;//序列号可自己定义，这里定义的意义为2004年6月签发，是本年度CA签发的第多少个以001计算，要求唯一

String afteraliasName = "eagleCA_Signed"; //签名后新产生的被签过名的证书在库中的别名

char[] afterNewPass = "100200".toCharArray(); //签名后新产生的被签过名的证书在库的条目的私钥的密码

//装载证书库

FileInputStream in = new FileInputStream(name);

KeyStore ks = KeyStore.getInstance("JKS");//JKS为证书库的类型

ks.load(in, storepass);

//从证书库中读出签发者（CA）的证书

java.security.cert.Certificate cl = ks.getCertificate(alias);//读出一个CA证书,这里的l是字母l不是数据字1

PrivateKey privateKey = (PrivateKey) ks.getKey(alias, cakeypass);//根据别名和证书密码读出CA证书的私钥

in.close();

//从证书库中读出的签发者(CA)的证书中提取签发者的信息

byte[] encodl = cl.getEncoded();//提取证书的编码，这里是字母l不是数据字1

X509CertImpl cimpl = new X509CertImpl(encodl);//这里是字母l不是数据字1，根据证书的编码创建X509CertImpl类型的对象

//根据上面的对象获得X509CertInfo类型的对象，该对象封装了证书的全部内容。

X509CertInfo cinfo_first =

    (X509CertInfo) cimpl.get(X509CertImpl.NAME + "." + X509CertImpl.INFO);

//然后获得X500Name类型的签发者信息

X500Name issuer = (X500Name)

    cinfo_first.get(X509CertInfo.SUBJECT + "." + CertificateIssuerName.DN_NAME);

//获取待签发的证书，即获取被签发者的证书 

//可从密钥库中获取，也可从导出的证书文件中获取，这里给出两种方式 /////////////////////////////////////////////////////////////////////////////// 

//方式一、采用从导出的cer文件中获取 start 

/////////////////////////////////////////////////////////////////////////////// 

/*

CertificateFactory cf = CertificateFactory.getInstance("X.509");//X.509是使用最多的一种数字证书标准 

FileInputStream in2 = new FileInputStream(cerFileName);//被签证书文件 

java.security.cert.Certificate c2 = cf.generateCertificate(in2);//生成需要被签的证书 

in2.close(); 

byte[] encod2 = c2.getEncoded(); 

X509CertImpl cimp2 = new X509CertImpl(encod2); 

//获得被签证书的详细内容，然后根据这个证书生成新证书 

X509CertInfo cinfo_second = 

(X509CertInfo)cimp2.get(X509CertImpl.NAME+"."+X509CertImpl.INFO); 


*/
/////////////////////////////////////////////////////////////////////////////// 

//end 方式一 

/////////////////////////////////////////////////////////////////////////////// 

/////////////////////////////////////////////////////////////////////////////// 

//方式二、从证书库中读出被签的证书 start 

///////////////////////////////////////////////////////////////////////////////

java.security.cert.Certificate c3 = ks.getCertificate(aliasName);//从证书库中读出被签证书，然后生成新的证书

byte[] encod3 = c3.getEncoded();

X509CertImpl cimp3 = new X509CertImpl(encod3);

X509CertInfo cinfo_second =

    (X509CertInfo) cimp3.get(X509CertImpl.NAME + "." + X509CertImpl.INFO); ///////////////////////////////////////////////////////////////////////////////

//end方式二 

/////////////////////////////////////////////////////////////////////////////// //设置新证书的有效期，使之为当前向后n年有效，新证书的 

//截止日期不能超过CA证书的有效日期

Date beginDate = new Date();

Calendar cal = Calendar.getInstance();

cal.setTime(beginDate);

cal.add(cal.YEAR, n);

Date endDate = cal.getTime();

CertificateValidity cv = new CertificateValidity(beginDate, endDate);

cinfo_second.set(X509CertInfo.VALIDITY, cv);

//设置新证书的序列号

CertificateSerialNumber csn = new CertificateSerialNumber(sn);

cinfo_second.set(X509CertInfo.SERIAL_NUMBER, csn);

//设置新证书的签发者

cinfo_second.set(X509CertInfo.ISSUER + "." + CertificateIssuerName.DN_NAME,

    issuer);

//新的签发者是CA的证书中读出来的 

//设置新证书的算法，指定CA签名该证书所使用的算法为md5WithRSA

AlgorithmId algorithm =

    new AlgorithmId(AlgorithmId.md5WithRSAEncryption_oid);

cinfo_second.set(CertificateAlgorithmId.NAME + "." +

    CertificateAlgorithmId.ALGORITHM, algorithm);

//创建新的签名后的证书

X509CertImpl newcert = new X509CertImpl(cinfo_second);

//签名,使用CA证书的私钥进行签名，签名使用的算法为MD5WithRSA

newcert.sign(privateKey, "MD5WithRSA");//这样便得到了经过CA签名后的证书

//把新证书存入证书库 

//把新生成的证书存入一个新的证书库，也可以存入原证书库， 

//存入新证书库，则新证书库中不仅包含原证书库中的所有条目， 

//而且新增加了一个这次产生的条目。注意，这时，新产生的签名后的证书只 

//包括公钥和主体信息及签名信息，不包括私钥信息。这里给出两种方式。 

/////////////////////////////////////////////////////////////////////////// 

//方式一：存入新密钥库 

/////////////////////////////////////////////////////////////////////////// 

KeyStore ks2 = KeyStore.getInstance("JKS");//JKS为证书库的类型

ks2.load(null, newLibPass);

PrivateKey prk = (PrivateKey) ks.getKey(aliasName, namePass);

java.security.cert.Certificate[] cchain = {newcert};

//存入原来的库,第二个参数为原证书的私钥，第三个参数为新证书的私钥密码，第三个参数为新证书

ks2.setKeyEntry(afteraliasName, prk, afterNewPass, cchain); //用新密钥替代原来的没有签名的证书的密码

FileOutputStream out = new FileOutputStream(newLib); 

//存入新库signedLib，并设置新库的库访问密码 

ks2.store(out,newLibPass); 

out.close(); 



/////////////////////////////////////////////////////////////////////////// 

//end 方式一 

/////////////////////////////////////////////////////////////////////////// 

//也可以采用另外一种方式，存入原证书库中 

//存入原库中，即在原证书库中增加一条证书，这个证书是原证书经过签名后的证书 

//这个新证书含有私钥和私钥密码 

/////////////////////////////////////////////////////////////////////////// 

//方式二，存入原密钥库 

/////////////////////////////////////////////////////////////////////////// 
/*
//先在原库中读出被签证书的私钥


PrivateKey prk = (PrivateKey) ks.getKey(aliasName, namePass);

java.security.cert.Certificate[] cchain = {newcert};

//存入原来的库,第二个参数为原证书的私钥，第三个参数为新证书的私钥密码，第三个参数为新证书

ks.setKeyEntry(afteraliasName, prk, afterNewPass, cchain); //用新密钥替代原来的没有签名的证书的密码

FileOutputStream out2 = new FileOutputStream(name);

ks.store(out2, storepass);//存入原来的库中，第二个参数为该库的访问密码
*/
/////////////////////////////////////////////////////////////////////////// 

//end 方式二 

///////////////////////////////////////////////////////////////////////////

}

}

