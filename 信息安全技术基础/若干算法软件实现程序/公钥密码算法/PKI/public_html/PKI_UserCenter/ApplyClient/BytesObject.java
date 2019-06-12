public class BytesObject implements java.io.Serializable
{
	byte[] bytes=null;
	public BytesObject(int length,byte[] bs)
	{
		bytes=new byte[length];
		System.arraycopy(bs,0,bytes,0,bs.length);
	}
}