import java.sql.*;
class ApplyDB 
{
	static boolean insert(ApplySource as) 
	{
		boolean flag=false;
		Connection conn=null;
		try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
		PreparedStatement pstmt=conn.prepareStatement("insert into [applytable] values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT)");
		pstmt.setLong(1,Date2Id.change(as.daytime));
		for(int x=2;x<14;x++)
			pstmt.setString(x,as.source[x-2]);
		pstmt.setBytes(14,as.applyPbk.getEncoded());
		pstmt.setString(15,as.daytime.toString());
		pstmt.executeUpdate();
		flag=true;
		}
		catch(Exception ex)
		{
			System.out.println(ex); ex.printStackTrace();
		}
		finally
		{
			try{ conn.close();}catch(Exception ex){}
		}
		return flag;
	}
}