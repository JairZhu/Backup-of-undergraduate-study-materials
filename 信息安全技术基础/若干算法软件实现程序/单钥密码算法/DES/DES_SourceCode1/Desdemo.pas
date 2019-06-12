unit Desdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsSkinData, BusinessSkinForm, SUIMgr, SUIButton,
  SUIEdit, ExtCtrls, SUIForm;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    suiThemeManager1: TsuiThemeManager;
    suiForm1: TsuiForm;
    Edit1: TsuiEdit;
    Edit2: TsuiEdit;
    Edit3: TsuiEdit;
    Edit4: TsuiEdit;
    Button1: TsuiButton;
    Button2: TsuiButton;
    procedure suitempButton1Click(Sender: TObject);
    procedure suitempButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses cpdes,DESCrypt;


procedure TForm1.suitempButton1Click(Sender: TObject);
begin
 edit2.Text:=EnCryptStr(edit1.Text,edit4.Text);
end;

procedure TForm1.suitempButton2Click(Sender: TObject);
begin
  edit3.Text:=DeCryptStr(edit2.Text,edit4.Text);
end;

end.
