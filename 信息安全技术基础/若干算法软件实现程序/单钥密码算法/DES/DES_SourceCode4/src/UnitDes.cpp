//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <string.h>

#pragma hdrstop

#include "UnitDes.h"
#include "UnitKeys.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TDesForm *DesForm;
//---------------------------------------------------------------------------
__fastcall TDesForm::TDesForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDesForm::cmdSourcePathClick(TObject *Sender)
{
  if (OpenDlg->Execute())
  {
    txtSourcePath->Text = OpenDlg->FileName;
  }
}
//---------------------------------------------------------------------------
void __fastcall TDesForm::cmdDestPathClick(TObject *Sender)
{
  if (OpenDlg->Execute())
  {
    txtDestPath->Text = OpenDlg->FileName;
  }
}
//---------------------------------------------------------------------------
void __fastcall TDesForm::txtSubKeyExit(TObject *Sender)
{
  try
  {
    StrToInt(((TEdit*)Sender)->Text);
    GenSubKeys();
  }
  catch (...)
  {
    ShowMessage("无效的输入");
    ((TEdit*)Sender)->Text = '1';
    ((TEdit*)Sender)->SetFocus();
    GenSubKeys();
  }
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::txtSubKeyEnter(TObject *Sender)
{
  ((TEdit*)Sender)->SelectAll();
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdGetKeyClick(TObject *Sender)
{
  txtSubKey8->Text = IntToStr(GetRandKey());
  txtSubKey7->Text = IntToStr(GetRandKey());
  txtSubKey6->Text = IntToStr(GetRandKey());
  txtSubKey5->Text = IntToStr(GetRandKey());
  txtSubKey4->Text = IntToStr(GetRandKey());
  txtSubKey3->Text = IntToStr(GetRandKey());
  txtSubKey2->Text = IntToStr(GetRandKey());
  txtSubKey1->Text = IntToStr(GetRandKey());
  GenSubKeys();
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::GenSubKeys()
{
  char s[8], buf[65];
  int i;

  s[0]=(char)(StrToInt(txtSubKey1->Text));
  s[1]=(char)(StrToInt(txtSubKey2->Text));
  s[2]=(char)(StrToInt(txtSubKey3->Text));
  s[3]=(char)(StrToInt(txtSubKey4->Text));
  s[4]=(char)(StrToInt(txtSubKey5->Text));
  s[5]=(char)(StrToInt(txtSubKey6->Text));
  s[6]=(char)(StrToInt(txtSubKey7->Text));
  s[7]=(char)(StrToInt(txtSubKey8->Text));

  if (RB1->Checked)
    MakeSubKey(s);
  else
    MakeSubKey2(s);

  txtKey1->Text = BitToString(buf,SubKeys[0],48);
  txtKey2->Text = BitToString(buf, SubKeys[1], 48);
  txtKey3->Text = BitToString(buf, SubKeys[2], 48);
  txtKey4->Text = BitToString(buf, SubKeys[3], 48);
  txtKey5->Text = BitToString(buf, SubKeys[4], 48);
  txtKey6->Text = BitToString(buf, SubKeys[4], 48);
  txtKey7->Text = BitToString(buf, SubKeys[6], 48);
  txtKey8->Text = BitToString(buf, SubKeys[7], 48);
  txtKey9->Text = BitToString(buf, SubKeys[8], 48);
  txtKey10->Text = BitToString(buf, SubKeys[9], 48);
  txtKey11->Text = BitToString(buf, SubKeys[10], 48);
  txtKey12->Text = BitToString(buf, SubKeys[11], 48);
  txtKey13->Text = BitToString(buf, SubKeys[12], 48);
  txtKey14->Text = BitToString(buf, SubKeys[13], 48);
  txtKey15->Text = BitToString(buf, SubKeys[14], 48);
  txtKey16->Text = BitToString(buf, SubKeys[15], 48);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdGetPClick(TObject *Sender)
{
  char strSrc[65];
  int i;

  memset(srcData, 0, 9);
  strncpy(srcData,txtSrcText->Text.c_str(),8);
  txtSrcText->Text = srcData;

  //把明文转成二进制数据形式
  BytesToBits(srcData, LR[0],64);
  txtBinSrc->Text = BitToString(srcData, LR[0], 64);

  //经过初始置换
  Transform(IP_Table, LR[0], LR[0], 64);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdShowCodeClick(TObject *Sender)
{
  char buf[65];

  //经过最终置换
  Transform(IPR_Table, LR[16], dest, 64);
  //输出密文明
  txtBinCode->Text = BitToString(buf,dest,64);
  BitsToBytes(TempCode, dest, 64);
  TempCode[8]=0;
  txtCodeText->Text = TempCode;
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdGetCClick(TObject *Sender)
{
  char strSrc[65];
  int i;

  strncpy(srcData,TempCode,8);
  srcData[8]=0;
  txtCodeText->Text = srcData;

  //把明文转成二进制数据形式
  BytesToBits(srcData, LR[0],64);
  //经过初始置换
  Transform(IP_Table, LR[0], LR[0], 64);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdEncryptTransClick(TObject *Sender)
{
  int i,j;
  char buf[256], Msg[512];

  for (i=0;i<16;i++)
  {
    memcpy(LR[i+1],LR[i]+32,32);
    F_func(LR[i]+32, LR[i+1]+32, SubKeys[i]);
    Xor(LR[i+1]+32, LR[i], 32);
  }
  RotateL(LR[16],LR[16],64,32);
  showM(LR[0],64,17, "加密");
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdDecryptTransClick(TObject *Sender)
{
  int i,j;
  char buf[256], Msg[512];

  for (i=0;i<16;i++)
  {
    memcpy(LR[i+1],LR[i]+32,32);
    F_func(LR[i]+32, LR[i+1]+32, SubKeys[15-i]);
    Xor(LR[i+1]+32, LR[i], 32);
  }
  RotateL(LR[16],LR[16],64,32);
  showM(LR[0],64,17, "解密");
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdShowTextClick(TObject *Sender)
{
  int i;
  char buf[65];

  //经过最终置换
  Transform(IPR_Table, LR[16], dest, 64);

  //输出明文明
  BitsToBytes(buf, dest, 64);
  buf[8] = 0;
  txtDestText->Text = buf;
  txtBinUnCode->Text = BitToString(buf,dest,64);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::FormActivate(TObject *Sender)
{
  GenSubKeys();
  ShowIPTable();
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::Button1Click(TObject *Sender)
{
  GenIPTable();
  ShowIPTable();
}

void __fastcall TDesForm::showM(char *M, int x, int y, const char* Msg)
{
  int i,j;
  char buf[1024],buf1[1024];

  Memo1->Lines->Add("======================================================");
  Memo1->Lines->Add(Msg);
  for (i=0;i<y;i++)
  {
    sprintf(buf, "[第%2d行]  ",i);
    for (j=0;j<x;j++)
    {
      sprintf(buf1,"%d", M[i*x+j]);
      strcat(buf,buf1);
    }
    Memo1->Lines->Add(buf);
  }
  Memo1->Lines->Add("======================================================");
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::Button8Click(TObject *Sender)
{
  int i;
  char M[64], N[64], O[64];

  for (i=0;i<64;i++)
    M[i]=i+1;

  Transform(IP_Table, M, N, 64);

  Transform(IPR_Table, N, O, 64);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::ShowIPTable()
{
  int i,j;

  for (i=0;i<8;i++)
  {
    for (j=0;j<8;j++)
    {
      SGIP->Rows[i]->Strings[j] = IntToStr(IP_Table[i*8+j]);
      SGIPR->Rows[i]->Strings[j] = IntToStr(IPR_Table[i*8+j]);
    }
  }
}
//---------------------------------------------------------------------------

char * TDesForm::BitToString(char* Out, const char * In, int len)
{
  for (int i=0;i<len;i++)
    Out[i]=In[i]+'0';
  Out[len]=0;
  return Out;
}
//---------------------------------------------------------------------------

char * TDesForm::StringToBit(char* Out, const char * In, int len)
{
  for (int i=0;i<len;i++)
    Out[i]=In[i]-'0';
  Out[len]=0;
  return Out;
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdDoAllClick(TObject *Sender)
{
  CmdGetPClick(Sender);
  CmdEncryptTransClick(Sender);
  CmdShowCodeClick(Sender);
  CmdGetCClick(Sender);
  CmdDecryptTransClick(Sender);
  CmdShowTextClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::CmdClearLogClick(TObject *Sender)
{
  Memo1->Lines->Clear();        
}
//---------------------------------------------------------------------------


void __fastcall TDesForm::CmdEncryptClick(TObject *Sender)
{
  char buf[256],buf1[8], fname[256];
  FILE *Input, *Output;
  long int filesize;

  //打开源文件
  strcpy(fname,txtSourcePath->Text.c_str());
  if (!FileExists(fname))
  {
    sprintf(buf, "文件 %s 不存在", fname);
    ShowMessage(buf);
    return;
  }
  Input = fopen(fname, "rb");
  if (!Input)
  {
    sprintf(buf, "无法打开文件 %s", fname);
    ShowMessage(buf);
    return;
  }

  //打开目标文件
  strcpy(fname,txtDestPath->Text.c_str());
  Output = fopen(fname, "wb+");
  if (!Output)
  {
    sprintf(buf, "无法打开文件 %s", fname);
    ShowMessage(buf);
    fclose(Input);
    return;
  }

  //写入IP表，文件长度，DES加密轮数
  memcpy(buf,IP_Table,64);
  fseek(Input, 0, SEEK_END);
  filesize = ftell(Input);
  memcpy(&buf[64],(void*)&filesize,4);
  fwrite(buf,68,1,Output);

  //设定密钥
  MakeSubKey(txtPassWord->Text.c_str());

  //加密转换
  fseek(Input, 0, SEEK_SET);
  memset(buf,0,8);
  while (fread(buf,1,8,Input))
  {
    Encrypt(buf,buf1);
    fwrite(buf1,8,1,Output);
  }

  fclose(Input);
  fclose(Output);
}
//---------------------------------------------------------------------------


void __fastcall TDesForm::CmdUncodeClick(TObject *Sender)
{
  char buf[256],buf1[8], fname[256];
  FILE *Input, *Output;
  long int filesize;
  int len;

  //打开源文件
  strcpy(fname,txtSourcePath->Text.c_str());
  if (!FileExists(fname))
  {
    sprintf(buf, "文件 %s 不存在", fname);
    ShowMessage(buf);
    return;
  }
  Input = fopen(fname, "rb");
  if (!Input)
  {
    sprintf(buf, "无法打开文件 %s", fname);
    ShowMessage(buf);
    return;
  }

  //打开目标文件
  strcpy(fname,txtDestPath->Text.c_str());
  Output = fopen(fname, "wb+");
  if (!Output)
  {
    sprintf(buf, "无法打开文件 %s", fname);
    ShowMessage(buf);
    fclose(Input);
    return;
  }

  //读入IP表及文件长度
  if (fread((void*)buf,68,1,Input)!=1)
  {
    ShowMessage("文件读入错误");
    fclose(Input);
    fclose(Output);
    return;
  }
  memcpy((void*)&filesize,&buf[64],4);

  //设定密钥
  MakeSubKey(txtPassWord->Text.c_str());
  //设定IP表
  if (!SetIPTable(buf))
  {
    ShowMessage("文件读入错误(格式有误)");
    fclose(Input);
    fclose(Output);
    return;
  }

  //解密转换
  memset(buf,0,8);
  while (filesize>0)
  {
    len=fread(buf,1,8,Input);
    if (len!=8)
    {
      ShowMessage("Error");
      fclose(Input);
      fclose(Output);
    }
    DeEncrypt(buf,buf1);
    fwrite(buf1,(filesize<8)?filesize:len,1,Output);
    filesize-=len;
  }

  fclose(Input);
  fclose(Output);
}
//---------------------------------------------------------------------------

void __fastcall TDesForm::RBClick(TObject *Sender)
{
  GenSubKeys();
}
//---------------------------------------------------------------------------


