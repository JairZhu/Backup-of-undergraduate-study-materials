import java.util.*;
import java.io.*;

import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.KeyPair; 
import java.security.PrivateKey; 		
import java.security.PublicKey; 
import java.security.KeyStore;
import java.security.Key;
import java.security.SignatureException; 
import java.security.InvalidKeyException;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.CertificateExpiredException;
import javax.crypto.*;

import org.bouncycastle.jce.provider.*;

public class LocalValidPKCS12 
{
	String userFilename;
	String caFilename;
	String password;
	public LocalValidPKCS12(String str1, String str2,String pwd)
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
		userFilename=str1;
		caFilename=str2;
		password=pwd;
	}

	public int valid()	// return 0:ok,1:outOfDate,2:sign error,-1:other error
	{
		int result=-1;

			try{
				KeyStore inputKeyStore = KeyStore.getInstance("PKCS12","BC");
				DataInputStream userdis=new DataInputStream(new FileInputStream(userFilename));		
				inputKeyStore.load(userdis, password.toCharArray());
				userdis.close();
				X509Certificate userCert=null;
				Enumeration enum = inputKeyStore.aliases();      
      				if(enum.hasMoreElements()) 
          			{             
					String keyAlias = (String)enum.nextElement();                 
					if (inputKeyStore.isKeyEntry(keyAlias))                
					{                   
 						Key key = inputKeyStore.getKey(keyAlias, password.toCharArray());        
            					Certificate[] certChain = inputKeyStore.getCertificateChain(keyAlias);   
						userCert=(X509Certificate)certChain[0]; 
              				}       
     				}
				else
				{
					return -1;
				}
				userCert.checkValidity();

				CertificateFactory cf=CertificateFactory.getInstance("X.509");			
				DataInputStream cadis=new DataInputStream(new FileInputStream(caFilename));		
				byte[]  cabytes=new byte[cadis.available()];
				cadis.readFully(cabytes);
				ByteArrayInputStream cabais=new ByteArrayInputStream(cabytes);
				Certificate caCert=cf.generateCertificate(cabais);
				PublicKey  caKey=caCert.getPublicKey();
				cadis.close();				
				
				userCert.verify(caKey,"BC");
				
				result=0;
			
			}
			catch(CertificateExpiredException ex)
			{
				result=1;
			}
			catch(SignatureException ex)
			{
				result=2;
			}
			catch(InvalidKeyException ex)
			{
				result=2;
			}
			catch(Exception ex)
			{
				System.out.println(ex);result=-1;
			}

		return result;
	}

	public static void main(String[] args)
	{
		LocalValidPKCS12 lv=new LocalValidPKCS12(args[0],args[1],args[2]);
		System.out.println(lv.valid());
		
	}
}