// RuleDlg.cpp : implementation file
//

#include "stdafx.h"
#include "FirewallApp.h"
#include "RuleDlg.h"
#include "util.h"

#include "rules.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRuleDlg dialog


CRuleDlg::CRuleDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRuleDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRuleDlg)
	m_portDestination = 0;
	m_action = _T("丢弃");
	m_protocol = _T("全部");
	//}}AFX_DATA_INIT
}


void CRuleDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRuleDlg)
	DDX_Control(pDX, IDC_IPADDRESS4, m_destMask);
	DDX_Control(pDX, IDC_IPADDRESS3, m_destIp);
	DDX_Text(pDX, IDC_EDIT4, m_portDestination);
	DDV_MinMaxUInt(pDX, m_portDestination, 0, 65535);
	DDX_CBString(pDX, IDC_COMBO3, m_action);
	DDX_CBString(pDX, IDC_COMBO4, m_protocol);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRuleDlg, CDialog)
	//{{AFX_MSG_MAP(CRuleDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRuleDlg message handlers

/**
 *	获取过滤规则
 *
 */
void CRuleDlg::OnOK() 
{
	UpdateData(TRUE);

	/*取得过滤规则的目标IP地址*/
	if(!m_destIp.IsBlank())
	{
		m_destIp.GetAddress(rule.destinationIp);
		/*从控件上取得的IP的内部表示与系统API使用的内部表示有所不同,
		  将取得IP内部表示转换为系统API使用的内部表示*/
		convertDWORD(&rule.destinationIp);
	}
	else rule.destinationIp = ALL_IP;//为空表示全部IP


	/*取得过滤规则的目标子网*/
	if(!m_destMask.IsBlank())
	{
		m_destMask.GetAddress(rule.destinationMask);
		convertDWORD(&rule.destinationMask);
	}
	else rule.destinationMask = ALL_MASK;//为空表示全部子网


	/*取得过滤规则的协议*/
	if(m_protocol == "TCP")
		rule.protocol = FILTER_PROTO_TCP;
	else if(m_protocol == "UDP")
		rule.protocol = FILTER_PROTO_UDP;
	else if(m_protocol == "ICMP")
		rule.protocol = FILTER_PROTO_ICMP;
	else
		rule.protocol = FILTER_PROTO_ANY;

	/*取得过滤规则的操作,目前本防火墙还没有支持该功能*/
	if(m_action == "")
	{
		AfxMessageBox("请选择操作");
		return;
	}
	else
	{
		if(m_action == "放行")
			rule.action = PF_ACTION_FORWARD;
		else
			rule.action = PF_ACTION_DROP;
	}

	/*过滤规则的目标端口*/
	rule.destinationPort = m_portDestination;

	/*最后标识这是流出数据包的过滤规则*/
	rule.bOut = true;
	
	CDialog::OnOK();
}
