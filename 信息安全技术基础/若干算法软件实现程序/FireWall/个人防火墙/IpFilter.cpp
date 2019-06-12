// IpFilter.cpp: implementation of the CIpFilter class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallApp.h"
#include "IpFilter.h"
#include <stdlib.h>
#define  WIN32_LEAN_AND_MEAN
#include <windows.h>
#include "fltdefs.h"
#include "util.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CIpFilter::CIpFilter()
{
	bCreateInterfaceSuccess = false;
	ruleCount = 0;

	/* 创建一个根据过滤规则丢弃数据包的过滤接口 */
	DWORD retD = PfCreateInterface( 0, PF_ACTION_FORWARD, PF_ACTION_FORWARD,FALSE, TRUE, &drop );
    ///* 创建一个根据过滤规则放行数据包的过滤接口 */
	//DWORD retD = PfCreateInterface( 0, PF_ACTION_DROP, PF_ACTION_DROP,FALSE, FALSE, &drop );
	if(retD == NO_ERROR){
		bCreateInterfaceSuccess = true;
	}
	
	in_addr ip = GetLocalIP();
	localInAddr = ip.S_un.S_addr;
}

CIpFilter::~CIpFilter()
{
	if(bCreateInterfaceSuccess){
		PfDeleteInterface(drop);
	}
}

/**
 *	通过将过滤接口绑定到本地IP的方法使得过滤器发生作用
 *
 **/
bool CIpFilter::Filtering()
{
	DWORD retD = PfBindInterfaceToIPAddress(drop,PF_IPV4,(PBYTE) & localInAddr);
	return (retD == NO_ERROR);
}

/**
 *	通过将过滤接口取消与本地IP的绑定的方法使得过滤器不再发生作用
 *
 **/
bool CIpFilter::UnFiltering()
{
	DWORD retD = PfUnBindInterface(drop);
	return (retD == NO_ERROR );
}

/**
 *	向IP过滤器增加一条规则,先根据规则创建一个Filter描述子,
 *	然后把Filter描述子加入到与IP过滤器相关的Interface即可
 *
 **/
bool CIpFilter::AddRule(RuleInfo rule)
{
	PF_FILTER_DESCRIPTOR pf ;

	/* 创建Filter描述子 */
	pf.dwFilterFlags     = FD_FLAGS_NOSYN;
	int a = FD_FLAGS_NOSYN;
    pf.dwRule            = 0;
    pf.pfatType          = PF_IPV4;
    pf.fLateBound        = 0;
    pf.dwProtocol    = rule.protocol;
    pf.wSrcPort      = rule.sourcePort;
    pf.wDstPort      = rule.destinationPort;
	pf.SrcAddr		 = (PBYTE) & rule.sourceIp;
	pf.SrcMask       = (PBYTE) & rule.sourceMask;
	pf.DstAddr       = (PBYTE) & rule.destinationIp;
	pf.DstMask       = (PBYTE) & rule.destinationMask;
    pf.wSrcPortHighRange = pf.wSrcPort;
    pf.wDstPortHighRange = pf.wDstPort;

	DWORD ret;
	
	/* 根据规则过滤数据包的方向来把Filter描述子加入到Inteface中 */
	if(rule.bOut) ret = PfAddFiltersToInterface(drop,0,NULL,1,&pf,NULL);
	else ret = PfAddFiltersToInterface(drop,1,&pf,0,NULL,NULL);
	if(ret == NO_ERROR) ruleCount ++;
	return ret == NO_ERROR;
}


/**
 *	删除与指定规则相关的Interface 中的Filter描述子
 *
 **/
bool CIpFilter::DeleteRule(RuleInfo rule)
{	
	PF_FILTER_DESCRIPTOR pf ;

	/* 根据规则生成与该规则相应的Filter描述子*/
	pf.dwFilterFlags     = FD_FLAGS_NOSYN;
	int a = FD_FLAGS_NOSYN;
    pf.dwRule            = 0;
    pf.pfatType          = PF_IPV4;
    pf.fLateBound        = 0;
    pf.dwProtocol    = rule.protocol;
    pf.wSrcPort      = rule.sourcePort;
    pf.wDstPort      = rule.destinationPort;
	pf.SrcAddr		 = (PBYTE) & rule.sourceIp;
	pf.SrcMask       = (PBYTE) & rule.sourceMask;
	pf.DstAddr       = (PBYTE) & rule.destinationIp;
	pf.DstMask       = (PBYTE) & rule.destinationMask;
    pf.wSrcPortHighRange = pf.wSrcPort;
    pf.wDstPortHighRange = pf.wDstPort;


	DWORD ret;
	/* 根据规则过滤数据包的方向来删除Interface中与它相关的Filter描述子 */
	if(rule.bOut) ret = PfRemoveFiltersFromInterface(drop,0,NULL,1,&pf);
	else ret = PfRemoveFiltersFromInterface(drop,1,&pf,0,NULL);
	if(ret == NO_ERROR) ruleCount --;
	return ret == NO_ERROR;

}


/**
 *	通过释放与过滤器相关的Interface,
 *	再重新生成一个新的Interface,
 *	最后把新Interface过滤器关联起来,
 *	从而实现了清除所有过滤规则的功能
 *	
 **/
bool CIpFilter::ClearAllRules()
{
	bool result = false;
	DWORD retDD = PfDeleteInterface(drop);
	DWORD retDC = PfCreateInterface( 0, PF_ACTION_DROP, PF_ACTION_DROP,FALSE, TRUE, &drop );

	if(UnFiltering()
		&& retDD == NO_ERROR
		&& retDC == NO_ERROR){
		result = true;
	}
	return result;
}


/**
 *	通过Windows Socket来取得本地IP
 *
 **/
in_addr CIpFilter::GetLocalIP()
{
	WORD wVersionRequested;
	WSADATA wsaData;
	hostent* localHost;

	wVersionRequested = MAKEWORD( 2, 2 );
	WSAStartup( wVersionRequested, &wsaData );	
	localHost = gethostbyname("");	
	WSACleanup();
	
	in_addr* localIP = (struct in_addr *)localHost->h_addr_list[0];
	return *localIP;
}


/**
 *	调用API 取得与过滤器相关的Interface相关的状态数据
 *
 **/
PF_INTERFACE_STATS * CIpFilter::GetState()
{
	PF_INTERFACE_STATS * ret;
	DWORD size = 0, retFlag = 0;
	int x = sizeof(PF_INTERFACE_STATS);
	ret = (PF_INTERFACE_STATS *)new char[sizeof(PF_INTERFACE_STATS)];
	retFlag = PfGetInterfaceStatistics(drop,ret,&size,FALSE);
	if(retFlag != NO_ERROR)
	{
		/*重复一定的调用次数,以提供成功调用的概率*/
		for(int i = 0; i < 10; i ++){
			delete ret;
			ret = (PF_INTERFACE_STATS *)new char[size];
			retFlag = PfGetInterfaceStatistics(drop,ret,&size,FALSE);
			if(retFlag == NO_ERROR) break;
		}
		if(retFlag != NO_ERROR) return NULL;
	}
	return ret;
}

