unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    SB1: TSpeedButton;
    SB2: TSpeedButton;
    SB3: TSpeedButton;
    SB4: TSpeedButton;
    SB5: TSpeedButton;
    SB6: TSpeedButton;
    SB7: TSpeedButton;
    SB8: TSpeedButton;
    SB9: TSpeedButton;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    procedure SB1Click(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure SB4Click(Sender: TObject);
    procedure SB5Click(Sender: TObject);
    procedure SB6Click(Sender: TObject);
    procedure SB7Click(Sender: TObject);
    procedure SB8Click(Sender: TObject);
    procedure SB9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure newgame;
    procedure search;
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pole:array[1..3,1..3] of integer;
  och,hod:integer;
implementation

procedure tform1.newgame;
var i,j:integer;
begin
  radiobutton1.Visible:=true;
  radiobutton2.Visible:=true;
  button1.Visible:=true;
  label1.Visible:=true;
  sb1.Visible:=false;
  sb2.Visible:=false;
  sb3.Visible:=false;
  sb4.Visible:=false;
  sb5.Visible:=false;
  sb6.Visible:=false;
  sb7.Visible:=false;
  sb8.Visible:=false;
  sb9.Visible:=false;
  sb1.Glyph.LoadFromFile('none.bmp');
  sb2.Glyph.LoadFromFile('none.bmp');
  sb3.Glyph.LoadFromFile('none.bmp');
  sb4.Glyph.LoadFromFile('none.bmp');
  sb5.Glyph.LoadFromFile('none.bmp');
  sb6.Glyph.LoadFromFile('none.bmp');
  sb7.Glyph.LoadFromFile('none.bmp');
  sb8.Glyph.LoadFromFile('none.bmp');
  sb9.Glyph.LoadFromFile('none.bmp');
  for i:=1 to 3 do
  for j:=1 to 3 do pole[i,j]:=0;
  hod:=0;
end;

procedure tform1.search;
var i:integer; s:string;
begin
  inc(hod);
  s:='';
  for i:=1 to 3 do
  if (pole[i,1]=pole[i,2])and(pole[i,1]=pole[i,3])and (pole[i,1]<>0)
  then begin
        case pole[i,1] of
         1:s:='Крестики выиграли!';
        -1:s:='Нолики выиграли!';
        end;
        showmessage(s);
        newgame;
        end;

  for i:=1 to 3 do
  if (pole[1,i]=pole[2,i])and(pole[1,i]=pole[3,i])and (pole[1,i]<>0)
  then begin
         case pole[1,i] of
         1:s:='Крестики выиграли!';
        -1:s:='Нолики выиграли!';
        end;
        showmessage(s);
        newgame;
       end;

  if (((pole[1,1]=pole[2,2])and(pole[1,1]=pole[3,3]))
  or ((pole[1,3]=pole[2,2])and(pole[2,2]=pole[3,1])))and (pole[2,2]<>0)
  then begin
         case pole[2,2] of
         1:s:='Крестики выиграли!';
        -1:s:='Нолики выиграли!';
        end;
        showmessage(s);
        newgame;
       end;
   if hod=9 then begin
   showmessage('Ничья!');
   newgame;
   end;
end;


{$R *.dfm}

procedure TForm1.SB1Click(Sender: TObject);
begin
  case och of
  1:begin
      sb1.Glyph.LoadFromFile('X.bmp');
      pole[1,1]:=1;
      search;
    end;
 -1:begin
      sb1.Glyph.LoadFromFile('O.bmp');
      pole[1,1]:=-1;
      search;
    end;
    end;
   och:=-och;
end;

procedure TForm1.SB2Click(Sender: TObject);
begin
  case och of
  1:begin
      sb2.Glyph.LoadFromFile('X.bmp');
      pole[1,2]:=1;
      search;
    end;
 -1:begin
      sb2.Glyph.LoadFromFile('O.bmp');
      pole[1,2]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB3Click(Sender: TObject);
begin
  case och of
  1:begin
      sb3.Glyph.LoadFromFile('X.bmp');
      pole[1,3]:=1;
      search;
    end;
 -1:begin
      sb3.Glyph.LoadFromFile('O.bmp');
      pole[1,3]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB4Click(Sender: TObject);
begin
  case och of
  1:begin
      sb4.Glyph.LoadFromFile('X.bmp');
      pole[2,1]:=1;
      search;
    end;
 -1:begin
      sb4.Glyph.LoadFromFile('O.bmp');
      pole[2,1]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB5Click(Sender: TObject);
begin
  case och of
  1:begin
      sb5.Glyph.LoadFromFile('X.bmp');
      pole[2,2]:=1;
      search;
    end;
 -1:begin
      sb5.Glyph.LoadFromFile('O.bmp');
      pole[2,2]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB6Click(Sender: TObject);
begin
  case och of
  1:begin
      sb6.Glyph.LoadFromFile('X.bmp');
      pole[2,3]:=1;
      search;
    end;
 -1:begin
      sb6.Glyph.LoadFromFile('O.bmp');
      pole[2,3]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB7Click(Sender: TObject);
begin
  case och of
  1:begin
      sb7.Glyph.LoadFromFile('X.bmp');
      pole[3,1]:=1;
      search;
    end;
 -1:begin
      sb7.Glyph.LoadFromFile('O.bmp');
      pole[3,1]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB8Click(Sender: TObject);
begin
  case och of
  1:begin
      sb8.Glyph.LoadFromFile('X.bmp');
      pole[3,2]:=1;
      search;
    end;
 -1:begin
      sb8.Glyph.LoadFromFile('O.bmp');
      pole[3,2]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.SB9Click(Sender: TObject);
begin
  case och of
  1:begin
      sb9.Glyph.LoadFromFile('X.bmp');
      pole[3,3]:=1;
      search;
    end;
 -1:begin
      sb9.Glyph.LoadFromFile('O.bmp');
      pole[3,3]:=-1;
      search;
    end;
    end;
    och:=-och;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  randomize;
  if radiobutton1.Checked then och:=1;
  if radiobutton2.Checked then och:=-1;
  radiobutton1.Visible:=false;
  radiobutton2.Visible:=false;
  button1.Visible:=false;
  label1.Visible:=false;
  sb1.Visible:=true;
  sb2.Visible:=true;
  sb3.Visible:=true;
  sb4.Visible:=true;
  sb5.Visible:=true;
  sb6.Visible:=true;
  sb7.Visible:=true;
  sb8.Visible:=true;
  sb9.Visible:=true;
  hod:=0;
end;


end.
