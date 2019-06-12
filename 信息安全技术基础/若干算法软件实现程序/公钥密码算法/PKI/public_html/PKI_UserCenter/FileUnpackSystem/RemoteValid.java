public class RemoteValid 
{
	String userFilename;
	String caFilename;
	int type;	//1:cer , 2:pkcs12
	public RemoteValid(String str1, String str2, int type)
	{
		userFilename=str1;
		caFilename=str2;
		this.type=type;
	}

	public int valid()	// return 0:ok,1:outOfDate,2:sign error,3:revocated,-1:other error
	{
		
	}
}