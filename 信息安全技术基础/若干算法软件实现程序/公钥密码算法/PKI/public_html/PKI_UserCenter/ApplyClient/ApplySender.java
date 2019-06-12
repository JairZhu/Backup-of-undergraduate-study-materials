import java.net.Socket;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
public class ApplySender
{
	static boolean send(String ip, int port, Object encryptedSource, byte[] wrapedKey)
	{
		boolean  check=false;
		Socket s=null;
		try{
			s=new Socket(ip,port);
			ObjectInputStream ois=new ObjectInputStream(s.getInputStream());
			ObjectOutputStream oos=new ObjectOutputStream(s.getOutputStream());
			oos.writeObject(encryptedSource);
			oos.writeObject(new BytesObject(wrapedKey.length,wrapedKey));
			oos.flush();
			boolean applyOk=ois.readBoolean();
			if(applyOk==true)
				check=true;
		}
		catch(Exception ex)
		{
			check=false;
		}
		finally
		{
			try{s.close();}catch(Exception ex){}
		}
		return check;
	}
}

