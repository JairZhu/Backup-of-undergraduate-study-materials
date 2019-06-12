program md5_test;

uses
	Forms,
	md5_test_main in 'md5_test_main.pas' {Main};

{$R *.RES}

begin
	Application.Initialize;
	Application.Title := 'md5.pas for Delphi 7';
	Application.CreateForm(TMain, Main);
	Application.Run;
end.

