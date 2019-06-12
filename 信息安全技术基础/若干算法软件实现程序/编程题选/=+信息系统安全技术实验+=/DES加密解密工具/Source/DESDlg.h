// DESDlg.h : header file
//

#if !defined(AFX_DESDLG_H__137E469F_86A7_43A9_849D_F829379B33AC__INCLUDED_)
#define AFX_DESDLG_H__137E469F_86A7_43A9_849D_F829379B33AC__INCLUDED_

#include "BUTTONST\BtnST.h"	// Added by ClassView
#include "BUTTONST\ShadeButtonST.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CDESDlg dialog

class CDESDlg : public CDialog
{
// Construction
public:
	bool m_runable;
	int t1[65];    //用来存放IP逆置换后得到的密文
	int t3[65];    //用来存放IP逆置换后得到的解密后的原文
	void DES_DECIPHER();
	void DES_ENCIPHER();
	int K[17][49]; //子密钥
	int R0[33];    //用来存放右侧明文
	int L0[33];    //用来存放左侧明文
	void KEY_BIO();
	void SOURCE_BIO();
	long m_fSize;

	CDESDlg(CWnd* pParent = NULL);	// standard constructor
// Dialog Data
	//{{AFX_DATA(CDESDlg)
	enum { IDD = IDD_DES_DIALOG };
	CProgressCtrl	m_ctlProgress;
	CStatic	m_ctlText2;
	CStatic	m_ctlText;
	CString	m_StrKey;
	CString	m_strText;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDESDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDESDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnExit();
	afx_msg void OnExitbutton();
	afx_msg void OnAuthor();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnCipherbutton();
	afx_msg void OnDecipherbutton();
	afx_msg void OnClear();
	afx_msg void OnDefaultfill();
	afx_msg void OnShift();
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);
	afx_msg void OnSfileopen();
	afx_msg void OnCfileopen();
	afx_msg void OnSfilesave();
	afx_msg void OnMfilesave();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	void FileSOpen(CFileDialog &m_foDlg);
	void FileOpen(CFileDialog& m_foDlg);
	int Key[64];
	bool m_seeable;
	void DES_GenerateSubkey(int CE[],int DE[],int Cx[],int Dx[],
							int K[][49],int kn);
    void DES_ITERATIVE(int LE[],int RE[],int Lx[],int Rx[],
					   int sub_key[]);
	bool m_IsChinese;
	CString m_StrSource;
	CString m_StrDeciphered;
	CString m_StrCiphered;
	CBrush m_brush2;
	CShadeButtonST m_exitBtn;
	CFont m_font2;
	void setMyFont();
	CFont m_font;
	CBrush m_brush;
	CShadeButtonST m_encipherBtn;
	CShadeButtonST m_decipherIcon;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DESDLG_H__137E469F_86A7_43A9_849D_F829379B33AC__INCLUDED_)
