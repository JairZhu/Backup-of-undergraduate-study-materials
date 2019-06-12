// IDEADlg.cpp : implementation file
//

#include "stdafx.h"
#include "IDEA.h"
#include "IDEADlg.h"


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
// CIDEADlg dialog

CIDEADlg::CIDEADlg(CWnd* pParent /*=NULL*/)
	: CDialog(CIDEADlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CIDEADlg)
	m_str = _T("");
	m_encrypt = -1;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CIDEADlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CIDEADlg)
	DDX_Control(pDX, IDC_EDIT1, m_code);
	DDX_Control(pDX, IDCANCEL, m_cancel);
	DDX_Control(pDX, IDOK, m_ok);
	DDX_Control(pDX, IDC_EDIT2, m_key);
	DDX_Text(pDX, IDC_EDIT4, m_str);
	DDX_Radio(pDX, IDC_RADIO1, m_encrypt);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CIDEADlg, CDialog)
	//{{AFX_MSG_MAP(CIDEADlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIDEADlg message handlers

BOOL CIDEADlg::OnInitDialog()
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
	m_encrypt=0;
	UpdateData(FALSE);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CIDEADlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CIDEADlg::OnPaint() 
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
HCURSOR CIDEADlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


void CIDEADlg::OnOK() 
{
	// TODO: Add extra validation here
	UpdateData(TRUE);
    
	char array[17],karray[33];
	int i,j,r,s;
	unsigned short int a,b,c,d,temp;
	unsigned short int X[4],K[8],Key[52],Y[4];

    for(i=0;i<17;i++)
		array[i]='\0';
	m_code.GetWindowText(array,17);
	i=0;
	while(array[i]!='\0')
		i++;
	if(i<16){
		MessageBox("请输入64比特的十六进制明文！"); 
		return;
	}
	for(i=0;i<16;){//将十六进制的字符变成数字
		for(j=0;j<4;j++){
            if(array[i]>='0'&&array[i]<='9'){
               temp=array[i]-48;
			}else
				if(array[i]>='A'&&array[i]<='F'){
                   temp=array[i]-55;
				}else
					if(array[i]>='a'&&array[i]<='f'){
						temp=array[i]-87;
					}
					else{
						MessageBox("请输入十六进制明文！"); 
						return;
					}
            switch(i%4){
			case 0:
				a=0x000f&a;
                a=temp<<12;
                break;
            case 1:
	            b=0x000f&b;
                b=temp<<8;
                break;
            case 2:
	            c=0x000f&c;
                c=temp<<4;
                break;
            case 3:
	            d=0x000f&d;
                d=temp;
                break;
			}
			i++;
		}
        X[i/4-1]=a|b|c|d;
	}
	for(i=0;i<33;i++)
		karray[i]='\0';
	m_key.GetWindowText(karray,33);
	i=0;
	while(karray[i]!='\0')
		i++;
	if(i<32){
		MessageBox("请输入128比特的十六进制密钥！"); 
		return;
	}
	for(i=0;i<32;){
		for(j=0;j<4;j++){
			if(karray[i]>='0'&&karray[i]<='9'){
               temp=karray[i]-48;
			}else
				if(karray[i]>='A'&&karray[i]<='F'){
					temp=karray[i]-55;
				}else
					if(karray[i]>='a'&&karray[i]<='f'){
						temp=karray[i]-87;
					}
					else{ 
						MessageBox("请输入十六进制密钥！"); 
						return;
					}
			switch(i%4){
			case 0:
				a=temp<<12;
                break;
            case 1:
                b=temp<<8;
                break;
            case 2:
                c=temp<<4;
                break;
            case 3:
                d=temp;
                break;
			}
            i++;
		}
        K[i/4-1]=a|b|c|d;
	}
	generate(K,Key);//扩展种子
	if(m_encrypt==0) TRACE("encrypt");
	else{//解密时把加密密钥转换成解密密钥
		unsigned short int t1,t2,t3,t4;
		unsigned short int Keytemp[52];

		for(i=0;i<52;i++)
			Keytemp[i]=Key[i];
		r=0;
		s=51;
        t1=mulInv(Key[r]);
		r++;
		t2=-Key[r];
		r++;
		t3=-Key[r];
		r++;
		t4=mulInv(Key[r]);
		r++;
		Keytemp[s]=t4;
	    s--;
		Keytemp[s]=t3;
		s--;
		Keytemp[s]=t2;
		s--;
		Keytemp[s]=t1;
		s--;
        for(i=0;i<7;i++){
			t1=Key[r];
			r++;
			t2=Key[r];
			r++;
			Keytemp[s]=t2;
			s--;
			Keytemp[s]=t1;
			s--;

            t1=mulInv(Key[r]);
    		r++;
			t2=-Key[r];
			r++;
			t3=-Key[r];
			r++;
			t4=mulInv(Key[r]);
			r++;
			Keytemp[s]=t4;
			s--;
			Keytemp[s]=t2;
			s--;
			Keytemp[s]=t3;
			s--;
			Keytemp[s]=t1;
			s--;
		}
		t1=Key[r];
		r++;
		t2=Key[r];
		r++;
		Keytemp[s]=t2;
		s--;
		Keytemp[s]=t1;
		s--;
		t1=mulInv(Key[r]);
		r++;
		t2=-Key[r];
		r++;
		t3=-Key[r];
		r++;
		t4=mulInv(Key[r]);
		r++;
		Keytemp[s]=t4;
		s--;
		Keytemp[s]=t3;
		s--;
		Keytemp[s]=t2;
		s--;
		Keytemp[s]=t1;
		s--;
		
		for(i=0;i<52;i++)
			Key[i]=Keytemp[i];
	}
	turn(X,Key,Y);//加密或解密
    m_str="";

	DectoHex(Y,m_str);//将十进制数转换成十六进制数

	UpdateData(FALSE);
}
//模65537乘法
unsigned short int CIDEADlg::mul(unsigned short int a,unsigned short int b)
{
	unsigned int c,d,e;
    c=a;
    d=b;
    e=c*d;
    if(e){
       d=0xffff&e;
       c=e>>16;
       return (d-c)+(d<c);
	}else if(a){
         return 1-a;
	}else{
         return 1-b;
	}
}
//扩展密钥
void CIDEADlg::generate(unsigned short int *k, unsigned short int *key)
{
	unsigned short int ktemp[8];
    unsigned short int temp,a,b;
	int i,j;
	
	for(i=0;i<8;i++){
		key[i]=k[i];
	}
    for(j=8;j<52;){//左移16位
		temp=k[0];
		for(i=0;i<8;i++){
			k[i]=k[i+1];
		}
		k[7]=temp;

		for(i=0;i<7;i++){//左移9位
			a=0x007f&k[i];
			a=a<<9;
			b=0xff80&k[i+1];
			b=b>>7;
			ktemp[i]=a|b;
		}
        a=0x007ff&k[7];
        a=a<<9;
        b=0xff80&k[0];
        b=b>>7;
        ktemp[7]=a|b;
		
		for(i=0;i<8;i++){
			k[i]=ktemp[i];
		}
		
		for(i=0;i<8;i++,j++){
			key[j]=k[i];
		}
	}
	return;
}

void CIDEADlg::OnCancel() 
{
	CDialog::OnCancel();
}

//轮函数
void CIDEADlg::turn(unsigned short *X, unsigned short *Key, unsigned short *Y)
{
	unsigned short int e0,e1,e2,e3;
	unsigned short int f0,f1;
	unsigned short int g,h,u,v;
	unsigned short int Z[8][6];
	int i,j,r;
	
	for(i=0,r=0;i<8;i++){
		for(j=0;j<6;j++){
			Z[i][j]=Key[r];
			r++;
		}
	}
	
	for(i=0;i<8;i++){
		e0=mul(X[0],Z[i][0]);
	    e1=X[1]+Z[i][1];
        e2=X[2]+Z[i][2];
	    e3=mul(X[3],Z[i][3]);
		
		f0=e0^e2;
		f1=e1^e3;
		
		g=mul(f0,Z[i][4]);
		h=g+f1;
		u=mul(h,Z[i][5]);
		v=g+u;
	
		Y[0]=e0^u;
		Y[1]=e2^u;
		Y[2]=e1^v;
		Y[3]=e3^v;
		
		X[0]=Y[0];
		X[1]=Y[1];
	    X[2]=Y[2];
	    X[3]=Y[3];
	}
	Y[0]=mul(X[0],Key[r]);
	r++;
    Y[1]=X[2]+Key[r];
    r++;
    Y[2]=X[1]+Key[r];
    r++;
    Y[3]=mul(X[3],Key[r]);
	return;
}
//十进制转换成十六进制
void CIDEADlg::DectoHex(unsigned short *Y, CString outstr)
{
	unsigned short int m=0,n,base;
	CString ch;
	int i,j;
	m_str="";
	for(i=0;i<4;i++){
		outstr="";
	base=Y[i];
	for(j=0;j<4;j++){
		m=base/16;
		n=base%16;
		if(n<=9)
			ch=n+48;
		else 
		    ch=n+55;
        outstr=ch+outstr;
	    base=m;
	}
	m_str=m_str+outstr;
	}
}
//模65537乘法的逆的计算
unsigned short int CIDEADlg::mulInv(unsigned short int x)
{
    unsigned short int t0,t1;
	unsigned short int q,y;

	if(x<=1)
		return x;
	t1=0x10001/x;
	y=0x10001%x;
	if(y==1)
		return 1-t1;
	t0=1;
	do{
		q=x/y;
		x=x%y;
		t0+=q*t1;
		if(x==1)
			return t0;
		q=y/x;
		y=y%x;
		t1+=q*t0;
	}while(y!=1);
	return 1-t1;
}
void CIDEADlg::OnButton1() 
{
	// TODO: Add your control notification handler code here
	CAboutDlg dlg;
	dlg.DoModal();
}
