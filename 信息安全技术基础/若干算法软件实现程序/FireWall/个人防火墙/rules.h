// rules.h: interface for the RuleInfo class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_RULES_H__E17E8B01_BD09_4B6E_BF0B_41D33F3DCC4A__INCLUDED_)
#define AFX_RULES_H__E17E8B01_BD09_4B6E_BF0B_41D33F3DCC4A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
#include "Fltdefs.h"

class RuleInfo  
{
public:
	DWORD sourceIp;//过滤规则的源IP地址
	DWORD sourceMask;//过滤规则的源子网掩码
	WORD sourcePort;//过滤规则的源端口

	DWORD destinationIp;//过滤规则的目标IP地址
	DWORD destinationMask;//过滤规则的目标子网掩码
	WORD destinationPort;//过滤规则的目标端口

	DWORD protocol;//过滤规则的封包协议(即使用的网络协议)
	PFFORWARD_ACTION action;//过滤规则的操作,是丢包还转发
	bool bOut;//标识是否是流出数据包过滤规则
	
	RuleInfo operator = (const RuleInfo& src);//过滤规则的赋值操作符

	RuleInfo();
	virtual ~RuleInfo();

};

const DWORD ALL_IP = 0;
const DWORD ALL_MASK = 0xFFFFFFFF;

#endif // !defined(AFX_RULES_H__E17E8B01_BD09_4B6E_BF0B_41D33F3DCC4A__INCLUDED_)
