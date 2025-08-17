object Form1: TForm1
  Left = 1616
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'xPack Compressor GUi'
  ClientHeight = 576
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 307
    Height = 33
    Caption = 'xPack Compressor GUi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 100
    Height = 13
    Caption = 'EXE Path Compress :'
  end
  object Label3: TLabel
    Left = 26
    Top = 531
    Width = 12
    Height = 13
    Caption = '...'
  end
  object Label5: TLabel
    Left = 27
    Top = 512
    Width = 62
    Height = 13
    Caption = 'Parameters :'
  end
  object Label6: TLabel
    Left = 24
    Top = 40
    Width = 242
    Height = 13
    Caption = 'XComp/XPack PE32-imagefile Packer und Rebuilder'
  end
  object Edit1: TEdit
    Left = 16
    Top = 80
    Width = 425
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 447
    Top = 80
    Width = 33
    Height = 21
    Caption = '...'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 417
    Top = 509
    Width = 73
    Height = 21
    Caption = 'Compress'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 557
    Width = 509
    Height = 19
    Panels = <
      item
        Text = 'Size :'
        Width = 50
      end
      item
        Text = '0'
        Width = 100
      end
      item
        Text = 'New Size :'
        Width = 70
      end
      item
        Text = '0'
        Width = 100
      end
      item
        Width = 50
      end>
    ExplicitTop = 611
    ExplicitWidth = 689
  end
  object CheckBox19: TCheckBox
    Left = 305
    Top = 511
    Width = 90
    Height = 17
    Caption = 'Show Console'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 191
    Width = 61
    Height = 17
    Caption = ' Backup'
    TabOrder = 5
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 214
    Width = 122
    Height = 17
    Caption = ' Resource Compress'
    TabOrder = 6
  end
  object CheckBox3: TCheckBox
    Left = 24
    Top = 237
    Width = 113
    Height = 17
    Caption = ' No Icon Compress'
    TabOrder = 7
  end
  object CheckBox4: TCheckBox
    Left = 24
    Top = 260
    Width = 119
    Height = 17
    Caption = ' No Debug Selection'
    TabOrder = 8
  end
  object CheckBox5: TCheckBox
    Left = 202
    Top = 191
    Width = 100
    Height = 17
    Caption = ' Get Relocations'
    TabOrder = 9
  end
  object CheckBox6: TCheckBox
    Left = 202
    Top = 214
    Width = 80
    Height = 17
    Caption = ' No Exports'
    TabOrder = 10
  end
  object CheckBox7: TCheckBox
    Left = 202
    Top = 237
    Width = 70
    Height = 17
    Caption = ' No Merge'
    TabOrder = 11
  end
  object CheckBox8: TCheckBox
    Left = 202
    Top = 260
    Width = 80
    Height = 17
    Caption = ' No Testing'
    TabOrder = 12
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 327
    Width = 299
    Height = 61
    Caption = ' Alignment '
    ItemIndex = 0
    Items.Strings = (
      ' No change Alignment'
      ' Specify File alignment in Power of 2 :')
    TabOrder = 13
  end
  object CheckBox10: TCheckBox
    Left = 24
    Top = 294
    Width = 172
    Height = 17
    Caption = ' Specify Loader Section Name :'
    TabOrder = 14
  end
  object Edit2: TEdit
    Left = 202
    Top = 292
    Width = 55
    Height = 21
    TabOrder = 15
    Text = 'XPack'
  end
  object RadioButton3: TRadioButton
    Left = 27
    Top = 112
    Width = 150
    Height = 17
    Caption = 'XComp097 (Best for 16bit)'
    Checked = True
    TabOrder = 16
    TabStop = True
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 280
    Top = 112
    Width = 171
    Height = 17
    Caption = 'XComp098 (Best for 32/64 bit)'
    TabOrder = 17
    OnClick = RadioButton4Click
  end
  object RadioGroup3: TRadioGroup
    Left = 16
    Top = 135
    Width = 241
    Height = 42
    Caption = ' XComp097 '
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'XComp'
      'XPack')
    TabOrder = 18
  end
  object RadioGroup4: TRadioGroup
    Left = 263
    Top = 135
    Width = 241
    Height = 42
    Caption = ' XComp098 '
    Columns = 2
    Enabled = False
    ItemIndex = 1
    Items.Strings = (
      'XComp'
      'XPack')
    TabOrder = 19
  end
  object ComboBox1: TComboBox
    Left = 231
    Top = 361
    Width = 66
    Height = 21
    Style = csDropDownList
    ItemIndex = 5
    TabOrder = 20
    Text = '1024'
    Items.Strings = (
      '32'
      '64'
      '128'
      '256'
      '512'
      '1024'
      '2048'
      '4096'
      '8192'
      '16384'
      '32768'
      '65536')
  end
  object GroupBox1: TGroupBox
    Left = 327
    Top = 193
    Width = 177
    Height = 120
    Caption = ' Stub '
    TabOrder = 21
    object RadioButton1: TRadioButton
      Left = 16
      Top = 40
      Width = 131
      Height = 17
      Caption = ' Replace MS-Dos Stub'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 63
      Width = 129
      Height = 17
      Caption = ' Replace MZ-EXE Stub'
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 11
      Top = 86
      Width = 126
      Height = 21
      TabOrder = 2
    end
    object Button3: TButton
      Left = 143
      Top = 86
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 3
      OnClick = Button3Click
    end
    object RadioButton5: TRadioButton
      Left = 16
      Top = 16
      Width = 48
      Height = 17
      Caption = 'None'
      Checked = True
      TabOrder = 4
      TabStop = True
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 327
    Top = 327
    Width = 177
    Height = 61
    Caption = ' Compression Algorithm '
    Columns = 2
    ItemIndex = 2
    Items.Strings = (
      'LZRW'
      'LZSS'
      'None')
    TabOrder = 22
  end
  object GroupBox20: TGroupBox
    Left = 16
    Top = 394
    Width = 299
    Height = 97
    Caption = ' Compress Level '
    TabOrder = 23
    object Label48: TLabel
      Left = 16
      Top = 48
      Width = 91
      Height = 13
      Caption = 'Compress Level : 1'
    end
    object CheckBox127: TCheckBox
      Left = 16
      Top = 24
      Width = 62
      Height = 17
      Caption = ' Activate'
      TabOrder = 0
    end
    object ScrollBar6: TScrollBar
      Left = 16
      Top = 67
      Width = 265
      Height = 17
      Max = 9
      Min = 1
      PageSize = 0
      Position = 1
      TabOrder = 1
      OnChange = ScrollBar6Change
    end
  end
  object GroupBox21: TGroupBox
    Left = 327
    Top = 394
    Width = 177
    Height = 97
    Caption = ' HEX Address '
    TabOrder = 24
    object Label49: TLabel
      Left = 24
      Top = 48
      Width = 124
      Height = 13
      Caption = 'Imagebase HEX Address :'
    end
    object Edit6: TEdit
      Left = 24
      Top = 67
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object CheckBox9: TCheckBox
      Left = 16
      Top = 24
      Width = 65
      Height = 17
      Caption = ' Activate'
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'Programme EXE|*.exe'
    Options = [ofHideReadOnly]
    Title = 'Programme EXE - UPX GUI'
    Left = 240
    Top = 56
  end
  object OpenDialog2: TOpenDialog
    Filter = 'MZ-EXE Stub File (*.EXE, STUB)|*.exe'
    Left = 320
    Top = 56
  end
end
