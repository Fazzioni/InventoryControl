unit Uconfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CheckLst, Buttons, RxCombos,
  OleCtrls, SHDocVw,activex,mshtml,printers, Mask, ToolEdit, DBCtrls, Spin;

type
  TFconfig = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    TabSheet3: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    TabSheet6: TTabSheet;
    Label3: TLabel;
    CheckBox3: TCheckBox;
    HotKey1: THotKey;
    CheckListBox1: TCheckListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    CheckListBox2: TCheckListBox;
    Label19: TLabel;
    Label20: TLabel;
    CheckBox7: TCheckBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    CheckBox8: TCheckBox;
    Panel1: TPanel;
    FontComboBox1: TFontComboBox;
    WebBrowser: TWebBrowser;
    Label21: TLabel;
    TabSheet7: TTabSheet;
    ComboBox2: TComboBox;
    Label14: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label4: TLabel;
    Edit3: TEdit;
    ListView1: TListView;
    Edit4: TEdit;
    Label1: TLabel;
    CheckBox10: TCheckBox;
    CheckBox6: TCheckBox;
    Bevel1: TBevel;
    Label12: TLabel;
    DirectoryEdit: TDirectoryEdit;
    DBlookSit: TDBLookupComboBox;
    Bevel2: TBevel;
    Label13: TLabel;
    Bevel3: TBevel;
    Label18: TLabel;
    CheckBox11: TCheckBox;
    Label16: TLabel;
    SpeedButton5: TSpeedButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet8: TTabSheet;
    DB_ContatoForma: TDBLookupComboBox;
    Label22: TLabel;
    Label23: TLabel;
    DBTipo: TDBLookupComboBox;
    Label24: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    TabSheet9: TTabSheet;
    CheckBox9: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    TabSheet10: TTabSheet;
    Edit1: TEdit;
    CheckBox14: TCheckBox;
    Label25: TLabel;
    Edit5: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Edit14: TEdit;
    Label30: TLabel;
    Edit15: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Edit16: TEdit;
    Label33: TLabel;
    Edit17: TEdit;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    Label34: TLabel;
    SpinEdit1: TSpinEdit;
    CheckBox17: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Edit7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintHTML;
    procedure WebBrowserDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FontComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FontComboBox1Exit(Sender: TObject);
    Function Locate(value:Smallint):Boolean;
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1Editing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure DBlookSitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Edit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox15Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
  private
    { Private declarations }
  public
    Bloc_Cliente : Boolean;
    Bloc_Estoque : Boolean;

    { Public declarations }
  end;



var
  Fconfig: TFconfig;

implementation

uses UDados, DB, Menus;

{$R *.dfm}

procedure TFconfig.Button1Click(Sender: TObject);
var
i : integer;
begin
Try
banco.Relatorio_Font_Size := StrToInt(Edit6.Text);
except
  MessageDlg('Tamanho da Fonte inválida na configuração HMTL',mtError,[mbok],0);
  exit;
end;
try
banco.Relatorio_Font_Name := FontComboBox1.Name;
banco.Relatorio_Color_Title    := Edit7.Color;
banco.Relatorio_Color_Fundo[1] := Edit8.Color;
banco.Relatorio_Color_Fundo[2] := Edit9.Color;
except
  MessageDlg('Existe um erro em: configurações HTML',mtError,[mbok],0);
  exit;
end;

if Printer.Printers.IndexOf(Edit4.Text) = -1 then
if  MessageDlg('A impressora informada não foi encontrada na lista, deseja continuar?',mtWarning,[mbNo,mbYes],0) = mrno  then
exit;


if CheckBox4.Checked then
if not (DirectoryExists(DirectoryEdit.Text)) then
if not CreateDir(DirectoryEdit.Text) then
if messageDlg('O diretório para salvar carta é inválido, deseja continuar?',mtWarning,[mbyes,mbno],0) = mrno then
exit;



if not Locate(1) then
begin
  Banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 1;
end
else
  banco.TB_Config.Edit;
  if not CheckBox3.Checked then
  banco.TB_ConfigValor.Value := '1'
  else
  banco.TB_ConfigValor.Value := '0';
banco.TB_Config.Post;








banco.Impressora_Sis := Edit4.Text;
banco.Config.WriteString('System','PrinterName',banco.Impressora_Sis);

// Impressora Supervisor
{if Edit4.Text <> Banco.Impressora_Sis then
if Banco.LogSupervisor then
begin
  if not Locate(2) then
  begin
  Banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 2;
  end
  else
  banco.TB_Config.Edit;

  banco.TB_ConfigValor.Value := Edit4.Text;
  banco.TB_Config.Post;
  banco.Impressora_Sis := Edit4.Text;
end
else // usuario normal
begin
  banco.TB_Log.Edit;
  banco.TB_LogImpressora.Value := Edit4.Text;
  Banco.TB_Log.Post;
  banco.Impressora_Sis := Edit4.Text;
  banco.Config.WriteString('System','PrinterName',banco.Impressora_Sis);
end;  }

if not Locate(4) then
begin
  Banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 4;
end
else
  banco.TB_Config.Edit;
  if not CheckBox11.Checked then
  banco.TB_ConfigValor.Value := '1'
  else
  banco.TB_ConfigValor.Value := '0';
banco.TB_Config.Post;




// Atalho format String
if not Locate(9) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 9;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(HotKey1.HotKey);
banco.TB_Config.Post;
banco.FormatarString1.ShortCut := HotKey1.HotKey;


// cpf,cnpj
if not Locate(10) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 10;
end
else
banco.TB_Config.Edit;
banco.Const_CNPJ_Page := Edit10.Text;
banco.TB_ConfigValor.Value := Edit10.Text;
banco.TB_Config.Post;


if not Locate(11) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 11;
end
else
banco.TB_Config.Edit;
banco.Const_CPF_Page := Edit11.Text;
banco.TB_ConfigValor.Value := Edit11.Text;
banco.TB_Config.Post;

if not Locate(12) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 12;
end
else
banco.TB_Config.Edit;
banco.campo_cnpj := Edit12.Text;
banco.TB_ConfigValor.Value := Edit12.Text;
banco.TB_Config.Post;


if not Locate(13) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 13;
end
else
banco.TB_Config.Edit;
banco.Campo_CPF := Edit13.Text;
banco.TB_ConfigValor.Value := Edit13.Text;
banco.TB_Config.Post;


//OPEN FILE
if not Locate(13) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 13;
end
else
banco.TB_Config.Edit;
banco.Campo_CPF := Edit13.Text;
banco.TB_ConfigValor.Value := Edit13.Text;
banco.TB_Config.Post;



// alterar situação do pedido, receber contas
if not Locate(15) then
begin
 banco.TB_Config.Insert;
 banco.TB_ConfigCodigo.Value := 15;
end
else
 banco.TB_Config.Edit;

 if DBlookSit.KeyValue = Null then
 Banco.Alter_Situacao := -1
 else
 banco.Alter_Situacao := DBlookSit.KeyValue;

Banco.TB_ConfigValor.Value := IntToStr(Banco.Alter_Situacao);
banco.TB_Config.post;




// Carta
if not Locate(20) then // Salvar
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 20;
end
else
banco.TB_Config.Edit;
if CheckBox4.Checked then banco.TB_ConfigValor.Value := '1'
else                      banco.TB_ConfigValor.Value := '0';
banco.TB_Config.Post;
banco.Carta_Salva := CheckBox4.Checked;


if not Locate(21) then // dir carta
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 21;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := DirectoryEdit.Text;
banco.TB_Config.Post;
Banco.carta_dir := DirectoryEdit.Text;


if not Locate(22) then // Open
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 22;
end
else
banco.TB_Config.Edit;
if CheckBox5.Checked then banco.TB_ConfigValor.Value := '1'
else                      banco.TB_ConfigValor.Value := '0';
banco.TB_Config.Post;
banco.Carta_Visible := CheckBox5.Checked;



if not Locate(23) then // printer
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 23;
end
else
banco.TB_Config.Edit;
if CheckBox10.Checked then banco.TB_ConfigValor.Value := '1'
else                      banco.TB_ConfigValor.Value := '0';
banco.TB_Config.Post;
banco.carta_Impr_aut := CheckBox10.Checked;


if not Locate(24) then // MsgPrinter
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 24;
end
else
banco.TB_Config.Edit;
if CheckBox6.Checked then banco.TB_ConfigValor.Value := '1'
else                      banco.TB_ConfigValor.Value := '0';
banco.TB_Config.Post;
banco.Carta_Impre_MSG := CheckBox6.Checked;



banco.Color_Contas_active := CheckBox14.Checked;

Banco.Color_Contas_Perso[1] := Edit1.color;
Banco.Color_Contas_Perso[2] := Edit5.color;
Banco.Color_Contas_Perso[3] := Edit14.color;
Banco.Color_Contas_Perso[4] := Edit15.color;
Banco.Color_Contas_Perso[5] := Edit16.color;
Banco.Color_Contas_Perso[6] := Edit17.color;



if not Locate(29) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 29;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := BoolToStr(CheckBox14.Checked);
banco.TB_Config.Post;

if not Locate(30) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 30;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(ColorToRGB(Edit1.Color));
banco.TB_Config.Post;

if not Locate(31) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 31;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(ColorToRGB(Edit5.Color));
banco.TB_Config.Post;

if not Locate(32) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 32;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(ColorToRGB(Edit14.Color));
banco.TB_Config.Post;


if not Locate(33) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 33;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(ColorToRGB(Edit15.Color));
banco.TB_Config.Post;


if not Locate(34) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 34;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(ColorToRGB(Edit16.Color));
banco.TB_Config.Post;



if not Locate(35) then // Cor modulo Contas
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 35;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value := IntToStr(ColorToRGB(Edit17.Color));
banco.TB_Config.Post;





// -----------------------------------------------------------------------------
//Historio cliente

// Salvar na tbconfig

//deletar
for i := 0 to banco.TB_Pedido_Histo.Fields.Count do
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,100+i,[]) then
banco.TB_Config.Delete;

For i := 0 to CheckListBox1.Items.Count - 1 do
If CheckListBox1.Checked[i] then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 100+i;
banco.TB_ConfigValor.Value := banco.TB_Pedido_Histo.Fields[i].FieldName;
end;

//deletar
for i := 0 to banco.TB_Contas_Histo.Fields.Count do
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,200+i,[]) then
banco.TB_Config.Delete;

For i := 0 to CheckListBox2.Items.Count - 1 do
If CheckListBox2.Checked[i] then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 200+i;
banco.TB_ConfigValor.Value := banco.TB_Contas_Histo.Fields[i].FieldName;
end;

if CheckBox8.Checked then
begin
  if not  banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,90,[]) then
  begin
  banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 90;
  banco.TB_ConfigValor.Value := '1';
  banco.TB_Config.Post;
  end;
end
else
  if  banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,90,[]) then
  banco.TB_Config.delete;

if CheckBox7.Checked then
begin
  if not  banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,91,[]) then
  begin
  banco.TB_Config.Insert;
  banco.TB_ConfigCodigo.Value := 91;
  banco.TB_ConfigValor.Value := '1';
  banco.TB_Config.Post;
  end;
end
else
  if  banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,91,[]) then
  banco.TB_Config.delete;

// -----------------------------------------------------------------------------
// Relatorio HTML size,name {Font}
//  80 = relatorio font name
//  81 = Font size
//  82 = COlor title
//  83 = Linha 1 color
//  84 = Linha 2 color

// 80
if not banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,80,[]) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 80;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value :=  FontComboBox1.FontName;
//Edit5.Text;
if banco.TB_ConfigValor.Value = '' then
banco.TB_ConfigValor.Value := 'Tahoma';
banco.TB_Config.Post;

// 81
if not banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,81,[]) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 81;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value :=  Edit6.Text;
if banco.TB_ConfigValor.Value = '' then
banco.TB_ConfigValor.Value := '2';
banco.TB_Config.Post;

// 82
if not banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,82,[]) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 82;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value :=  IntToStr(ColorToRGB(Edit7.Color));
if banco.TB_ConfigValor.Value = '' then
banco.TB_ConfigValor.Value := ColorToString(banco.Relatorio_Color_Title);
banco.TB_Config.Post;


// 83
if not banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,83,[]) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 83;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value :=  IntToStr(ColorToRGB(Edit8.Color));
if banco.TB_ConfigValor.Value = '' then
banco.TB_ConfigValor.Value := ColorToString(banco.Relatorio_Color_fundo[1]);
banco.TB_Config.Post;


if not banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,84,[]) then
begin
banco.TB_Config.Insert;
banco.TB_ConfigCodigo.Value := 84;
end
else
banco.TB_Config.Edit;
banco.TB_ConfigValor.Value :=  IntToStr(ColorToRGB(Edit9.Color));
if banco.TB_ConfigValor.Value = '' then
banco.TB_ConfigValor.Value := ColorToString(banco.Relatorio_Color_fundo[2]);
banco.TB_Config.Post;



if DB_ContatoForma.KeyValue = null then
banco.Config.DeleteKey('Agenda_Padrao','Contato_Format')
else
Banco.Config.WriteInteger('Agenda_Padrao','Contato_Format',DB_ContatoForma.KeyValue);

if DBTipo.KeyValue = null then
banco.Config.DeleteKey('Agenda_Padrao','Contato_Type')
else
Banco.Config.WriteInteger('Agenda_Padrao','Contato_Type',DBTipo.KeyValue);



banco.Config.WriteBool('Ffinaliza', 'BttNew',CheckBox9.Checked);
banco.Config.WriteBool('Ffinaliza','BttEdit',CheckBox12.Checked);
banco.Config.WriteBool('Ffinaliza','BttHist',CheckBox13.Checked);


if (Bloc_Cliente <> CheckBox3.Checked) or (Bloc_Estoque <> CheckBox11.Checked) then
begin
MessageDlg('É necessário fechar a aplicação para as alterações serem efetuadas',mtInformation,[mbok],0);
end;






close;

end;

procedure TFconfig.FormShow(Sender: TObject);
var
  i, a : Byte;
  Item : TListItem;
begin

 CheckBox9.Checked := banco.Config.ReadBool('Ffinaliza', 'BttNew',true);
CheckBox12.Checked := banco.Config.ReadBool('Ffinaliza','BttEdit',true);
CheckBox13.Checked := banco.Config.ReadBool('Ffinaliza','BttHist',true);

//Vamos organizar os fields
DirectoryEdit.Text := '';
Edit2.Text := '';
Edit3.Text := '';
Edit4.Text := '';
Edit6.Text := '';
Edit7.Text := '';
Edit8.Text := '';
Edit9.Text := '';
Edit10.Text := '';
Edit11.Text := '';
Edit12.Text := '';
Edit13.Text := '';



Edit10.Text := banco.Const_CNPJ_Page;
Edit11.Text := banco.Const_CPF_Page;
Edit12.Text := Banco.campo_cnpj;
Edit13.Text := Banco.campo_cpf;

Edit4.Text := banco.Impressora_Sis;


CheckBox8.Checked := banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,90,[]);
CheckBox7.Checked := banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,91,[]);

CheckBox3.Checked := true;
CheckBox11.Checked := true;

if Locate(1) then
if  banco.TB_ConfigValor.Value = '1' then
CheckBox3.Checked := false;

if Locate(4) then
if  banco.TB_ConfigValor.Value = '1' then
CheckBox11.Checked := False;




// 15 = alterar situação
if Banco.Alter_Situacao > -1 then
DBlookSit.KeyValue := Banco.Alter_Situacao
else
DBlookSit.KeyValue := null;


//LIstar impressoras
if Printer.Printers.Count > 1 then
for i := 0 to printer.Printers.Count - 1 do
begin
Item := ListView1.Items.Add;
Item.Caption := printer.Printers[i];
end;



CheckBox4.Checked := banco.Carta_Salva;
DirectoryEdit.Text := banco.carta_dir;
CheckBox5.Checked := banco.Carta_Visible;
CheckBox10.Checked := banco.carta_Impr_aut;
CheckBox6.Checked := banco.Carta_Impre_MSG;

HotKey1.HotKey := banco.FormatarString1.ShortCut;




for i := 0 to banco.TB_Pedido_Histo.Fields.Count - 1 do
begin
banco.TB_Pedido_Histo.Fields[i].Visible := false;

if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,100+i,[]) then
 if banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Pedido_Histo) <> -1 then
    begin
     a := banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Pedido_Histo);
     banco.TB_Pedido_Histo.Fields[a].Visible := true;
     banco.TB_Pedido_Histo.Fields[a].Index :=  i;
    end;
end;



for i := 0 to banco.TB_Pedido_Histo.Fields.Count - 1 do
begin
CheckListBox1.Items.Add(banco.TB_Pedido_Histo.Fields[i].DisplayLabel);
CheckListBox1.Checked[i] := banco.TB_Pedido_Histo.Fields[i].Visible;
end;



for i := 0 to banco.TB_Contas_Histo.Fields.Count - 1 do
begin
banco.TB_Contas_Histo.Fields[i].Visible := false;

if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,200+i,[]) then
 if banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Contas_Histo) <> -1 then
    begin
     a := banco.RetornFieldname(Banco.TB_ConfigValor.Value,banco.TB_Contas_Histo);
     banco.TB_Contas_Histo.Fields[a].Visible := true;
     banco.TB_Contas_Histo.Fields[a].Index :=  i;
    end;
end;



for i := 0 to banco.TB_Contas_Histo.Fields.Count - 1 do
begin
CheckListBox2.Items.Add(banco.TB_Contas_Histo.Fields[i].DisplayLabel);
CheckListBox2.Checked[i] := banco.TB_Contas_Histo.Fields[i].Visible;
end;

//contas

CheckBox14.Checked :=banco.Color_Contas_active ;

Edit1.color :=Banco.Color_Contas_Perso[1];
Edit5.color :=Banco.Color_Contas_Perso[2];
Edit14.color :=Banco.Color_Contas_Perso[3];
Edit15.color :=Banco.Color_Contas_Perso[4];
Edit16.color :=Banco.Color_Contas_Perso[5];
Edit17.color :=Banco.Color_Contas_Perso[6];



//------------------------------------------------------------------------------
//  80 = relatorio font name
//  81 = Font size
//  82 = COlor title
//  83 = Linha 1 color
//  84 = Linha 2 color
// 80
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,80,[]) then
begin
try
FontComboBox1.FontName := banco.TB_ConfigValor.Value;
except
FontComboBox1.FontName := banco.Relatorio_Font_Name;
end;
end
else
FontComboBox1.FontName := banco.Relatorio_Font_Name;

// 81
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,81,[]) then
begin
try
Edit6.Text := IntToStr(StrToInt(banco.TB_ConfigValor.Value));
except
Edit6.Text := IntToStr(BANCO.Relatorio_Font_Size);
end;
end
else
Edit6.Text := IntToStr(BANCO.Relatorio_Font_Size);

// 82
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,82,[]) then
begin
try
Edit7.Color := StrToInt(banco.TB_ConfigValor.Value);
except
Edit7.Color := BANCO.Relatorio_Color_Title;
end;
end
else
Edit7.Color := BANCO.Relatorio_Color_Title;

// 83
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,83,[]) then
begin
try
Edit8.Color := StrToInt(banco.TB_ConfigValor.Value);
except
Edit8.Color := BANCO.Relatorio_Color_fundo[1];
end;
end
else
Edit8.Color := BANCO.Relatorio_Color_fundo[1];
// 84
if banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,84,[]) then
begin
try
Edit9.Color := StrToInt(banco.TB_ConfigValor.Value);
except
Edit8.Color := BANCO.Relatorio_Color_fundo[2];
end;
end
else
Edit9.Color := BANCO.Relatorio_Color_fundo[2];




PaintHTML;


Bloc_Cliente := CheckBox3.Checked;
Bloc_Estoque := CheckBox11.Checked;


If banco.Config.ValueExists('Agenda_Padrao','Contato_Format') then
DB_ContatoForma.KeyValue := Banco.Config.ReadInteger('Agenda_Padrao','Contato_Format',-1);

If banco.Config.ValueExists('Agenda_Padrao','Contato_Type') then
DBTipo.KeyValue := Banco.Config.ReadInteger('Agenda_Padrao','Contato_Type',-1);

end;

procedure TFconfig.SpeedButton2Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox1.ItemIndex in [0..CheckListBox1.Items.Count -2] then
  begin
    Index := CheckListBox1.ItemIndex +1;
    CheckListBox1.Items.Move(CheckListBox1.ItemIndex, Index);
    CheckListBox1.ItemIndex := Index;
    banco.TB_Pedido_Histo.Fields[Index-1].Index := index;
  end;
  CheckListBox1.SetFocus;
end;

procedure TFconfig.SpeedButton1Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox1.ItemIndex > 0 then
  begin
    Index := CheckListBox1.ItemIndex -1;
    CheckListBox1.Items.Move(CheckListBox1.ItemIndex, Index);
    CheckListBox1.ItemIndex := Index;
    banco.TB_Pedido_Histo.Fields[Index+1].Index := index;

  end;
  CheckListBox1.SetFocus;
end;

procedure TFconfig.SpeedButton3Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox2.ItemIndex in [0..CheckListBox2.Items.Count -2] then
  begin
    Index := CheckListBox2.ItemIndex +1;
    CheckListBox2.Items.Move(CheckListBox2.ItemIndex, Index);
    CheckListBox2.ItemIndex := Index;
    banco.TB_Contas_Histo.Fields[Index-1].Index := index;
  end;
  CheckListBox2.SetFocus;
end;

procedure TFconfig.SpeedButton4Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox2.ItemIndex > 0 then
  begin
    Index := CheckListBox2.ItemIndex -1;
    CheckListBox2.Items.Move(CheckListBox2.ItemIndex, Index);
    CheckListBox2.ItemIndex := Index;
    banco.TB_Contas_Histo.Fields[Index+1].Index := index;

  end;
  CheckListBox2.SetFocus;
end;

procedure TFconfig.Edit7Change(Sender: TObject);
begin
(sender as TEdit).Text := '';
HideCaret((sender as TEdit).Handle);
(Sender as TEdit).Cursor := crHandPoint;


end;

procedure TFconfig.Edit7ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;
end;

procedure TFconfig.Edit7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
banco.ColorDialog.Color := (sender as TEdit).Color;

if banco.ColorDialog.Execute then
begin
(Sender as TEdit).Color := banco.ColorDialog.Color;
PaintHTML;
end;


end;

procedure TFconfig.PaintHTML;
var
Arquivo : TStringList;
SizeFont : byte;
ms: TMemoryStream;

begin
Try
  SizeFont := StrToInt(Edit6.Text);
except
WebBrowser.Navigate('about:blank') ;
exit;
end;

if FontComboBox1.FontName = '' then
begin
WebBrowser.Navigate('about:blank') ;
exit;
end;
    WebBrowser.Navigate('about:blank') ;
    while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

Try
  arquivo := TStringList.Create;
  arquivo.Add('<html><head><title>Testando Fonte</title></head>');
  arquivo.Add('<body bgcolor="#FFFFFF" vlink="#FF0000" leftmargin="0"><center>');
  arquivo.Add('<br>');
  arquivo.Add('<br>');
  arquivo.Add('<table border=0 bgcolor=#000000 cellspacing=1 cellpadding=4>');

  arquivo.Add('<tr bgcolor='+Banco.ColortoHTML(Edit7.Color)+'>') ;
  arquivo.Add('        <th colspan=2><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Título da Tabela</font></th>');
  arquivo.Add('</tr>');

  arquivo.Add('<tr bgcolor='+Banco.ColortoHTML(Edit7.Color)+'>') ;
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Coluna 1</font></th>');
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Coluna 2</font></th>');
  arquivo.Add('</tr>');

  arquivo.Add('<tr bgcolor='+Banco.ColortoHTML(Edit8.Color)+'>') ;
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Primeira Linha</font></th>');
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Primeira Linha</font></th>');
  arquivo.Add('</tr>');

  arquivo.Add('<tr bgcolor='+Banco.ColortoHTML(Edit9.Color)+'>') ;
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Segunda Linha</font></th>');
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Segunda Linha</font></th>');
  arquivo.Add('</tr>');

  arquivo.Add('<tr bgcolor='+Banco.ColortoHTML(Edit8.Color)+'>') ;
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Terceira Linha</font></th>');
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Terceira Linha</font></th>');
  arquivo.Add('</tr>');

  arquivo.Add('<tr bgcolor='+Banco.ColortoHTML(Edit9.Color)+'>') ;
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Quarta Linha</font></th>');
  arquivo.Add('        <th colspan=1><font size='+IntToStr(SizeFont)+' face="'+FontComboBox1.FontName+'">Quarta Linha</font></th>');
  arquivo.Add('</tr>');

  arquivo.Add('</table>');
  arquivo.Add('<br>');
  arquivo.Add('</center>');
  arquivo.Add('</html>');


  if Assigned(WebBrowser.Document) then 
   begin 
      ms := TMemoryStream.Create;
      Arquivo.SaveToStream(ms);
      ms.Seek(0, 0) ;
     (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
    end;
   
finally
FreeAndNil(ms);
FreeAndNil(Arquivo);


end;

end;

procedure TFconfig.WebBrowserDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  Pagina: IHTMLDocument2;
begin
      WebBrowser.OleObject.Document.Body.Scroll:='no';
      pagina:=WebBrowser.Document as IHTMLDocument2;
      pagina.Get_ParentWindow.ScrollBy(0,0);
end;

procedure TFconfig.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
key:=#0;
PaintHTML;
end;


if not (key in['0'..'9',chr(8)]) then
key :=#0;



end;

procedure TFconfig.FontComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
key:=#0;
PaintHTML;
end;
end;

procedure TFconfig.FontComboBox1Exit(Sender: TObject);
begin
PaintHTML;

end;

function TFconfig.Locate(value: Smallint): Boolean;
begin
result := banco.TB_Config.Locate(banco.TB_ConfigCodigo.FieldName,value,[]);
end;

procedure TFconfig.ListView1DblClick(Sender: TObject);
begin
if ListView1.ItemIndex <> -1 then
Edit4.Text := ListView1.Items[ListView1.itemindex].Caption;


ListView1.Refresh;

end;

procedure TFconfig.ListView1Editing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
AllowEdit := false;

end;

procedure TFconfig.DBlookSitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_delete then
begin
DBlookSit.KeyValue := null;
end;

end;

procedure TFconfig.FormCreate(Sender: TObject);
begin
Bloc_Cliente := true;
Bloc_Estoque := true;

end;

procedure TFconfig.SpeedButton5Click(Sender: TObject);
begin
DBlookSit.KeyValue := null;

end;

procedure TFconfig.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if LowerCase(Item.Caption) = LowerCase(Edit4.Text) then
    Listview1.Canvas.Brush.Color := clGray
  else
    ListView1.Canvas.Brush.Color := clWhite;
end;

procedure TFconfig.Edit4Change(Sender: TObject);
begin
ListView1.Refresh;

end;

procedure TFconfig.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFconfig.SpeedButton6Click(Sender: TObject);
begin
DB_ContatoForma.KeyValue := null;

end;

procedure TFconfig.SpeedButton7Click(Sender: TObject);
begin
DBTipo.KeyValue := null;

end;

procedure TFconfig.Edit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
banco.ColorDialog.Color := (sender as TEdit).Color;

if banco.ColorDialog.Execute then
begin
(Sender as TEdit).Color := banco.ColorDialog.Color;
end;


end;

procedure TFconfig.CheckBox15Click(Sender: TObject);
begin
if (Sender as TCheckBox).Checked then CheckBox16.Checked := false;


end;

procedure TFconfig.CheckBox16Click(Sender: TObject);
begin
if (Sender as TCheckBox).Checked then CheckBox15.Checked := false;

end;

end.


       Browser_COlor : TColor;

     App_Dir : TFileName;
     Dir_Banco:TFileName;
    Config : TIniFile;
    IniDir : TFileName;

    User_cod : Integer;
    User_Cor : TFileName;

    Carta_Visible : Boolean;
      Carta_Salva : Boolean;
        carta_dir : TFileName;
    carta_Impr_aut: Boolean;


    Const_CNPJ_Page : String; //http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/ConsultaPublica.asp
    Const_CPF_Page : string; //http://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/Cnpjreva_Solicitacao.asp
    campo_cnpj:ShortString;

