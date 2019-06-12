#if !defined(AFX_DLGENDBOX_H__9B0FFD4C_1389_4584_A1C2_CE1062E658EB__INCLUDED_)
#define AFX_DLGENDBOX_H__9B0FFD4C_1389_4584_A1C2_CE1062E658EB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEndBox.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEndBox dialog

class CDlgEndBox : public CDialog
{
// Construction
public:
	void OnStopTimer();
	void OnStartTimer();	

	int m_nTimer;

	CDlgEndBox(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEndBox)
	enum { IDD = IDD_ENDBOX };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEndBox)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEndBox)
	virtual void OnOK();
	virtual BOOL OnInitDialog();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGENDBOX_H__9B0FFD4C_1389_4584_A1C2_CE1062E658EB__INCLUDED_)
