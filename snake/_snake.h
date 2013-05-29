//---------------------------------------------------------------------------

#ifndef _snakeH
#define _snakeH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TTimer *Timer1;
        TStatusBar *StatusBar1;
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormKeyPress(TObject *Sender, char &Key);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public: 	// User declarations
        __fastcall TForm1(TComponent* Owner);
};
class TSnake_zveno
{
  friend class TSnake;
  private:
    int x;
    int y;
    TSnake_zveno *next;
    TSnake_zveno *pred;
  public:
    TSnake_zveno(int _x,int _y);
    int GetX() const;
    void SetX(int _x);
    int GetY() const;
    void SetY(int _y);
};


class TSnake
{
  private:
    TSnake_zveno *first;
    TSnake_zveno *last;
    int count;
    char dir;
  public:
    TSnake();
    ~TSnake();
    char GetDir() const;
    void SetDir(char _dir);
    int GetCount()const;
    TSnake_zveno* GetFirst()const;
    TSnake_zveno* GetLast()const;
    void new_zveno();
    void prn();
    void ExSit();
};

class TTarget
{
  private:
    int x,y;
  public:
    TTarget(int,int);
    ~TTarget();
    int GetX()const;
    int GetY()const;
    void SetX(int);
    void SetY(int);
    void prn();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
