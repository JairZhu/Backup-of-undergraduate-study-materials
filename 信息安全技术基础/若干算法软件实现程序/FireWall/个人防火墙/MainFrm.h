// MainFrm.h : interface of the CMainFrame class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_MAINFRM_H__D4F52F5F_ED8A_4DB8_86C7_E5E0A88D0924__INCLUDED_)
#define AFX_MAINFRM_H__D4F52F5F_ED8A_4DB8_86C7_E5E0A88D0924__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "winioctl.h"
#include "rules.h"
#include "ipFilter.h"

class CMainFrame : public CFrameWnd
{
	
protected: // create from serialization only
	CMainFrame();
	DECLARE_DYNCREATE(CMainFrame)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMainFrame)
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMainFrame();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  // control bar embedded members
	CStatusBar  m_wndStatusBar;
	CToolBar    m_wndToolBar;

	BOOL started;//标识过滤功能是否已经启动
	BOOL installed;//标识过滤规则是否已经被应用
	CIpFilter cIpFilter;//过滤器
	RuleInfo rule;//增加规则时,接收规则参数
	bool bAdded;//增加规则时,是否确实是已经增加了规则
	void OnIn();//增加对流入数据包的过滤规则
	void OnOut();//增加对流出数据包的过滤规则
// Generated message map functions
protected:

	//{{AFX_MSG(CMainFrame)
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnButtonstart();
	afx_msg void OnButtonadd();
	afx_msg void OnButtondel();
	afx_msg void OnButtondesinstall();
	afx_msg void OnButtoninstall();
	afx_msg void OnButtonstop();
	afx_msg void OnUpdateButtonstart(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtonstop(CCmdUI* pCmdUI);
	afx_msg void OnMenuAddrule();
	afx_msg void OnMenuDelrule();
	afx_msg void OnMenuInstallrules();
	afx_msg void OnMenuUninstallrules();
	afx_msg void OnMenustart();
	afx_msg void OnUpdateMenustart(CCmdUI* pCmdUI);
	afx_msg void OnMenustop();
	afx_msg void OnUpdateMenustop(CCmdUI* pCmdUI);
	afx_msg void OnAppExit();
	afx_msg void OnLoadRules();
	afx_msg void OnSaveRules();
	afx_msg void OnUpdateInstallrules(CCmdUI* pCmdUI);
	afx_msg void OnUpdateUninstallrules(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtondesinstall(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtoninstall(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtondel(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtonadd(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAINFRM_H__D4F52F5F_ED8A_4DB8_86C7_E5E0A88D0924__INCLUDED_)
