// FirewallAppDoc.cpp : implementation of the CFirewallAppDoc class
//

#include "stdafx.h"
#include "FirewallApp.h"

#include "FirewallAppDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirewallAppDoc

IMPLEMENT_DYNCREATE(CFirewallAppDoc, CDocument)

BEGIN_MESSAGE_MAP(CFirewallAppDoc, CDocument)
	//{{AFX_MSG_MAP(CFirewallAppDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirewallAppDoc construction/destruction

CFirewallAppDoc::CFirewallAppDoc()
{
	nRules = 0;
}

CFirewallAppDoc::~CFirewallAppDoc()
{
}

BOOL CFirewallAppDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CFirewallAppDoc serialization

void CFirewallAppDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CFirewallAppDoc diagnostics

#ifdef _DEBUG
void CFirewallAppDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CFirewallAppDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CFirewallAppDoc commands

/**
 *	增加一条特定的规则
 **/
bool CFirewallAppDoc::AddRule(RuleInfo rule)
{
	if(nRules >= MAX_RULES)//若规则数已经达到最大值,则不允许增加
	{
		AfxMessageBox("已经达到最大规则数目");
		return false;
	}

	else
	{
		rules[nRules] = rule;
		nRules++;
	}

	return true;
}

/**
 *	重设所有规则	
 **/
bool CFirewallAppDoc::ResetRules()
{
	nRules = 0;
	return true;
}

/** 
 *	删除指定的规则
 **/
bool CFirewallAppDoc::DeleteRule(unsigned int position)
{
	
	if(position >= nRules)//若指定的规则不在已有的规则中,则不删除
		return false;

	if(position != nRules - 1)
	{
		unsigned int i;

		for(i = position + 1;i<nRules;i++)//将已删除规则之后的规则依次向前移位,填补空出的位置
		{
			rules[i - 1] = rules[i];
		}
	}
	nRules--;
	return true;
}
