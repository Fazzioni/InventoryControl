unit UinfoConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, DBClient, Gauges,
  ComCtrls, ThemeDBGrid, DBCtrls;

type
  TFinfoConta = class(TForm)
    TB_Hist: TADOQuery;
    TB_HistCodigo: TAutoIncField;
    TB_HistID_Func: TIntegerField;
    TB_HistAlteracao: TWideStringField;
    TB_HistData: TDateTimeField;
    TB_HistID_Conta: TIntegerField;
    Timer1: TTimer;
    DataSet: TClientDataSet;
    DataSetCampo: TStringField;
    DataSetOldValue: TStringField;
    DataSetNewValue: TStringField;
    DataSetFuncionario: TStringField;
    TB_Func: TADOQuery;
    DataSource1: TDataSource;
    TB_Funccodigo: TAutoIncField;
    TB_Funcnome: TWideStringField;
    DataSetErro: TBooleanField;
    TB_Cli: TADOQuery;
    TB_Clinome_razao: TWideStringField;
    TB_Clicodigo: TIntegerField;
    ThemeDBGrid1: TThemeDBGrid;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label15: TLabel;
    Label16: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    DataSetData: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormHide(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    Function FormatSpace(valor:ShortString;Space:byte):ShortString;
    procedure FormResize(Sender: TObject);
    procedure Label17MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBText2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FinfoConta: TFinfoConta;

implementation

uses UDados, IniFiles;

{$R *.dfm}

procedure TFinfoConta.FormShow(Sender: TObject);
begin
Label15.Caption := '';
Label16.Caption := '';
Label17.Caption := '';

TB_Hist.SQL.Clear;
TB_Hist.SQL.Add('Select * from tb_cont_hist');
TB_Hist.SQL.Add('Where id_conta ='+IntToStr(banco.TB_ContasCodigo.Value));
TB_Hist.SQL.Add('order by Data');
TB_Hist.Open;


if banco.TB_ContasPagada.Value then
begin
Label16.Caption := FormatDateTime('DD/MM/YYYY hh:mm:ss ',banco.TB_ContasDataPagada.Value);

if TB_Func.State in [dsinactive] then tb_func.Open;
if TB_Func.Locate(TB_Funccodigo.FieldName,banco.TB_ContasFuncRecebe.Value,[]) then
Label15.Caption := TB_Funcnome.Value;
end
else
begin
Label8.Visible := false;
Label15.Visible := false;
Label7.Visible := false;
Label16.Visible := false;

Label11.Top := Label8.Top;
Label17.Top := Label8.Top;
end;

if not banco.TB_ContasID_Cliente.IsNull then
begin
if TB_Cli.State in [dsinactive] then TB_Cli.Open;

if tb_cli.Locate(TB_Clicodigo.FieldName,Banco.TB_ContasID_Cliente.Value,[]) then
Label17.Caption := TB_Clinome_razao.Value;

end
else
begin
Label11.Visible := false;
Label17.Visible := false;
end;



if not banco.TB_ContasPagada.Value then
begin
DBText7.Font.Color := banco.Contas_Color_Atrasada;

if banco.TB_ContasDataVencimento.Value < date then
DBText6.Font.Color := banco.Contas_Color_Atrasada;

end
else
begin
DBText7.Font.Color := banco.Contas_Color_Pagada;
DBText6.Font.Color := banco.Contas_Color_Pagada;
end;

Label2.Visible := not(Banco.TB_ContasNPedido.IsNull);
DBText2.Visible := not(Banco.TB_ContasNPedido.IsNull);



if TB_Hist.recordcount > 0 then
Timer1.Enabled := true;


Width := banco.Config.ReadInteger('Hist_Contas','Width',Width);
Height:= banco.Config.ReadInteger('Hist_Contas','Height',Height);


end;

procedure TFinfoConta.Timer1Timer(Sender: TObject);
var
  Campo : Shortint;
  I : byte;
  First,Second : byte;
begin
ProgressBar1.Visible := true;
Timer1.Enabled := false;

  try
  banco.LoadIndexOf(DataSet);
  DataSet.CreateDataSet;
  if not DataSet.Active then   DataSet.Active := true;

  banco.LoadColumns(ThemeDBGrid1);
  except
  on e: exception do
  begin
    banco.Create_Erro(e.ClassName,e.Message);
    MessageDlg(e.Message,mtError,[mbok],0);
    close;
  end;
  end;

TB_Hist.First;
TB_Func.Open;
while not TB_Hist.Eof do
begin

campo := -1;
First := 0;
Second := 0;

ProgressBar1.Max := TB_Hist.RecordCount;
ProgressBar1.Position := TB_Hist.RecNo;
Application.ProcessMessages;

if TB_HistAlteracao.Value = '#$:=R3C3B!D4' then
begin
 DataSet.insert;
 DataSetCampo.Value := 'Pagada';
 DataSetOldValue.Value := 'Não';
 DataSetNewValue.Value := 'Conta Paga';
 DataSetData.Value := FormatDateTime('DD/MM/YYYY hh:mm:ss',TB_HistData.Value);


 if TB_Func.Locate(TB_Funccodigo.FieldName,TB_HistID_Func.Value,[]) then
DataSetFuncionario.Value := TB_Funcnome.Value;


 DataSet.Post;
 TB_Hist.Next;
break;
end;




For i := 1 to length(TB_HistAlteracao.Value) do
begin
  if (TB_HistAlteracao.Value[i] = '=')  then
  if First = 0 then
  First := i-1;

  if TB_HistAlteracao.Value[i] = '$'  then
  if TB_HistAlteracao.Value[I+1] ='@' then
  if TB_HistAlteracao.Value[I+2] =':' then
  if TB_HistAlteracao.Value[I+3] ='=' then
  if Second = 0 then
  Second := i-1;


end;


DataSet.insert;
DataSetErro.Value := false;


if TB_Func.Locate(TB_Funccodigo.FieldName,TB_HistID_Func.Value,[]) then
DataSetFuncionario.Value := TB_Funcnome.Value;

campo := banco.SearchField(banco.TB_Contas,copy(TB_HistAlteracao.Value,1,First),false);
if campo > 1 then
DataSetCampo.Value := banco.TB_Contas.Fields[campo].DisplayLabel;

if DataSetCampo.Value = '' then
begin
 DataSetCampo.Value := copy(TB_HistAlteracao.Value,1,First);
 DataSetErro.Value := true;
end;

 DataSetData.Value := FormatDateTime('DD/MM/YYYY hh:mm:ss',TB_HistData.Value);

DataSetOldValue.Value := copy(TB_HistAlteracao.Value,First+2,Second- first -1);
DataSetNewValue.Value := copy(TB_HistAlteracao.Value,Second+5,length(TB_HistAlteracao.Value));


// Clientes
if Campo > -1 then
if banco.TB_ContasID_Cliente.Index = campo then
begin
  if TB_Cli.State in [dsinactive] then TB_Cli.Open;

  if DataSetOldValue.Value <> '' then
  try
  if tb_cli.Locate(TB_Clicodigo.FieldName,StrToInt(DataSetOldValue.Value),[]) then   DataSetOldValue.Value := TB_Clinome_razao.Value;
  except
  DataSetErro.Value := true;
  end;

  if DataSetNewValue.Value <> '' then
  try
  if tb_cli.Locate(TB_Clicodigo.FieldName,StrToInt(DataSetNewValue.Value),[]) then   DataSetNewValue.Value := TB_Clinome_razao.Value;
  except
  DataSetErro.Value := true;
  end;
end;

// Portador
if Campo > -1 then
if banco.TB_ContasPortador.Index = campo then
begin
  if Banco.TB_Portador.State in [dsinactive] then Banco.TB_Portador.Open;

  if DataSetOldValue.Value <> '' then
  try
  if Banco.TB_Portador.Locate(Banco.TB_PortadorCodigo.FieldName,StrToInt(DataSetOldValue.Value),[]) then   DataSetOldValue.Value := Banco.TB_PortadorDescricao.Value;
  except
  DataSetErro.Value := true;
  end;

  if DataSetNewValue.Value <> '' then
  try
  if Banco.TB_Portador.Locate(Banco.TB_PortadorCodigo.FieldName,StrToInt(DataSetNewValue.Value),[]) then   DataSetNewValue.Value := Banco.TB_PortadorDescricao.Value;
  except
  DataSetErro.Value := true;
  end;

end;



DataSet.Post;


TB_Hist.Next;
end;

ProgressBar1.Visible := false;



end;

procedure TFinfoConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
close;

end;

procedure TFinfoConta.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
    (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;

    if DataSetErro.Value then
    (Sender as TThemeDBGrid).Canvas.Font.Color := clRed
    else
    (Sender as TThemeDBGrid).Canvas.Font.Color := clwhite;

     if DataSetCampo.Value = 'Pagada' then
     if DataSetNewValue.Value ='Conta Paga' then
     (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Contas_Color_Pagada
     else
     (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Contas_Color_Atrasada;

   end
 else
 if DataSetCampo.Value = 'Pagada' then
 begin
     (Sender as TThemeDBGrid).Canvas.font.Color := clBlack;
     if DataSetNewValue.Value ='Conta Paga' then
     (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Contas_Color_Pagada
     else
     (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Contas_Color_Atrasada;

 end
 else
  if DataSetErro.Value then
  begin
  (Sender as TThemeDBGrid).Canvas.Brush.Color := clRed;
  (Sender as TThemeDBGrid).Canvas.Font.Color := clBlack;
  end
  else
  begin
   if Banco.Cor_Grid[5] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[5]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
  end;
(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFinfoConta.FormHide(Sender: TObject);
begin
if not (DataSet.State in [dsinactive]) then
begin
Banco.SaveIndexOf(DataSet);
banco.SaveColumns(ThemeDBGrid1);
DataSet.Active := false;
end;


banco.Config.WriteInteger('Hist_Contas','Width',Width);
banco.Config.WriteInteger('Hist_Contas','Height',Height);
end;

procedure TFinfoConta.Memo1Enter(Sender: TObject);
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFinfoConta.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
key := 0;
end;

procedure TFinfoConta.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
key := #0;
end;

procedure TFinfoConta.Memo1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled := true;

end;

function TFinfoConta.FormatSpace(valor:ShortString; Space: byte): ShortString;
begin
Result := valor;
while length(result) <= Space do
result := result+' ';

end;

procedure TFinfoConta.FormResize(Sender: TObject);
begin
Label9.Left := (Width div 2) - (Label9.Width);

Label8.Left := Label9.Left;
Label7.Left := Label9.Left;
Label11.Left:= Label9.Left;

DBText7.Left := Label9.Left +Label9.Width + 3;

Label15.Left := DBText7.Left;
Label16.Left := DBText7.Left;
Label17.Left := DBText7.Left;






end;

procedure TFinfoConta.Label17MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft then
if MessageDlg('Deseja visualizar o histórico do cliente?',mtConfirmation,[mbyes,mbno],0) = mryes then
banco.HistoricoCliente(banco.TB_ContasID_Cliente.Value);
end;

procedure TFinfoConta.DBText2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

if MessageDlg('Deseja visualizar o pedido em PDF?',mtConfirmation,[mbyes,mbno],0) = mrno then
exit;

if not (banco.TB_Pedido.State in [dsInactive]) then banco.TB_Pedido.Close;

banco.TB_Pedido.SQL.Clear;
{banco.TB_Pedido.SQL.Add('Select  A.*, B.nome_razao, B.nome, B.UF, B.Municiopio, B.cpf from');
banco.TB_Pedido.SQL.Add('Venda_info A inner join Cliente_cadastro B on');
banco.TB_Pedido.SQL.Add('A.id_cliente = b.codigo'); }
banco.TB_Pedido.SQL.Add(Banco.Sql_Tb_Pedido_Default);
banco.TB_Pedido.SQL.Add('where A.id_pedido = '+IntToStr(banco.TB_ContasNPedido.value));
banco.TB_Pedido.Open;

if banco.TB_Pedido.RecordCount = 0 then
MessageDlg('Erro ao procurar pedido',mtError,[mbok],0)
else
banco.GeraDav;

end;



procedure TFinfoConta.ThemeDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (ssCtrl	 in Shift) and (key = 80) then
if DataSet.Active then
banco.ListaQuery(DataSet,'Lista de Alterações: Conta '+IntToStr(banco.TB_ContasCodigo.Value),DataSetCampo.Index);



end;

end.
