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

public class X2P
{
	String certFile;
	String pvkFile;
	String pkcs12File;
	String password;
	String funcStr;	

	public X2P(String fn1,String fn2,String fn3,String pwd,String fs)
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
		certFile=fn1;
		pvkFile=fn2;
		pkcs12File=fn3;
		password=pwd;
		funcStr=fs;
	}
	
	
	public int convert()		//0:ok, -1:certfile error, -2:pvkfile error, -3:generate error
	{
		X509Certificate cert=null;
		PrivateKey pvk=null;
		
			
		try{
			CertificateFactory cf=CertificateFactory.getInstance("X.509");
			DataInputStream cfdis=new DataInputStream(new FileInputStream(certFile));		
			byte[]  cfbytes=new byte[cfdis.available()];
			cfdis.readFully(cfbytes);
			ByteArrayInputStream cfbais=new ByteArrayInputStream(cfbytes);
			cert=(X509Certificate)cf.generateCertificate(cfbais);
		}
		catch(Exception ex)
		{	
			return -1;
		}
		
		try{
			DataInputStream mpdis=new DataInputStream(new FileInputStream(pvkFile));
			byte[] mpbytes=new byte[mpdis.available()];
			mpdis.readFully(mpbytes);
			PKCS8EncodedKeySpec myPvkKeySpec = new PKCS8EncodedKeySpec(mpbytes);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA","BC");
			pvk = keyFactory.generatePrivate(myPvkKeySpec);
		}
		catch(Exception ex)
		{	
			return -2;
		}

		try{
   			KeyStore outputKeyStore = KeyStore.getInstance("PKCS12","BC");
    			outputKeyStore.load(null, password.toCharArray());	
   			outputKeyStore.setKeyEntry(cert.getSerialNumber().toString(), pvk, password.toCharArray(), new Certificate[]{cert});
   			FileOutputStream fos=new FileOutputStream(pkcs12File+"_PKCS12_certId("+cert.getSerialNumber().toString()+")"+funcStr+".pfx");
   			outputKeyStore.store(fos,  password.toCharArray());
			fos.close();
			
			return 0;
		}
		catch(Exception ex)
		{	
			return -3;
		}
		
	}

}