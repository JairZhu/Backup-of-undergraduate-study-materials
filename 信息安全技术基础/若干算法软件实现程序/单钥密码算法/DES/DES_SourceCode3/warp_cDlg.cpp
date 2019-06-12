// warp_cDlg.cpp : implementation file
//

#include "stdafx.h"
#include "warp_c.h"
#include "warp_cDlg.h"
#include "StringTo.h"
#include "warpdll.h"
#include "spdtest.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

unsigned long S_Box_ID_For_Test;

DWORD ldata = 123456789, rdata =987654321;
DWORD lkey = 123456, rkey = 654321;
DWORD lexkey = 0xffff, rexkey = 0xaaaaaaaa;


/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWarp_cDlg dialog

CWarp_cDlg::CWarp_cDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CWarp_cDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CWarp_cDlg)
	m_file = _T("");
	m_optUnwarp = -1;
	m_optWarp = -1;
	m_Confirm = _T("");
	m_Key = _T("");
	m_DLLVersion = _T("");
	m_chkShowPassword = FALSE;
	m_chkExitWhenDone = FALSE;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CWarp_cDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CWarp_cDlg)
	DDX_Control(pDX, IDC_cmdSpeedTest, m_cmdSpdTest);
	DDX_Control(pDX, IDC_chkExitWhenDone, m_chkbtnExitWhenDone);
	DDX_Control(pDX, IDC_cmdCancel, m_cmdCancel);
	DDX_Control(pDX, IDC_SHOWPASSWORD, m_chkbtnShowPassword);
	DDX_Control(pDX, IDC_optWarp, m_optbtnWarp);
	DDX_Control(pDX, IDC_optUnwarp, m_optbtnUnwarp);
	DDX_Control(pDX, IDC_cmdOpen, m_cmdOpen);
	DDX_Control(pDX, IDC_txtKey, m_txtKey);
	DDX_Control(pDX, IDC_txtFile, m_txtFile);
	DDX_Control(pDX, IDC_txtConfirm, m_txtConfirm);
	DDX_Control(pDX, IDC_PROGRESS1, m_Progress);
	DDX_Control(pDX, IDC_cmdUnwarp, m_cmdUnwarp);
	DDX_Control(pDX, IDC_cmdWarp, m_cmdWarp);
	DDX_Text(pDX, IDC_txtFile, m_file);
	DDX_Radio(pDX, IDC_optWarp, m_optWarp);
	DDX_Text(pDX, IDC_txtConfirm, m_Confirm);
	DDV_MaxChars(pDX, m_Confirm, 27);
	DDX_Text(pDX, IDC_txtKey, m_Key);
	DDV_MaxChars(pDX, m_Key, 27);
	DDX_Text(pDX, IDC_DLLVersion, m_DLLVersion);
	DDX_Check(pDX, IDC_SHOWPASSWORD, m_chkShowPassword);
	DDX_Check(pDX, IDC_chkExitWhenDone, m_chkExitWhenDone);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CWarp_cDlg, CDialog)
	//{{AFX_MSG_MAP(CWarp_cDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_cmdOpen, OncmdOpen)
	ON_BN_CLICKED(IDC_optUnwarp, OnoptUnwarp)
	ON_BN_CLICKED(IDC_optWarp, OnoptWarp)
	ON_BN_CLICKED(IDC_cmdWarp, OncmdWarp)
	ON_BN_CLICKED(IDC_cmdUnwarp, OncmdUnwarp)
	ON_WM_TIMER()
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_DEFAULT, OnDefault)
	ON_BN_CLICKED(IDC_SHOWPASSWORD, OnShowpassword)
	ON_BN_CLICKED(IDC_cmdCancel, OncmdCancel)
	ON_BN_CLICKED(IDC_cmdSpeedTest, OncmdSpeedTest)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWarp_cDlg message handlers

BOOL CWarp_cDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	m_optWarp = 0;
	m_optUnwarp = 1;
	m_cmdUnwarp.ShowWindow(false);
	m_cmdCancel.ShowWindow(false);
	m_Progress.SetRange(0, 100);
	m_Progress.SetStep(1);
	m_chkShowPassword = false;
	m_txtKey.SetPasswordChar('*');
	m_txtConfirm.SetPasswordChar('*');
	m_txtKey.GetPasswordChar();
	m_txtConfirm.GetPasswordChar();
	char temp[6];
	CString szVersionL,szVersionR,szDot;
	szDot = ".";
	ltoa(Version() >> 16, temp, 10);
	szVersionL = temp;
	ltoa(Version() & 65535, temp, 10);
	szVersionR = temp;
	m_DLLVersion = _T("DLL Version: ") + szVersionL + szDot + szVersionR;
	handle = -1;
	this->UpdateData(false);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CWarp_cDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CWarp_cDlg::OnPaint() 
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
HCURSOR CWarp_cDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CWarp_cDlg::OncmdOpen() 
{
	// TODO: Add your control notification handler code here
	CFileDialog filedialog(true);
	filedialog.DoModal();
	params.szFileName = filedialog.GetPathName();
	m_file = params.szFileName;
	this->UpdateData(false);
}

void CWarp_cDlg::OnoptUnwarp() 
{
	// TODO: Add your control notification handler code here
	m_optUnwarp = 0;
	m_optWarp = 1;
	m_cmdWarp.ShowWindow(false);
	m_cmdUnwarp.ShowWindow(true);
	m_txtConfirm.EnableWindow(false);
	//UpdateData(false);
}

void CWarp_cDlg::OnoptWarp() 
{
	// TODO: Add your control notification handler code here
	m_optUnwarp = 1;
	m_optWarp = 0;
	m_cmdUnwarp.ShowWindow(false);
	m_cmdWarp.ShowWindow(true);
	m_txtConfirm.EnableWindow(true);
	//UpdateData(false);
}

void CWarp_cDlg::OncmdWarp() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);
	if (m_file == "")
	{
		MessageBox(TEXT("Please input a file path or select a file from the ""File Open Dialog Box"" by clicking the button ""Open"""), 
			TEXT(Msg_Title));
		return;
	}
	if (m_Confirm == "" && (!m_chkShowPassword))
	{
		MessageBox(TEXT("Please confirm your codes."), 
			TEXT(Msg_Title));
		return;
	}
	if (m_Key != m_Confirm&&(!m_chkShowPassword))
	{
		MessageBox(TEXT("Codes are different!"), 
			TEXT(Msg_Title));
		return;
	}
	params.szFileName = m_file;
	params.szKeys = m_Key;
	Warp();
}

void CWarp_cDlg::OncmdUnwarp() 
{
	// TODO: Add your control notification handler code here
	UpdateData(true);
	if (m_file == "")
	{
		MessageBox(TEXT("Please input a file path or select a file from the \"File Open Dialog Box\" by clicking the button \"Open\"."), 
			TEXT(Msg_Title));
		return;
	}
	params.szFileName = m_file;
	params.szKeys = m_Key;
	Unwarp();
}

int CWarp_cDlg::Warp()
{
	m_txtFile.EnableWindow(false);
	m_txtKey.EnableWindow(false);
	m_txtConfirm.EnableWindow(false);
	m_cmdOpen.EnableWindow(false);
	m_cmdWarp.EnableWindow(false);
	m_cmdUnwarp.EnableWindow(false);
	m_cmdSpdTest.EnableWindow(false);
	m_cmdCancel.ShowWindow(true);
	m_optbtnWarp.EnableWindow(false);
	m_optbtnUnwarp.EnableWindow(false);
	m_chkbtnShowPassword.EnableWindow(false);
	m_chkbtnExitWhenDone.EnableWindow(false);
	params.iCompleteProgress = 0;
	params.bHalt = false;
	handle = ThreadEncrypt(&params);
	m_Progress.SetPos(0);
	m_Progress.ShowWindow(true);
	m_Timer = SetTimer(1, 100, NULL);
	return 0;
}

int CWarp_cDlg::Unwarp()
{
	this->UpdateData(true);
	m_txtFile.EnableWindow(false);
	m_txtKey.EnableWindow(false);
	m_txtConfirm.EnableWindow(false);
	m_cmdOpen.EnableWindow(false);
	m_cmdWarp.EnableWindow(false);
	m_cmdUnwarp.EnableWindow(false);
	m_cmdSpdTest.EnableWindow(false);
	m_cmdCancel.ShowWindow(true);
	m_optbtnWarp.EnableWindow(false);
	m_optbtnUnwarp.EnableWindow(false);
	m_chkbtnShowPassword.EnableWindow(false);
	m_chkbtnExitWhenDone.EnableWindow(false);
	params.bHalt = false;
	params.iCompleteProgress = 0;
	handle = ThreadDecrypt(&params);
	m_Progress.SetPos(0);
	m_Progress.ShowWindow(true);
	m_Timer = SetTimer(1, 100, NULL);
	return 0;
}

void CWarp_cDlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	if (params.iCompleteProgress == PROGRESS_ALL_FINISHED)
	{
		KillTimer(m_Timer);
		params.iCompleteProgress = 0;
		m_Progress.ShowWindow(false);
		m_Progress.SetPos(0);
		switch (params.statue)
		{	
		case S_ALL_RIGHT:
			if (m_chkExitWhenDone)
			{
				OnClose();
				this->DestroyWindow();
			}
			else
			{
				m_Progress.SetPos(100);
				m_Progress.ShowWindow(true);
				MessageBox(TEXT(Msg_AllRight),TEXT(Msg_Title));
				m_Progress.SetPos(0);
				m_Progress.ShowWindow(false);
			}
			break;
		case S_VERSION_NOT_MATCH:
			MessageBox(TEXT(Msg_VersionNotMatch),
				TEXT(Msg_Title));
			break;
		case S_FILE_OPEN_ERROR:
			MessageBox(TEXT(Msg_FileOpenError),
				TEXT(Msg_Title));
			break;
		case S_FILE_NAME_EMPTY:
			MessageBox(TEXT(Msg_FileNameEmpty),
				TEXT(Msg_Title));
			break;
		case S_FILE_CORRUPTED:
			MessageBox(TEXT(Msg_FileCorrupted),
				TEXT(Msg_Title));
			break;
		case S_KEY_INCURRECT:
			MessageBox(TEXT(Msg_KeyIncurrect),
				TEXT(Msg_Title));
			break;
		case S_WEAK_KEY:
			MessageBox(TEXT(Msg_WeakKey),
				TEXT(Msg_Title));
			break;
		case S_CANCELED:
			break;
		}
		m_txtFile.EnableWindow(true);
		m_txtKey.EnableWindow(true);
		if(m_optUnwarp)
			m_txtConfirm.EnableWindow(true);
		m_cmdOpen.EnableWindow(true);
		m_cmdWarp.EnableWindow(true);
		m_cmdUnwarp.EnableWindow(true);
		m_cmdSpdTest.EnableWindow(true);
		m_cmdCancel.ShowWindow(false);
		m_optbtnWarp.EnableWindow(true);
		m_optbtnUnwarp.EnableWindow(true);
		m_chkbtnShowPassword.EnableWindow(true);
		m_chkbtnExitWhenDone.EnableWindow(true);
	}
	else if (params.iCompleteProgress == PROGRESS_WRITING_FINISHED)
		m_cmdCancel.ShowWindow(false);
	else
		m_Progress.SetPos(params.iCompleteProgress);
	CDialog::OnTimer(nIDEvent);
}

void CWarp_cDlg::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	if (handle != -1)
	{
		params.bHalt=true;
		DWORD rslt = WaitForSingleObject((HANDLE) handle, INFINITE);
		rslt = rslt;
		switch (rslt)
		{
		case WAIT_ABANDONED:
			break;
		case WAIT_OBJECT_0:
			break;
		case WAIT_TIMEOUT:
			break;
		case WAIT_FAILED:
			break;
		default:
			break;
		}
	}
	m_Key="";
	m_Confirm=m_Key;
	CDialog::OnClose();
}

void CWarp_cDlg::OnDefault() 
{
	// TODO: Add your control notification handler code here
	if(m_optUnwarp)
		OncmdWarp();
	else
		OncmdUnwarp();
}

void CWarp_cDlg::OnShowpassword() 
{
	// TODO: Add your control notification handler code here
	m_chkShowPassword=!m_chkShowPassword;
	if(m_chkShowPassword)
	{
		m_txtKey.SetPasswordChar(NULL);	
		m_txtConfirm.SetPasswordChar(NULL);
	}
	else
	{
		m_txtKey.SetPasswordChar('*');
		m_txtConfirm.SetPasswordChar('*');
	}
	m_txtKey.GetPasswordChar();
	m_txtKey.RedrawWindow();
	m_txtConfirm.GetPasswordChar();
	m_txtConfirm.RedrawWindow();
	m_txtKey.SetFocus();
}

void CWarp_cDlg::OncmdCancel() 
{
	// TODO: Add your control notification handler code here
	params.bHalt = true;
	DWORD rslt = WaitForSingleObject((HANDLE) handle, INFINITE);
	rslt = rslt;
	switch (rslt)
	{
	case WAIT_ABANDONED:
		rslt = rslt;	
		break;
	case WAIT_OBJECT_0:
		rslt = rslt;
		break;
	case WAIT_TIMEOUT:
		rslt = rslt;
		break;
	case WAIT_FAILED:
		rslt = rslt;
		break;
	default:
		rslt = rslt;
		break;
	}
}

void testfun()
{
	Fast_ENC(&ldata, &rdata, S_Box_ID_For_Test);
}

void CWarp_cDlg::OncmdSpeedTest() 
{
	// TODO: Add your control notification handler code here
	SPDTEST_RSLT rslt;
	CString msg;
	int decimal, sign;
	CString buff;
	S_Box_ID_For_Test = Gen_S_Box();
	Init_S_Box(&lexkey, &rexkey, S_Box_ID_For_Test);
	Init_ENC_Subkeys(&lkey, &rkey, S_Box_ID_For_Test);
	rslt = spdtest(testfun);
	Drop_S_Box(S_Box_ID_For_Test);
	if (rslt.bTestSucc)
	{
		buff = _fcvt(1000 / float(rslt.TimeUsedInMilliseconds) * rslt.Times, 7, &decimal, &sign);
		msg = "Your computer can process ";
		msg += buff.Left(decimal) + "." + buff.Right(buff.GetLength() - decimal);
		msg = msg + " groups per second \nwithout the consideration of I/O.";
	}
	else
		msg = "Congratulations! Your computer is too powerful to do the test.";
	MessageBox(msg, _T("Speed test result"));
}
