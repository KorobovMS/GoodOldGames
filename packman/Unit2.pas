unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    pspeed: TTrackBar;
    espeed: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure pspeedChange(Sender: TObject);
    procedure espeedChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses upack;
{$R *.dfm}

procedure TForm2.pspeedChange(Sender: TObject);
begin
  label1.Caption:='�������� �������= '+inttostr(pspeed.Position);
end;

procedure TForm2.espeedChange(Sender: TObject);
begin
  label2.Caption:='�������� ������= '+inttostr(espeed.Position);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  form2.Visible:=false;
  upack.Form1.packt.Enabled:=true;
  upack.Form1.enemyt.Enabled:=true;
  upack.Form1.enemyt.interval:=101-unit2.Form2.espeed.Position;
  upack.Form1.packt.Interval:=101-unit2.Form2.pspeed.Position;
  if upack.Form1.MainMenu1.Items[1].Caption='����������'
  then upack.Form1.MainMenu1.Items[1].Caption:='�����';
end;

end.
