program _pokersupernew;

uses
  Forms,
  poker in '..\poker\poker.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
