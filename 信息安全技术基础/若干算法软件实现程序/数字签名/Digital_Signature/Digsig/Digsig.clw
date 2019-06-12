; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CersigDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Digsig.h"

ClassCount=6
Class1=CDigsigApp
Class2=CDigsigDlg
Class3=CAboutDlg

ResourceCount=6
Resource1=IDD_GENSIG
Resource2=IDR_MAINFRAME
Resource3=IDD_GENKEY
Resource4=IDD_ABOUTBOX
Resource5=IDD_DIGSIG_DIALOG
Class4=CersigDlg
Class5=GenkeyDlg
Class6=GensigDlg
Resource6=IDD_CERSIG

[CLS:CDigsigApp]
Type=0
HeaderFile=Digsig.h
ImplementationFile=Digsig.cpp
Filter=N

[CLS:CDigsigDlg]
Type=0
HeaderFile=DigsigDlg.h
ImplementationFile=DigsigDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=IDC_FORMTAB

[CLS:CAboutDlg]
Type=0
HeaderFile=DigsigDlg.h
ImplementationFile=DigsigDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_DIGSIG_DIALOG]
Type=1
Class=CDigsigDlg
ControlCount=2
Control1=IDC_LOCATION,static,1342308352
Control2=IDC_FORMTAB,SysTabControl32,1342177280

[DLG:IDD_GENKEY]
Type=1
Class=GenkeyDlg
ControlCount=9
Control1=IDC_GENK_N,edit,1350633600
Control2=IDC_GENK_D,edit,1350633600
Control3=IDC_GENK_E,edit,1350633600
Control4=IDC_GENKEY,button,1342242816
Control5=IDC_STATIC,static,1342308353
Control6=IDC_STATIC,static,1342308353
Control7=IDC_STATIC,static,1342308353
Control8=IDC_SAVE_PK,button,1342242816
Control9=IDC_SAVE_UK,button,1342242816

[DLG:IDD_GENSIG]
Type=1
Class=GensigDlg
ControlCount=10
Control1=IDC_GENS_PK,edit,1350633600
Control2=IDC_GENS_IMPK,button,1342242816
Control3=IDC_GENS_F,edit,1350633600
Control4=IDC_GENS_IMF,button,1342242816
Control5=IDC_GENS_S,edit,1350633600
Control6=IDC_GENSIG,button,1342242816
Control7=IDC_GENS_SAVE,button,1342242816
Control8=IDC_STATIC,static,1342308865
Control9=IDC_STATIC,static,1342308865
Control10=IDC_STATIC,static,1342308865

[DLG:IDD_CERSIG]
Type=1
Class=CersigDlg
ControlCount=8
Control1=IDC_CERS_UK,edit,1350633600
Control2=IDC_STATIC,static,1342308865
Control3=IDC_CERS_IMUK,button,1342242816
Control4=IDC_CERS_F,edit,1350633600
Control5=IDC_CERS_IMF,button,1342242816
Control6=IDC_CERS_SIG,edit,1350633600
Control7=IDC_CERS_IMSIG,button,1342242816
Control8=IDC_CERS,button,1342242816

[CLS:CersigDlg]
Type=0
HeaderFile=CersigDlg.h
ImplementationFile=CersigDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_CERS_UK
VirtualFilter=dWC

[CLS:GenkeyDlg]
Type=0
HeaderFile=GenkeyDlg.h
ImplementationFile=GenkeyDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_GENK_N
VirtualFilter=dWC

[CLS:GensigDlg]
Type=0
HeaderFile=GensigDlg.h
ImplementationFile=GensigDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_GENS_PK
VirtualFilter=dWC

