// AESDlg.cpp : implementation file
///////////////////////////////////////////////////////////////////////////////
//  程序实现：邓韶勇
///////////////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "AES.h"
#include "AESDlg.h"
#include "DlgEndBox.h"
#include "DlgVersion.h"
#include "DlgWait.h"
#include <io.h>

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
	void OnStopTimer();
	void OnStartTimer();
	CAboutDlg();

	int m_nTimer;

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
	virtual void OnOK();
	virtual BOOL OnInitDialog();
	afx_msg void OnTimer(UINT nIDEvent);
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

void CAboutDlg::OnOK() 
{
	// TODO: Add extra validation here
	OnStopTimer();
	//
	CDialog::OnOK();
}

BOOL CAboutDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	OnStartTimer();
	// TODO: Add extra initialization here	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CAboutDlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	OnOK();
	//
	CDialog::OnTimer(nIDEvent);
}

void CAboutDlg::OnStartTimer()
{
	m_nTimer = SetTimer(1, TIME_SHOWPIC, 0);
}

void CAboutDlg::OnStopTimer()
{
	KillTimer(m_nTimer);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
	ON_WM_SHOWWINDOW()
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAESDlg dialog

CAESDlg::CAESDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAESDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAESDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CAESDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAESDlg)
	DDX_Control(pDX, IDC_PROGRESS1, m_progress);
	DDX_Control(pDX, IDC_EDIT8, m_key);
	DDX_Control(pDX, IDC_EDIT7, m_time);
	DDX_Control(pDX, IDC_EDIT6, m_rshow);
	DDX_Control(pDX, IDC_EDIT5, m_sshow);
	DDX_Control(pDX, IDC_EDIT4, m_rtext);
	DDX_Control(pDX, IDC_EDIT3, m_stext);
	DDX_Control(pDX, IDC_EDIT2, m_rfile);
	DDX_Control(pDX, IDC_EDIT1, m_sfile);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAESDlg, CDialog)
	//{{AFX_MSG_MAP(CAESDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON9, OnInit)
	ON_BN_CLICKED(IDC_BUTTON1, OnSBrowse)
	ON_BN_CLICKED(IDC_BUTTON2, OnRBrowse)
	ON_BN_CLICKED(IDC_BUTTON3, OnSOutput)
	ON_BN_CLICKED(IDC_BUTTON4, OnROutput)
	ON_BN_CLICKED(IDC_BUTTON5, OnEncrypt)
	ON_BN_CLICKED(IDC_BUTTON6, OnDecrypt)
	ON_BN_CLICKED(IDC_BUTTON7, OnSShowText)
	ON_BN_CLICKED(IDC_BUTTON8, OnRShowText)
	ON_BN_CLICKED(IDC_BUTTON10, OnSClear)
	ON_BN_CLICKED(IDC_BUTTON11, OnStop)
	ON_BN_CLICKED(IDC_BUTTON12, OnSetkey128)
	ON_BN_CLICKED(IDC_BUTTON13, OnSetkey192)
	ON_BN_CLICKED(IDC_BUTTON14, OnSetkey256)
	ON_EN_KILLFOCUS(IDC_EDIT3, OnKillfocusEdit3)
	ON_EN_CHANGE(IDC_EDIT3, OnChangeEdit3)
	ON_BN_CLICKED(IDC_BUTTON15, OnRClear)
	ON_BN_CLICKED(IDC_BUTTON16, OnShowVersion)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAESDlg message handlers

BOOL CAESDlg::OnInitDialog()
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
	OnInit();
	OnSysCommand(IDM_ABOUTBOX, NULL);	
	//
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CAESDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CAESDlg::OnPaint() 
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
HCURSOR CAESDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}
//=============================================================================
//AES关键函数
//=============================================================================
namespace
{
//变量定义
u1byte  pow_tab[256];
u1byte  log_tab[256];
u1byte  sbx_tab[256];
u1byte  isb_tab[256];
u4byte  rco_tab[ 10];
u4byte  ft_tab[4][256];
u4byte  it_tab[4][256];
u4byte  fl_tab[4][256];
u4byte  il_tab[4][256];
u4byte  tab_gen = 0;

//表达式定义
#define ff_mult(a,b)    (a && b ? pow_tab[(log_tab[a] + log_tab[b]) % 255] : 0)
#define f_rn(bo, bi, n, k)                          \
    bo[n] =  ft_tab[0][byte(bi[n],0)] ^             \
             ft_tab[1][byte(bi[(n + 1) & 3],1)] ^   \
             ft_tab[2][byte(bi[(n + 2) & 3],2)] ^   \
             ft_tab[3][byte(bi[(n + 3) & 3],3)] ^ *(k + n)
#define i_rn(bo, bi, n, k)                          \
    bo[n] =  it_tab[0][byte(bi[n],0)] ^             \
             it_tab[1][byte(bi[(n + 3) & 3],1)] ^   \
             it_tab[2][byte(bi[(n + 2) & 3],2)] ^   \
             it_tab[3][byte(bi[(n + 1) & 3],3)] ^ *(k + n)
#define ls_box(x)                \
    ( fl_tab[0][byte(x, 0)] ^    \
      fl_tab[1][byte(x, 1)] ^    \
      fl_tab[2][byte(x, 2)] ^    \
      fl_tab[3][byte(x, 3)] )
#define f_rl(bo, bi, n, k)                          \
    bo[n] =  fl_tab[0][byte(bi[n],0)] ^             \
             fl_tab[1][byte(bi[(n + 1) & 3],1)] ^   \
             fl_tab[2][byte(bi[(n + 2) & 3],2)] ^   \
             fl_tab[3][byte(bi[(n + 3) & 3],3)] ^ *(k + n)
#define i_rl(bo, bi, n, k)                          \
    bo[n] =  il_tab[0][byte(bi[n],0)] ^             \
             il_tab[1][byte(bi[(n + 3) & 3],1)] ^   \
             il_tab[2][byte(bi[(n + 2) & 3],2)] ^   \
             il_tab[3][byte(bi[(n + 1) & 3],3)] ^ *(k + n)
//函数定义
void gen_tabs(void)
{   
	u4byte  i, t;
    u1byte  p, q;   
	//
    for(i = 0,p = 1; i < 256; ++i)
    {
        pow_tab[i] = (u1byte)p; log_tab[p] = (u1byte)i;
        p = p ^ (p << 1) ^ (p & 0x80 ? 0x01b : 0);
    }
    log_tab[1] = 0; p = 1;
    for(i = 0; i < 10; ++i)
    {
        rco_tab[i] = p; 
        p = (p << 1) ^ (p & 0x80 ? 0x1b : 0);
    }
    for(i = 0; i < 256; ++i)
    {   
        p = (i ? pow_tab[255 - log_tab[i]] : 0); q = p; 
        q = (q >> 7) | (q << 1); p ^= q; 
        q = (q >> 7) | (q << 1); p ^= q; 
        q = (q >> 7) | (q << 1); p ^= q; 
        q = (q >> 7) | (q << 1); p ^= q ^ 0x63; 
        sbx_tab[i] = p; isb_tab[p] = (u1byte)i;
    }
    for(i = 0; i < 256; ++i)
    {
        p = sbx_tab[i];         
        t = p; fl_tab[0][i] = t;
        fl_tab[1][i] = rotl(t,  8);
        fl_tab[2][i] = rotl(t, 16);
        fl_tab[3][i] = rotl(t, 24);
        t = ((u4byte)ff_mult(2, p)) |
            ((u4byte)p <<  8) |
            ((u4byte)p << 16) |
            ((u4byte)ff_mult(3, p) << 24);        
        ft_tab[0][i] = t;
        ft_tab[1][i] = rotl(t,  8);
        ft_tab[2][i] = rotl(t, 16);
        ft_tab[3][i] = rotl(t, 24);
        p = isb_tab[i];         
        t = p; il_tab[0][i] = t; 
        il_tab[1][i] = rotl(t,  8); 
        il_tab[2][i] = rotl(t, 16); 
        il_tab[3][i] = rotl(t, 24);
        t = ((u4byte)ff_mult(14, p)) |
            ((u4byte)ff_mult( 9, p) <<  8) |
            ((u4byte)ff_mult(13, p) << 16) |
            ((u4byte)ff_mult(11, p) << 24);        
        it_tab[0][i] = t; 
        it_tab[1][i] = rotl(t,  8); 
        it_tab[2][i] = rotl(t, 16); 
        it_tab[3][i] = rotl(t, 24); 
    }
    tab_gen = 1;
}

#define star_x(x) (((x) & 0x7f7f7f7f) << 1) ^ ((((x) & 0x80808080) >> 7) * 0x1b)
#define imix_col(y,x)       \
    u   = star_x(x);        \
    v   = star_x(u);        \
    w   = star_x(v);        \
    t   = w ^ (x);          \
   (y)  = u ^ v ^ w;        \
   (y) ^= rotr(u ^ t,  8) ^ \
          rotr(v ^ t, 16) ^ \
          rotr(t,24)

}// end of namespace

//表达式定义
#define loop4(i)                                    \
{   t = ls_box(rotr(t,  8)) ^ rco_tab[i];           \
    t ^= e_key[4 * i];     e_key[4 * i + 4] = t;    \
    t ^= e_key[4 * i + 1]; e_key[4 * i + 5] = t;    \
    t ^= e_key[4 * i + 2]; e_key[4 * i + 6] = t;    \
    t ^= e_key[4 * i + 3]; e_key[4 * i + 7] = t;    \
}
#define loop6(i)                                    \
{   t = ls_box(rotr(t,  8)) ^ rco_tab[i];           \
    t ^= e_key[6 * i];     e_key[6 * i + 6] = t;    \
    t ^= e_key[6 * i + 1]; e_key[6 * i + 7] = t;    \
    t ^= e_key[6 * i + 2]; e_key[6 * i + 8] = t;    \
    t ^= e_key[6 * i + 3]; e_key[6 * i + 9] = t;    \
    t ^= e_key[6 * i + 4]; e_key[6 * i + 10] = t;   \
    t ^= e_key[6 * i + 5]; e_key[6 * i + 11] = t;   \
}
#define loop8(i)                                    \
{   t = ls_box(rotr(t,  8)) ^ rco_tab[i];           \
    t ^= e_key[8 * i];     e_key[8 * i + 8] = t;    \
    t ^= e_key[8 * i + 1]; e_key[8 * i + 9] = t;    \
    t ^= e_key[8 * i + 2]; e_key[8 * i + 10] = t;   \
    t ^= e_key[8 * i + 3]; e_key[8 * i + 11] = t;   \
    t  = e_key[8 * i + 4] ^ ls_box(t);              \
    e_key[8 * i + 12] = t;                          \
    t ^= e_key[8 * i + 5]; e_key[8 * i + 13] = t;   \
    t ^= e_key[8 * i + 6]; e_key[8 * i + 14] = t;   \
    t ^= e_key[8 * i + 7]; e_key[8 * i + 15] = t;   \
}

//函数定义
void CAESDlg::set_key(const u1byte in_key[], const u4byte key_len)
{   
	u4byte  i, t, u, v, w;
	//
    if(!tab_gen)
        gen_tabs();
    k_len = (key_len + 31) / 32;
    e_key[0] = u4byte_in(in_key     ); 
	e_key[1] = u4byte_in(in_key +  4);
    e_key[2] = u4byte_in(in_key +  8); 
	e_key[3] = u4byte_in(in_key + 12);
    switch(k_len)
    {
        case 4: t = e_key[3];
                for(i = 0; i < 10; ++i) 
                    loop4(i);
                break;
        case 6: e_key[4] = u4byte_in(in_key + 16); t = e_key[5] = u4byte_in(in_key + 20);
                for(i = 0; i < 8; ++i) 
                    loop6(i);
                break;
        case 8: e_key[4] = u4byte_in(in_key + 16); e_key[5] = u4byte_in(in_key + 20);
                e_key[6] = u4byte_in(in_key + 24); t = e_key[7] = u4byte_in(in_key + 28);
                for(i = 0; i < 7; ++i) 
                    loop8(i);
                break;
    }
    d_key[0] = e_key[0]; d_key[1] = e_key[1];
    d_key[2] = e_key[2]; d_key[3] = e_key[3];
    for(i = 4; i < 4 * k_len + 24; ++i)
    {
        imix_col(d_key[i], e_key[i]);
    }
    return;
}

//表达式定义
#define f_nround(bo, bi, k) \
    f_rn(bo, bi, 0, k);     \
    f_rn(bo, bi, 1, k);     \
    f_rn(bo, bi, 2, k);     \
    f_rn(bo, bi, 3, k);     \
    k += 4
#define f_lround(bo, bi, k) \
    f_rl(bo, bi, 0, k);     \
    f_rl(bo, bi, 1, k);     \
    f_rl(bo, bi, 2, k);     \
    f_rl(bo, bi, 3, k)

//函数定义
void CAESDlg::encrypt(const u1byte in_blk[16], u1byte out_blk[16])
{   
	u4byte  b0[4], b1[4], *kp;
	//
    b0[0] = u4byte_in(in_blk    ) ^ e_key[0]; b0[1] = u4byte_in(in_blk +  4) ^ e_key[1];
    b0[2] = u4byte_in(in_blk + 8) ^ e_key[2]; b0[3] = u4byte_in(in_blk + 12) ^ e_key[3];
    kp = e_key + 4;
    if(k_len > 6)
    {
        f_nround(b1, b0, kp); f_nround(b0, b1, kp);
    }
    if(k_len > 4)
    {
        f_nround(b1, b0, kp); f_nround(b0, b1, kp);
    }
    f_nround(b1, b0, kp); f_nround(b0, b1, kp);
    f_nround(b1, b0, kp); f_nround(b0, b1, kp);
    f_nround(b1, b0, kp); f_nround(b0, b1, kp);
    f_nround(b1, b0, kp); f_nround(b0, b1, kp);
    f_nround(b1, b0, kp); f_lround(b0, b1, kp);
    u4byte_out(out_blk,      b0[0]); u4byte_out(out_blk +  4, b0[1]);
    u4byte_out(out_blk +  8, b0[2]); u4byte_out(out_blk + 12, b0[3]);
}

//表达式定义
#define i_nround(bo, bi, k) \
    i_rn(bo, bi, 0, k);     \
    i_rn(bo, bi, 1, k);     \
    i_rn(bo, bi, 2, k);     \
    i_rn(bo, bi, 3, k);     \
    k -= 4
#define i_lround(bo, bi, k) \
    i_rl(bo, bi, 0, k);     \
    i_rl(bo, bi, 1, k);     \
    i_rl(bo, bi, 2, k);     \
    i_rl(bo, bi, 3, k)

//函数定义
void CAESDlg::decrypt(const u1byte in_blk[16], u1byte out_blk[16])
{   
	u4byte  b0[4], b1[4], *kp;
	//
    b0[0] = u4byte_in(in_blk     ) ^ e_key[4 * k_len + 24]; 
	b0[1] = u4byte_in(in_blk +  4) ^ e_key[4 * k_len + 25];
    b0[2] = u4byte_in(in_blk +  8) ^ e_key[4 * k_len + 26]; 
	b0[3] = u4byte_in(in_blk + 12) ^ e_key[4 * k_len + 27];
    kp = d_key + 4 * (k_len + 5);
    if(k_len > 6)
    {
        i_nround(b1, b0, kp); i_nround(b0, b1, kp);
    }
    if(k_len > 4)
    {
        i_nround(b1, b0, kp); i_nround(b0, b1, kp);
    }
    i_nround(b1, b0, kp); i_nround(b0, b1, kp);
    i_nround(b1, b0, kp); i_nround(b0, b1, kp);
    i_nround(b1, b0, kp); i_nround(b0, b1, kp);
    i_nround(b1, b0, kp); i_nround(b0, b1, kp);
    i_nround(b1, b0, kp); i_lround(b0, b1, kp);
    u4byte_out(out_blk,     b0[0]); u4byte_out(out_blk +  4, b0[1]);
    u4byte_out(out_blk + 8, b0[2]); u4byte_out(out_blk + 12, b0[3]);
}
//=============================================================================
/*
x==0	清除全部
x==1	保留sfile和stext，清除其他
x==2	保留rfile和rtext，清除其他
*/
void CAESDlg::ClearAll(int x)
{
	if (x!=1)
	{
		m_sfile.SetWindowText("");
		m_sfile.UpdateWindow();
		m_stext.SetWindowText("");
		m_stext.UpdateWindow();
	}
	if (x!=2)
	{
		m_rfile.SetWindowText("");
		m_rfile.UpdateWindow();	
		m_rtext.SetWindowText("");
		m_rtext.UpdateWindow();
	}
	m_sshow.SetWindowText("");
	m_sshow.UpdateWindow();
	m_rshow.SetWindowText("");
	m_rshow.UpdateWindow();
	m_time.SetWindowText("");		
	m_time.UpdateWindow();
	m_progress.SetRange32(0, 100);
	m_progress.SetPos(0);	
}

void CAESDlg::OnInit() 
{
	// TODO: Add your control notification handler code here
	int i;
	sflag	=	0;
	rflag	=	0;
	editflag	=	0;
	showflag	=	1;
	//
	for (i=0; i<KEY_MAX; i++)
	{
		key128[i]	=	rand()%2;	
		key192[i]	=	rand()%2;	
		key256[i]	=	rand()%2;
	}
	key128[KEY_MAX]	=	0;
	key192[KEY_MAX]	=	0;
	key256[KEY_MAX]	=	0;
	//
	ClearAll(0);
	//	
	OnSetkey128();	
}

//选择明文
void CAESDlg::OnSBrowse() 
{
	// TODO: Add your control notification handler code here
	static char BASED_CODE szFilter[] = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*||";
	int result;
	//
	CFileDialog dlg(true, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, szFilter, NULL);
	if (dlg.DoModal()==IDOK)
	{
		sflag	=	1;
		editflag	=	0;
		showflag	=	1;
		//
		ClearAll(0);
		//
		strcpy(sfilename, dlg.GetPathName());
		m_sfile.SetWindowText(sfilename);
		m_sfile.UpdateWindow();		
		//读入
		result	=	copyfile(sfilename, SFILENAME);		
		//
		OnSShowText();		
	}	
}

//选择密文
void CAESDlg::OnRBrowse() 
{
	// TODO: Add your control notification handler code here	
	static char BASED_CODE szFilter[] = "All Files (*.*)|*.*||";
	int result;
	FILE* handle;
	int filelen;
	//
	CFileDialog dlg(true, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, szFilter, NULL);
	if (dlg.DoModal()==IDOK)
	{
		rflag	=	1;
		showflag	=	1;
		//
		ClearAll(0);
		//
		strcpy(rfilename, dlg.GetPathName());		
		//		
		handle	=	fopen(rfilename, "rb");
		filelen	=	filelength(fileno(handle));
		result	=	fclose(handle);
		if (filelen==0 || filelen%16!=0)
		{	
			show("密文长度不对");
			rflag	=	0;
			return;	
		}
		//
		m_rfile.SetWindowText(rfilename);
		m_rfile.UpdateWindow();	
		//读入
		result	=	copyfile(rfilename, RFILENAME);		
		//
		OnRShowText();
	}
}

//输出明文
void CAESDlg::OnSOutput() 
{
	// TODO: Add your control notification handler code here
	static char BASED_CODE szFilter[] = "All Files (*.*)|*.*||";	
	int result;
	//
	if (sflag==0)
	{
		show("请先选择明文文件或输入明文");
		return;
	}
	//	
	CFileDialog dlg(false, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, szFilter, NULL);	
	if (dlg.DoModal()==IDOK)
	{
		strcpy(soutfile, dlg.GetPathName());
		//
		result	=	copyfile(SFILENAME, soutfile);
		//
		show("明文输出完成");
	}
}

//输出密文
void CAESDlg::OnROutput() 
{
	// TODO: Add your control notification handler code here
	static char BASED_CODE szFilter[] = "All Files (*.*)|*.*||";	
	int result;
	//
	if (rflag==0)
	{
		show("请先选择密文文件");
		return;
	}
	//
	CFileDialog dlg(false, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, szFilter, NULL);	
	if (dlg.DoModal()==IDOK)
	{
		strcpy(routfile, dlg.GetPathName());
		//
		result	=	copyfile(RFILENAME, routfile);
		//
		show("密文输出完成");
	}	
}

//加密明文
void CAESDlg::OnEncrypt() 
{
	// TODO: Add your control notification handler code here
	int i;
	int filelen;
	int pos;
	FILE* handle;
	FILE* handle2;
	int firstcount;
	int result;
	//
	if (sflag==0)
	{
		show("请先选择明文文件或输入明文");
		return;
	}
	//准备工作
	m_rfile.SetWindowText("");
	m_rtext.SetWindowText("");	
	//
	handle	=	fopen(SFILENAME, "rb");	
	if (handle==NULL)
	{
		show("非法明文文件");		
		return;
	}
	filelen	=	filelength(fileno(handle));
	if (filelen==0)
	{
		show("明文为空");
		fclose(handle);
		return;
	}
	handle2	=	fopen(RFILENAME, "wb");
	//
	setposinit(0, filelen);
	pos	=	0;
	firstcount	=	0;
	while (pos<filelen)
	{
		memset(stext, 0, TEXT_MAX+1);
		scount	=	fread(stext, 1, TEXT_MAX, handle);
		if (scount%16!=0)
			scount	=	scount+16-scount%16;
		if (firstcount==0)
			firstcount	=	scount;
		pos	+=	scount;
		//加密工作:stext->rtext
		for (i=0; i<scount; i+=16)
		{
			memcpy(s_blk, stext+i, 16);
			encrypt(s_blk, r_blk);
			memcpy(rtext+i, r_blk, 16);
		}
		//
		result	=	fwrite(rtext, 1, scount, handle2);
		//
		setpos(pos);			
	}
	result	=	fclose(handle);
	result	=	fclose(handle2);
	//
	scount	=	firstcount;
	rcount	=	scount;
	rflag	=	1;
	showflag	=	1;
	//显示结果
	OnRShowText();
}

//解密密文
void CAESDlg::OnDecrypt() 
{
	// TODO: Add your control notification handler code here
	int i;
	int filelen;
	int pos;
	FILE* handle;
	FILE* handle2;
	int firstcount;
	int result;
	//
	if (rflag==0)
	{
		show("请先选择密文文件");
		return;
	}
	//准备工作
	m_sfile.SetWindowText("");
	m_stext.SetWindowText("");
	//
	handle	=	fopen(RFILENAME, "rb");	
	if (handle==NULL)
	{
		show("非法密文文件");		
		return;
	}
	filelen	=	filelength(fileno(handle));
	if (filelen==0 || filelen%16!=0)
	{
		show("密文长度不对");
		fclose(handle);
		return;
	}
	handle2	=	fopen(SFILENAME, "wb");
	//
	setposinit(0, filelen);
	pos	=	0;
	firstcount	=	0;
	while (pos<filelen)
	{
		memset(rtext, 0, TEXT_MAX+1);
		rcount	=	fread(rtext, 1, TEXT_MAX, handle);
		//
		if (firstcount==0)
			firstcount	=	rcount;
		pos	+=	rcount;
		//解密工作:rtext->stext
		for (i=0; i<rcount; i+=16)
		{
			memcpy(r_blk, rtext+i, 16);
			decrypt(r_blk, s_blk);
			memcpy(stext+i, s_blk, 16);
		}
		//
		result	=	fwrite(stext, 1, rcount, handle2);
		//
		setpos(pos);			
	}
	result	=	fclose(handle);
	result	=	fclose(handle2);
	//显示结果
	rcount	=	firstcount;
	scount	=	rcount;
	sflag	=	1;
	showflag	=	1;
	OnSShowText();
}

//显示明文
//用文本方式，将ASC的0转换为空格来显示
void CAESDlg::OnSShowText() 
{
	// TODO: Add your control notification handler code here	
	int i;	
	FILE* handle;
	int result;
	//
	memset(stext, 0, TEXT_MAX+1);
	handle	=	fopen(SFILENAME, "rb");
	if (handle==NULL)
	{
		show("非法明文文件");		
		return;
	}
	scount	=	fread(stext, 1, TEXT_MAX, handle);
	result	=	fclose(handle);
	//处理	
	for (i=0; i<scount; i++)
	{
		if (stext[i]==0)
			stext2[i]	=	' ';
		else
			stext2[i]	=	stext[i];
	}
	stext2[scount]	=	0;
	//
	m_stext.SetWindowText(stext2);
	m_stext.UpdateWindow();
}

//显示密文
//用01方式，不用文本方式
void CAESDlg::OnRShowText() 
{
	// TODO: Add your control notification handler code here
	int i,j;
	int p;
	FILE* handle;
	int result;
	const int mark[9]	=	{0, 128, 64, 32, 16, 8, 4, 2, 1};
	unsigned char c1,c2,c3;	
	//
	memset(rtext, 0, TEXT_MAX+1);		
	handle	=	fopen(RFILENAME, "rb");
	if (handle==NULL)
	{
		show("非法密文文件");		
		return;
	}
	rcount	=	fread(rtext, 1, TEXT_MAX, handle);		
	result	=	fclose(handle);
	//处理	
	p	=	0;
	for (i=0; i<rcount; i++)
	{
		for (j=1; j<=8; j++)
		{
			c1	=	rtext[i];
			c2	=	mark[j];
			c3	=	c1&c2;
			if (c3==0) 
				rtext2[p]	=	'0';
			else
				rtext2[p]	=	'1';
			p++;
		}
	}
	rtext2[p]	=	0;
	//
	m_rtext.SetWindowText(rtext2);
	m_rtext.UpdateWindow();
}

//清除明文
void CAESDlg::OnSClear() 
{
	// TODO: Add your control notification handler code here
	memset(stext, 0, TEXT_MAX+1);
	memset(stext2, 0, TEXT_MAX+1);
	DeleteFile(SFILENAME);
	//
	sflag	=	0;	
	editflag	=	0;
	showflag	=	1;
	//
	m_sfile.SetWindowText("");
	m_sfile.UpdateWindow();
	//
	m_stext.SetWindowText("");
	m_stext.UpdateWindow();
	//	
	m_sshow.SetWindowText("");
	m_rshow.SetWindowText("");
	m_time.SetWindowText("");		
	m_progress.SetRange32(0, 100);
	m_progress.SetPos(0);
}

void CAESDlg::OnRClear() 
{
	// TODO: Add your control notification handler code here
	//
	memset(rtext, 0, TEXT_MAX+1);
	memset(rtext2, 0, 8*TEXT_MAX+1);
	DeleteFile(RFILENAME);
	//
	rflag	=	0;
	showflag	=	1;
	//
	m_rfile.SetWindowText("");
	m_rfile.UpdateWindow();
	//
	m_rtext.SetWindowText("");
	m_rtext.UpdateWindow();
	//	
	m_sshow.SetWindowText("");
	m_rshow.SetWindowText("");
	m_time.SetWindowText("");		
	m_progress.SetRange32(0, 100);
	m_progress.SetPos(0);
}


void CAESDlg::OnStop() 
{
}

void CAESDlg::show(char *str)
{
	MessageBox(str, "信息", MB_OK|MB_ICONINFORMATION);
}

//显示进度
void CAESDlg::setpos(int pos)
{
	char temp[128];
	int i;	
	//
	if (showflag==1 || rand()%NUM_RAND1==0)
	{		
		etime	=	GetTickCount()-stime;
		sprintf(temp, "%i秒%i毫秒", etime/1000, etime%1000);
		//
		m_time.SetWindowText(temp);
		m_time.UpdateWindow();
	}
	//
	if (showflag==1 || rand()%NUM_RAND2==0)
	{
		for (i=SHOW_MAX-1; i>0; i--)
		{
			sshow[i]	=	sshow[i-1];
			rshow[i]	=	rshow[i-1];
		}
		sshow[0]	=	rand()%2+'0';
		rshow[0]	=	rand()%2+'0';
		//
		m_sshow.SetWindowText(sshow);
		m_sshow.UpdateWindow();
		//
		m_rshow.SetWindowText(rshow);
		m_rshow.UpdateWindow();
	}
	//
	showflag	=	0;
	m_progress.SetPos(pos);	
}

void CAESDlg::setposinit(int a, int b)
{
	int	i;
	//
	m_progress.SetRange32(a,b);
	m_progress.SetPos(0);
	//
	for (i=0; i<SHOW_MAX; i++)
	{
		sshow[i]	=	rand()%2+'0';
		rshow[i]	=	rand()%2+'0';
	}
	sshow[SHOW_MAX]	=	0;
	rshow[SHOW_MAX]	=	0;
	//
	stime	=	GetTickCount();
}

void CAESDlg::OnSetkey128() 
{
	// TODO: Add your control notification handler code here
	keylen	=	128;
	memcpy(key, (char*)key128, keylen);	
	OnShowKey();
	//
	set_key(key128, keylen);
}

void CAESDlg::OnSetkey192() 
{
	// TODO: Add your control notification handler code here
	keylen	=	192;
	memcpy(key, (char*)key192, keylen);		
	OnShowKey();
	//
	set_key(key192, keylen);
}

void CAESDlg::OnSetkey256() 
{
	// TODO: Add your control notification handler code here	
	keylen	=	256;
	memcpy(key, (char*)key256, keylen);	
	OnShowKey();
	//
	set_key(key256, keylen);
}

void CAESDlg::OnShowKey()
{	
	char skey[KEY_MAX+128];
	int p;
	int i;
	//
	p	=	0;
	for (i=0; i<keylen; i++)
	{		
		skey[p]	=	key[i]+'0';
		p++;
		if ((i+1)%64==0)
		{
			skey[p]	=	'\n';
			p++;
		}		
	}
	skey[p]	=	0;
	//
	m_key.SetWindowText(skey);
	m_key.UpdateWindow();	
}

//将用户输入的明文输出到文件中
void CAESDlg::OnKillfocusEdit3() 
{
	// TODO: Add your control notification handler code here
	FILE* handle;
	int len;
	char* buf;
	int result;
	//
	len	=	m_stext.GetWindowTextLength();
	buf	=	(char*)malloc(len+1);
	//
	result	=	m_stext.GetWindowText(buf, len+1);
	handle	=	fopen(SFILENAME, "wb");
	result	=	fwrite(buf, 1, len, handle);
	result	=	fclose(handle);
	//
	free(buf);
	//
	sflag	=	1;
	showflag	=	1;
}

void CAESDlg::OnChangeEdit3() 
{
	editflag	=	1;
}

void CAESDlg::OnOK() 
{
	// TODO: Add extra validation here
	CDlgEndBox dlg;
	dlg.DoModal();
	//
	CDialog::OnOK();
}


void CAESDlg::OnShowVersion() 
{
	// TODO: Add your control notification handler code here
	CDlgVersion dlg;
	dlg.DoModal();
}

int CAESDlg::copyfile(char *sfilename, char *dfilename)
{
	int result;
	//
	CDlgWait dlg;
	result	=	dlg.Create(IDD_WAIT);
	result	=	dlg.ShowWindow(SW_SHOWNORMAL);
	//
	result	=	CopyFile(sfilename, dfilename, FALSE);
	//
	result	=	dlg.DestroyWindow();
	//
	return 0;
}


