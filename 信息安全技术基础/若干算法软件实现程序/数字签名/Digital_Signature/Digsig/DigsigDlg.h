// DigsigDlg.h : header file
//

#if !defined(AFX_DIGSIGDLG_H__9D40514B_01FA_40B9_87B1_B3E8E19CE3D6__INCLUDED_)
#define AFX_DIGSIGDLG_H__9D40514B_01FA_40B9_87B1_B3E8E19CE3D6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
//#include "Rsa.h"
#include "gensigdlg.h"
#include "genkeydlg.h"
#include "cersigdlg.h"
/////////////////////////////////////////////////////////////////////////////
// CDigsigDlg dialog

class CDigsigDlg : public CDialog
{
// Construction
public:
	CDigsigDlg(CWnd* pParent = NULL);	// standard constructor
	GenkeyDlg m_keydlg;
	GensigDlg m_sigdlg;
	CersigDlg m_cerdlg;
	void ShowTabWindow(int index);
	int index;
// Dialog Data
	//{{AFX_DATA(CDigsigDlg)
	enum { IDD = IDD_DIGSIG_DIALOG };
	CTabCtrl	m_formtab;
	CStatic	m_location;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDigsigDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDigsigDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnSelchangeFormtab(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIGSIGDLG_H__9D40514B_01FA_40B9_87B1_B3E8E19CE3D6__INCLUDED_)
