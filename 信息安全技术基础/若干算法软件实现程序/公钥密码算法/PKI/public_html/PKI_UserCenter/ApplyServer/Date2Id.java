import java.util.Calendar;
class Date2Id 
{
	static long change(java.util.Date d)
	{
		Calendar calendar = new java.util.GregorianCalendar();
 		calendar.setTime(d);
		String year=String.valueOf(calendar.get(Calendar.YEAR));
		String month=changeNum(calendar.get(Calendar.MONTH)+1);
		String date=changeNum(calendar.get(Calendar.DATE));
		String hour=changeNum(calendar.get(Calendar.HOUR_OF_DAY));
		String minute=changeNum(calendar.get(Calendar.MINUTE));
		String second=changeNum(calendar.get(Calendar.SECOND));
		String millisecond=changeNum1(calendar.get(Calendar.MILLISECOND));
		String showtime=year+month+date+hour+minute+second+millisecond;
		return Long.parseLong(showtime);
	}

	static String changeNum(int v)
	{ 
		if(v<10) return "0"+v; else return String.valueOf(v);
	}
	static String changeNum1(int v)
	{ 
		if(v<10) return "00"+v; 
		else if(v>=10 && v<100) return "0"+v; 
		else return String.valueOf(v);
	}

}