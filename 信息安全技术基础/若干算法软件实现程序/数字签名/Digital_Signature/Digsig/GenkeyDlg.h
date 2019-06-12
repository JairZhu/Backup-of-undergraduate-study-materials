#if !defined(AFX_GENKEYDLG_H__1B88BC54_7B62_44C1_9774_FEFE52E6269A__INCLUDED_)
#define AFX_GENKEYDLG_H__1B88BC54_7B62_44C1_9774_FEFE52E6269A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// GenkeyDlg.h : header file
//
#include "rsa.h"
/////////////////////////////////////////////////////////////////////////////
// GenkeyDlg dialog

class GenkeyDlg : public CDialog
{
// Construction
public:
	GenkeyDlg(CWnd* pParent = NULL);   // standard constructor
	CRsa genkey;
	CBigInt n;
	CBigInt e;
	CBigInt d;
// Dialog Data
	//{{AFX_DATA(GenkeyDlg)
	enum { IDD = IDD_GENKEY };
	CString	m_strN;
	CString	m_strD;
	CString	m_strE;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(GenkeyDlg)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(GenkeyDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnGenkey();
	afx_msg void OnSavePk();
	afx_msg void OnSaveUk();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GENKEYDLG_H__1B88BC54_7B62_44C1_9774_FEFE52E6269A__INCLUDED_)
