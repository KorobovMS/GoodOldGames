object Form1: TForm1
  Left = 219
  Top = 650
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 778
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 759
    Width = 1280
    Height = 19
    Panels = <
      item
        Text = #1057#1098#1077#1076#1077#1085#1086':'
        Width = 100
      end
      item
        Width = 100
      end>
    SimplePanel = False
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 16
    Top = 32
  end
end
