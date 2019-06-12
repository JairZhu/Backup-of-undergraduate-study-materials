// FirewallAppView.h : interface of the CFirewallAppView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIREWALLAPPVIEW_H__A4ED256D_C173_47E8_8DA9_9C8C20CB2073__INCLUDED_)
#define AFX_FIREWALLAPPVIEW_H__A4ED256D_C173_47E8_8DA9_9C8C20CB2073__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
#include "stdafx.h"

class CFirewallAppView : public CFormView
{
protected: // create from serialization only
	CFirewallAppView();
	DECLARE_DYNCREATE(CFirewallAppView)

public:
	//{{AFX_DATA(CFirewallAppView)
	enum { IDD = IDD_FIREWALLAPP_FORM };
	CListCtrl	m_rules;
	//}}AFX_DATA

// Attributes
public:
	CFirewallAppDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallAppView)
	public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void OnInitialUpdate(); // called first time after construct
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnPrint(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	void UpdateList();//更新规则列表
	virtual ~CFirewallAppView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	void AddRuleToList(RuleInfo rule);//向防火墙增加规则的同时在列表中增加相应的项目
	//bool IsAllIP(in_addr ip);

	//{{AFX_MSG(CFirewallAppView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in FirewallAppView.cpp
inline CFirewallAppDoc* CFirewallAppView::GetDocument()
   { return (CFirewallAppDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLAPPVIEW_H__A4ED256D_C173_47E8_8DA9_9C8C20CB2073__INCLUDED_)
