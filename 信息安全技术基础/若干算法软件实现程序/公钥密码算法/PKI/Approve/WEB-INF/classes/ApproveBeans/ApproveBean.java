package ApproveBeans;

import java.io.*;
import java.sql.*;
import java.security.cert.X509Certificate;
import java.security.*;
import java.security.interfaces.*;
import java.security.spec.*;

import org.bouncycastle.jce.provider.*;
import org.bouncycastle.jce.*;
import org.bouncycastle.asn1.x509.*;

import ApplyBeans.Date2Id;

public class ApproveBean
{
	public String applyId;
	public String subjectId_Sign,subjectId_Encrypt;
	public X509Certificate  signXC,encryptXC;
	public PrivateKey  encryptPvk;
	public String errorMsg;

	private String JKSFileName;

	public void setJKSFileName(String str){JKSFileName=str;}
	
	public boolean getX509Certs()
	{
		Connection conn=null;	
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
			Statement stmt=conn.createStatement();
			String sql="select applyCN,applyOU,applyO,applyL,applyST,applyC,applyPbk from applytable where applyId="+applyId+"  and  not approved=1";
			ResultSet rs=stmt.executeQuery(sql); 
			if(rs.next())
			{
				Security.addProvider(new BouncyCastleProvider());
				X509V3CertificateGenerator xcg=new X509V3CertificateGenerator();

				//generate sign cert	
				java.util.Date  thistime=new java.util.Date();
				subjectId_Sign=String.valueOf(Date2Id.change(thistime));

				String xnstr="cn="+rs.getString(1)+",ou="+rs.getString(2)+",o="+rs.getString(3)+",l="+rs.getString(4)+",st="+rs.getString(5)+",c="+rs.getString(6);
				X509Name xn=new X509Name(false,xnstr);

				xcg.setSerialNumber(new java.math.BigInteger(subjectId_Sign));

				xcg.setNotBefore(thistime); 

				java.util.Calendar calendar=new java.util.GregorianCalendar();
				calendar.setTime(thistime);
				calendar.add(java.util.Calendar.YEAR, 1);
				xcg.setNotAfter(calendar.getTime()); 

            			xcg.setSubjectDN(xn);

				xcg.setSignatureAlgorithm("SHA1withRSA");

				byte[] encodedPbk=rs.getBytes(7);
				X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(encodedPbk);
 				KeyFactory keyFactory = KeyFactory.getInstance("RSA","BC");
 				PublicKey signPbk = keyFactory.generatePublic(pubKeySpec);
				xcg.setPublicKey(signPbk);

				FileInputStream fisJKS = new FileInputStream(JKSFileName); 
				KeyStore ks = KeyStore.getInstance("JKS"); 
				ks.load(fisJKS,"123456".toCharArray()); 
				PrivateKey caSignPvk = (PrivateKey)ks.getKey("RootCaSignCert","123456".toCharArray()); 
				X509Certificate rootCaSignCert=(X509Certificate)ks.getCertificate("RootCaSignCert");
				fisJKS.close(); 


				xnstr=rootCaSignCert.getSubjectDN().getName();
				xn=new X509Name(false,xnstr);
				xcg.setIssuerDN(xn);
				//System.out.println(xnstr);
				signXC=xcg.generateX509Certificate(caSignPvk, "BC");

				// generate encrypt cert
				thistime=new java.util.Date();
				subjectId_Encrypt=String.valueOf(Date2Id.change(thistime));
				xcg.setSerialNumber(new java.math.BigInteger(subjectId_Encrypt));

				xcg.setNotBefore(thistime); 

				calendar.setTime(thistime);
				calendar.add(java.util.Calendar.YEAR, 1);
				xcg.setNotAfter(calendar.getTime()); 

				KeyPairGenerator kpg=KeyPairGenerator.getInstance("RSA","BC");
				SecureRandom rd=SecureRandom.getInstance("SHA1PRNG");
				rd.setSeed(new java.util.Date().getTime());
				kpg.initialize(1024,rd);
				KeyPair kp=kpg.genKeyPair();
				encryptPvk=kp.getPrivate();
				PublicKey encryptPbk=kp.getPublic();  

				xcg.setPublicKey(encryptPbk);
				
				encryptXC=xcg.generateX509Certificate(caSignPvk, "BC");
	
				
				try{conn.close();}catch(Exception ex2){}
				errorMsg="ok!";
				return true;
			}
			else
			{
				try{conn.close();}catch(Exception ex2){}
				errorMsg="db error";
				return false;
			}
		}
		catch(Exception ex)
		{
			try{conn.close();}catch(Exception ex2){}
			errorMsg=ex.toString();
			return false;
		}
	}
}
