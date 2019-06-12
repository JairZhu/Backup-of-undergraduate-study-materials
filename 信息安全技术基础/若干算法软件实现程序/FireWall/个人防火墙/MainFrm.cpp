// MainFrm.cpp : implementation of the CMainFrame class
//

#include "stdafx.h"
#include "FirewallApp.h"

#include "MainFrm.h"
#include "RuleDlg.h"
#include "FirewallAppDoc.h"
#include "FirewallAppView.h"
#include "rules.h"
#include "SelectDlg.h"
#include "ruleindlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
	//{{AFX_MSG_MAP(CMainFrame)
	ON_WM_CREATE()
	ON_COMMAND(ID_BUTTONSTART, OnButtonstart)
	ON_COMMAND(ID_BUTTONADD, OnButtonadd)
	ON_COMMAND(ID_BUTTONDEL, OnButtondel)
	ON_COMMAND(ID_BUTTONDESINSTALL, OnButtondesinstall)
	ON_COMMAND(ID_BUTTONINSTALL, OnButtoninstall)
	ON_COMMAND(ID_BUTTONSTOP, OnButtonstop)
	ON_UPDATE_COMMAND_UI(ID_BUTTONSTART, OnUpdateButtonstart)
	ON_UPDATE_COMMAND_UI(ID_BUTTONSTOP, OnUpdateButtonstop)
	ON_COMMAND(IDMENU_ADDRULE, OnMenuAddrule)
	ON_COMMAND(IDMENU_DELRULE, OnMenuDelrule)
	ON_COMMAND(IDMENU_INSTALLRULES, OnMenuInstallrules)
	ON_COMMAND(IDMENU_UNINSTALLRULES, OnMenuUninstallrules)
	ON_COMMAND(ID_MENUSTART, OnMenustart)
	ON_UPDATE_COMMAND_UI(ID_MENUSTART, OnUpdateMenustart)
	ON_COMMAND(ID_MENUSTOP, OnMenustop)
	ON_UPDATE_COMMAND_UI(ID_MENUSTOP, OnUpdateMenustop)
	ON_COMMAND(ID_APP_EXIT, OnAppExit)
	ON_COMMAND(IDMENU_LOADRULES, OnLoadRules)
	ON_COMMAND(IDMENU_SAVERULES, OnSaveRules)
	ON_UPDATE_COMMAND_UI(IDMENU_INSTALLRULES, OnUpdateInstallrules)
	ON_UPDATE_COMMAND_UI(IDMENU_UNINSTALLRULES, OnUpdateUninstallrules)
	ON_UPDATE_COMMAND_UI(ID_BUTTONDESINSTALL, OnUpdateButtondesinstall)
	ON_UPDATE_COMMAND_UI(ID_BUTTONINSTALL, OnUpdateButtoninstall)
	ON_UPDATE_COMMAND_UI(ID_BUTTONDEL, OnUpdateButtondel)
	ON_UPDATE_COMMAND_UI(ID_BUTTONADD, OnUpdateButtonadd)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

static UINT indicators[] =
{
	ID_SEPARATOR,           // status line indicator
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

/////////////////////////////////////////////////////////////////////////////
// CMainFrame construction/destruction

CMainFrame::CMainFrame()
{
	started = FALSE;
	installed = FALSE;
}

CMainFrame::~CMainFrame()
{
	
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	if (!m_wndToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC) ||
		!m_wndToolBar.LoadToolBar(IDR_MAINFRAME))
	{
		TRACE0("无法创建状态栏\n");
		return -1;      // fail to create
	}

	SetWindowText("个人防火墙");

	return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	if( !CFrameWnd::PreCreateWindow(cs) )
		return FALSE;


	//para quitar el untitled del titulo de la aplicacion
	cs.style &= ~ FWS_ADDTOTITLE;

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CMainFrame diagnostics

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CFrameWnd::AssertValid();
}

void CMainFrame::Dump(CDumpContext& dc) const
{
	CFrameWnd::Dump(dc);
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMainFrame message handlers

/**
 *	启动过滤功能
 *
 */
void CMainFrame::OnButtonstart() 
{
	if(cIpFilter.Filtering())
	{
		started = TRUE;
	}
}

/**
 *	停止过滤功能
 *
 */
void CMainFrame::OnButtonstop() 
{
	if(cIpFilter.UnFiltering())
	{
		started = FALSE;
	}
}

/**
 *	增加过滤规则
 *
 */
void CMainFrame::OnButtonadd() 
{
	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();
	CSelectDlg dlg;
	
	INT_PTR ret = dlg.DoModal();
	/*如果规则数目还没有达到最大值,可继续增加规则*/
	if(doc->nRules < MAX_RULES)
	{
		/*增加规则*/
		if( ret != IDCANCEL){
			/*增加流入数据包的过滤规则*/
			if(ret == IDC_IN){
				OnIn();
			}
			/*增加流出数据的过滤规则*/
			else if(ret == IDC_OUT){
				OnOut();
			}
			/*确定存在增加的过滤规则时的处理,*/
			if(bAdded){
				if(!doc->AddRule(rule))
					AfxMessageBox("添加过滤规则出错");
				else
				{
					CFirewallAppView *view = (CFirewallAppView *)GetActiveView();
					view->UpdateList();
					if(installed) cIpFilter.AddRule(rule);
				}
			}
		}
	}

	else
		AfxMessageBox("过滤规则数目已经达到最大值");
}

/**
 *	删除规则列表中被选中的规则
 *
 */
void CMainFrame::OnButtondel() 
{
	CFirewallAppView *view = (CFirewallAppView *)GetActiveView();

	POSITION pos = view->m_rules.GetFirstSelectedItemPosition();
	if (pos == NULL)
	{
		AfxMessageBox("请选择一条过滤规则");
		return;
	}
	
	/*取得要删除的规则的下标*/
	int position;
	position = view->m_rules.GetNextSelectedItem(pos);

	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();
	
	/*如果规则已经被应用在过滤器上,则在过滤器中删除该规则,同时更新规则的内部表示及界面*/
	if(installed)
	{
		if(cIpFilter.DeleteRule(doc->rules[position]))
		{
			doc->DeleteRule(position);	
			view->UpdateList();
		}
	}
	else 
	{
		doc->DeleteRule(position);	
		view->UpdateList();
	}

}


/**
 *	把已经定义好的规则应用到过滤器上
 *
 */
void CMainFrame::OnButtoninstall() 
{
	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();

	unsigned int i;

	if(doc->nRules > 0){
		for(i=0;i<doc->nRules;i++)
		{
			/*把规则逐条应用到过滤器上*/
			if (!cIpFilter.AddRule(doc->rules[i])){
				AfxMessageBox("无法应用过滤规则");
				return ;
			}
		}	
		installed = TRUE;//最后标识规则已经应用到过滤器上
	}
}

/**
 *	将应用在过滤器上的规则不发生作用
 *
 */
void CMainFrame::OnButtondesinstall() 
{
	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();
	for(unsigned int i = 0; i < doc -> nRules; i ++){
		/*把规则逐条从与过滤器相关的Interface上删除*/
		if(!cIpFilter.DeleteRule(doc -> rules[i])){
			AfxMessageBox("无法停用过滤规则");
			return ;		
		}
	}
	installed = FALSE;	//最后标识规则没有被应用在过滤器上
}

/**
 *
 *
 */
void CMainFrame::OnUpdateButtonstart(CCmdUI* pCmdUI) 
{
	if(started)
		pCmdUI->Enable(FALSE);
	else
		pCmdUI->Enable(TRUE);	
}

/**
 *
 *
 */
void CMainFrame::OnUpdateButtonstop(CCmdUI* pCmdUI) 
{
	if(started)
		pCmdUI->Enable(TRUE);

	else
		pCmdUI->Enable(FALSE);
}

/**
 *
 *
 */
void CMainFrame::OnMenuAddrule() 
{
	OnButtonadd();	
}

/**
 *
 *
 */
void CMainFrame::OnMenuDelrule() 
{
	OnButtondel();	
}

/**
 *
 *
 */
void CMainFrame::OnMenuInstallrules() 
{
	OnButtoninstall();
}

/**
 *
 *
 */
void CMainFrame::OnMenuUninstallrules() 
{
	OnButtondesinstall();
	
}

/**
 *
 *
 */
void CMainFrame::OnMenustart() 
{
	OnButtonstart();
}

/**
 *
 *
 */
void CMainFrame::OnUpdateMenustart(CCmdUI* pCmdUI) 
{
	if(started)
		pCmdUI->Enable(FALSE);

	else
		pCmdUI->Enable(TRUE);	
	
}

/**
 *
 *
 */
void CMainFrame::OnMenustop() 
{
	OnButtonstop();
}

/**
 *
 *
 */
void CMainFrame::OnUpdateMenustop(CCmdUI* pCmdUI) 
{
	if(started)
		pCmdUI->Enable(TRUE);

	else
		pCmdUI->Enable(FALSE);
	
}

/**
 *
 *
 */
void CMainFrame::OnAppExit() 
{

}

/**
 *
 *
 */
void CMainFrame::OnLoadRules() 
{
	CFile file;
	CFileException e;
	DWORD nRead;

	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();

	CFileDialog dg(TRUE,NULL, NULL, OFN_HIDEREADONLY | OFN_CREATEPROMPT,"Rule Files(*.rul)|*.rul|all(*.*)|*.*||", NULL);
	if(dg.DoModal()==IDCANCEL)
		return;
	
	CString nf=dg.GetPathName();

	if(nf.GetLength() == 0)
	{
		AfxMessageBox("文件名无效");

		return;
	}

	if( !file.Open(nf, CFile::modeRead, &e ) )
	{
		AfxMessageBox("打开文件出错");

		return;
	}

	doc->ResetRules();
	RuleInfo rule;
	
    do
    {
 		nRead = file.Read(&rule, sizeof(RuleInfo));
		
		if(nRead == 0)
			break;

		if(!doc->AddRule(rule))
		{
			AfxMessageBox("添加过滤规则出错");
			break;
		}

    }while (1);
		
	CFirewallAppView *view = (CFirewallAppView *)GetActiveView();

	view->UpdateList();
	OnButtoninstall();
	OnButtonstart();
}

/**
 *
 *
 */
void CMainFrame::OnSaveRules() 
{
	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();

	if(doc->nRules == 0)
	{
		AfxMessageBox("无过滤规则");

		return;
	}


	CFileDialog dg(FALSE, NULL, NULL, OFN_HIDEREADONLY | OFN_CREATEPROMPT,"Rule Files(*.rul)|*.rul|all(*.*)|*.*||", NULL);
	if(dg.DoModal()==IDCANCEL)
		return;
	
	CString nf=dg.GetPathName();

	if(nf.GetLength() == 0)
	{
		AfxMessageBox("文件名无效");

		return;
	}

	CFile file;
	CFileException e;
	nf +=".rul";
	
	if( !file.Open( nf, CFile::modeCreate | CFile::modeWrite, &e ) )
	{
		AfxMessageBox("文件打开出错");

		return;
	}


	unsigned int i;

	for(i=0;i<doc->nRules;i++)
	{
		file.Write(&doc->rules[i], sizeof(RuleInfo));
	}
	
	file.Close();
}

/**
 *
 *
 */
void CMainFrame::OnUpdateInstallrules(CCmdUI* pCmdUI) 
{
	if(installed) 
		pCmdUI ->Enable(FALSE);
	else 
		pCmdUI ->Enable(TRUE);
}

/**
 *
 *
 */
void CMainFrame::OnUpdateUninstallrules(CCmdUI* pCmdUI) 
{
	if(installed)
		pCmdUI ->Enable(TRUE);
	else 
		pCmdUI ->Enable(FALSE);
}

/**
 *
 *
 */
void CMainFrame::OnUpdateButtondesinstall(CCmdUI* pCmdUI) 
{
	if(installed)
		pCmdUI ->Enable(TRUE);
	else 
		pCmdUI ->Enable(FALSE);
	
}

/**
 *
 *
 */
void CMainFrame::OnUpdateButtoninstall(CCmdUI* pCmdUI) 
{
	if(installed) 
		pCmdUI ->Enable(FALSE);
	else 
		pCmdUI ->Enable(TRUE);
	
}

/**
 *
 *
 */
void CMainFrame::OnUpdateButtondel(CCmdUI* pCmdUI) 
{
	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();
	if(doc ->nRules > 0)
		pCmdUI ->Enable(TRUE);
	else 
		pCmdUI -> Enable(FALSE);
}

/**
 *
 *
 */
void CMainFrame::OnUpdateButtonadd(CCmdUI* pCmdUI) 
{
	CFirewallAppDoc *doc = (CFirewallAppDoc *)GetActiveDocument();
	if(doc ->nRules == MAX_RULES)
		pCmdUI ->Enable(FALSE);
	else pCmdUI ->Enable(TRUE);
}

/**
 *
 *
 */
void CMainFrame::OnIn() 
{
	CRuleInDlg dlg;
	if(dlg.DoModal() == IDOK)
	{		
		rule = dlg.rule;
		rule.destinationIp = cIpFilter.localInAddr;
		rule.destinationMask = ALL_MASK;
		rule.destinationPort = rule.sourcePort;
		bAdded = true;
	} else bAdded = false;
}

/**
 *
 *
 */
void CMainFrame::OnOut() 
{
	CRuleDlg dlg;	
	if(dlg.DoModal() == IDOK)
	{
		rule = dlg.rule;
		rule.sourceIp = cIpFilter.localInAddr;
		rule.sourceMask = ALL_MASK;
		rule.sourcePort = rule.destinationPort;
		bAdded = true;
	} else bAdded = false;	
}
