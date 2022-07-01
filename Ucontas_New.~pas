unit Ucontas_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ComCtrls, ToolEdit, CurrEdit, db,
  Grids, DBGrids, ThemeDBGrid, ADODB, ExtCtrls;

type
  TFconta_New = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DBComboBox1: TDBLookupComboBox;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    TBCliente: TADOQuery;
    TBClientes_Source: TDataSource;
    TBClientecodigo: TIntegerField;
    TBClientenome_razao: TWideStringField;
    ThemeDBGrid2: TThemeDBGrid;
    Bevel1: TBevel;
    Memo1: TMemo;
    TB_Descri: TADOQuery;
    TB_DescriCodigo: TAutoIncField;
    TB_Descridescricao: TWideStringField;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
    function Focused: Integer;
    procedure BitBtn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
    Procedure GravaHistAlter;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ThemeDBGrid2Exit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ThemeDBGrid2TitleClick(Column: TColumn);
    Procedure ButtonSetDescri(sender : TObject);
  private
    { Private declarations }
  public
    Editing : Boolean;
    { Public declarations }
  end;

var
  Fconta_New: TFconta_New;

implementation

uses UDados, DateUtils;

{$R *.dfm}
function TFconta_New.Focused: Integer;
begin
result := -1;
Result:= ActiveControl.ComponentIndex;

end;

procedure TFconta_New.FormCreate(Sender: TObject);
begin
Editing := false;
end;

procedure TFconta_New.FormShow(Sender: TObject);
begin
Width :=banco.Config.ReadInteger('Receber_Config','Width',Width);
Height :=banco.Config.ReadInteger('Receber_Config','Height',Height);


Memo1.Clear;
Edit1.Text := '';
DateTimePicker1.Date := Date;

if Editing then
begin
  Caption := 'Editando conta a receber...';
  BitBtn1.Caption := 'Editar';
   BitBtn3.Visible := true;
   
  if banco.TB_ContasPagada.Value then
  begin
    Edit1.Enabled := false;
    DBEdit10.Enabled := false;
    DateTimePicker1.Enabled := false;
    CurrencyEdit1.Enabled := false;
    DBComboBox1.Enabled := false;
    ThemeDBGrid2.Enabled := false;
    BitBtn3.Visible := false;
    BitBtn1.OnClick := ButtonSetDescri;
  end
  else
  banco.TB_Contas.Edit;

  if banco.TB_ContasPagada.Value then
  begin
    Label9.Caption := 'Conta recebida';
    Label9.Font.Color := banco.Contas_Color_Pagada;
  end
  else
  if Banco.TB_ContasDataVencimento.Value < Date then
  begin
  Label9.Caption := 'Conta atrasada';
  Label9.Font.Color := banco.Contas_Color_Atrasada;
  end
  else
  begin
  Label9.Caption := 'Aguardando Pagamento';
  Label9.Font.Color := clNavy;
  end;

  CurrencyEdit1.Value:=  banco.TB_ContasValor.Value;
  DateTimePicker1.Date:=  banco.TB_ContasDataVencimento.Value;


  if not Banco.TB_ContasNPedido.IsNull then
  begin
  Label7.Visible := true;
  DBEdit2.Visible :=true;
  end;

  if not banco.TB_ContasID_Cliente.IsNull then
  begin
  TBCliente.Close;
  TBCliente.SQL.Clear;
  TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
  TBCliente.SQL.Add('where codigo = '+IntToStr(Banco.TB_ContasID_Cliente.value));
  TBCliente.Open;
  Edit1.Text := TBClientenome_razao.Value;
  end;

  TB_Descri.SQL.Clear;
  TB_Descri.DisableControls;
  TB_Descri.SQL.Add('Select * from TB_Cont_Descri');
  TB_Descri.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  try
  TB_Descri.Open;
  except
    on e :Exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg('Erro ao abrir descrição',mtError,[mbok],0);
    end;
  end;
  if not (TB_Descri.State in [dsinactive]) then
  if TB_Descri.RecordCount = 1 then
  begin
  Memo1.Lines.Text := TB_Descridescricao.Value;

  TB_Descri.Close;
  end;


end
else
begin
  Caption := 'Criando conta a receber...';
  BitBtn1.Caption := 'Criar';
  banco.TB_Contas.Insert;
  Label9.Visible := false;
  
end;




end;

procedure TFconta_New.FormHide(Sender: TObject);
begin
if Banco.TB_Contas.State in [dsedit, dsinsert] then
Banco.TB_Contas.Cancel;

banco.Config.WriteInteger('Receber_Config','Width',Width);
banco.Config.WriteInteger('Receber_Config','Height',Height);

end;

procedure TFconta_New.BitBtn2Click(Sender: TObject);
begin
banco.TB_Contas.Cancel;
ModalResult := mrCancel;

end;

procedure TFconta_New.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
if BitBtn3.Caption = 'Confirmar' then
DBEdit1Enter(DBEdit1)
else
if ThemeDBGrid2.Visible then
begin
ThemeDBGrid2.Visible := false;
Edit1.SetFocus;
end
else
BitBtn2.Click;

end;

procedure TFconta_New.BitBtn1Click(Sender: TObject);
begin

if banco.TB_ContasDescricao.IsNull then
begin
MessageDlg('É necessário preencher o campo Descrição',mtError,[mbok],0);
DBEdit10.SetFocus;
exit;
end;

if CurrencyEdit1.Value = 0 then
begin
MessageDlg('Informe o valor',mtError,[mbok],0);
CurrencyEdit1.SetFocus;
exit;
end;

if Edit1.Text ='' then
banco.TB_ContasID_Cliente.Clear;



if Banco.TB_Contas.State in [dsinsert] then // se estiver criando
if DateTimePicker1.Date < Date then
if MessageDlg('A data de vencimento '+FormatDateTime('DD/MM/YYYY',DateTimePicker1.Date)+' é menor que hoje, deseja continuar?',mtWarning,[mbYes,mbno],0) = mrno then
begin
DateTimePicker1.SetFocus;
exit;
end;

if not Editing then
banco.TB_ContasDataCreate.Value := Now;

banco.TB_ContasValor.Value := CurrencyEdit1.Value;
if banco.TB_ContasDataVencimento.Value <> DateTimePicker1.Date then
banco.TB_ContasDataVencimento.Value:= StrToDate(FormatDateTime('DD/MM/YYYY',DateTimePicker1.Date));

try
  GravaHistAlter;

banco.TB_Contas.Post;

//descricao
if Memo1.Lines.Text = '' then
begin
  try
  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  banco.ExecSQLTB.SQL.Add('delete from TB_Cont_Descri');
  banco.ExecSQLTB.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  banco.ExecSQLTB.ExecSQL;
  except
  on e :exception do
  begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg('Erro ao atualizar o campo descrição, sequencia #02',mtError,[mbok],0);
  end;
  end;

end
else
begin
  TB_Descri.Close;
  TB_Descri.SQL.Clear;
  TB_Descri.DisableControls;
  TB_Descri.SQL.Add('Select * from TB_Cont_Descri');
  TB_Descri.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  try
  TB_Descri.Open;
  except
    on e :Exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg('Erro ao atualizar o campo descrição, sequencia #03',mtError,[mbok],0);
    end;
  end;
  if not (TB_Descri.State in [dsinactive]) then
  begin
    if TB_Descri.RecordCount = 0 then
    begin
    TB_Descri.Insert;
    TB_DescriCodigo.Value := banco.TB_ContasCodigo.Value;
    end
    else
    TB_Descri.Edit;

    TB_Descridescricao.Value := Memo1.Text;

    try
    TB_Descri.Post;
    except
    on e :Exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg('Erro ao atualizar o campo descrição, sequencia #04',mtError,[mbok],0);
    end;
    end;


    TB_Descri.Close;
    
  end;

end;


MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);


close;
except
on e : exception do
begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Não foi possível concluir a ação, mensagem original'+#13+e.Message,mtError,[mbok],0);
end;
end;
end;

procedure TFconta_New.BitBtn3Click(Sender: TObject);
var
  AuxDate : Tdate;
begin
if BitBtn3.Caption = 'Confirmar' then
begin
  if (banco.TB_ContasDescricao.IsNull) or (banco.TB_ContasDescricao.Value = '') then
  begin
  MessageDlg('É necessário preencher o campo Descrição',mtError,[mbok],0);
  DBEdit10.SetFocus;
  exit;
  end;

  if CurrencyEdit1.Value = 0 then
  begin
  MessageDlg('Informe o valor',mtError,[mbok],0);
  CurrencyEdit1.SetFocus;
  exit;
  end;

  try
    StrToInt(Edit2.Text);
  except
    MessageDlg('Não foi possível adiar, valor inválido',mtError,[mbok],0);
    Edit2.SetFocus;
    exit;
  end;

 if StrToInt(Edit2.Text) <= 0 then
 begin
 MessageDlg('Dias inválidos para adiar',mtError,[mbok],0);
 Edit2.SetFocus;
 exit;
 end;

 AuxDate := banco.TB_ContasDataVencimento.Value;
 AuxDate := IncDay(banco.TB_ContasDataVencimento.Value,StrToInt(Edit2.Text));

 if MessageDlg('Deseja adiar para '+FormatDateTime('DD/MM/YYYY',AuxDate)+#13+
 FormatDateTime('DDDD, DD',AuxDate)+' de '+FormatDateTime('MMMM',AuxDate)+' de '+FormatDateTime('YYYY',AuxDate),mtConfirmation,[mbyes,mbno],0) = mrno then
 begin
 DBEdit1Enter(DBEdit1);
 exit;
 end;




  banco.Config.WriteString('Receber_Config','Adiar',Edit2.Text);
  banco.TB_ContasDataVencimento.Value := AuxDate;

  try
banco.TB_Contas.Post;
MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
close;
except
on e : exception do
begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Não foi possível concluir a ação, mensagem original'+#13+e.Message,mtError,[mbok],0);

  Edit2.Visible := false;
  Label3.Visible := false;
  BitBtn3.Caption := 'Adiar';

end;
end;


end
else
begin
Label3.Visible:= true;
Edit2.Visible := true;
BitBtn3.Caption := 'Confirmar';
Edit2.SetFocus;

Edit2.Text := banco.Config.ReadString('Receber_Config','Adiar','30');

if not Banco.IsInt(Edit2.Text) then
Edit2.Text := '30';

end;


end;

procedure TFconta_New.DBEdit1Enter(Sender: TObject);
begin
if BitBtn3.Caption = 'Confirmar' then
begin
BitBtn3.Caption := 'Adiar';
Label3.Visible := false;
Edit2.Visible := false;
end;

end;

procedure TFconta_New.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
BitBtn3Click(BitBtn3);


if not (key in ['0'..'9',chr(8)]) then
key := #0;


end;

procedure TFconta_New.Edit2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;

end;

procedure TFconta_New.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
self.Perform(WM_NEXTDLGCTL,0,0);
key:=#0;
end;

end;


procedure TFconta_New.BitBtn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_left then
begin
BitBtn2.SetFocus;
key := 0;
end;

if key = vk_right then
begin
  if BitBtn3.Visible then
  BitBtn3.SetFocus
  else
  BitBtn2.SetFocus;
  

  key := 0;
end;


end;

procedure TFconta_New.BitBtn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_left then
begin
BitBtn1.SetFocus;
key := 0;
end;

if key = vk_right then
begin
  if BitBtn3.Visible then
  BitBtn3.SetFocus
  else
  BitBtn1.SetFocus;

key := 0;
end;
end;

procedure TFconta_New.BitBtn3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_left then
begin
BitBtn2.SetFocus;
key := 0;
end;

if key = vk_right then
begin
BitBtn1.SetFocus;
key := 0;
end;
end;

procedure TFconta_New.ThemeDBGrid2DrawColumnCell(Sender: TObject;
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
   if Banco.Cor_Grid[6] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[6]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFconta_New.ThemeDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
begin
ThemeDBGrid2.Visible := false;
  if TBCliente.RecordCount > 0 then
  begin
    Edit1.Text := TBClienteNome_Razao.Value;
    banco.TB_ContasID_Cliente.Value := TBClienteCodigo.Value;
    Edit1.SetFocus;
  end
  else
    Edit1.SetFocus;
end;

end;




procedure TFconta_New.GravaHistAlter;
  procedure InserHist(Alteracao: ShortString);
  begin
  Try
  banco.ExecSQLTB.SQL.Clear;
  banco.ExecSQLTB.SQL.Add('Insert into tb_Cont_hist (ID_Func,Alteracao,Data,ID_Conta)');
  banco.ExecSQLTB.SQL.Add('Values ('+IntToStr(banco.User_cod)+',"'+Alteracao+'","'+
  FormatDateTime('YYYY/MM/DD',Date)+' '+FormatDateTime('hh:mm:ss',time)+'",'+IntToStr(banco.TB_ContasCodigo.value)+')');
  banco.ExecSQLTB.ExecSQL;
  except
  end;
  end;

var
  I : Shortint;
begin
if not Editing then
exit;

For i := 0 to Banco.TB_Contas.Fields.Count - 1 do
if not banco.TB_Contas.Fields[i].Lookup then
if VarToStr(banco.TB_Contas.Fields[i].OldValue) <> VarToStr(banco.TB_Contas.Fields[i].Value) then
InserHist( banco.TB_Contas.Fields[i].FieldName+'='+VarToStr(banco.TB_Contas.Fields[i].OldValue)+'$@:='+VarToStr(banco.TB_Contas.Fields[i].Value));
end;



procedure TFconta_New.Edit1KeyPress(Sender: TObject; var Key: Char);
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
     ThemeDBGrid2.Visible := true;
     ThemeDBGrid2.Top := Edit1.Top +Edit1.Height +1;
     ThemeDBGrid2.Left:= Edit1.Left;
     ThemeDBGrid2.Width:= Edit1.Width;

     ThemeDBGrid2.SetFocus;
     exit;
    end;
if TBCliente.Active then
if not ( TBCliente.State in [dsinactive]) then
if TBCliente.Locate(TBClienteNome_Razao.FieldName,Edit1.Text,[]) then
begin
banco.TB_ContasID_Cliente.Value := TBClientecodigo.Value;
self.Perform(WM_NEXTDLGCTL,0,0);
exit;
end;

   Try
    StrToInt(Edit1.Text);
    TBCliente.Close;
    TBCliente.SQL.Clear;
    TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
    TBCliente.SQL.Add('where ativo = true');
    TBCliente.SQL.Add('and codigo = '+Edit1.Text);
    TBCliente.Open;

    if TBCliente.RecordCount > 0 then
    begin
     Edit1.Text := Banco.TBClientesNome_Razao.Value;
     banco.TB_ContasID_Cliente.Value := TBClientecodigo.Value;
     self.Perform(WM_NEXTDLGCTL,0,0);
     exit;
    end;

   Except
   end;

  ThemeDBGrid2.Visible := true;
   ThemeDBGrid2.Top := Edit1.Top +Edit1.Height+ 1;
     ThemeDBGrid2.Left:= Edit1.Left;
     ThemeDBGrid2.Width:= Edit1.Width;

  ThemeDBGrid2.SetFocus;

  TBCliente.Close;
  TBCliente.SQL.Clear;
  TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
  TBCliente.SQL.Add('where ativo = true');
  TBCliente.SQL.Add('and nome_razao like '+chr(39)+Edit1.Text+'%'+chr(39));
  TBCliente.Open;

  if TBCliente.RecordCount = 0 then
  begin
  TBCliente.close;
  TBCliente.SQL.Clear;
  TBCliente.SQL.Add('Select codigo,nome_razao from Cliente_Cadastro');
  TBCliente.SQL.Add('where ativo = true');
  TBCliente.Open;
  end;


end;


end;

procedure TFconta_New.ThemeDBGrid2Exit(Sender: TObject);
begin
ThemeDBGrid2.Visible := false;
end;

procedure TFconta_New.FormResize(Sender: TObject);
const
  Largura = 10;
begin

  Bevel1.Width := ClientWidth - (Bevel1.Left * 2);
  Bevel1.Height:= ClientHeight - (Bevel1.Top * 2);

  DBEdit1.Width := (ClientWidth * 20) div 100;
  Edit1.Width := Bevel1.Width - Edit1.Left - Largura;
  DBEdit10.Width := Bevel1.Width - DBEdit10.Left - Largura;
  //DateTimePicker1.Width := (ClientWidth * 40) div 100;
  //DBComboBox1.Width := DateTimePicker1.Width;
  CurrencyEdit1.Width := DBEdit1.Width;

  DateTimePicker1.Width := (Edit1.Width - Label6.Width - Largura-3) div 2;

  DBComboBox1.Width := DateTimePicker1.Width;
  Label6.Left := DateTimePicker1.Left + DateTimePicker1.Width + Largura;
  DBComboBox1.Left := Label6.Left + Label6.Width + 3;


  DBEdit2.Left := Edit1.Width + Edit1.Left - DBEdit2.Width;
  Label7.Left := DBEdit2.Left - 3 - Label7.Width;


  BitBtn1.Left := Bevel1.Width - BitBtn1.Width - Largura;
  BitBtn2.Left := BitBtn1.Left - Largura - BitBtn2.Width;
  BitBtn3.Left := BitBtn2.Left - Largura - BitBtn3.Width;
  BitBtn1.Top := Bevel1.Top + Bevel1.Height - BitBtn1.Height - Largura;
  BitBtn2.Top := BitBtn1.Top;
  BitBtn3.Top := BitBtn1.Top;

  Edit2.Top := BitBtn3.Top + BitBtn3.Height - Edit2.Height;
  Label3.Top := Edit2.top;

  Memo1.Width := Edit1.Width;
  Memo1.Height := BitBtn3.Top - Memo1.Top - (Largura * 2);

  //ThemeDBGrid2.Height := (CurrencyEdit1.Top + CurrencyEdit1.Height) - (Edit1.Top + Edit1.Height +1);
  ThemeDBGrid2.Height := Memo1.Top + (Memo1.Height div 2) - ThemeDBGrid2.Top;
  ThemeDBGrid2.Width := Edit1.Width;


  ThemeDBGrid2.Columns[0].Width := (ThemeDBGrid2.Width * 10) div 100;
  ThemeDBGrid2.Columns[1].Width := ThemeDBGrid2.Width - 23 - ThemeDBGrid2.Columns[0].Width;

  Label9.Left := DBEdit1.Left + DBEdit1.Width + 6;
  if Label7.Visible then
  Label9.Width := Label7.Left - Label9.Left
  else
  Label9.Width := Edit1.Width - Label9.Left + Edit1.Left
end;

procedure TFconta_New.ThemeDBGrid2TitleClick(Column: TColumn);
begin
banco.OrdenaGrid(Column);
end;

procedure TFconta_New.ButtonSetDescri(sender: TObject);
var
  erro : Boolean;
begin
erro := false;

//descricao
if Memo1.Lines.Text = '' then
begin
  try
  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  banco.ExecSQLTB.SQL.Add('delete from TB_Cont_Descri');
  banco.ExecSQLTB.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  banco.ExecSQLTB.ExecSQL;
  except
  on e :exception do
  begin
    banco.Create_Erro(e.ClassName,e.Message);
    erro := true;
    MessageDlg('Erro ao atualizar o campo descrição, sequencia #02',mtError,[mbok],0);
  end;
  end;
end
else
begin
  TB_Descri.Close;
  TB_Descri.SQL.Clear;
  TB_Descri.DisableControls;
  TB_Descri.SQL.Add('Select * from TB_Cont_Descri');
  TB_Descri.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  try
  TB_Descri.Open;
  except
    on e :Exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    erro := true;
    MessageDlg('Erro ao atualizar o campo descrição, sequencia #03',mtError,[mbok],0);
    end;
  end;
  if not (TB_Descri.State in [dsinactive]) then
  begin
    if TB_Descri.RecordCount = 0 then
    begin
    TB_Descri.Insert;
    TB_DescriCodigo.Value := banco.TB_ContasCodigo.Value;
    end
    else
    TB_Descri.Edit;

    TB_Descridescricao.Value := Memo1.Text;

    try
    TB_Descri.Post;
    except
    on e :Exception do
    begin
    banco.Create_Erro(e.ClassName,e.Message);
    erro := true;
    MessageDlg('Erro ao atualizar o campo descrição, sequencia #04',mtError,[mbok],0);
    end;
    end;
    TB_Descri.Close;
 end;
end;

if not erro then
begin
MessageDlg('Dados gravados com sucesso',mtInformation,[mbok],0);
close;
end;

end;

end.
