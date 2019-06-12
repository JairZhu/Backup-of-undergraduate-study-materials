// RuleInDlg.cpp : implementation file
//

#include "stdafx.h"
#include "FirewallApp.h"
#include "RuleInDlg.h"
#include "util.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRuleInDlg dialog


CRuleInDlg::CRuleInDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRuleInDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRuleInDlg)
	m_portsource = 0;
	m_action = _T("丢弃");
	m_protocol = _T("全部");
	//}}AFX_DATA_INIT
}


void CRuleInDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRuleInDlg)
	DDX_Control(pDX, IDC_IPADDRESS2, m_srcMask);
	DDX_Control(pDX, IDC_IPADDRESS1, m_srcIp);
	DDX_Text(pDX, IDC_EDIT2, m_portsource);
	DDV_MinMaxInt(pDX, m_portsource, 0, 65535);
	DDX_CBString(pDX, IDC_COMBO1, m_action);
	DDX_CBString(pDX, IDC_COMBO2, m_protocol);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRuleInDlg, CDialog)
	//{{AFX_MSG_MAP(CRuleInDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRuleInDlg message handlers

/**
 *	增加过滤规则
 *
 */
void CRuleInDlg::OnOK() 
{
	UpdateData(TRUE);
	
	/*取得规则的源IP*/
	if(!m_srcIp.IsBlank())
	{
		m_srcIp.GetAddress(rule.sourceIp);
		convertDWORD(&rule.sourceIp);
	}
	else rule.sourceIp = ALL_IP;
	
	/*取得规则的源子网*/
	if(!m_srcMask.IsBlank())
	{
		m_srcMask.GetAddress(rule.sourceMask);
		convertDWORD(&rule.sourceMask);
	}
	else rule.sourceMask = ALL_MASK;

	/*取得规则的协议*/
	if(m_protocol == "TCP")
		rule.protocol = FILTER_PROTO_TCP;
	else if(m_protocol == "UDP")
		rule.protocol = FILTER_PROTO_UDP;
	else if(m_protocol == "ICMP")
		rule.protocol = FILTER_PROTO_ICMP;
	else
		rule.protocol = FILTER_PROTO_ANY;

	/*以得规则相应的操作,目前本防火墙还没有支持该功能*/
	if(m_action == "")
	{
		AfxMessageBox("请选择操作");
		return;
	}
	else
	{
		if(m_action == "Forward")
			rule.action = PF_ACTION_FORWARD;
		else
			rule.action = PF_ACTION_DROP;
	}

	/*取得规则的源端口*/
	rule.sourcePort = m_portsource;

	/*最后标识是流入数据包过滤规则*/
	rule.bOut = false;
	
	CDialog::OnOK();
}
