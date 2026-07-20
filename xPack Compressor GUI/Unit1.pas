unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  WinApi.ShellAPI;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
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
    Button4: TButton;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    RadioButton3: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ScrollBar6Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
procedure ExecuteAndWait(const FileName, Parameters: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  CmdLine: string;
  SelectedPriority: DWORD;
begin
  // Read the selected flag from the ComboBox objects.
  SelectedPriority := DWORD(Form1.ComboBox1.Items.Objects[Form1.ComboBox2.ItemIndex]);

  // Assemble command line
  CmdLine := Format('"%s" %s', [FileName, Parameters]);

  // Initialize structures
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;

  // show or hide console report
  if Form1.CheckBox19.Checked = true then
  begin
    StartupInfo.wShowWindow := SW_NORMAL;
  end else begin
    StartupInfo.wShowWindow := SW_HIDE;
  end;

  // create process
  if CreateProcess(nil, PChar(CmdLine),
                   nil,
                   nil,
                   False,
                   SelectedPriority,
                   nil,
                   nil,
                   StartupInfo,
                   ProcessInfo) then
  begin
    // Wait until the called program has finished
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);

    // Close handles to avoid memory leaks.
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end
  else
    RaiseLastOSError;
end;

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

procedure TForm1.Button2Click(Sender: TObject);

begin
  Screen.Cursor := crHourGlass;
  Label3.Caption := '';

  if CheckBox1.Checked = true then Label3.Caption := Label3.Caption + ' -b '; // no backup
  if CheckBox2.Checked = true then Label3.Caption := Label3.Caption + ' -r '; // don't pack resource section
  if CheckBox3.Checked = true then Label3.Caption := Label3.Caption + ' -i '; // don't pack icons
  if CheckBox4.Checked = true then Label3.Caption := Label3.Caption + ' -d '; // don't delete debug section
  if CheckBox5.Checked = true then Label3.Caption := Label3.Caption + ' -re '; // exe file -> don't delete relocations section
  if CheckBox6.Checked = true then Label3.Caption := Label3.Caption + ' -e '; // delete exports
  if CheckBox7.Checked = true then Label3.Caption := Label3.Caption + ' -c '; // don't merge sections
  if CheckBox8.Checked = true then Label3.Caption := Label3.Caption + ' -t '; // don't test before processing

  case RadioGroup1.ItemIndex of
  0 : Label3.Caption := Label3.Caption + ' -f ';                              // don't change file alignment
  1 : Label3.Caption := Label3.Caption + ' -f ' + ComboBox1.Text + ' ';       // specify file alignment in power of 2
  end;

  if CheckBox8.Checked = true then Label3.Caption := Label3.Caption + ' -s ' + Edit2.Text + ' '; // specify loader section name

  if RadioButton1.Checked = true then Label3.Caption := Label3.Caption + ' -m ';                 // don't replace MZ-exe stub
  if RadioButton2.Checked = true then Label3.Caption := Label3.Caption + ' -m:' + Edit3.Text + ' '; // specify new MZ-exe stub file

  case RadioGroup2.ItemIndex of
  0 : Label3.Caption := Label3.Caption + ' -lzr ';  // specify compression algorithm
  1 : Label3.Caption := Label3.Caption + ' -lzs ';  // specify compression algorithm
  end;

  // specify compression level, std: 5
  if CheckBox127.Checked = true then Label3.Caption := Label3.Caption + ' -l:' + IntToStr(ScrollBar6.Position ) + ' ';
  // set imagebase
  if CheckBox9.Checked = true then Label3.Caption := Label3.Caption +  ' -a:' + Edit6.Text + ' ';

  try
    // XComp v097
    if RadioButton3.Checked = true then
    begin
      case RadioGroup3.ItemIndex of
        0 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp097\XCompc.exe';
        1 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp097\XPackc.exe';
      end;

      if CheckBox19.Checked = true then
      begin
        ExecuteAndWait(PChar(app), ' '+ Label3.Caption + Edit1.Text);
      end else begin
        ExecuteAndWait(PChar(app), ' '+ Label3.Caption + Edit1.Text);
      end;
    end;

    // XComp v098
    if RadioButton4.Checked = true then
    begin
      case RadioGroup4.ItemIndex of
        0 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp098\XCompc.exe';
        1 : app := ExtractFilePath(Application.ExeName)+'XComp\XComp098\XPackc.exe';
      end;

      if CheckBox19.Checked = true then
      begin
        ExecuteAndWait(PChar(app), ' '+ Label3.Caption + Edit1.Text);
      end else begin
        ExecuteAndWait(PChar(app), ' '+ Label3.Caption + Edit1.Text);
      end;
    end;
  finally
    StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(Edit1.Text)) + ' Kb';
  end;

  Screen.Cursor := crDefault;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog2.Execute then Edit3.Text := OpenDialog2.FileName;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      Edit1.Text := OpenDialog1.FileName;
      Button2.Enabled := True;
    end;
  StatusBar1.Panels[1].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName)) + ' Kb';
  StatusBar1.Panels[3].Text := '0 Kb';
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  If not (Key in [#46, #48..#57, #8]) then Key := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Link names and the corresponding WinAPI constants
  ComboBox2.AddItem('Idle (Low)', TObject(IDLE_PRIORITY_CLASS));
  // Manually defined for older Delphi versions, if necessary
  ComboBox2.AddItem('Below Normal', TObject($00004000));
  ComboBox2.AddItem('Normal', TObject(NORMAL_PRIORITY_CLASS));
  // Manually defined, if applicable
  ComboBox2.AddItem('Above Normal', TObject($00008000)); //
  ComboBox2.AddItem('High (High)', TObject(HIGH_PRIORITY_CLASS));
  ComboBox2.AddItem('Realtime (Real-Time)', TObject(REALTIME_PRIORITY_CLASS));

  // Select 'Normal' by default (index 2)
  ComboBox2.ItemIndex := 2;
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
