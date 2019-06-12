import java.net.*;
import java.io.*;

import java.security.Key; 
import java.security.PrivateKey;
import java.security.KeyStore;
import javax.crypto.*;

import org.bouncycastle.jce.provider.*;


public class ApplyServer
{
	public static void main(String[] args)
	{
		ServerSocket ss=null;
		Socket s=null;
		try{
			java.security.Security.addProvider(new BouncyCastleProvider());
			ss=new ServerSocket(8888);
			while(true)
			{
				s=ss.accept();
				new ApplyServerThread(s,args[0]).start();
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		finally
		{
			try{ ss.close();} catch(Exception ex){}
		}
	}	
}

class ApplyServerThread extends Thread
{
	Socket client=null;
	ObjectInputStream ois=null;
	ObjectOutputStream oos=null;
	String jksFileName=null;
	public ApplyServerThread(Socket s,String jksFileName)
	{
		client=s;
		this.jksFileName=jksFileName;
	}

	public void run()
	{	
		try{
			oos=new ObjectOutputStream(client.getOutputStream());
			ois=new ObjectInputStream(client.getInputStream());
			SealedObject encryptedSource=(SealedObject)ois.readObject();
			BytesObject bo=(BytesObject)ois.readObject();
			byte[] wrapedKey=bo.bytes;
		
			FileInputStream fisJKS = new FileInputStream(jksFileName); 
			KeyStore ks = KeyStore.getInstance("JKS"); 
			ks.load(fisJKS,"123456".toCharArray()); 
			PrivateKey CADecryptPvk = (PrivateKey)ks.getKey("RootCaEncryptCert","123456".toCharArray()); 
			fisJKS.close(); 

			Cipher cipher=Cipher.getInstance("RSA","BC");
			cipher.init(Cipher.UNWRAP_MODE,CADecryptPvk);
			Key desKey=cipher.unwrap(wrapedKey,"DES",Cipher.SECRET_KEY);

			cipher = Cipher.getInstance("DES","BC");
			cipher.init(Cipher.DECRYPT_MODE,desKey);					
			ApplySource as = (ApplySource) (encryptedSource.getObject(cipher));
			
			for(int x=0;x<12;x++)
			{
				System.out.print(as.source[x]+"  ");
			}
			System.out.println();
			System.out.println(as.applyPbk);
			System.out.println("Apply Time: "+as.daytime);
			boolean applyOk=ApplyDB.insert(as);
			oos.writeBoolean(applyOk);
			oos.flush();
		}
		catch(Exception ex)
		{
			System.out.println(ex); ex.printStackTrace();
		}
		finally
		{
			try{ client.close();} catch(Exception ex){}
		}
	}
}