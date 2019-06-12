// Util.cpp: implementation of the Util class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallApp.h"
#include "Util.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

/**
 *	将整个DWORD四个字节倒序重新安排
 *
 */
void convertDWORD(DWORD* dw)
{
	BYTE temp = 0;
	BYTE * a = (BYTE*)dw;

	temp = a[0];
	a[0] = a[3];
	a[3] = temp;

	temp = a[1];
	a[1] = a[2];
	a[2] = temp;
}

/**
 *	从DWORD中取得该IP相应的字符串
 *
 */
char * GetIP(DWORD in)
{
	in_addr ip;
	ip.S_un.S_un_b.s_b1 = ((char*)&in)[0];
	ip.S_un.S_un_b.s_b2 = ((char*)&in)[1];
	ip.S_un.S_un_b.s_b3 = ((char*)&in)[2];
	ip.S_un.S_un_b.s_b4 = ((char*)&in)[3];
	return inet_ntoa(ip);
}


/**
 * 从PBYTE中取得其相应的IP字符串
 *
 */
char * GetIP(PBYTE in)
{
	in_addr ip;
	ip.S_un.S_un_b.s_b1 = in[0];
	ip.S_un.S_un_b.s_b2 = in[1];
	ip.S_un.S_un_b.s_b3 = in[2];
	ip.S_un.S_un_b.s_b4 = in[3];
	return inet_ntoa(ip);
}