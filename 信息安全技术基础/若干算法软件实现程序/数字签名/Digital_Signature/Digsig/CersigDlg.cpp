// CersigDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Digsig.h"
#include "CersigDlg.h"
#include "sha1.h"
#include "sha1.c"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CersigDlg dialog
/*
extern void SHA1Transform(unsigned long state[5], unsigned char buffer[64]);
extern void SHA1Init(SHA1_CTX* context);
extern void SHA1Update(SHA1_CTX* context, unsigned char* data, unsigned int len);
extern void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
*/
CersigDlg::CersigDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CersigDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CersigDlg)
	m_strUK = _T("");
	m_strF = _T("");
	m_strS = _T("");
	//}}AFX_DATA_INIT
}


void CersigDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CersigDlg)
	DDX_Text(pDX, IDC_CERS_UK, m_strUK);
	DDX_Text(pDX, IDC_CERS_F, m_strF);
	DDX_Text(pDX, IDC_CERS_SIG, m_strS);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CersigDlg, CDialog)
	//{{AFX_MSG_MAP(CersigDlg)
	ON_BN_CLICKED(IDC_CERS_IMUK, OnCersImuk)
	ON_BN_CLICKED(IDC_CERS_IMF, OnCersImf)
	ON_BN_CLICKED(IDC_CERS_IMSIG, OnCersImsig)
	ON_BN_CLICKED(IDC_CERS, OnCers)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CersigDlg message handlers

BOOL CersigDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL CersigDlg::PreTranslateMessage(MSG* pMsg) 
{
	// TODO: Add your specialized code here and/or call the base class
	
	return CDialog::PreTranslateMessage(pMsg);
}

void CersigDlg::OnCersImuk() 
{
	// TODO: Add your control notification handler code here
	CFileDialog imp_uk_dlg(TRUE,"uk",NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,"Public key files (*.uk)|*.uk");
	if(imp_uk_dlg.DoModal()==IDOK){
		CString file_path=imp_uk_dlg.GetPathName();
		CFile fuk(file_path,CFile::modeRead);
		char temp;
		m_strUK.Empty();
		while(true){
			fuk.Read(&temp,1);
			if(temp!=0x0D)
				m_strUK.Insert(m_strUK.GetLength(),temp);
			else
				break;
		}
		fuk.Read(&temp,1);//read 0x0A
		m_strN.Empty();
		while(true){
			fuk.Read(&temp,1);
			if(temp!=0x0D)
				m_strN.Insert(m_strN.GetLength(),temp);
			else
				break;
		}
		fuk.Close();
		UpdateData(FALSE);
		uk.Get(m_strUK);
		n.Get(m_strN);
	}
}

void CersigDlg::OnCersImf() 
{
	// TODO: Add your control notification handler code here
	CFileDialog imp_f_dlg(TRUE);
	if(imp_f_dlg.DoModal()==IDOK){
		m_strF=imp_f_dlg.GetPathName();
		UpdateData(FALSE);
	}
}

void CersigDlg::OnCersImsig() 
{
	// TODO: Add your control notification handler code here
	CFileDialog imp_sig_dlg(TRUE,"sig",NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,"Signature files (*.sig)|*.sig");
	if(imp_sig_dlg.DoModal()==IDOK){
		CString file_path=imp_sig_dlg.GetPathName();
		CFile fsig(file_path,CFile::modeRead);
		m_strS.Empty();
		char temp;
		while(true){
			fsig.Read(&temp,1);
			if(temp!=0x0D)
				m_strS.Insert(m_strS.GetLength(),temp);
			else
				break;
		}
		fsig.Close();
		UpdateData(FALSE);
		sig.Get(m_strS);
	}
}

void CersigDlg::OnCers() 
{
	// TODO: Add your control notification handler code here
	if(m_strUK.IsEmpty()){
		MessageBox("请导入公钥",NULL,MB_ICONERROR|MB_OK);
		return;
	}
	if(m_strF.IsEmpty()){
		MessageBox("请选择签名文件",NULL,MB_ICONERROR|MB_OK);
		return;
	}
	if(m_strS.IsEmpty()){
		MessageBox("请导入签名",NULL,MB_ICONERROR|MB_OK);
		return;
	}
	//----sha------------//
	int i;
	SHA1_CTX context;
	unsigned char digest[20], buffer[16384];
	FILE* file;
	if(!(file=fopen(LPCTSTR(m_strF),"rb"))){
		MessageBox("无法打开文件!");
		return;
	}
	SHA1Init(&context);
    while (!feof(file)) {  // note: what if ferror(file) 
        i = fread(buffer, 1, 16384, file);
        SHA1Update(&context, buffer, i);
    }
    SHA1Final(digest, &context);
	fclose(file);
	//--------------------//
	dig.Mov(0);
	for(int j=0;j<5;j++){
		memcpy(&dig.m_ulValue[j],&digest[j*4],4);
	}
	dig.m_nLength=5;
	CRsa cer;
	if(dig.Cmp(cer.decrypt(sig,n,uk))==0){
		MessageBox("签名合法",NULL,MB_ICONINFORMATION|MB_OK);
	}else
		MessageBox("签名不合法",NULL,MB_ICONERROR|MB_OK);
}
