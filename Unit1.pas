unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, XPMan, ComCtrls, Spin;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox19: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    RadioGroup1: TRadioGroup;
    CheckBox10: TCheckBox;
    Edit2: TEdit;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    Button3: TButton;
    OpenDialog2: TOpenDialog;
    RadioGroup2: TRadioGroup;
    GroupBox20: TGroupBox;
    Label48: TLabel;
    CheckBox127: TCheckBox;
    ScrollBar6: TScrollBar;
    GroupBox21: TGroupBox;
    Label49: TLabel;
    Edit6: TEdit;
    RadioButton5: TRadioButton;
    CheckBox9: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  app: String;

implementation

{$R *.dfm}
function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    begin
      Edit1.Text := OpenDialog1.FileName;
      Button2.Enabled := True;
    end;
    StatusBar1.Panels[1].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName)) + ' Kb';
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
  Screen.Cursor := crHourGlass;
  Label3.Caption := '';

  if CheckBox1.Checked = true then Label3.Caption := Label3.Caption + ' -b ';
  if CheckBox2.Checked = true then Label3.Caption := Label3.Caption + ' -r ';
  if CheckBox3.Checked = true then Label3.Caption := Label3.Caption + ' -i ';
  if CheckBox4.Checked = true then Label3.Caption := Label3.Caption + ' -d ';
  if CheckBox5.Checked = true then Label3.Caption := Label3.Caption + ' -re ';
  if CheckBox6.Checked = true then Label3.Caption := Label3.Caption + ' -e ';
  if CheckBox7.Checked = true then Label3.Caption := Label3.Caption + ' -c ';
  if CheckBox8.Checked = true then Label3.Caption := Label3.Caption + ' -t ';

  case RadioGroup1.ItemIndex of
  0 : Label3.Caption := Label3.Caption + ' -f ';
  1 : Label3.Caption := Label3.Caption + ' -f ' + ComboBox1.Text + ' ';
  end;

  if CheckBox8.Checked = true then Label3.Caption := Label3.Caption + ' -s ' + Edit2.Text + ' ';

  if RadioButton1.Checked = true then Label3.Caption := Label3.Caption + ' -m ';
  if RadioButton2.Checked = true then Label3.Caption := Label3.Caption + ' -m:' + Edit3.Text + ' ';

  case RadioGroup2.ItemIndex of
  0 : Label3.Caption := Label3.Caption + ' -lzr ';
  1 : Label3.Caption := Label3.Caption + ' -lzs ';
  end;

  if CheckBox127.Checked = true then Label3.Caption := Label3.Caption + ' -l:' + IntToStr(ScrollBar6.Position ) + ' ';

  if CheckBox9.Checked = true then Label3.Caption := Label3.Caption +  ' -a:' + Edit6.Text + ' ';

  try
   if RadioButton3.Checked = true then begin
      case RadioGroup3.ItemIndex of
      0 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp097\XCompc.exe';
      1 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp097\XPackc.exe';
      end;
        if CheckBox19.Checked = true then begin
        ShellExecute(Handle, 'open', PChar(app),
               PChar(' ' + Label3.Caption + Edit1.Text), nil, SW_SHOWNORMAL);
        end else begin
        ShellExecute(Handle, 'open', PChar(app),
               PChar(' ' + Label3.Caption  + Edit1.Text), nil, SW_HIDE);
        end;
    end;

    if RadioButton4.Checked = true then begin
      case RadioGroup4.ItemIndex of
      0 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp098\XCompc.exe';
      1 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp098\XPackc.exe';
      end;
        if CheckBox19.Checked = true then begin
        ShellExecute(Handle, 'open', PChar(app),
               PChar(' ' + Label3.Caption + Edit1.Text), nil, SW_SHOWNORMAL);
        end else begin
        ShellExecute(Handle, 'open', PChar(app),
               PChar(' ' + Label3.Caption  + Edit1.Text), nil, SW_HIDE);
        end;
    end;
  finally
  end;

  Screen.Cursor := crDefault;
  StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(Edit1.Text)) + ' Kb';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog2.Execute then Edit3.Text := OpenDialog2.FileName;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then Key := #0;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  RadioGroup4.Enabled := false;
  RadioGroup3.Enabled := true;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  RadioGroup3.Enabled := false;
  RadioGroup4.Enabled := true;
end;

procedure TForm1.ScrollBar6Change(Sender: TObject);
begin
  Label48.Caption := 'Compress Level : ' + IntToStr(ScrollBar6.Position);
end;

end.
