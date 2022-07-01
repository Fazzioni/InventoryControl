unit UAgendaNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, db, ComCtrls, ExtCtrls, ADODB,
  Grids, DBGrids, ThemeDBGrid;

type
  TFAgenda_New = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label7: TLabel;
    DBTipo: TDBLookupComboBox;
    Label8: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBMemo1: TDBMemo;
    DB_ContatoForma: TDBLookupComboBox;
    EditDate: TDateTimePicker;
    EditHora: TDateTimePicker;
    Bevel1: TBevel;
    DBText1: TDBText;
    DBText2: TDBText;
    Edit1: TEdit;
    TBCliente: TADOQuery;
    ThemeDBGrid2: TThemeDBGrid;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
    Procedure VisibleGrid;
    procedure ThemeDBGrid2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ThemeDBGrid2Exit(Sender: TObject);
    procedure ThemeDBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TBClienteAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Editando : Boolean;
  end;

var
  FAgenda_New: TFAgenda_New;

implementation

uses UDados, UAgenda, Math, IniFiles, UAgendaMes, DateUtils,
  UAgenda_MesHora;

{$R *.dfm}

procedure TFAgenda_New.FormCreate(Sender: TObject);
begin
Editando := false;

end;

procedure TFAgenda_New.BitBtn1Click(Sender: TObject);
var
  EditCod : Boolean;
begin
EditCod := false;

if (banco.TB_AgendaAssunto.IsNull) or (banco.TB_AgendaAssunto.AsString = '' ) then
begin
MessageDlg('Preencha o campo assunto',mtError,[mbok],0);
DBEdit6.SetFocus;
exit;
end;


if Edit1.Text = '' then banco.TB_AgendaID_Cliente.Clear;



if not Editando then banco.TB_AgendaData_Criado.Value := now;

try
banco.TB_AgendaData.Value :=StrToDateTime( DateToStr(EditDate.Date) +' '+TimeToStr(EditHora.Time));

if banco.TB_AgendaID_Cliente.OldValue <> Banco.TB_AgendaID_Cliente.Value then
EditCod := true;

if Editando then
begin
  banco.ADOConnection1.BeginTrans;
  banco.GravaAuditoria(Banco.TB_Agenda,banco.TB_AgendaCodigo.Value,5, 2);
end;

Banco.TB_Agenda.Post;

MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);

if Editando then
Banco.ADOConnection1.CommitTrans;

if EditCod then // se altero o id cliente, vamos atualizar;
begin
{ Book := banco.TB_Agenda.Bookmark;
 banco.TB_Agenda.DisableControls;
 Banco.TB_Agenda.Close;
 Banco.TB_Agenda.open;
 banco.TB_Agenda.Bookmark := Book;
 banco.TB_Agenda.EnableControls;}
 banco.Refresh(banco.TB_Agenda);
end;

close;

except
  on e : exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg(e.Message,mtError,[mbok],0);

  if Editando then
  Banco.ADOConnection1.RollbackTrans;
  

  end;
end;



end;

procedure TFAgenda_New.FormShow(Sender: TObject);
var
  Aux : integer;
begin
Edit1.Text := '';

Self.Constraints.MinWidth := 400;
Self.Constraints.MinHeight := 300;

Width  :=banco.Config.ReadInteger(name,'Width',Width);
Height :=banco.Config.ReadInteger(name,'Height',Height);

EditDate.Date := Date;
EditHora.Time := StrToTime('00:00:00');


if Editando then
begin
banco.TB_Agenda.Edit;
caption := 'Editando agenda...';
BitBtn1.Caption := 'Editar';

EditDate.Date := StrToDate(FormatDateTime('DD/MM/YYYY',Banco.TB_AgendaData.Value));
EditHora.Time := StrToTime(FormatDateTime('hh:mm:ss',Banco.TB_AgendaData.Value));

if not Banco.TB_AgendaID_Cliente.IsNull then
try
  TBCliente.Close;
  TBCliente.SQL.Clear;
  TBCliente.SQL.Add('Select nome_razao from Cliente_Cadastro');
  TBCliente.SQL.Add('where codigo = '+IntToStr(banco.TB_AgendaID_Cliente.Value));
  TBCliente.Open;

  if TBCliente.RecordCount > 0 then
  if not TBCliente.FieldByName('nome_razao').IsNull then
  Edit1.Text := TBCliente.FieldValues['nome_razao'];

 TBCliente.Close;
Except
  on e :Exception do
  begin
  Banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao verificar cliente',mtError,[mbok],0);
  BitBtn1.Enabled := false;
  end;
end;

end
else
begin
banco.TB_Agenda.Insert;
BitBtn1.Caption := 'Inserir';
caption := 'Inserindo agenda...';
Banco.TB_AgendaEfetuado.AsBoolean := false;
EditDate.Date := date;
Label1.Visible := false;
Label3.Visible := false;
Edit1.Text := '';


If banco.Config.ValueExists('Agenda_Padrao','Contato_Format') then
begin
  aux := -1;
  aux := Banco.Config.ReadInteger('Agenda_Padrao','Contato_Format',-1);
  if aux > -1 then
  if banco.TB_Agenda_Contato.Locate(banco.TB_Agenda_ContatoCodigo.FieldName,aux,[]) then
  banco.TB_AgendaContato_Forma.Value := aux;
end;

If banco.Config.ValueExists('Agenda_Padrao','Contato_Type') then
begin
  aux := -1;
  aux := Banco.Config.ReadInteger('Agenda_Padrao','Contato_Type',-1);
  if aux > -1 then
  if banco.TB_Agenda_Tipo.Locate(banco.TB_Agenda_TipoCodigo.FieldName,aux,[]) then
  banco.TB_AgendaTipo.Value := aux;
end;


end;


end;

procedure TFAgenda_New.BitBtn2Click(Sender: TObject);
begin
close;

end;

procedure TFAgenda_New.FormHide(Sender: TObject);
begin
if Banco.TB_Agenda.State in [dsedit, dsinsert] then
Banco.TB_Agenda.Cancel;

banco.Config.WriteInteger(name,'Width',Width);
banco.Config.WriteInteger(name,'Height',Height);
end;

procedure TFAgenda_New.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
if ThemeDBGrid2.Visible then
begin
ThemeDBGrid2.Visible := false;
Edit1.SetFocus;
end
else
close;

end;

procedure TFAgenda_New.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
key := #0;
Self.Perform(WM_NEXTDLGCTL,0,0);
end;

end;

procedure TFAgenda_New.FormResize(Sender: TObject);
Const
  Largura = 8;
begin

//if Width  < 400 then Width := 400;
//If Height < 300 then Height:= 300;


Bevel1.Left := Largura;
Bevel1.top := Largura;
Bevel1.Width  := Width - (largura  * 4);
Bevel1.Height := Height - (largura * 7);

DBEdit6.Width :=  Width - DBEdit6.Left - (Largura * 5);
Edit1.Width := DBEdit6.Width;
DBMemo1.Width := DBEdit6.Width;


DBCheckBox1.Top := Bevel1.Height + Bevel1.Top - Largura - DBCheckBox1.Height;
Label3.Top := DBCheckBox1.Top - DBCheckBox1.Height -4;
DBText2.Top := Label3.Top;

Label1.Top := Label3.Top - 4 - Label3.Height;
DBText1.Top := Label1.Top;

Label2.Top := Label1.Top - 23;
DB_ContatoForma.Top := Label2.Top -3;


Label8.Top := Label2.Top;
DBTipo.Top := DB_ContatoForma.Top;


BitBtn1.Top := Bevel1.Height + Bevel1.top - BitBtn1.Height - (Largura * 2);
BitBtn2.Top := BitBtn1.Top;
BitBtn1.Left := Bevel1.Width + Bevel1.Left - BitBtn1.Width - (Largura * 2);
BitBtn2.Left := BitBtn1.Left - BitBtn2.Width - Largura;

DBMemo1.Height := DB_ContatoForma.Top - DBMemo1.Top - Largura;


DB_ContatoForma.Width :=  ((DBMemo1.Width ) *50) div 100;
DBTipo.Width := (DBMemo1.Width * 40) div 100;

DBTipo.Left :=  DBMemo1.Left + DBMemo1.Width - DBTipo.Width;
Label8.Left := DBTipo.Left - Label8.Width - 5;


EditDate.Width := (Width  *30) div 100;
SpeedButton1.Left := EditDate.Width + EditDate.Left + Largura;

EditHora.Left := SpeedButton1.Left + SpeedButton1.Width + Largura;
EditHora.Width := (Width  *15) div 100;

//SpeedButton1.Left := EditHora.Left + EditHora.Width + 5;


SpeedButton2.Left := EditHora.Left + EditHora.Width + Largura;


ThemeDBGrid2.Height := DBMemo1.Top - ThemeDBGrid2.Top + (DBMemo1.Height * 75 div 100);
ThemeDBGrid2.Width :=  Edit1.Width;
if ThemeDBGrid2.Columns.Count = 2 then
begin
ThemeDBGrid2.Columns[0].Width := (ThemeDBGrid2.Width - 23) * 20 div 100;
ThemeDBGrid2.Columns[1].Width := (ThemeDBGrid2.Width - 23) * 80 div 100;
end;






end;

procedure TFAgenda_New.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13 ) then
begin
key := #0;

    if Edit1.Text = '' then
    begin
     TBCliente.Close;
     TBCliente.SQL.Clear;
     TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
     TBCliente.SQL.Add('where ativo = true');
     TBCliente.open;
     TBCliente.EnableControls;
     VisibleGrid;
     exit;
    end;

if TBCliente.Active then
if not (TBCliente.State in [dsinactive]) then
if TBCliente.Locate('nome_razao',Edit1.Text,[]) then
begin
banco.TB_AgendaID_Cliente.Value := TBCliente.FieldValues['codigo'];
self.Perform(WM_NEXTDLGCTL,0,0);
exit;
end;

  if banco.IsInt(Edit1.Text) then
   Try
    StrToInt(Edit1.Text);
    TBCliente.Close;
    TBCliente.SQL.Clear;
    TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
    TBCliente.SQL.Add('where ativo = true');
    TBCliente.SQL.Add('and codigo = '+Edit1.Text);
    TBCliente.Open;
    TBCliente.EnableControls;

    if TBCliente.RecordCount > 0 then
    begin
     Edit1.Text := Banco.TBClientesNome_Razao.Value;
     banco.TB_AgendaID_Cliente.Value := TBCliente.FieldValues['codigo'];
     self.Perform(WM_NEXTDLGCTL,0,0);
     exit;
    end;

   Except
   end;


  TBCliente.Close;
  TBCliente.SQL.Clear;
  TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
  TBCliente.SQL.Add('where ativo = true');
  TBCliente.SQL.Add('and nome_razao like '+chr(39)+Edit1.Text+'%'+chr(39));
  TBCliente.Open;
  TBCliente.EnableControls;
  VisibleGrid;

  if TBCliente.RecordCount = 0 then
  begin
  TBCliente.close;
  TBCliente.SQL.Clear;
  TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
  TBCliente.SQL.Add('where ativo = true');
  TBCliente.Open;
  TBCliente.EnableControls;
  VisibleGrid;
  end;


end;


end;


procedure TFAgenda_New.ThemeDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
begin
ThemeDBGrid2.Visible := false;
  if TBCliente.RecordCount > 0 then
  begin
    Edit1.Text := TBCliente.FieldValues['nome_razao'];
    banco.TB_AgendaID_Cliente.Value := TBCliente.FieldValues['codigo'];
    Edit1.SetFocus;
  end
  else
    Edit1.SetFocus;
end;

end;

procedure TFAgenda_New.VisibleGrid;
Const
  Dif = 23;
begin
  ThemeDBGrid2.Top := Edit1.Top + Edit1.Height + 2;
  ThemeDBGrid2.Left := Edit1.Left;
  ThemeDBGrid2.Visible := true;
  ThemeDBGrid2.SetFocus;

  if ThemeDBGrid2.Columns.Count = 2 then
  begin
  ThemeDBGrid2.Columns[0].Width := 50;
  ThemeDBGrid2.Columns[0].Title.Caption := 'Código';
  ThemeDBGrid2.Columns[1].Width := ThemeDBGrid2.Width - Dif - ThemeDBGrid2.Columns[0].Width;
  ThemeDBGrid2.Columns[1].Title.Caption := 'Razão Social';
  end;

  
end;

procedure TFAgenda_New.ThemeDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  holdcolor : TColor;
begin
HoldColor := ThemeDBGrid2.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if Banco.Cor_Grid[9] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[9]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFAgenda_New.ThemeDBGrid2Exit(Sender: TObject);
begin
ThemeDBGrid2.Visible := false;
end;

procedure TFAgenda_New.ThemeDBGrid2DblClick(Sender: TObject);
begin
ThemeDBGrid2.Visible := false;

  if TBCliente.RecordCount > 0 then
  begin
    Edit1.Text := TBCliente.FieldValues['nome_razao'];
    banco.TB_AgendaID_Cliente.Value := TBCliente.FieldValues['codigo'];
    Edit1.SetFocus;
  end
  else
    Edit1.SetFocus;
end;

procedure TFAgenda_New.SpeedButton1Click(Sender: TObject);
begin
try
  Application.CreateForm(TFAgenda_Mes,FAgenda_Mes);

  FAgenda_Mes.Mes := MonthOf(EditDate.Date);
  FAgenda_Mes.Ano := YearOf(EditDate.Date);
  FAgenda_Mes.Dia := DayOf(EditDate.Date);

  FAgenda_Mes.ShowModal;
Finally
  FreeAndNil(FAgenda_Mes);
end;

end;


procedure TFAgenda_New.SpeedButton2Click(Sender: TObject);
begin
try
  DateToStr(EditDate.Date);
except
  MessageDlg('Data inválida',mtError,[mbok],0);
  exit;
end;

try
  Application.CreateForm(TFAgenda_MesHora,FAgenda_MesHora);
  FAgenda_MesHora.Dia :=  EditDate.Date;
  FAgenda_MesHora.ShowModal;
finally
  FreeAndNil(FAgenda_MesHora);
end;

end;

procedure TFAgenda_New.TBClienteAfterOpen(DataSet: TDataSet);
begin
if ThemeDBGrid2.Columns.Count = 2 then
begin
ThemeDBGrid2.Columns[0].Width := (ThemeDBGrid2.Width - 23) * 20 div 100;
ThemeDBGrid2.Columns[1].Width := (ThemeDBGrid2.Width - 23) * 80 div 100;
end;

end;

end.
