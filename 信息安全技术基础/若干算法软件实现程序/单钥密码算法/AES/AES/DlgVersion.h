#if !defined(AFX_DLGVERSION_H__DBCE18F4_52D1_4A37_9470_D9D109DA53EB__INCLUDED_)
#define AFX_DLGVERSION_H__DBCE18F4_52D1_4A37_9470_D9D109DA53EB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgVersion.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgVersion dialog

class CDlgVersion : public CDialog
{
// Construction
public:
	CDlgVersion(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgVersion)
	enum { IDD = IDD_VERSION };
	CEdit	m_text;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgVersion)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgVersion)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGVERSION_H__DBCE18F4_52D1_4A37_9470_D9D109DA53EB__INCLUDED_)
