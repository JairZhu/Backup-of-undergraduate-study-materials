//---------------------------------------------------------------------------

#ifndef UnitDesH
#define UnitDesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TDesForm : public TForm
{
__published:	// IDE-managed Components
        TPageControl *MainPage;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TEdit *txtSourcePath;
        TEdit *txtDestPath;
        TLabel *Label1;
        TLabel *Label2;
        TBitBtn *CmdEncrypt;
        TBitBtn *CmdUncode;
        TBitBtn *cmdClose;
        TButton *cmdSourcePath;
        TButton *cmdDestPath;
        TLabel *Label3;
        TEdit *txtSubKey8;
        TEdit *txtSubKey7;
        TEdit *txtSubKey6;
        TEdit *txtSubKey5;
        TEdit *txtSubKey4;
        TEdit *txtSubKey3;
        TEdit *txtSubKey2;
        TEdit *txtSubKey1;
        TLabel *Label4;
        TLabel *Label5;
        TLabel *Label6;
        TLabel *Label7;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TLabel *Label12;
        TLabel *Label13;
        TEdit *txtKey1;
        TLabel *Label14;
        TEdit *txtKey2;
        TLabel *Label15;
        TEdit *txtKey3;
        TLabel *Label16;
        TEdit *txtKey4;
        TLabel *Label17;
        TEdit *txtKey5;
        TLabel *Label18;
        TEdit *txtKey6;
        TLabel *Label19;
        TEdit *txtKey7;
        TLabel *Label20;
        TEdit *txtKey8;
        TLabel *Label21;
        TEdit *txtKey9;
        TLabel *Label22;
        TEdit *txtKey10;
        TLabel *Label23;
        TEdit *txtKey11;
        TLabel *Label24;
        TEdit *txtKey12;
        TLabel *Label25;
        TEdit *txtKey13;
        TLabel *Label26;
        TEdit *txtKey14;
        TLabel *Label27;
        TEdit *txtKey15;
        TLabel *Label28;
        TEdit *txtKey16;
        TBitBtn *CmdGetKey;
        TOpenDialog *OpenDlg;
        TTabSheet *TabSheet3;
        TButton *CmdGetP;
        TButton *CmdEncryptTrans;
        TButton *CmdShowCode;
        TEdit *txtBinSrc;
        TEdit *txtBinCode;
        TEdit *txtBinUnCode;
        TButton *CmdGetC;
        TButton *CmdDecryptTrans;
        TButton *CmdShowText;
        TMemo *Memo1;
        TEdit *txtDestText;
        TTabSheet *TabSheet4;
        TButton *Button1;
        TStringGrid *SGIP;
        TStringGrid *SGIPR;
        TLabel *Label29;
        TLabel *Label30;
        TEdit *txtPassWord;
        TLabel *Label31;
        TEdit *txtSrcText;
        TEdit *txtCodeText;
        TLabel *Label32;
        TLabel *Label33;
        TLabel *Label34;
        TLabel *Label35;
        TButton *CmdDoAll;
        TButton *CmdClearLog;
        TRadioGroup *RadioGroup1;
        TRadioButton *RB1;
        TRadioButton *RB2;
        void __fastcall cmdSourcePathClick(TObject *Sender);
        void __fastcall cmdDestPathClick(TObject *Sender);
        void __fastcall txtSubKeyExit(TObject *Sender);
        void __fastcall txtSubKeyEnter(TObject *Sender);
        void __fastcall CmdGetKeyClick(TObject *Sender);
        void __fastcall GenSubKeys();
        void __fastcall CmdGetPClick(TObject *Sender);
        void __fastcall CmdEncryptTransClick(TObject *Sender);
        void __fastcall CmdShowCodeClick(TObject *Sender);
        void __fastcall CmdGetCClick(TObject *Sender);
        void __fastcall CmdDecryptTransClick(TObject *Sender);
        void __fastcall CmdShowTextClick(TObject *Sender);
        void __fastcall FormActivate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button8Click(TObject *Sender);
        void __fastcall showM(char *M, int x, int y, const char* Msg);
        void __fastcall ShowIPTable();
        void __fastcall CmdDoAllClick(TObject *Sender);
        void __fastcall CmdClearLogClick(TObject *Sender);
        void __fastcall CmdEncryptClick(TObject *Sender);
        void __fastcall CmdUncodeClick(TObject *Sender);
        void __fastcall RBClick(TObject *Sender);
private:
        char TempCode[9];
        char * BitToString(char* Out, const char * In, int len);	// User declarations
        char * StringToBit(char* Out, const char * In, int len);	// User declarations
public:		// User declarations
        __fastcall TDesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDesForm *DesForm;
//---------------------------------------------------------------------------
#endif
