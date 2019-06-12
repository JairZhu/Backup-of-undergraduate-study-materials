// DigsigDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Digsig.h"
#include "DigsigDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif
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
// CDigsigDlg dialog

CDigsigDlg::CDigsigDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDigsigDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDigsigDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	index=0;
}

void CDigsigDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDigsigDlg)
	DDX_Control(pDX, IDC_FORMTAB, m_formtab);
	DDX_Control(pDX, IDC_LOCATION, m_location);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDigsigDlg, CDialog)
	//{{AFX_MSG_MAP(CDigsigDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_NOTIFY(TCN_SELCHANGE, IDC_FORMTAB, OnSelchangeFormtab)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDigsigDlg message handlers

BOOL CDigsigDlg::OnInitDialog()
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
	TC_ITEM tItem;
    tItem.mask = TCIF_TEXT;
    tItem.pszText = "生成秘钥";
    tItem.cchTextMax = strlen( tItem.pszText);     
    m_formtab.InsertItem( 0, &tItem);	//添加选项

	tItem.mask = TCIF_TEXT;
    tItem.pszText = "生成签名";
    tItem.cchTextMax = strlen( tItem.pszText);     
    m_formtab.InsertItem( 1, &tItem);	//添加选项

	tItem.mask = TCIF_TEXT;
    tItem.pszText = "验证签名";
    tItem.cchTextMax = strlen( tItem.pszText);     
    m_formtab.InsertItem( 2, &tItem);	//添加选项

	CRect rect;
	m_location.GetWindowRect(&rect);
	ScreenToClient(&rect);

	m_keydlg.Create(IDD_GENKEY,this);
	m_sigdlg.Create(IDD_GENSIG,this);
	m_cerdlg.Create(IDD_CERSIG,this);

	m_keydlg.MoveWindow(&rect);
	m_sigdlg.MoveWindow(&rect);
	m_cerdlg.MoveWindow(&rect);

	ShowTabWindow(index);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CDigsigDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CDigsigDlg::OnPaint() 
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
HCURSOR CDigsigDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDigsigDlg::ShowTabWindow(int index)
{
	switch(index)
	{
	case 0:
		m_keydlg.ShowWindow(SW_SHOW);
		m_sigdlg.ShowWindow(SW_HIDE);
		m_cerdlg.ShowWindow(SW_HIDE);
		break;
	case 1:
		m_keydlg.ShowWindow(SW_HIDE);
		m_sigdlg.ShowWindow(SW_SHOW);
		m_cerdlg.ShowWindow(SW_HIDE);
		break;
	case 2:
		m_keydlg.ShowWindow(SW_HIDE);
		m_sigdlg.ShowWindow(SW_HIDE);
		m_cerdlg.ShowWindow(SW_SHOW);
		break;
	}
	m_formtab.SetCurSel(index);
}



void CDigsigDlg::OnSelchangeFormtab(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	index=m_formtab.GetCurSel();
	ShowTabWindow(index);
	*pResult = 0;
}
