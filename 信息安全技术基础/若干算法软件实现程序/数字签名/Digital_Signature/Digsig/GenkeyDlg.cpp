// GenkeyDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Digsig.h"
#include "GenkeyDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// GenkeyDlg dialog


GenkeyDlg::GenkeyDlg(CWnd* pParent /*=NULL*/)
	: CDialog(GenkeyDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(GenkeyDlg)
	m_strN = _T("");
	m_strD = _T("");
	m_strE = _T("");
	//}}AFX_DATA_INIT
}


void GenkeyDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(GenkeyDlg)
	DDX_Text(pDX, IDC_GENK_N, m_strN);
	DDX_Text(pDX, IDC_GENK_D, m_strD);
	DDX_Text(pDX, IDC_GENK_E, m_strE);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(GenkeyDlg, CDialog)
	//{{AFX_MSG_MAP(GenkeyDlg)
	ON_BN_CLICKED(IDC_GENKEY, OnGenkey)
	ON_BN_CLICKED(IDC_SAVE_PK, OnSavePk)
	ON_BN_CLICKED(IDC_SAVE_UK, OnSaveUk)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// GenkeyDlg message handlers

BOOL GenkeyDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL GenkeyDlg::PreTranslateMessage(MSG* pMsg) 
{
	// TODO: Add your specialized code here and/or call the base class
	
	return CDialog::PreTranslateMessage(pMsg);
}

void GenkeyDlg::OnGenkey() 
{
	// TODO: Add your control notification handler code here
	genkey.getkeys(n,e,d);
	n.Put(m_strN);
	e.Put(m_strE);
	d.Put(m_strD);
	UpdateData(FALSE);
}

void GenkeyDlg::OnSavePk() 
{
	// TODO: Add your control notification handler code here
	if(m_strD.IsEmpty()){
		MessageBox("Ë½Ô¿Îª¿Õ");
		return;
	}
	CFileDialog save_pk_dlg(FALSE,"rk",NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,"Private key files (*.rk)|*.rk");
	if(save_pk_dlg.DoModal()==IDOK){
		CString file_path=save_pk_dlg.GetPathName();
		CFile fpk(file_path,CFile::modeCreate|CFile::modeWrite);
		fpk.Write((LPCTSTR)m_strD,m_strD.GetLength());
		char endline[2]={0x0d,0x0a};
		fpk.Write(endline,2);
		fpk.Write((LPCTSTR)m_strN,m_strN.GetLength());
		fpk.Write(endline,2);
		fpk.Close();
	}
}

void GenkeyDlg::OnSaveUk() 
{
	// TODO: Add your control notification handler code here
	if(m_strE.IsEmpty()){
		MessageBox("¹«Ô¿Îª¿Õ");
		return;
	}
	CFileDialog save_uk_dlg(FALSE,"uk",NULL,OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,"Public key files (*.uk)|*.uk");
	if(save_uk_dlg.DoModal()==IDOK){
		CString file_path=save_uk_dlg.GetPathName();
		CFile fuk(file_path,CFile::modeCreate|CFile::modeWrite);
		fuk.Write((LPCTSTR)m_strE,m_strE.GetLength());
		char endline[2]={0x0d,0x0a};
		fuk.Write(endline,2);
		fuk.Write((LPCTSTR)m_strN,m_strN.GetLength());
		fuk.Write(endline,2);
		fuk.Close();
	}
}
