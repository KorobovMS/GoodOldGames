object Form2: TForm2
  Left = 151
  Top = 114
  Width = 617
  Height = 221
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 97
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1055#1072#1082#1084#1072#1085#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 86
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1074#1088#1072#1075#1086#1074
  end
  object pspeed: TTrackBar
    Left = 136
    Top = 32
    Width = 441
    Height = 41
    LineSize = 0
    Max = 100
    Min = 1
    Position = 50
    TabOrder = 0
    OnChange = pspeedChange
  end
  object espeed: TTrackBar
    Left = 136
    Top = 96
    Width = 441
    Height = 45
    Max = 100
    Min = 1
    Position = 75
    TabOrder = 1
    OnChange = espeedChange
  end
  object Button1: TButton
    Left = 48
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
end
