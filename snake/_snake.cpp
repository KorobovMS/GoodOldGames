//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "_snake.h"
#include <cstdlib>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
TSnake *snake;
TTarget *target;
//---------------------------------------------------------------------------

TSnake_zveno::TSnake_zveno(int _x,int _y):x(_x),y(_y)
{}

int TSnake_zveno::GetX() const
{return x;}

void TSnake_zveno::SetX(int _x)
{x=_x;}

int TSnake_zveno::GetY() const
{return y;}

void TSnake_zveno::SetY(int _y)
{y=_y;}


TSnake::TSnake()
{
  count=0;
  Form1->Canvas->Pen->Color=Form1->Color;
  first=new TSnake_zveno(30,30);
  last=first;
  dir='в';
  first->next=last;
  last->pred=first;
  TSnake_zveno *x;
  x=new TSnake_zveno(20,30);
  last->next=x;
  x->pred=last;
  last=x;
  x=new TSnake_zveno(10,30);
  last->next=x;
  x->pred=last;
  last=x;
  last->next=0;
}

TSnake::~TSnake()
{
  TSnake_zveno *curr=first;
  TSnake_zveno *temp;
  for(; curr!=0;)
  {
    temp=curr;
    curr=temp->next;
    delete temp;
  }
}

char TSnake::GetDir() const
{return dir;}

void TSnake::SetDir(char _dir)
{dir=_dir;}

TSnake_zveno* TSnake::GetFirst()const
{
  return first;
}

TSnake_zveno* TSnake::GetLast()const
{
  return last;
}

void TSnake::prn()
{
  TSnake_zveno *curr;
  Form1->Canvas->Brush->Color=Form1->Color;
  for(curr=first; curr!=0; curr=curr->next)
    Form1->Canvas->Ellipse(curr->x,curr->y,curr->x+10,curr->y+10);

  switch (snake->dir)
  {
    case 'ц':
      snake->first->y-=10;
      for(curr=last; curr!=first; curr=curr->pred)
      {
        curr->x=curr->pred->x;
        curr->y=curr->pred->y;
      };
      break;
    case 'ы':
      snake->first->y+=10;
      for(curr=last; curr!=first; curr=curr->pred)
      {
        curr->x=curr->pred->x;
        curr->y=curr->pred->y;
      };
      break;
    case 'в':
      snake->first->x+=10;
      for(curr=last; curr!=first; curr=curr->pred)
      {
        curr->x=curr->pred->x;
        curr->y=curr->pred->y;
      };
      break;
    case 'ф':
      snake->first->x-=10;
      for(curr=last; curr!=first; curr=curr->pred)
      {
        curr->x=curr->pred->x;
        curr->y=curr->pred->y;
      };
      break;
  };
  Form1->Canvas->Brush->Color=clRed;
  for(curr=first; curr!=0; curr=curr->next)
    Form1->Canvas->Ellipse(curr->x,curr->y,curr->x+10,curr->y+10);
}

void TSnake::new_zveno()
{
     target->SetX(rand()%128*10);
     target->SetY(rand()%77*10);
     count++;
     TSnake_zveno *x=new TSnake_zveno(last->x,last->y);
     last->next=x;
     x->pred=last;
     last=x;
     last->next=0;
}

int TSnake::GetCount()const
{return count;}

void TSnake::ExSit()
{
  bool p=false;
  TSnake_zveno *curr;
  for(curr=first->next->next; curr!=0&&!p; curr=curr->next)
  {
     if ((snake->first->x==curr->x)&&
        (snake->first->y==curr->y)) p=true;
  }

  if ((snake->first->x==Form1->ClientWidth)||
     (snake->first->x<0)||
     (snake->first->y==Form1->ClientHeight)||
     (snake->first->y<0)||(p))
     {
       Form1->Timer1->Enabled=false;
       Form1->Color=clRed;
     }
}


TTarget::TTarget(int _x,int _y):x(_x),y(_y)
{}

TTarget::~TTarget()
{}

int TTarget::GetX()const
{return x;}

int TTarget::GetY()const
{return y;}

void TTarget::SetX(int _x)
{x=_x;}

void TTarget::SetY(int _y)
{y=_y;}

void TTarget::prn()
{
  Form1->Canvas->Brush->Color=clGreen;
  Form1->Canvas->Ellipse(x,y,x+10,y+10);
}

__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
  snake->prn();
  target->prn();
  if((snake->GetFirst()->GetX()==target->GetX())&&
    (snake->GetFirst()->GetY()==target->GetY()))
  snake->new_zveno();
  snake->ExSit();
  StatusBar1->Panels->Items[0]->Text="—ъедено: "+IntToStr(snake->GetCount());
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  randomize();
  snake=new TSnake;
  target=new TTarget(rand()%128*10,rand()%77*10);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormKeyPress(TObject *Sender, char &Key)
{
  if ((Key=='ц'&&snake->GetDir()!='ы')||
      (Key=='ы'&&snake->GetDir()!='ц')||
      (Key=='в'&&snake->GetDir()!='ф')||
      (Key=='ф'&&snake->GetDir()!='в'))
  snake->SetDir(Key);
  if (Key==27) Form1->Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
  snake->~TSnake();
  target->~TTarget();      
}
//---------------------------------------------------------------------------

