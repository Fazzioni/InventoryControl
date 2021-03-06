unit UConnect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB,ADOInt, OleDB, ActiveX, ExtCtrls, ComCtrls,
  XPMan,  Buttons;

type
  TFprincipal = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
    XPManifest1: TXPManifest;
    Panel2: TPanel;
    Button1: TButton;
    Next1: TPanel;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    ADOConnection1: TADOConnection;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CheckBox7: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Button3: TButton;
    Procedure GetProx;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure Label5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure LocateList(value : ShortString);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Proximo : byte;
  end;

var
  Fprincipal: TFprincipal;

implementation

{$R *.dfm}
Function GetMac:ShortString; stdcall; external 'sysconf.dll';
Function Encript(Value:ShortString):ShortString;stdcall; external 'sysconf.dll';

procedure TFprincipal.GetProx;
begin
ListView1.Visible := false;
Next1.Visible := false;
Button1.Caption := 'Pr?ximo';
Button2.Enabled := true;
Button3.Enabled := true;

if Proximo = 0 then
begin
Button2.Enabled := false;
Button3.Enabled := false;
ListView1.Visible := true;
end
else
if Proximo = 1 then
begin
Next1.Visible := true;
Button1.Caption := 'Salvar';
end;



end;

procedure TFprincipal.Button1Click(Sender: TObject);
var
 Arquivo : TStringList;
begin
if Proximo = 0 then
begin
if ListView1.ItemIndex = -1 then
exit;

Label5.Caption := ListView1.Items[ListView1.itemindex].Caption;

end;





if proximo = 1 then
begin

if (pos(';',Edit1.Text) <> 0) or (pos(chr(39),Edit1.Text) <> 0) or
   (pos('"',Edit1.Text) <> 0) or (pos('|',Edit1.Text) <> 0) or
   (pos('*',Edit1.Text) <> 0) or (pos('?',Edit1.Text) <> 0) or
   (pos('<',Edit1.Text) <> 0) or (pos('>',Edit1.Text) <> 0) then
begin
  MessageDlg('O camino do arquivo n?o pode conter nenhum dos seguintes caracteres:'+#13+'" ; * ? < > | '+chr(39),mtError,[mbok],0);
  exit;
end;
Button3Click(Button3);


  Try
  Arquivo := TStringList.Create;
  Arquivo.Clear;
  Arquivo.Add(ADOConnection1.ConnectionString);
  if CheckBox1.Checked then
  begin
    try
    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName)+'Inicialization.ini');
    MessageDlg('Arquivo salvo',mtInformation,[mbok],0);
    close;
    Except
    on e :Exception do
    MessageDlg('Falha ao salvar arquivo'+#13+e.Message,mtError,[mbok],0);
    end;

  end
  else
  begin
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Inicialization\') then
   if not CreateDir(ExtractFilePath(Application.ExeName)+'Inicialization\') then
   begin
   MessageDlg('N?o foi poss?vel criar a pasta de log, crie manualente:'+#13+ExtractFilePath(Application.ExeName)+'Inicialization\',mtError,[mbok],0);
   exit;
   end;

    try
   Arquivo.SaveToFile(ExtractFilePath(Application.ExeName)+'Inicialization\'+GetMac+'.ini');
    MessageDlg('Arquivo salvo',mtInformation,[mbok],0);
    close;
    Except
    on e :Exception do
    MessageDlg('Falha ao salvar arquivo'+#13+e.Message,mtError,[mbok],0);
    end;
   end;

  Finally
  FreeAndNil(Arquivo);
  end;
end;


inc (Proximo);
GetProx;


end;

procedure TFprincipal.Button2Click(Sender: TObject);
begin
if Proximo > 0 then
Proximo := Proximo -1;
GetProx;

end;

procedure TFprincipal.ListView1DblClick(Sender: TObject);
begin
Button1Click(Button1);
end;

procedure TFprincipal.SpeedButton1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
Edit1.Text := OpenDialog1.FileName;

end;

procedure TFprincipal.Button3Click(Sender: TObject);
begin
OpenDialog1.FileName := Edit1.Text;

if Edit1.Text ='' then
begin
MessageDlg('Informe o local do banco de dados',mtError,[mbok],0);
Abort;
exit;
end;

if not FileExists(Edit1.Text) then
begin
MessageDlg('O arquivo n?o existe',mtError,[mbok],0);
Abort;
exit;
end;

ADOConnection1.ConnectionString := '';
ADOConnection1.ConnectionString := 'Provider='+ListView1.Items[ListView1.Itemindex].Caption+';';
if Edit2.Text <> '' then ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + 'User ID="'+Edit2.Text+'";';
if Edit3.Text <> '' then ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + 'Password="'+Encript(Edit3.Text)+'";';

if CheckBox7.Checked then
ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + 'Mode=Share Deny Read|Share Deny Write;';


ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + 'Data Source='+Edit1.Text+';';
try
ADOConnection1.Connected := true;
MessageDlg('Teste de conex?o conclu?do com ?xito',mtInformation,[mbok],0);
ADOConnection1.Connected := false;
Except
on e :Exception do
begin
  MessageDlg(e.Message,mtError,[mbok],0);
  Abort;
  
end;
end;


end;

procedure TFprincipal.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
AllowEdit := false;

end;

procedure TFprincipal.Label5Click(Sender: TObject);
begin
Button2Click(Button2);
end;

procedure TFprincipal.FormCreate(Sender: TObject);
var
  Arquivo : TStringList;
  ListParametro : TStringList;
  i : Cardinal;
  LasTI : Cardinal;

  Lista : TStringList;
  Item : TListItem;

begin
Label8.Caption := '';
Label9.Caption := '';

Edit1.Text := '';
Edit2.Text := '';
Edit3.Text := '';



Proximo := 0;
CheckBox7.Checked := false;

try
  Lista := TStringList.Create;
  Lista.Clear;
  GetProviderNames(lista);
ListView1.Clear;
For i := 0 to Lista.Count -1 do
begin
Item := ListView1.Items.Add;
Item.Caption := Lista[i];
end;

Finally
FreeAndNil(Lista);
end;

GetProx;


// procurar arquivo

try
Arquivo := TStringList.Create;

Arquivo.Clear;

if FileExists(ExtractFilePath(Application.ExeName)+'\inicialization\'+GetMac+'.ini') then
Arquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+'\inicialization\'+GetMac+'.ini')
else
if FileExists(ExtractFilePath(Application.ExeName)+'\inicialization.ini') then
begin
Arquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+'\inicialization.ini');
CheckBox1.Checked := true;
end;


if Arquivo.Count > 0 then
begin
ListParametro := TStringList.Create;
ListParametro.Clear;

LasTI := 1;
for i := 1 to length(Arquivo.Text) do
if Arquivo.Text[i] = ';' then
begin
 ListParametro.Add(copy(Arquivo.Text,LasTI,i-LasTI));
 LasTI := i+1;
end;


For i := 0 to ListParametro.Count -1 do
begin
if copy(ListParametro[i],1,9) = 'Provider=' then Label8.Caption := copy(ListParametro[i],10,length(ListParametro[i]));
LocateList(Label8.Caption);

if copy(ListParametro[i],1,12) = 'Data Source=' then Edit1.Text := copy(ListParametro[i],13,length(ListParametro[i]));
Label9.Caption := Edit1.Text;

if LowerCase(ListParametro[i]) = LowerCase ('Mode=Share Deny Read|Share Deny Write') then CheckBox7.Checked := true;


if copy(ListParametro[i],1,8) = 'User ID=' then Edit2.Text := copy(ListParametro[i],9,length(ListParametro[i]));

if Length(Edit2.Text) > 1 then
if Edit2.Text[1] ='"' then
Edit2.Text := copy(Edit2.Text,2,length(Edit2.Text));

if Length(Edit2.Text) > 1 then
if Edit2.Text[length(Edit2.Text)] ='"' then
Edit2.Text := copy(Edit2.Text,1,length(Edit2.Text)-1);






end;



end;

Finally
  FreeAndNil(Arquivo);
  FreeAndNil(ListParametro);
end;

end;

procedure TFprincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
Button2Click(Button2);

end;

procedure TFprincipal.LocateList(value: ShortString);
var
  i : Smallint;
begin

For i := 0 to ListView1.Items.Count - 1 do
if LowerCase(ListView1.Items[i].Caption) = LowerCase(value) then
ListView1.ItemIndex := i;


end;

procedure TFprincipal.FormShow(Sender: TObject);
begin
if not FileExists(Label9.Caption) then
Label9.Font.Color := clred;

end;

end.
