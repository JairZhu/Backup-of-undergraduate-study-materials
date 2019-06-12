// GensigDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Digsig.h"
#include "GensigDlg.h"
#include "sha1.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// GensigDlg dialog
GensigDlg::GensigDlg(CWnd* pParent /*=NULL*/)
	: CDialog(GensigDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(GensigDlg)
	m_strPK = _T("");
	m_strF = _T("");
	m_strS = _T("");
	//}}AFX_DATA_INIT
}


void GensigDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(GensigDlg)
	DDX_Text(pDX, IDC_GENS_PK, m_strPK);
	DDX_Text(pDX, IDC_GENS_F, m_strF);
	DDX_Text(pDX, IDC_GENS_S, m_strS);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(GensigDlg, CDialog)
	//{{AFX_MSG_MAP(GensigDlg)
	ON_BN_CLICKED(IDC_GENS_IMPK, OnGensImpk)
	ON_BN_CLICKED(IDC_GENS_IMF, OnGensImf)
	ON_BN_CLICKED(IDC_GENSIG, OnGensig)
	ON_BN_CLICKED(IDC_GENS_SAVE, OnGensSave)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// GensigDlg message handlers

BOOL GensigDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL GensigDlg::PreTranslateMessage(MSG* pMsg) 
{
	// TODO: Add your specialized code here and/or call the base class
	
	return CDialog::PreTranslateMessage(pMsg);
}

void GensigDlg::OnGensImpk() 
{
	// TODO: Add your control notification handler code here
	CFileDialog imp_pk_dlg(TRUE,"rk",NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,"Private key files (*.rk)|*.rk");
	if(imp_pk_dlg.DoModal()==IDOK){
		CString file_path=imp_pk_dlg.GetPathName();
		CFile fpk(file_path,CFile::modeRead);
		char temp;
		m_strPK.Empty();
		while(true){
			fpk.Read(&temp,1);
			if(temp!=0x0D)
				m_strPK.Insert(m_strPK.GetLength(),temp);
			else
				break;
		}
		fpk.Read(&temp,1);//read 0x0A
		m_strN.Empty();
		while(true){
			fpk.Read(&temp,1);
			if(temp!=0x0D)
				m_strN.Insert(m_strN.GetLength(),temp);
			else
				break;
		}
		UpdateData(FALSE);
		pk.Get(m_strPK);
		n.Get(m_strN);
	}
}

void GensigDlg::OnGensImf() 
{
	// TODO: Add your control notification handler code here
	CFileDialog imp_f_dlg(TRUE);
	if(imp_f_dlg.DoModal()==IDOK){
		m_strF=imp_f_dlg.GetPathName();
		UpdateData(FALSE);
	}
}

void GensigDlg::OnGensig() 
{
	// TODO: Add your control notification handler code here
	if(m_strPK.IsEmpty()){
		MessageBox("请导入私钥",NULL,MB_ICONERROR|MB_OK);
		return;
	}
	if(m_strF.IsEmpty()){
		MessageBox("请选择要签名的文件",NULL,MB_ICONERROR|MB_OK);
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
	CRsa enc;
	sig.Mov(enc.encrypt(dig,n,pk));
	sig.Put(m_strS);
	UpdateData(FALSE);
}

void GensigDlg::OnGensSave() 
{
	// TODO: Add your control notification handler code here
	if(m_strS.IsEmpty()){
		MessageBox("请生成签名");
		return;
	}
	CFileDialog save_sig_dlg(FALSE,"sig",NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,"Signature files (*.sig)|*.sig");
	if(save_sig_dlg.DoModal()==IDOK){
		CString file_path=save_sig_dlg.GetPathName();
		CFile fsig(file_path,CFile::modeCreate|CFile::modeWrite);
		fsig.Write((LPCTSTR)m_strS,m_strS.GetLength());
		char endline[2]={0x0d,0x0a};
		fsig.Write(endline,2);
		fsig.Close();
	}
}
