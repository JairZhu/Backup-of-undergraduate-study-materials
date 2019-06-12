// rules.cpp: implementation of the RuleInfo class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallApp.h"
#include "rules.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

RuleInfo::RuleInfo()
{

}

RuleInfo::~RuleInfo()
{

}

/**
 *	过滤规则的赋值操作符
 *
 */
RuleInfo RuleInfo::operator = (const RuleInfo& src)
{
	this ->action = src.action;
	this ->bOut = src.bOut;
	this ->destinationIp = src.destinationIp;
	this ->destinationMask = src.destinationMask;
	this ->destinationPort = src.destinationPort;
	this ->protocol = src.protocol;
	this ->sourceIp = src.sourceIp;
	this ->sourceMask = src.sourceMask;
	this ->sourcePort = src.sourcePort;
	return *this;
}