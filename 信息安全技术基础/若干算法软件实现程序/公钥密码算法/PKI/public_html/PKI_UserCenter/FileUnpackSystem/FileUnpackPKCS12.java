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

public class FileUnpackPKCS12
{
	String filenameToUnpack;
	String filenameAfterUnpack;
	String yourCertFilename;
	String myPrivateFilename;
	String password;

	public FileUnpackPKCS12(String fs1,String fs2,String fs3,String fs4,String pwd)
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
		filenameToUnpack=fs1;
		filenameAfterUnpack=fs2;
		yourCertFilename=fs3;
		myPrivateFilename=fs4;
		password=pwd;
	}

	public int unpack()		//0:pack suc, -1: unpack error,-2: unpack suc but verify error.
	{

		byte[] signbytes;
		try
		{
			//read from the packed file, split to 3 parts.
			DataInputStream dis=new DataInputStream(new FileInputStream(filenameToUnpack));
			signbytes=new byte[128];
			dis.readFully(signbytes);	
			byte[] wrapedkey=new byte[128];
			dis.readFully(wrapedkey);
			//byte[] encryptedbytes=new byte[dis.available];
			//dis.readFully(encryptedbytes);		

			//unwrap the wrapedkey  to gain the desKey
				//get my private key from my private file
			KeyStore inputKeyStore = KeyStore.getInstance("PKCS12","BC");
			DataInputStream mpdis=new DataInputStream(new FileInputStream(myPrivateFilename));		
			inputKeyStore.load(mpdis, password.toCharArray());
			mpdis.close();
			PrivateKey myPvk=null;
			Enumeration enum = inputKeyStore.aliases();      
      			if(enum.hasMoreElements()) 
          		{             
				String keyAlias = (String)enum.nextElement();                 
				if (inputKeyStore.isKeyEntry(keyAlias))                
				{                   
 					myPvk = (PrivateKey)inputKeyStore.getKey(keyAlias, password.toCharArray());        
              			}       
     			}
			else
			{
				return -1;
			}

				//use the private key to unwrap the wrapedkey, gain the desKey		
			Cipher cipher1=Cipher.getInstance("RSA","BC");
			cipher1.init(Cipher.UNWRAP_MODE,myPvk);
			Key desKey=cipher1.unwrap(wrapedkey,"DES",Cipher.SECRET_KEY);

			//use the desKey  to decrypt the encrypted-bytes,and write to new file.
			Cipher cipher2 = Cipher.getInstance("DES","BC");
			cipher2.init(Cipher.DECRYPT_MODE,desKey);	
			CipherInputStream cis=new CipherInputStream(dis, cipher2);
			FileOutputStream  fos=new FileOutputStream(filenameAfterUnpack);
       			int i ;
    			while ((i=cis.read())!=-1) fos.write(i);
			fos.flush();
			fos.close();
			dis.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);return -1;
		}

		try	
		{
			//get the publicKey of sender for verify the signature
			CertificateFactory cf=CertificateFactory.getInstance("X.509");
			DataInputStream ycfdis=new DataInputStream(new FileInputStream(yourCertFilename));		
			byte[]  ycfbytes=new byte[ycfdis.available()];
			ycfdis.readFully(ycfbytes);
			ByteArrayInputStream ycfbais=new ByteArrayInputStream(ycfbytes);
			Certificate ycfCert=cf.generateCertificate(ycfbais);
			PublicKey  ycfKey=ycfCert.getPublicKey();	//ycfKey
			ycfdis.close();	

			//verify the signature
			Signature  signature=Signature.getInstance("SHA1WithRSA","BC");
			signature.initVerify(ycfKey);	
			DataInputStream toverifydis=new DataInputStream(new FileInputStream(filenameAfterUnpack));
			byte[] toverifybytes=new byte[toverifydis.available()];
			toverifydis.readFully(toverifybytes);
			signature.update(toverifybytes);
			boolean verifyResult=signature.verify(signbytes);
			toverifydis.close();
			if(verifyResult==true)
				return 0;
			else
				return -2;
		}
		catch(Exception ex)
		{
			System.out.println(ex);return -2;
		}
	}

	public static void main(String[] args)
	{
		FileUnpackPKCS12 fu=new FileUnpackPKCS12(args[0],args[1],args[2],args[3],"333333");
		System.out.println(fu.unpack());
	}
}