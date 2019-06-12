//spdtest.h
//Update: 2003.1.10
//Test a function' speed.

#pragma
#ifndef __SPDTEST
#define __SPDTEST
#ifndef __AFX_H__
#ifndef _WINDOWS_
#include <windows.h>
#endif
#endif
#include <iostream.h>

class SPDTEST_RSLT
{
public:
	friend ostream& operator << (ostream& stream, const SPDTEST_RSLT& obj);
	DWORD TimeUsedInMilliseconds;
	DWORD Times;
	bool bTestSucc;
};

ostream& operator << (ostream& stream, const SPDTEST_RSLT& obj)
{
	if (obj.bTestSucc)
	{
		stream << "time used (ms): " << obj.TimeUsedInMilliseconds << '\t' << "times: " 
			<< obj.Times << '\n';
		stream.precision(20);
		stream << "time used per call (ms): " << double(obj.TimeUsedInMilliseconds) / obj.Times 
			<< '\n';
	}
	else
		stream << "test failed\n";
	return stream;
}

SPDTEST_RSLT spdtest(void (*function)(void))
{
	DWORD times, oldtimes, i;
	DWORD TimeAdjustment, TimeIncrement;
	BOOL TimeAdjustmentDisabled;
	DWORD min;
	DWORD Interval = 0;
	DWORD starttime, endtime;
	SPDTEST_RSLT rslt;

	if (GetSystemTimeAdjustment(&TimeAdjustment, &TimeIncrement, &TimeAdjustmentDisabled))	
	{
		if(TimeAdjustmentDisabled)
			min = TimeAdjustment;
		else
			min = TimeAdjustment + TimeIncrement;
	}
	else
		min = 590000;
	min /= 10000;
	min <<= 4;
	for (oldtimes = 0, times = 1; Interval < min; times <<= 1)
	{
		if (oldtimes > times)
		{
			rslt.bTestSucc = false;
			return rslt;
		}
		starttime = GetTickCount();
		for (i = 0; i < times; i++)
			function();
		endtime = GetTickCount();
		if (endtime >= starttime)
			Interval = endtime - starttime;
		else
			Interval = 0xffffffff - starttime+endtime;
		oldtimes = times;
	}
	rslt.bTestSucc = true;
	rslt.Times = times;
	rslt.TimeUsedInMilliseconds = Interval;
	return	rslt;
}

#endif

