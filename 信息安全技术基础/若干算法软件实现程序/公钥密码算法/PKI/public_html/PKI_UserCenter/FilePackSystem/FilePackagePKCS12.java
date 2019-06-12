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

public class FilePackagePKCS12
{
	String filenameToPack;
	String filenameAfterPack;
	String yourCertFilename;
	String myPrivateFilename;
	String password;

	public FilePackagePKCS12(String fs1,String fs2,String fs3,String fs4,String pwd)
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
		filenameToPack=fs1;
		filenameAfterPack=fs2;
		yourCertFilename=fs3;
		myPrivateFilename=fs4;
		password=pwd;
	}

	public int pack()		//0:pack suc, -1:error
	{
		try
		{
			//get the publicKey of reciepient
			CertificateFactory cf=CertificateFactory.getInstance("X.509");
			DataInputStream ycfdis=new DataInputStream(new FileInputStream(yourCertFilename));		
			byte[]  ycfbytes=new byte[ycfdis.available()];
			ycfdis.readFully(ycfbytes);
			ByteArrayInputStream ycfbais=new ByteArrayInputStream(ycfbytes);
			Certificate ycfCert=cf.generateCertificate(ycfbais);
			PublicKey  ycfKey=ycfCert.getPublicKey();	//ycfKey
			ycfdis.close();	

			//generate desKey  for encrypt file
			Cipher cipher1 = Cipher.getInstance("DES","BC");
			KeyGenerator keygen = KeyGenerator.getInstance("DES","BC");
			SecretKey desKey = keygen.generateKey();
			cipher1.init(Cipher.ENCRYPT_MODE,desKey);

			//generate the wrapedkey (using ycfKey to wrap desKey)
			Cipher cipher2=Cipher.getInstance("RSA","BC");
			cipher2.init(Cipher.WRAP_MODE,ycfKey);
			byte[]  wrapedKey=cipher2.wrap(desKey);

			//get my private key 
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

			//generate the signature of the file
			Signature  signature=Signature.getInstance("SHA1WithRSA","BC");
			signature.initSign(myPvk);	
			DataInputStream tosigndis=new DataInputStream(new FileInputStream(filenameToPack));
			byte[] tosignbytes=new byte[tosigndis.available()];
			tosigndis.readFully(tosignbytes);
			signature.update(tosignbytes);
			byte[] signedbytes=signature.sign();
			tosigndis.close();
			

			DataInputStream toencryptdis=new DataInputStream(new FileInputStream(filenameToPack));
   			CipherInputStream cis=new CipherInputStream(toencryptdis, cipher1);

			FileOutputStream  fos=new FileOutputStream(filenameAfterPack);
			fos.write(signedbytes);		//128bytes
			fos.flush();
			fos.write(wrapedKey);fos.flush();	//128bytes
       			int i ;
    			while ((i=cis.read())!=-1) fos.write(i);
			fos.flush();
						
			cis.close();
			fos.close();



			return 0;
		}
		catch(Exception ex)
		{
			System.out.println(ex);return -1;
		}
	}

	public static void main(String[] args)
	{
		FilePackagePKCS12 fp=new FilePackagePKCS12(args[0],args[1],args[2],args[3],"333333");
		System.out.println(fp.pack());
	}
}