; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CDlgWait
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "AES.h"

ClassCount=6
Class1=CAESApp
Class2=CAESDlg
Class3=CAboutDlg

ResourceCount=6
Resource1=IDD_VERSION
Resource2=IDR_MAINFRAME
Resource3=IDD_ABOUTBOX
Class4=CDlgEndBox
Resource4=IDD_ENDBOX
Class5=CDlgVersion
Resource5=IDD_AES_DIALOG
Class6=CDlgWait
Resource6=IDD_WAIT

[CLS:CAESApp]
Type=0
HeaderFile=AES.h
ImplementationFile=AES.cpp
Filter=N
LastObject=CAESApp

[CLS:CAESDlg]
Type=0
HeaderFile=AESDlg.h
ImplementationFile=AESDlg.cpp
Filter=D
LastObject=CAESDlg
BaseClass=CDialog
VirtualFilter=dWC

[CLS:CAboutDlg]
Type=0
HeaderFile=AESDlg.h
ImplementationFile=AESDlg.cpp
Filter=D
LastObject=CAboutDlg
BaseClass=CDialog
VirtualFilter=dWC

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=2
Control1=IDOK,button,1208090624
Control2=IDC_STATIC,static,1342179342

[DLG:IDD_AES_DIALOG]
Type=1
Class=CAESDlg
ControlCount=35
Control1=IDOK,button,1342242816
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_BUTTON1,button,1342242816
Control5=IDC_EDIT1,edit,1350633600
Control6=IDC_BUTTON2,button,1342242816
Control7=IDC_EDIT2,edit,1350633600
Control8=IDC_EDIT3,edit,1353781444
Control9=IDC_STATIC,static,1342308352
Control10=IDC_BUTTON3,button,1342242816
Control11=IDC_STATIC,static,1342308352
Control12=IDC_EDIT4,edit,1353779396
Control13=IDC_BUTTON4,button,1342242816
Control14=IDC_BUTTON5,button,1342242816
Control15=IDC_BUTTON6,button,1342242816
Control16=IDC_EDIT5,edit,1350633602
Control17=IDC_STATIC,static,1342308352
Control18=IDC_EDIT6,edit,1350633600
Control19=IDC_STATIC,static,1342308352
Control20=IDC_EDIT7,edit,1350633602
Control21=IDC_PROGRESS1,msctls_progress32,1350565888
Control22=IDC_STATIC,static,1342308352
Control23=IDC_STATIC,static,1342308352
Control24=IDC_EDIT8,edit,1350633476
Control25=IDC_BUTTON7,button,1208025088
Control26=IDC_BUTTON8,button,1208025088
Control27=IDC_BUTTON9,button,1208025088
Control28=IDC_BUTTON10,button,1342242816
Control29=IDC_BUTTON11,button,1208025088
Control30=IDC_BUTTON12,button,1342242816
Control31=IDC_BUTTON13,button,1342242816
Control32=IDC_BUTTON14,button,1342242816
Control33=IDC_STATIC,static,1342177283
Control34=IDC_BUTTON15,button,1342242816
Control35=IDC_BUTTON16,button,1342242817

[DLG:IDD_ENDBOX]
Type=1
Class=CDlgEndBox
ControlCount=2
Control1=IDOK,button,1208090624
Control2=IDC_STATIC,static,1342179342

[CLS:CDlgEndBox]
Type=0
HeaderFile=DlgEndBox.h
ImplementationFile=DlgEndBox.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgEndBox
VirtualFilter=dWC

[DLG:IDD_VERSION]
Type=1
Class=CDlgVersion
ControlCount=4
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,button,1342177287
Control4=IDC_EDIT1,edit,1350633668

[CLS:CDlgVersion]
Type=0
HeaderFile=DlgVersion.h
ImplementationFile=DlgVersion.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgVersion
VirtualFilter=dWC

[DLG:IDD_WAIT]
Type=1
Class=CDlgWait
ControlCount=0

[CLS:CDlgWait]
Type=0
HeaderFile=DlgWait.h
ImplementationFile=DlgWait.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgWait

