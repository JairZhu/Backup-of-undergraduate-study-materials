// IDEADlg.h : header file
//

#if !defined(AFX_IDEADLG_H__E0803CB9_0ADC_4B3B_8970_DFBA17EFCA8F__INCLUDED_)
#define AFX_IDEADLG_H__E0803CB9_0ADC_4B3B_8970_DFBA17EFCA8F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CIDEADlg dialog

class CIDEADlg : public CDialog
{
// Construction
public:
	unsigned short int mulInv(unsigned short int x);
	void DectoHex(unsigned short int *Y,CString outstr);
	void turn(unsigned short int *X,unsigned short int *Key,unsigned short int *Y);
	void generate(unsigned short int* k,unsigned short int* key);
	unsigned short int mul(unsigned short int a,unsigned short int b);
	CIDEADlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CIDEADlg)
	enum { IDD = IDD_IDEA_DIALOG };
	CEdit	m_code;
	CButton	m_cancel;
	CButton	m_ok;
	CEdit	m_key;
	CString	m_str;
	int		m_encrypt;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIDEADlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CIDEADlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_IDEADLG_H__E0803CB9_0ADC_4B3B_8970_DFBA17EFCA8F__INCLUDED_)
