package ApplyBeans;

import java.sql.*;
import java.util.Vector;

public class ApplyBrowser
{
	Connection conn=null;
	ResultSet rsCN=null,rsPosition=null,rsOU=null,rsO=null,rsL=null,rsST=null,rsC=null,rsDate=null;
	public Vector vCN=new Vector(),vPosition=new Vector(),vOU=new Vector(),vO=new Vector(),
			vL=new Vector(),vST=new Vector(),vC=new Vector(),vDate=new Vector();
	public Exception  exstr=null;
	Statement stmt=null;
	public boolean browse()
	{
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
			stmt=conn.createStatement();
			rsCN=stmt.executeQuery("select distinct applyCN from applytable");
			while(rsCN.next())
				vCN.add(new String(rsCN.getString(1)));
			rsPosition=stmt.executeQuery("select distinct applyPosition from applytable");
			while(rsPosition.next())
				vPosition.add(new String(rsPosition.getString(1)));			
			rsO=stmt.executeQuery("select distinct applyO from applytable");
			while(rsO.next())
				vO.add(new String(rsO.getString(1)));
			rsOU=stmt.executeQuery("select distinct applyOU from applytable");
			while(rsOU.next())
				vOU.add(new String(rsOU.getString(1)));
			rsL=stmt.executeQuery("select distinct applyL from applytable");
			while(rsL.next())
				vL.add(new String(rsL.getString(1)));
			rsST=stmt.executeQuery("select distinct applyST from applytable");
			while(rsST.next())
				vST.add(new String(rsST.getString(1)));
			rsC=stmt.executeQuery("select distinct applyC from applytable");
			while(rsC.next())
				vC.add(new String(rsC.getString(1)));
			rsDate=stmt.executeQuery("select distinct applyDate from applytable");
			while(rsDate.next())
				vDate.add(new String(rsDate.getString(1)));
			
			try{ conn.close();}catch(Exception ex2){}
			return true;
		}
		catch(Exception ex)
		{
			try{ conn.close();}catch(Exception ex2){}
			exstr=ex;
			return false;
		}
	}
}