// Util.h: interface for the Util class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_UTIL_H__5071ED4B_6B64_4036_B4AA_9C0C3212A240__INCLUDED_)
#define AFX_UTIL_H__5071ED4B_6B64_4036_B4AA_9C0C3212A240__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

void convertDWORD(DWORD* dw);//将DWORD的四个字节顺序颠倒
char * GetIP(DWORD in);//从DWORD中取得IP字符串
char * GetIP(PBYTE in);//从PBYTE指向的四个字节中取得IP字符串

#endif // !defined(AFX_UTIL_H__5071ED4B_6B64_4036_B4AA_9C0C3212A240__INCLUDED_)
