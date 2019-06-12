// AES.h : main header file for the AES application
//

#if !defined(AFX_AES_H__9BC2E7A1_DF11_41A1_B4E2_F45E3A8568E4__INCLUDED_)
#define AFX_AES_H__9BC2E7A1_DF11_41A1_B4E2_F45E3A8568E4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CAESApp:
// See AES.cpp for the implementation of this class
//

class CAESApp : public CWinApp
{
public:
	CAESApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAESApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CAESApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_AES_H__9BC2E7A1_DF11_41A1_B4E2_F45E3A8568E4__INCLUDED_)
