// IpFilter.h: interface for the CIpFilter class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_IPFILTER_H__E3DA54F2_89B6_440E_855C_2C562BFBD1BA__INCLUDED_)
#define AFX_IPFILTER_H__E3DA54F2_89B6_440E_855C_2C562BFBD1BA__INCLUDED_

#include "rules.h"
#include "stdafx.h"

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CIpFilter  
{
public:
	CIpFilter();
	virtual ~CIpFilter();

	bool Filtering();//使IP过滤器起作用
	bool UnFiltering();//使IP过滤器不起作用
	bool AddRule(RuleInfo rule);//向IP过滤器增加过滤规则
	bool DeleteRule(RuleInfo rule);//从IP过滤器删除规则
	bool ClearAllRules();//清除IP过滤器中的所有过滤规则

	in_addr GetLocalIP();//用Windows Socket方法取得本地IP地址
	PF_INTERFACE_STATS * GetState();//取得IP过滤器的相关状态

	int ruleCount;//IP过滤器中的规则计数器
	DWORD localInAddr;//记录本地IP地址
protected:
//	void MakeFilter(RuleInfo rule,PF_FILTER_DESCRIPTOR* pf);

	INTERFACE_HANDLE drop;//与IP过滤器相关联的Interface
	bool bCreateInterfaceSuccess;//表示与IP过滤器相关联的Interface是否创建成功
};

#endif // !defined(AFX_IPFILTER_H__E3DA54F2_89B6_440E_855C_2C562BFBD1BA__INCLUDED_)
