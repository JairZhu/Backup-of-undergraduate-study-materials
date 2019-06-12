#if !defined(AFX_CERSIGDLG_H__9F8BEB7C_0BC4_4399_AFC8_998D215C12DF__INCLUDED_)
#define AFX_CERSIGDLG_H__9F8BEB7C_0BC4_4399_AFC8_998D215C12DF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// CersigDlg.h : header file
//
#include "rsa.h"
/////////////////////////////////////////////////////////////////////////////
// CersigDlg dialog

class CersigDlg : public CDialog
{
// Construction
public:
	CersigDlg(CWnd* pParent = NULL);   // standard constructor
	CString m_strN;
	CBigInt uk;
	CBigInt n;
	CBigInt dig;
	CBigInt sig;
// Dialog Data
	//{{AFX_DATA(CersigDlg)
	enum { IDD = IDD_CERSIG };
	CString	m_strUK;
	CString	m_strF;
	CString	m_strS;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CersigDlg)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CersigDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnCersImuk();
	afx_msg void OnCersImf();
	afx_msg void OnCersImsig();
	afx_msg void OnCers();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CERSIGDLG_H__9F8BEB7C_0BC4_4399_AFC8_998D215C12DF__INCLUDED_)
