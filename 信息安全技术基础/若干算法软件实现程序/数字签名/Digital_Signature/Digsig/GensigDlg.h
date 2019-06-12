#if !defined(AFX_GENSIGDLG_H__9F9698EB_8772_4DEE_9750_F00CF80795DE__INCLUDED_)
#define AFX_GENSIGDLG_H__9F9698EB_8772_4DEE_9750_F00CF80795DE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// GensigDlg.h : header file
//
#include "rsa.h"
/////////////////////////////////////////////////////////////////////////////
// GensigDlg dialog
class GensigDlg : public CDialog
{
// Construction
public:
	GensigDlg(CWnd* pParent = NULL);   // standard constructor
	CBigInt pk;
	CBigInt n;
	CBigInt dig;
	CBigInt sig;
	CString m_strN;
// Dialog Data
	//{{AFX_DATA(GensigDlg)
	enum { IDD = IDD_GENSIG };
	CString	m_strPK;
	CString	m_strF;
	CString	m_strS;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(GensigDlg)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(GensigDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnGensImpk();
	afx_msg void OnGensImf();
	afx_msg void OnGensig();
	afx_msg void OnGensSave();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GENSIGDLG_H__9F9698EB_8772_4DEE_9750_F00CF80795DE__INCLUDED_)
