// FirewallApp.h : main header file for the FIREWALLAPP application
//

#if !defined(AFX_FIREWALLAPP_H__EAC29374_7A77_4FFA_846D_2E3B316F0050__INCLUDED_)
#define AFX_FIREWALLAPP_H__EAC29374_7A77_4FFA_846D_2E3B316F0050__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CFirewallAppApp:
// See FirewallApp.cpp for the implementation of this class
//

class CFirewallAppApp : public CWinApp
{
public:
	CFirewallAppApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallAppApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CFirewallAppApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLAPP_H__EAC29374_7A77_4FFA_846D_2E3B316F0050__INCLUDED_)
