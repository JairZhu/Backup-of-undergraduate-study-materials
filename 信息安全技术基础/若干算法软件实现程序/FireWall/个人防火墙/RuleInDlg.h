#if !defined(AFX_RULEINDLG_H__8143FBD3_10B1_4DBB_8D47_05342C907292__INCLUDED_)
#define AFX_RULEINDLG_H__8143FBD3_10B1_4DBB_8D47_05342C907292__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RuleInDlg.h : header file
//
#include "rules.h"

/////////////////////////////////////////////////////////////////////////////
// CRuleInDlg dialog

class CRuleInDlg : public CDialog
{
// Construction
public:
	CRuleInDlg(CWnd* pParent = NULL);   // standard constructor
	
	RuleInfo rule;

// Dialog Data
	//{{AFX_DATA(CRuleInDlg)
	enum { IDD = IDD_IN };
	CIPAddressCtrl	m_srcMask;
	CIPAddressCtrl	m_srcIp;
	int		m_portsource;
	CString	m_action;
	CString	m_protocol;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRuleInDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CRuleInDlg)
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RULEINDLG_H__8143FBD3_10B1_4DBB_8D47_05342C907292__INCLUDED_)
