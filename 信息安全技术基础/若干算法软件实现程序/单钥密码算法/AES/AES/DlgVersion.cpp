// DlgVersion.cpp : implementation file
//

#include "stdafx.h"
#include "AES.h"
#include "DlgVersion.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgVersion dialog


CDlgVersion::CDlgVersion(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgVersion::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgVersion)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgVersion::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgVersion)
	DDX_Control(pDX, IDC_EDIT1, m_text);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgVersion, CDialog)
	//{{AFX_MSG_MAP(CDlgVersion)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgVersion message handlers
/*
程序使用说明：
加密：
(1) 按“选择明文”选择一个明文文件。
    也可以在“明文”窗口中输入明文，按“输出到文件”可以保存。
(2) 按“128位密钥”或者“192位密钥”或者“256位密钥”选择密钥。
(3) 按“加密”开始进行加密。
(4) 加密过程将有进度显示。
(5) 加密完成后，“密文”窗口将显示加密后的结果。
(6) 加密的结果是用01方式表示的，按“输出到文件”可以保存。
解密：
(1) 按“选择密文”选择一个密文文件。
(2) 按“128位密钥”或者“192位密钥”或者“256位密钥”选择密钥。
(3) 按“解密”开始进行解密。
(4) 解密过程将有进度显示。
(5) 解密完成后，“明文”窗口将显示解密后的结果。
(6) 解密的结果是用文本方式表示的，按“输出到文件”可以保存。
版权声明：
    本程序源代码的修改权、发放权归指导老师所有。
*/
BOOL CDlgVersion::OnInitDialog() 
{
	char str[10240];
	char* s1="程序使用说明：";
	char* s2="加密：";
	char* s3="(1) 按“选择明文”选择一个明文文件。";
	char* s4="    也可以在“明文”窗口中输入明文，按“输出到文件”可以保存。";
	char* s5="(2) 按“128位密钥”或者“192位密钥”或者“256位密钥”选择密钥。";
	char* s6="(3) 按“加密”开始进行加密。";
	char* s7="(4) 加密过程将有进度显示。";
	char* s8="(5) 加密完成后，“密文”窗口将显示加密后的结果。";
	char* s9="(6) 加密的结果是用01方式表示的，按“输出到文件”可以保存。";
	char* s10="解密：";
	char* s11="(1) 按“选择密文”选择一个密文文件。";
	char* s12="(2) 按“128位密钥”或者“192位密钥”或者“256位密钥”选择密钥。";
	char* s13="(3) 按“解密”开始进行解密。";
	char* s14="(4) 解密过程将有进度显示。";
	char* s15="(5) 解密完成后，“明文”窗口将显示解密后的结果。";
	char* s16="(6) 解密的结果是用文本方式表示的，按“输出到文件”可以保存。";
	char* s17="版权声明：";
    char* s18="    本程序源代码的修改权、发放权归指导老师所有。";	
	//
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	sprintf(str, "%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n%s\r\n",s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18);
	
	//
	m_text.SetWindowText(str);
	m_text.UpdateWindow();
	//
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
