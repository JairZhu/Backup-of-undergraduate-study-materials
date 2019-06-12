// LW.h : main header file for the LW application
//

#if !defined(AFX_LW_H__0B2DABBA_2074_46F3_8908_AEAA79A95D4A__INCLUDED_)
#define AFX_LW_H__0B2DABBA_2074_46F3_8908_AEAA79A95D4A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CLWApp:
// See LW.cpp for the implementation of this class
//

class CLWApp : public CWinApp
{
public:
	CLWApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLWApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CLWApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LW_H__0B2DABBA_2074_46F3_8908_AEAA79A95D4A__INCLUDED_)
