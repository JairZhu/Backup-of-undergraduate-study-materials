// DlgEndBox.cpp : implementation file
//

#include "stdafx.h"
#include "AES.h"
#include "DlgEndBox.h"
#include "AESDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEndBox dialog


CDlgEndBox::CDlgEndBox(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEndBox::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEndBox)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgEndBox::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEndBox)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEndBox, CDialog)
	//{{AFX_MSG_MAP(CDlgEndBox)
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEndBox message handlers

void CDlgEndBox::OnOK() 
{
	// TODO: Add extra validation here
	
	CDialog::OnOK();
}

BOOL CDlgEndBox::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	OnStartTimer();

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgEndBox::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	OnOK();

	CDialog::OnTimer(nIDEvent);
}

void CDlgEndBox::OnStartTimer()
{
	m_nTimer = SetTimer(1, TIME_SHOWENDPIC, 0);
}

void CDlgEndBox::OnStopTimer()
{
	KillTimer(m_nTimer);
}
