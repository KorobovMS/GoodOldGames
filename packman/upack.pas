unit upack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus;

type
  ttarget=record
            tx,ty:integer;
            visible:boolean;
          end;
  tenemy=record
           ex,ey,nex,ney:integer;
           visible:boolean;
           map:tbitmap;
         end;
  TForm1 = class(TForm)
    packt: TTimer;
    StatusBar1: TStatusBar;
    enemyt: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure packtTimer(Sender: TObject);
    procedure enemytTimer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    sym:char;
  end;

var
  Form1: TForm1;
mleft,mleftcl,mright,mrightcl,mup,mupcl,mdown,mdowncl:tbitmap;
mx,my,what,tar:integer;
target:array[1..40] of ttarget;
enemy:array[1..3] of tenemy;
implementation
uses unit2;
{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
var i:integer;
begin
  randomize;
  form1.Canvas.Brush.Color:=clwhite;
  form1.Canvas.Rectangle(0,0,700,700);
  mleft:=tbitmap.Create;
  mright:=tbitmap.Create;
  mup:=tbitmap.Create;
  mdown:=tbitmap.Create;

  mleftcl:=tbitmap.Create;
  mrightcl:=tbitmap.Create;
  mupcl:=tbitmap.Create;
  mdowncl:=tbitmap.Create;

  for i:=1 to 3 do enemy[i].map:=tbitmap.Create;

  mleft.LoadFromFile('mleft.bmp');
  mright.LoadFromFile('mright.bmp');
  mup.LoadFromFile('mup.bmp');
  mdown.LoadFromFile('mdown.bmp');

  mleftcl.LoadFromFile('mleftcl.bmp');
  mrightcl.LoadFromFile('mrightcl.bmp');
  mupcl.LoadFromFile('mupcl.bmp');
  mdowncl.LoadFromFile('mdowncl.bmp');

  for i:=1 to 3 do
  enemy[i].map.LoadFromFile('enemy.bmp');

  {mleft.Transparent:=true;
  mright.Transparent:=true;
  mup.Transparent:=true;
  mdown.Transparent:=true;

  mleftcl.Transparent:=true;
  mrightcl.Transparent:=true;
  mupcl.Transparent:=true;
  mdowncl.Transparent:=true;}

  for i:=1 to 40 do
  begin
    with target[i] do
    begin
      visible:=true;
      tx:=random(600)+10;
      ty:=random(400)+10;
    end;
  end;
  form1.Canvas.Brush.Color:=clred;
  form1.Canvas.Pen.Color:=form1.Color;
  mx:=10;
  my:=10;
  enemy[1].ex:=600;
  enemy[1].ey:=10;
  enemy[2].ex:=600;
  enemy[2].ey:=400;
  enemy[3].ex:=10;
  enemy[3].ey:=400;

  enemy[1].nex:=600;
  enemy[1].ney:=10;
  enemy[2].nex:=600;
  enemy[2].ney:=400;
  enemy[3].nex:=10;
  enemy[3].ney:=400;
  what:=1;
  tar:=0;
  mainmenu1.Items[0].Items[0].OnClick:=form1.OnActivate;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
sym:=key;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  packt.Enabled:=false;
  enemyt.Enabled:=false;
  mleft.Free;
  mright.Free;
  mup.Free;
  mdown.Free;

  mleftcl.Free;
  mrightcl.Free;
  mupcl.Free;
  mdowncl.Free;
end;

procedure TForm1.packtTimer(Sender: TObject);
var i:integer;
begin
  what:=-what;
  case sym of
  #244:begin
         if what=1 then begin
         form1.canvas.Draw(mx,my,mleft);
         dec(mx,5);
         end
         else begin
                form1.canvas.Draw(mx,my,mleftcl);
                dec(mx,5);
              end;
         for i:=1 to 40 do
         if (abs((mx+25)-target[i].tx)<30)and(abs((my+25)-target[i].ty)<30)
         then begin
                inc(tar);
                target[i].tx:=-1000;
                target[i].ty:=-1000;
                target[i].visible:=false;
                statusbar1.Panels[0].Text:='������� '+inttostr(tar);
              end;
       end;

  #226:begin
         if what=1 then begin
         form1.canvas.Draw(mx,my,mright);
         inc(mx,5);
         end
         else begin
                form1.canvas.Draw(mx,my,mrightcl);
                inc(mx,5);
              end;
         for i:=1 to 40 do
         if (abs((mx+25)-target[i].tx)<30)and(abs((my+25)-target[i].ty)<30)
         then begin
                inc(tar);
                target[i].tx:=-1000;
                target[i].ty:=-1000;
                target[i].visible:=false;
                statusbar1.Panels[0].Text:='������� '+inttostr(tar);
              end;
       end;

  #246:begin
         if what=1 then begin
         form1.canvas.Draw(mx,my,mup);
         dec(my,5);
         end
         else begin
                form1.canvas.Draw(mx,my,mupcl);
                dec(my,5);
              end;
         for i:=1 to 40 do
         if (abs((mx+25)-target[i].tx)<30)and(abs((my+25)-target[i].ty)<30)
         then begin
                inc(tar);
                target[i].tx:=-1000;
                target[i].ty:=-1000;
                target[i].visible:=false;
                statusbar1.Panels[0].Text:='������� '+inttostr(tar);
              end;
       end;

  #251:begin
         if what=1 then begin
         form1.canvas.Draw(mx,my,mdown);
         inc(my,5);
         end
         else begin
                form1.canvas.Draw(mx,my,mdowncl);
                inc(my,5);
              end;
         for i:=1 to 40 do
         if (abs((mx+25)-target[i].tx)<30)and(abs((my+25)-target[i].ty)<30)
         then begin
                inc(tar);
                target[i].tx:=-1000;
                target[i].ty:=-1000;
                target[i].visible:=false;
                statusbar1.Panels[0].Text:='������� '+inttostr(tar);
              end;
       end;
  end;
  statusbar1.Panels[1].Text:='�� ���������� �� ('+inttostr(mx)+'; '+inttostr(my)+')';
  for i:=1 to 40 do
  if target[i].visible
  then canvas.Ellipse(target[i].tx,target[i].ty,target[i].tx+10,target[i].ty+10);
  end;

procedure TForm1.enemytTimer(Sender: TObject);
var i:integer;
begin
  for i:=1 to 3 do
  with enemy[i] do
  begin
    if ex>mx then dec(ex)
    else inc(ex);
    if ey>my then dec(ey)
    else inc(ey);
    form1.Canvas.Draw(ex,ey,map);
    if (abs(ex-mx)<30)and(abs(ey-my)<30) then form1.Activate;
  end;

end;

procedure TForm1.N5Click(Sender: TObject);
begin
  if mainmenu1.Items[1].Caption='�����' then begin
  packt.Enabled:=false;
  enemyt.Enabled:=false;
  mainmenu1.Items[1].Caption:='����������';
  end
  else begin
         packt.Enabled:=true;
         enemyt.Enabled:=true;
         mainmenu1.Items[1].Caption:='�����';
       end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 close;
end;


procedure TForm1.N6Click(Sender: TObject);
begin
  packt.Enabled:=false;
  enemyt.Enabled:=false;
  unit2.Form2.Visible:=true;
end;

end.
