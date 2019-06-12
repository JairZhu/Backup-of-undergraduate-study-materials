// warp_c.h : main header file for the WARP_C application
//

#if !defined(AFX_WARP_C_H__2A278744_EF76_11D4_B45C_444553540000__INCLUDED_)
#define AFX_WARP_C_H__2A278744_EF76_11D4_B45C_444553540000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CWarp_cApp:
// See warp_c.cpp for the implementation of this class
//

class CWarp_cApp : public CWinApp
{
public:
	CWarp_cApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWarp_cApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CWarp_cApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WARP_C_H__2A278744_EF76_11D4_B45C_444553540000__INCLUDED_)
