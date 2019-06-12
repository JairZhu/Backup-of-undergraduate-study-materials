// AESDlg.h : header file
//

#if !defined(AFX_AESDLG_H__AAC812BA_AE98_4C04_AFAD_4B9DC8B8B96E__INCLUDED_)
#define AFX_AESDLG_H__AAC812BA_AE98_4C04_AFAD_4B9DC8B8B96E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

//数据类型的定义
typedef unsigned char   u1byte;
typedef unsigned short  u2byte;
typedef unsigned long   u4byte;
typedef signed char     s1byte;
typedef signed short    s2byte;
typedef signed long     s4byte;

//表达式的定义
#  include <stdlib.h>
#  pragma intrinsic(_lrotr,_lrotl)
#  define rotr(x,n) _lrotr(x,n)
#  define rotl(x,n) _lrotl(x,n)
#define byte(x,n)   ((u1byte)((x) >> (8 * n)))
#define	u4byte_in(x)		(*(u4byte*)(x))
#define	u4byte_out(x, v)	(*(u4byte*)(x) = (v)) 

#define TIME_SHOWPIC	1000
#define TIME_SHOWENDPIC	1000
//CEdit的限制是30000字节
#define TEXT_MAX		16*1024
#define SHOW_MAX		64
#define KEY_MAX			256
#define SFILENAME		"SourceFile.AES"
#define RFILENAME		"ResultFile.AES"
#define NUM_RAND1		10
#define NUM_RAND2		100
/*
明文长度必须是16字节的整数倍，不足的自动用0补足
*/
/////////////////////////////////////////////////////////////////////////////
// CAESDlg dialog

class CAESDlg : public CDialog
{
// Construction
public:
	void ClearAll(int x);
	int copyfile(char* sfilename, char* dfilename);
	void OnShowKey();
	void decrypt(const u1byte in_blk[16], u1byte out_blk[16]);
	void encrypt(const u1byte in_blk[16], u1byte out_blk[16]);
	void set_key(const u1byte in_key[], const u4byte key_len);
	void setposinit(int a, int b);
	void setpos(int pos);
	void show(char* str);
	CAESDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CAESDlg)
	enum { IDD = IDD_AES_DIALOG };
	CProgressCtrl	m_progress;
	CEdit	m_key;
	CEdit	m_time;
	CEdit	m_rshow;
	CEdit	m_sshow;
	CEdit	m_rtext;
	CEdit	m_stext;
	CEdit	m_rfile;
	CEdit	m_sfile;
	//}}AFX_DATA

	char sfilename[1024];
	char rfilename[1024];
	char soutfile[1024];
	char routfile[1024];
	//
	char stext[TEXT_MAX+1];
	char stext2[TEXT_MAX+1];
	char rtext[TEXT_MAX+1];
	char rtext2[8*TEXT_MAX+1];
	int scount;
	int rcount;	
	//
	char sshow[SHOW_MAX+1];
	char rshow[SHOW_MAX+1];
	//
	DWORD stime;
	DWORD etime;
	//
	int sflag;		//是否已经选择明文文件
	int rflag;		//是否已经选择密文文件
	int editflag;	//明文是否已经修改过
	int showflag;	//是否第一次显示进度
	//
	char key[KEY_MAX+1];
	int keylen;
	u1byte key128[KEY_MAX+1];
	u1byte key192[KEY_MAX+1];
	u1byte key256[KEY_MAX+1];	
	//
	u1byte s_blk[16];
	u1byte r_blk[16];

	//AES关键变量
	u4byte  k_len;
	u4byte  e_key[64];
	u4byte  d_key[64];

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAESDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CAESDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnInit();
	afx_msg void OnSBrowse();
	afx_msg void OnRBrowse();
	afx_msg void OnSOutput();
	afx_msg void OnROutput();
	afx_msg void OnEncrypt();
	afx_msg void OnDecrypt();
	afx_msg void OnSShowText();
	afx_msg void OnRShowText();
	afx_msg void OnSClear();
	afx_msg void OnStop();
	afx_msg void OnSetkey128();
	afx_msg void OnSetkey192();
	afx_msg void OnSetkey256();
	afx_msg void OnKillfocusEdit3();
	afx_msg void OnChangeEdit3();
	virtual void OnOK();
	afx_msg void OnRClear();
	afx_msg void OnShowVersion();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_AESDLG_H__AAC812BA_AE98_4C04_AFAD_4B9DC8B8B96E__INCLUDED_)
