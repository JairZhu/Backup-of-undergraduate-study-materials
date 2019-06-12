import java.util.*;
import java.io.*;

import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.KeyPair; 
import java.security.PrivateKey; 		
import java.security.PublicKey; 
import java.security.KeyStore;
import java.security.Key;
import java.security.KeyFactory;
import java.security.Signature;
import java.security.SignatureException; 
import java.security.InvalidKeyException;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.CertificateExpiredException;
import java.security.spec.PKCS8EncodedKeySpec;
import javax.crypto.*;

import org.bouncycastle.jce.provider.*;

public class P2X
{
	String certFile;
	String pvkFile;
	String pkcs12File;
	String password;
	String funcStr;

	public P2X(String fn1,String fn2,String fn3,String pwd,String fs)
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
		certFile=fn1;
		pvkFile=fn2;
		pkcs12File=fn3;
		password=pwd;
		funcStr=fs;
	}
	
	
	public int convert()		//0:ok, -1:pkcs12 file read error, -2:save cert error, -3:save pvk error
	{
		X509Certificate cert=null;
		PrivateKey pvk=null;
		
		try{
			KeyStore inputKeyStore = KeyStore.getInstance("PKCS12","BC");
			DataInputStream pkcsdis=new DataInputStream(new FileInputStream(pkcs12File));		
			inputKeyStore.load(pkcsdis, password.toCharArray());
			pkcsdis.close();
			Enumeration enum = inputKeyStore.aliases();      
      			if(enum.hasMoreElements()) 
          		{             
				String keyAlias = (String)enum.nextElement();                 
				if (inputKeyStore.isKeyEntry(keyAlias))                
				{                   
 					Key key = inputKeyStore.getKey(keyAlias, password.toCharArray());
					pvk=(PrivateKey)key;        
            				Certificate[] certChain = inputKeyStore.getCertificateChain(keyAlias);   
					cert=(X509Certificate)certChain[0]; 
              			}       
     			}
			else
			{
				return -1;
			}
		}
		catch(Exception ex)
		{	
			return -1;
		}		

			
		try{
       			BufferedInputStream bis = new BufferedInputStream(new ByteArrayInputStream(cert.getEncoded()));
        		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(certFile+"_Cert_certId("+cert.getSerialNumber().toString()+")"+funcStr+".cer"));

        		byte[] buff = new byte[2048];
        		int bytesRead;

        		while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) 
			{
            			bos.write(buff,0,bytesRead);
			}
			bos.flush();
			bis.close();bos.close();					
		}
		catch(Exception ex)
		{	
			return -2;
		}

		
		try{
       			BufferedInputStream bis = new BufferedInputStream(new ByteArrayInputStream(pvk.getEncoded()));
        		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(pvkFile+"_Pvk_certId("+cert.getSerialNumber().toString()+")"+funcStr+".pem"));

        		byte[] buff = new byte[2048];
        		int bytesRead;

        		while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) 
			{
            			bos.write(buff,0,bytesRead);
			}
			bos.flush();
			bis.close();bos.close();
			
			return 0;	
		}
		catch(Exception ex)
		{	
			return -3;
		}
		
	}

}