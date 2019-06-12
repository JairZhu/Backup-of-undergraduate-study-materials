unit md5_test_main;

// -----------------------------------------------------------------------------------------------
INTERFACE
// -----------------------------------------------------------------------------------------------

uses
	Windows, SysUtils, Classes, Forms, Dialogs, Controls, StdCtrls, ComCtrls;

type
	TMain = class(TForm)
		Pages: TPageControl;
		TabString: TTabSheet;
		TabFile: TTabSheet;
		TabTestSuite: TTabSheet;
		TabTimeTrial: TTabSheet;
		SLabel: TLabel;
		SEdit: TEdit;
		SDigest: TButton;
		FLabel: TLabel;
		FEdit: TEdit;
		FSelect: TButton;
		FDigest: TButton;
		TSExecute: TButton;
		TTLabel1: TLabel;
		TTLength: TEdit;
		TTLabel2: TLabel;
		TTCount: TEdit;
		TTStart: TButton;
		Display: TMemo;
		ButtonClear: TButton;
		ButtonClose: TButton;
		OpenDlg: TOpenDialog;
		procedure SDigestClick(Sender: TObject);
		procedure FSelectClick(Sender: TObject);
		procedure FDigestClick(Sender: TObject);
		procedure TSExecuteClick(Sender: TObject);
		procedure TTKeyPress(Sender: TObject; var Key: Char);
		procedure TTStartClick(Sender: TObject);
		procedure ButtonClearClick(Sender: TObject);
		procedure ButtonCloseClick(Sender: TObject);
	end;

var
	Main: TMain;

// -----------------------------------------------------------------------------------------------
IMPLEMENTATION
// -----------------------------------------------------------------------------------------------

{$R *.DFM}

uses
	md5;

function LogEntry(Cmd, Msg: string; Dig: MD5Digest): string;
begin
	Result := Format('%s(''%s'') =' + #13#10 + '   %s', [Cmd, Msg, MD5Print(Dig)]);
end;

procedure TMain.SDigestClick(Sender: TObject);
begin
	with Display.Lines do begin
		if Count > 0 then Add('');
		Add(LogEntry('MD5String', SEdit.Text, MD5String(SEdit.Text)));
	end;
end;

procedure TMain.FSelectClick(Sender: TObject);
begin
	with OpenDlg do if Execute then FEdit.Text := FileName;
end;

procedure TMain.FDigestClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
	with Display.Lines do begin
		if Count > 0 then Add('');
		Add(LogEntry('MD5File', FEdit.Text, MD5File(FEdit.Text)));
	end;
	Screen.Cursor := crDefault;
end;

procedure TMain.TSExecuteClick(Sender: TObject);
var
	I: byte;
const
	Suite: array[1..9] of string = (
		'', 'a', 'abc', 'message digest', 'abcdefghijklmnopqrstuvwxyz',
		'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789',
		'12345678901234567890123456789012345678901234567890123456789012345678901234567890',
    'md5Ëã·¨²âÊÔ','´òËéÀ©¾ü°¢ÉªµØ¿ó¾Ö¿¨Ëõ¶Ì'
	);
begin
	with Display.Lines do begin
		if Count > 0 then Add('');
		Add('Executing RFC 1321 test suite ...');
		for I := 1 to 9 do Add(LogEntry('   MD5', Suite[I], MD5String(Suite[I])));
	end;
end;

procedure TMain.TTKeyPress(Sender: TObject; var Key: Char);
begin
	if not (Key in [#8, '0'..'9']) then Key := #0;
end;

procedure TMain.TTStartClick(Sender: TObject);
var
	BLength, BCount: longint;
	Block: pointer;
	B: pByte;
	I: longint;
	Ticks: longword;
	Context: MD5Context;
	Digest: MD5Digest;
	Speed: string;
begin
	Screen.Cursor := crHourGlass;
	BLength := strToIntDef(copy(TTLength.Text, 1, 5), 0);
	BCount := strToIntDef(copy(TTCount.Text, 1, 5), 0);
	if BLength < 0 then BLength := 0;
	if BCount < 0 then BCount := 0;
	with Display.Lines do begin
		if Count > 0 then Add('');
		Add(Format('Digesting %0.0n %0.0n-byte blocks ...', [BCount + 0.1, BLength + 0.1]));
		GetMem(Block, BLength + 1);
		try
			B := Block;
			I := 0;
			while I < BLength do begin
				B^ := I and $ff;
				inc(B);
				inc(I);
			end;
			Ticks := GetTickCount;
			MD5Init(Context);
			I := 0;
			while I < BCount do begin
				MD5Update(Context, Block, BLength);
				inc(I);
			end;
			MD5Final(Context, Digest);
			Ticks := GetTickCount - Ticks;
			if (BCount * BLength = 0) or (Ticks = 0) then Speed := 'n/a'
			else Speed := Format('%.0n bytes/second', [(BCount * BLength) / (Ticks / 1000)]);
			Add(Format('   Digest = %s', [MD5Print(Digest)]));
			Add(Format('   Time   = %.3n seconds', [Ticks / 1000]));
			Add(Format('   Speed  = %s', [Speed]));
		finally
			FreeMem(Block);
		end;
	end;
	Screen.Cursor := crDefault;
end;

procedure TMain.ButtonClearClick(Sender: TObject);
begin
	Display.Lines.Clear;
end;

procedure TMain.ButtonCloseClick(Sender: TObject);
begin
	Close;
end;

end.

