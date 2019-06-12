// LWDlg.h : header file
//

#if !defined(AFX_LWDLG_H__221EFDFC_1555_4A29_B254_0EE4D5B3D20F__INCLUDED_)
#define AFX_LWDLG_H__221EFDFC_1555_4A29_B254_0EE4D5B3D20F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef _DES_cpp
#define _DES_cpp
//#include "DES.cpp"

typedef struct {
		unsigned   long  ek[32];   // encrypt key
		unsigned   long  dk[32];   //
} des_ctx;
#endif
extern void des_key( des_ctx *, unsigned char *);
extern void deskey ( unsigned char *, short );
extern void des_enc(des_ctx *, unsigned char *, int );
extern void des_dec(des_ctx *, unsigned char *, int );

/////////////////////////////////////////////////////////////////////////////
// CLWDlg dialog

class CLWDlg : public CDialog
{
// Construction
public:
	CLWDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CLWDlg)
	enum { IDD = IDD_LW_DIALOG };
	CString	m_C;
	CString	m_Key;
	CString	m_PlainText;
	CString	m_Original;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLWDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	des_ctx dc;
	int block;
	char p[100];
	char c[100];
	char Key[8];
	void CStringToUnsignedChar(CString CS, char *);
	void UnsignedCharToBinary(char *ch ,int block,CString& );//二进制形式
	void initKey();

	// Generated message map functions
	//{{AFX_MSG(CLWDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnDecB();
	afx_msg void OnEncB();
	afx_msg void OnExit();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LWDLG_H__221EFDFC_1555_4A29_B254_0EE4D5B3D20F__INCLUDED_)
