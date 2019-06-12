// DESDlg.cpp : implementation file
//

#include "stdafx.h"
#include "DES.h"
#include "DESDlg.h"
#include<math.h>

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
// CDESDlg dialog

CDESDlg::CDESDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDESDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDESDlg)
	m_StrKey = _T("");
	m_strText = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDESDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDESDlg)
	DDX_Control(pDX, IDC_PROGRESS1, m_ctlProgress);
	DDX_Control(pDX, IDC_KEYSTATIC, m_ctlText2);
	DDX_Control(pDX, IDC_STATICTEXT, m_ctlText);
	DDX_Text(pDX, IDC_KEY, m_StrKey);
	DDV_MaxChars(pDX, m_StrKey, 8);
	DDX_Text(pDX, IDC_EDITBOX, m_strText);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDESDlg, CDialog)
	//{{AFX_MSG_MAP(CDESDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_COMMAND(ID_EXIT, OnExit)
	ON_BN_CLICKED(IDC_EXITBUTTON, OnExitbutton)
	ON_COMMAND(ID_AUTHOR, OnAuthor)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDC_CIPHERBUTTON, OnCipherbutton)
	ON_BN_CLICKED(IDC_DECIPHERBUTTON, OnDecipherbutton)
	ON_COMMAND(ID_CLEAR, OnClear)
	ON_COMMAND(IDC_DEFAULTFILL, OnDefaultfill)
	ON_COMMAND(IDM_SHIFT, OnShift)
	ON_WM_CONTEXTMENU()
	ON_COMMAND(ID_SFILEOPEN, OnSfileopen)
	ON_COMMAND(ID_CFILEOPEN, OnCfileopen)
	ON_COMMAND(ID_SFILESAVE, OnSfilesave)
	ON_COMMAND(IDC_MFILESAVE, OnMfilesave)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDESDlg message handlers

BOOL CDESDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.
	m_strText="##说明：本工具为信息系统安全技术课程作品  课程教师：龙冬阳教授##";
	m_StrKey="software";
	UpdateData(false);//注意，在初始化里改变默认设置，改完后一定要刷新
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
	m_ctlProgress.SetRange(0,100);
	m_runable=true;
	m_IsChinese=false;
	m_seeable=false;
	CBitmap m_bmp;
	m_bmp.LoadBitmap(IDB_BITMAPBRUSH);
	m_brush2.CreatePatternBrush(&m_bmp);

	m_exitBtn.SubclassDlgItem(IDC_EXITBUTTON,this);
	m_exitBtn.SetIcon(IDI_ICONEXIT,IDI_ICONEXIT2);
	m_exitBtn.SetShade(CShadeButtonST::SHS_HARDBUMP);
	
	//decipher icon
	m_decipherIcon.SubclassDlgItem(IDC_DECIPHERBUTTON,this);
	m_decipherIcon.SetIcon(IDI_ICONDECIPHER);
	m_decipherIcon.SetShade(CShadeButtonST::SHS_HARDBUMP);

	//encipher icon
	m_encipherBtn.SubclassDlgItem(IDC_CIPHERBUTTON,this);
	m_encipherBtn.SetIcon(IDI_ENCIPHERICON);
   	m_encipherBtn.SetShade(CShadeButtonST::SHS_HARDBUMP);

	m_brush.CreateSolidBrush(RGB(179,185,233 ));
	setMyFont();
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CDESDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CDESDlg::OnPaint()
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
HCURSOR CDESDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CDESDlg::OnExit() 
{
	OnOK();
}

void CDESDlg::OnExitbutton() 
{
	OnOK();
}

void CDESDlg::OnAuthor() 
{
	AfxMessageBox("中山大学软件学院\n\n软件工程00级  吴丹\n\n",MB_ICONINFORMATION);
}

void CDESDlg::setMyFont()
{
	m_font.CreateFont(32,0,0,0,FW_NORMAL,0,0,0,DEFAULT_CHARSET,
		               OUT_CHARACTER_PRECIS,CLIP_CHARACTER_PRECIS,
					   DEFAULT_QUALITY,DEFAULT_PITCH|FF_DONTCARE,
					   "隶书");
	m_font2.CreateFont(18,0,0,0,FW_BOLD,0,0,0,DEFAULT_CHARSET,
		               OUT_CHARACTER_PRECIS,CLIP_CHARACTER_PRECIS,
					   DEFAULT_QUALITY,DEFAULT_PITCH|FF_DONTCARE,
					   "新宋体");
	m_ctlText.SetFont(&m_font);
	m_ctlText2.SetFont(&m_font2);
    return;
}

HBRUSH CDESDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor) 
{
	HBRUSH hbr = CDialog::OnCtlColor(pDC, pWnd, nCtlColor);
	
	// TODO: Change any attributes of the DC here
	if(nCtlColor==CTLCOLOR_DLG)
	{
		return (HBRUSH)m_brush2.GetSafeHandle();
	}
	else if(nCtlColor!=CTLCOLOR_EDIT)
	{
		pDC->SetBkMode(TRANSPARENT);
		pDC->SetTextColor(RGB(25,115,152));
    	return (HBRUSH)m_brush2.GetSafeHandle();
	}
	// TODO: Return a different brush if the default is not desired
	return CDialog::OnCtlColor(pDC, pWnd, nCtlColor);
}

//以下为DES加密解密处理函数

void CDESDlg::SOURCE_BIO()
{
	char ch;
	static int i,j,str[8];
	int r=0;
	int len=m_strText.GetLength();
	m_fSize=0;
	m_StrSource="";
	while(8*m_fSize<len){
      	for(i=0;i<8;i++)
		{   
			if(8*m_fSize+i==len)
			{
				r=i;
				break;
			}
			ch=m_strText.GetAt(8*m_fSize+i);
			if(ch>0)
				str[7]=0;
			else{  //unicode字符
				str[7]=1;
				ch=0-ch;
			}
		    for(j=0;j<7;j++)
			{
                str[j]=ch%2;
		        ch=ch/2;
			}
	        for(j=7;j>=0;j--)
				m_StrSource+=char(str[j]+'0');
		}
		m_fSize++;
		if(m_fSize%50==0)
			m_ctlProgress.SetPos(int(100*8*(m_fSize-1)/float(len)));
	}//while
	if(r)
		for(i=0;i<(8-r)*8;i++)
			m_StrSource+='0';
	m_ctlProgress.SetPos(100);
}

void CDESDlg::KEY_BIO()
{
	UpdateData(TRUE);
	if(m_StrKey.GetLength()!=8){
		MessageBox("密钥必须为八位","密钥错!",MB_ICONSTOP|MB_OK);
		m_runable=false;
	}
	else{
		m_runable=true;
		char ch;
		static int i,j,str[8];

		for(i=0;i<8;i++)
		{
			ch=m_StrKey.GetAt(i);
			for(j=0;j<8;j++)
			{
				 str[j]=ch%2;
				 ch=ch/2;
			} 
			for(j=7;j>=0;j--)
				Key[i*8+j]=str[j];
		}
	}
}

void CDESDlg::DES_ENCIPHER()
{
	int m[65],  //用来存放二进制的明文
		m1[65], //经过初始置换后的明文二进制
		i,C0[29],D0[29],k0[57];
    //IP初始置换表
    int ip[64]={58,50,42,34,26,18,10,2,60,52,44,36,28,20,
		        12,4,62,54,46,38,30,22,14,6,64,56,48,40,32,
				24,16,8,57,49,41,33,25,17,9,1,59,51,43,35,
				27,19,11,3,61,53,45,37,29,21,13,5,63,55,47,
				39,31,23,15,7};	
	//IP逆置换表
	int IP_REVERSE[64]={40,8,48,16,56,24,64,32,
	                    39,7,47,15,55,23,63,31,
						38,6,46,14,54,22,62,30,
						37,5,45,13,53,21,61,29,
					    36,4,44,12,52,20,60,28,
						35,3,43,11,51,19,59,27,
						34,2,42,10,50,18,58,26,
						33,1,41, 9,49,17,57,25};
	//P56置换表
	int P56[57]={57,49,41,33,25,17,9,1,58,50,42,34,26,18,
	             10,2,59,51,43,35,27,19,11,3,60,52,44,36,
	             63,55,47,39,31,23,15,7,62,54,46,38,30,22,
	             14,6,61,53,45,37,29,21,13,5,28,20,12,4};
	m_ctlProgress.SetPos(0);
	SOURCE_BIO();
/************************************************************/
//生成子密钥
	for(i=1;i<57;i++)
	  k0[i]=Key[P56[i-1]];
    for(i=1;i<29;i++)
	  C0[i]=k0[i];
	for(i=29;i<=56;i++)
	  D0[i-28]=k0[i];

	int CE[29],DE[29],Cx[29],Dx[29];
	for(i=1;i<=28;i++){
		CE[i]=C0[i];
		DE[i]=D0[i];
	}
	for(int num=1;num<=16;num++){
		DES_GenerateSubkey(CE,DE,Cx,Dx,K,num);
		for(i=1;i<=28;i++){
			CE[i]=Cx[i];
			DE[i]=Dx[i];
		}
	}
//生成完毕
/************************************************************/
	/**********/
	/*加密过程*/
	/**********/
	m_strText="";          //设置字符串变量为空
	long len=m_StrSource.GetLength();
    long count=0;
	m_ctlProgress.SetPos(0);
	while((m_fSize--)>0){//while
		for(i=1;i<=64;i++){
			m[i]=(m_StrSource.GetAt(count)-'0');
			count++;
		}
		for(i=1;i<=64;i++)
			m1[i]=m[ip[i-1]];

		for(i=1;i<=32;i++)
			L0[i]=m1[i];     //明文左侧的初始化
		for(i=33;i<=64;i++)
			R0[i-32]=m1[i];  //明文右侧的初始化
		/**************************************************/
		//进行十六次迭代
		int RE[33],LE[33],Lx[33],Rx[33];
		for(i=1;i<=32;i++){
			RE[i]=R0[i];
			LE[i]=L0[i];
		}
		for(num=1;num<=16;num++){
			DES_ITERATIVE(LE,RE,Lx,Rx,K[num]);
			for(i=1;i<=32;i++){
				LE[i]=Lx[i];
				RE[i]=Rx[i];
			}
		}
	    //迭代完毕
		/************************************************************/
		int t[65]; 
		for(i=1;i<=32;i++)
		{
			t[i]=LE[i];
			t[i+32]=RE[i];
		}
		for(i=1;i<=64;i++)   //将密文进行IP逆置换
			t1[i]=t[IP_REVERSE[i-1]];

		for(i=1;i<=64;i++)
		{
			m_strText=m_strText+(char)(48+t1[i]);   //48为字符0的ASCII码
			if(i%8==0)                //逢8位空格
				m_strText=m_strText+"   ";
		}
		m_ctlProgress.SetPos(int(100*(1-64*(m_fSize-1)/float(len))));
	}//while
	m_ctlProgress.SetPos(100);
	UpdateData(false);
	MessageBox("加密结束，请继续下一步操作!","好消息",MB_OK|MB_ICONINFORMATION);
}

void CDESDlg::DES_DECIPHER()
{
	int  i,j,t2[65];  //用来存放经过IP初始置换后的密文
    int IP_REVERSE[64]={40,8,48,16,56,24,64,32,
						39,7,47,15,55,23,63,31,
						38,6,46,14,54,22,62,30,
						37,5,45,13,53,21,61,29,
						36,4,44,12,52,20,60,28,
					 	35,3,43,11,51,19,59,27,
						34,2,42,10,50,18,58,26,
						33,1,41,9,49,17,57,25};
  int ip[65]={58,50,42,34,26,18,10,2,
	          60,52,44,36,28,20,12,4,
	          62,54,46,38,30,22,14,6,
	          64,56,48,40,32,24,16,8,
	          57,49,41,33,25,17,9,1,
	          59,51,43,35,27,19,11,3,
	          61,53,45,37,29,21,13,5,
	          63,55,47,39,31,23,15,7};      //IP初始置换表
	int	k0[57],
        C0[29],D0[29];//C代表p56置换后的左半部分，D代表右半部分	
	//P56置换表
	int P56[57]={57,49,41,33,25,17,9,1,58,50,42,34,26,18,
	              10,2,59,51,43,35,27,19,11,3,60,52,44,36,
	              63,55,47,39,31,23,15,7,62,54,46,38,30,22,
	              14,6,61,53,45,37,29,21,13,5,28,20,12,4};
	/*******************************************************/
	//生成子密钥
	for(i=1;i<57;i++)
	  k0[i]=Key[P56[i-1]];
    for(i=1;i<29;i++)
	  C0[i]=k0[i];
	for(i=29;i<=56;i++)
	  D0[i-28]=k0[i];

	int CE[29],DE[29],Cx[29],Dx[29];
	for(i=1;i<=28;i++){
		CE[i]=C0[i];
		DE[i]=D0[i];
	}
	for(int num=1;num<=16;num++){
		DES_GenerateSubkey(CE, DE, 
						   Cx, Dx,K,num);
		for(i=1;i<=28;i++){
			CE[i]=Cx[i];
			DE[i]=Dx[i];
		}
	}
	//生成完毕
  /*******************************************************/
  /**********/
  /*开始解密*/
  /**********/
  m_ctlProgress.SetPos(0);
  m_StrCiphered=m_strText;
  m_StrSource="";
  m_strText="";
  long len=m_StrCiphered.GetLength();
  long constlen=len;
  if(len%88!=0&&len%88<85){        //密文不完整
	  MessageBox("密文不完整!","密文错",MB_OK|MB_ICONERROR);
	  m_runable=false;
  }
  else{
	  if(len%88!=0)
		  len+=(88-len%88);
	  int x=0;       
	  while((len-=11*8)>=0){
		  for(i=1;i<=64;i++){
			  t1[i]=int(m_StrCiphered.GetAt(x)-'0');
		      if(t1[i]!=0&&t1[i]!=1){      //密文不合规范
				  MessageBox("密文不符合规范!","密文错",MB_OK|MB_ICONERROR);
			      m_runable=false;
			      break;
			  }
			  if(i%8==0)
				  x+=4;
			  else 
				  x++;
		  }
	      if(m_runable==false)
			  break;
		  for(i=1;i<=64;i++)
		  {
			  t2[i]=t1[ip[i-1]];
		  }
		  for(i=1;i<33;i++)
		  {
			  R0[i]=t2[i];
		      L0[i]=t2[i+32];
		  }
          /**************************************************/
          //进行十六次迭代
		  int RE[33],LE[33],Lx[33],Rx[33];
		  for(i=1;i<=32;i++){
			  RE[i]=R0[i];
			  LE[i]=L0[i];
		  }
		  for(int num=1;num<=16;num++){
		      DES_ITERATIVE(LE,RE,Lx,Rx,
					    	K[17-num]);
		      for(i=1;i<=32;i++){
			      LE[i]=Lx[i];
			      RE[i]=Rx[i];
			  }
		  }
		  //迭代完毕
		  /************************************************************/
	      int t[65]; 
	      for(i=1;i<=32;i++)
		  {
		      t[i]=RE[i];
			  t[i+32]=LE[i];
		  }
          for(i=1;i<=64;i++)     //将明文进行IP逆置换
			  t3[i]=t[IP_REVERSE[i-1]];
	      int ch=0;
	      for(i=0;i<=7;i++)
		  {
              for(j=8;j>1;j--)
				  ch=ch+t3[i*8+j]*(int)pow(2,8-j);	
			  if(t3[i*8+1]==1)
		          ch=0-ch;
	          m_strText=m_strText+(char)ch;
	          ch=0;
		  }//for
		  m_ctlProgress.SetPos(int((1-float(len)/constlen)*100));
	  }//while
	}//if(密文合乎规范)
	if(m_runable){
		UpdateData(FALSE);
		MessageBox("解密结束，请继续下一步操作!","好消息",MB_OK|MB_ICONINFORMATION);
	}
}

void CDESDlg::OnCipherbutton() 
{
	KEY_BIO();
	if(m_runable){
		DES_ENCIPHER();
	}
}

void CDESDlg::OnDecipherbutton() 
{
	KEY_BIO();
	if(m_runable){
		DES_DECIPHER();
	}
}

void CDESDlg::OnClear() 
{
	m_strText="";
	UpdateData(FALSE);
}

void CDESDlg::DES_ITERATIVE(int LE[],int RE[],int Lx[],int Rx[],
							int sub_key[])
{
	int s11[7],s21[7],s31[7],s41[7],s51[7],s61[7],s71[7],s81[7];
	int E[49]={32,1,2,3,4,5,4,5,6,7,8,9,8,9,10,11,12,13,
	           12,13,14,15,16,17,16,17,18,19,20,21,20,21,22,23,24,25,
	           24,25,26,27,28,29,28,29,30,31,32,31}; // E/P扩展换表
	int P[33]={16,7,20,21,29,12,28,17,1,15,23,26,5,18,31,10,
	           2,8,24,14,32,27,3,9,19,13,30,6,22,11,4,25};//P32置换表
	//八个密码盒
	int s1[4][16]={14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7,
	               0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8,
	               4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0,
	               15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13};
    int s2[4][16]={15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10,
	               3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5,
	               0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15,
	               13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9};
	int s3[4][16]={10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8,
            	   13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1,
	               13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7,
	               1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12};
	int s4[4][16]={7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15,
	               13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9,
	               10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4,
	               3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14};
	int s5[4][16]={2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9,
	               14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6,
	               4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14,
	               11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3};
	int s6[4][16]={12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11,
	               10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8,
    	           9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6,
	               4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13};
	int s7[4][16]={4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1,
	               13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6,
	               1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2,
	               6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12};
	int s8[4][16]={13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7,
	               1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2,
	               7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8,
	               2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11};
	
	static int f[33],j;
	int s[9],     //用来存放经过S盒后得到的8个数
		frk[33],  //用来存放经过P32置换后的密文
		temp[5],
		RE1[49];
	//进行第x次迭代
	for(int i=1;i<=48;i++)//经过E/P变换扩充，由32位变为48位
	  RE1[i]=RE[E[i-1]];  //RE是左侧明文
	for(i=1;i<=48;i++)//与K1按位作不进位加法运算/K1为第一组子密钥
	  RE1[i]=RE1[i]+sub_key[i];
	for(i=1;i<=48;i++)
    {
		if(RE1[i]==2)
        RE1[i]=0;
    }
	for(i=1;i<7;i++)//48位分成8组，每组6个
	{
		s11[i]=RE1[i];
		s21[i]=RE1[i+6];
		s31[i]=RE1[i+12];
		s41[i]=RE1[i+18];
		s51[i]=RE1[i+24];
		s61[i]=RE1[i+30];
		s71[i]=RE1[i+36];
		s81[i]=RE1[i+42];
	}//下面经过S盒，得到8个数,每个4 bit(0-15)
	s[1]=s1[s11[6]+s11[1]*2][s11[5]+s11[4]*2+s11[3]*4+s11[2]*8];
	s[2]=s2[s21[6]+s21[1]*2][s21[5]+s21[4]*2+s21[3]*4+s21[2]*8];
	s[3]=s3[s31[6]+s31[1]*2][s31[5]+s31[4]*2+s31[3]*4+s31[2]*8];
	s[4]=s4[s41[6]+s41[1]*2][s41[5]+s41[4]*2+s41[3]*4+s41[2]*8];
	s[5]=s5[s51[6]+s51[1]*2][s51[5]+s51[4]*2+s51[3]*4+s51[2]*8];
	s[6]=s6[s61[6]+s61[1]*2][s61[5]+s61[4]*2+s61[3]*4+s61[2]*8];
	s[7]=s7[s71[6]+s71[1]*2][s71[5]+s71[4]*2+s71[3]*4+s71[2]*8];
	s[8]=s8[s81[6]+s81[1]*2][s81[5]+s81[4]*2+s81[3]*4+s81[2]*8];
	for(i=0;i<8;i++)//8个数变换输出二进制
	{
		for(j=1;j<5;j++)
		{
		  temp[j]=s[i+1]%2;
		  s[i+1]=s[i+1]/2;
		}
		for(j=1;j<5;j++)
	      f[4*i+j]=temp[5-j];
	}
	for(i=1;i<33;i++)//将上文输出的二进制数经过P32变换
	  frk[i]=f[P[i-1]];
	for(i=1;i<33;i++)
      Lx[i]=RE[i];
	for(i=1;i<33;i++) //将右侧明文作不进位二进制加法运算
    {
		Rx[i]=LE[i]+frk[i];
		if(Rx[i]==2)
          Rx[i]=0;
    }	
}

void CDESDlg::DES_GenerateSubkey(int CE[], int DE[], 
								 int Cx[], int Dx[],
							   	 int K[][49],int kn)
{
	int Q48[49]={14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,
		          4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,
	              30,40,51,45,33,48,44,49,39,56,34,53,46,
				  42,50,36,29,32};             //Q48筛选表
	int offSet[17]={0,1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1};
	int C[57];  //用来存放循环左移以后的通信密钥

    for(int i=1;i<29-offSet[kn];i++)//1循环左移一位(第一次迭代的位数为1)
	{
		Cx[i]=CE[i+1];
		Dx[i]=DE[i+1];
	}
	Cx[28]=CE[2];
	Dx[28]=DE[2];
	if(offSet[kn]==2){
		Cx[27]=CE[1];
		Dx[27]=DE[1];
	}
	for(i=1;i<=28;i++)
	{
		C[i]=Cx[i];
		C[i+28]=Dx[i];
	}
	for(i=1;i<=48;i++)
	    K[kn][i]=C[Q48[i-1]]; //生成子密钥Kx
}

void CDESDlg::OnDefaultfill() 
{
	m_strText="请在这里输入文本并开始编辑...";
	UpdateData(FALSE);
}

void CDESDlg::OnShift() 
{
	CMenu *m_lMenu;
	m_lMenu=GetMenu();
	if(m_seeable==false){
		m_seeable=true;
		((CEdit*)GetDlgItem(IDC_KEY))->SetPasswordChar(0);	
		m_lMenu->ModifyMenu(IDM_SHIFT,MF_STRING,IDM_SHIFT,"密钥不可见");
	}
	else{
		m_seeable=false;
		((CEdit*)GetDlgItem(IDC_KEY))->SetPasswordChar('*');	
		m_lMenu->ModifyMenu(IDM_SHIFT,MF_STRING,IDM_SHIFT,"密钥可见");
	}
	Invalidate(true);
}

void CDESDlg::OnContextMenu(CWnd* pWnd, CPoint point) 
{
	CMenu *m_lMenu;
	m_lMenu=GetMenu();
	m_lMenu=m_lMenu->GetSubMenu(0);
	m_lMenu->TrackPopupMenu(TPM_LEFTALIGN+TPM_RIGHTBUTTON,
		point.x,point.y,this,NULL);
}

void CDESDlg::OnSfileopen() 
{
	CFileDialog m_foDlg(TRUE,"txt","Demo.txt",
		                OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
						"文本文件(*.txt)|*.txt|数据文件(.dat)|*.dat|所有文件(*.*)|*.*||",
						NULL);
  	FileOpen(m_foDlg);
}

void CDESDlg::OnCfileopen() 
{
	CFileDialog m_foDlg(TRUE,"des","Bio.des",
		                OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
						"DES文件(*.des)|*.des|文本文件(*.txt)|*.txt|数据文件(.dat)|*.dat|所有文件(*.*)|*.*||",
						NULL);
	FileOpen(m_foDlg);
}

void CDESDlg::OnSfilesave() 
{
	CFileDialog m_foDlg(FALSE,"txt","new.txt",
		                OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
						"文本文件(*.txt)|*.txt|数据文件(.dat)|*.dat|所有文件(*.*)|*.*||",
						NULL);
	FileSOpen(m_foDlg);
}

void CDESDlg::OnMfilesave() 
{
	CFileDialog m_foDlg(FALSE,"des","new.des",
		                OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
						"DES文件(*.des)|*.des|文本文件(*.txt)|*.txt|数据文件(.dat)|*.dat|所有文件(*.*)|*.*||",
						NULL);
	FileSOpen(m_foDlg);
}

void CDESDlg::FileOpen(CFileDialog& m_foDlg)
{ 
	CString fileName;
	m_strText="";
    FILE *fp=NULL;
	if(m_foDlg.DoModal()==IDOK){
		fileName=m_foDlg.GetPathName();
		fp=fopen(fileName,"r");
		if(!fp)
			MessageBox("该文件 "+fileName+" 不存在!","警告",MB_OK|MB_ICONWARNING);
		else{
			while(!feof(fp))
				m_strText+=getc(fp);
			fclose(fp);
			UpdateData(FALSE);
		}
	}		
}

void CDESDlg::FileSOpen(CFileDialog &m_foDlg)
{	
    CString fileName;
	FILE *fp=NULL;
	if(m_foDlg.DoModal()==IDOK){
		UpdateData(TRUE);
		fileName=m_foDlg.GetPathName();
		fp=fopen(fileName,"w");
		fputs(m_strText,fp);
		fclose(fp);
	}	
}
