// warp_cDlg.h : header file
//

#if !defined(AFX_WARP_CDLG_H__2A278746_EF76_11D4_B45C_444553540000__INCLUDED_)
#define AFX_WARP_CDLG_H__2A278746_EF76_11D4_B45C_444553540000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CWarp_cDlg dialog

#ifndef __WARPDLL
#define __WARPDLL

#define PROGRESS_ALL_FINISHED 101
#define PROGRESS_WRITING_FINISHED 100

enum WarpStatues
{
	S_ALL_RIGHT=0,
	S_VERSION_NOT_MATCH,
	S_FILE_OPEN_ERROR,
	S_FILE_NAME_EMPTY,
	S_FILE_CORRUPTED,
	S_KEY_INCURRECT,
	S_WEAK_KEY,
	S_CANCELED
};

typedef struct
{
	CString szFileName;
	CString szKeys;
	bool bHalt;
	int iCompleteProgress;
	int statue;
}
WARPARAMS,*PWARPARAMS;
#endif

#define Msg_Title "Warp"
#define Msg_AllRight "Complete!"
#define Msg_VersionNotMatch "The version of \"warpdll.dll\" doesn't match the file you chose to decrypt. Please get the very \"warpdll.dll\" first."
#define Msg_FileOpenError "File open error! Maybe the file is read only."
#define Msg_FileNameEmpty "Please enter the file name you want to encrypt/decrypt."
#define Msg_FileCorrupted "The file you chose has been corrupted."
#define Msg_KeyIncurrect "Incurrect key. Please input the correct key."
#define Msg_WeakKey "Your key contains weak key that makes attack much easier. Please choose another key."

class CWarp_cDlg : public CDialog
{
// Construction
public:
	CWarp_cDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CWarp_cDlg)
	enum { IDD = IDD_WARP_C_DIALOG };
	CButton	m_cmdSpdTest;
	CButton	m_chkbtnExitWhenDone;
	CButton	m_cmdCancel;
	CButton	m_chkbtnShowPassword;
	CButton	m_optbtnWarp;
	CButton	m_optbtnUnwarp;
	CButton	m_cmdOpen;
	CEdit	m_txtKey;
	CEdit	m_txtFile;
	CEdit	m_txtConfirm;
	CProgressCtrl	m_Progress;
	CButton	m_cmdUnwarp;
	CButton	m_cmdWarp;
	CString	m_file;
	int		m_optUnwarp;
	int		m_optWarp;
	CString	m_Confirm;
	CString	m_Key;
	CString	m_DLLVersion;
	BOOL	m_chkShowPassword;
	BOOL	m_chkExitWhenDone;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWarp_cDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CWarp_cDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OncmdOpen();
	afx_msg void OnoptUnwarp();
	afx_msg void OnoptWarp();
	afx_msg void OncmdWarp();
	afx_msg void OncmdUnwarp();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnClose();
	afx_msg void OnDefault();
	afx_msg void OnShowpassword();
	afx_msg void OncmdCancel();
	afx_msg void OncmdSpeedTest();
	//}}AFX_MSG
	int Warp();
    int Unwarp();
	unsigned char ch;
	WARPARAMS params;
	UINT m_Timer;
	unsigned long handle;
	unsigned long hThreadHandler;
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WARP_CDLG_H__2A278746_EF76_11D4_B45C_444553540000__INCLUDED_)
