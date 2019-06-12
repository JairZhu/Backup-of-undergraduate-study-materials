import java.io.*;

import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.KeyPair; 
import java.security.PrivateKey; 		
import java.security.PublicKey; 
import java.security.SignatureException; 
import java.security.InvalidKeyException;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.CertificateExpiredException;
import javax.crypto.*;

import org.bouncycastle.jce.provider.*;

public class LocalValid 
{
	String userFilename;
	String caFilename;
	public LocalValid(String str1, String str2)
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
		userFilename=str1;
		caFilename=str2;
	}

	public int valid()	// return 0:ok,1:outOfDate,2:sign error,-1:other error
	{
		int result=-1;

			try{

				CertificateFactory cf=CertificateFactory.getInstance("X.509");

				DataInputStream userdis=new DataInputStream(new FileInputStream(userFilename));		
				byte[]  userbytes=new byte[userdis.available()];
				userdis.readFully(userbytes);
				ByteArrayInputStream userbais=new ByteArrayInputStream(userbytes);
				X509Certificate userCert=(X509Certificate)(cf.generateCertificate(userbais));
				userdis.close();

				userCert.checkValidity();
			
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
		LocalValid lv=new LocalValid(args[0],args[1]);
		System.out.println(lv.valid());
		
	}
}