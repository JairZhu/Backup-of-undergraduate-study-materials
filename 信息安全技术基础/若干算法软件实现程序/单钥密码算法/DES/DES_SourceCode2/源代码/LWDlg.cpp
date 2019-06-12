// LWDlg.cpp : implementation file
//

#include "stdafx.h"
#include "LW.h"
#include "LWDlg.h"

//#include "DES.cpp"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLWDlg dialog

CLWDlg::CLWDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLWDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLWDlg)
	m_C = _T("");
	m_Key = _T("");
	m_PlainText = _T("");
	m_Original = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CLWDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLWDlg)
	DDX_Text(pDX, IDC_C, m_C);
	DDX_Text(pDX, IDC_K, m_Key);
	DDV_MaxChars(pDX, m_Key, 8);
	DDX_Text(pDX, IDC_P, m_PlainText);
	DDX_Text(pDX, IDC_Original, m_Original);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CLWDlg, CDialog)
	//{{AFX_MSG_MAP(CLWDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_DecB, OnDecB)
	ON_BN_CLICKED(IDC_EncB, OnEncB)
	ON_BN_CLICKED(IDC_Exit, OnExit)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLWDlg message handlers

BOOL CLWDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_PlainText="abcdefgh";
	m_Key="abcdefgh";
	UpdateData(false);//今后注意，在初始化里改变默认设置，改完后一定要刷新
    


	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CLWDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CLWDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CLWDlg::OnDecB() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);
	initKey();
	
	des_dec( &dc, (unsigned char *)c, block );
    m_Original="";
	for(int i=0;i<8*block;i++)
		m_Original += c[i];

	UpdateData(false);	

}

void CLWDlg::OnEncB() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);
	initKey();//key
	int n=m_PlainText.GetLength();
	block=n/8+(n%8==0?0:1);

	CStringToUnsignedChar( m_PlainText,p );//P
	des_enc( &dc, (unsigned char *)p, block );

	for(int i=0;i<8*block;i++)
		c[i]=p[i];
	
	UnsignedCharToBinary( p,block, m_C );   

	UpdateData(false);

	
}
void CLWDlg::initKey()
{

	CStringToUnsignedChar( m_Key,Key );
	des_key(&dc,(unsigned char *)Key);//产生子密钥串

}
void CLWDlg::UnsignedCharToBinary(char *p ,int block,CString& s)
{
	
	int ch;
	int B[8]={1,2,4,8,16,32,64,128};
	s="";
	for(int i=0;i<8*block;i++)
	{	  
		ch=(int)p[i];		
	  for(int j=7;j>=0;j--)
	  {
		  //s += (char)( (ch&B[j])?31:30);//字符转化错误		 
		  s +=  (ch&B[j])?'1':'0';		 
	  }
	  //s.MakeReverse();	  
	  s+=" ";
	}

	return ;
}

void CLWDlg::CStringToUnsignedChar(CString CS, char *key)
{
	
	for(int i=0;i<CS.GetLength();i++)
	{
	  *key=CS.GetAt(i);	  
	  key++;
	}
	while (i%8!=0)
	{	
		*key=' ';
		key++;
		i++;
	}
	return ;
}
	
void CLWDlg::OnExit() 
{
	// TODO: Add your control notification handler code here
	exit(0);	
}
