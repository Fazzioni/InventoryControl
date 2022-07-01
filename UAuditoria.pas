unit UAuditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids, ThemeDBGrid,
  ComCtrls, DBClient, DBCtrls, Buttons;

type
  TFAuditoria = class(TForm)
    TB_Auditoria: TADOQuery;
    TB_AuditoriaCodigo: TAutoIncField;
    TB_AuditoriaTipo: TIntegerField;
    TB_AuditoriaData: TDateTimeField;
    TB_AuditoriaUser: TIntegerField;
    TB_Auditoriamodulo: TIntegerField;
    TB_Auditoriareg: TIntegerField;
    TB_AuditoriaCampo: TWideStringField;
    TB_AuditoriaOldValue: TWideStringField;
    TB_AuditoriaNewValue: TWideStringField;
    TB_Func: TADOQuery;
    TB_Funcnome: TWideStringField;
    TB_Funccodigo: TAutoIncField;
    TB_AuditoriaUserVirtual: TStringField;
    Panel2: TPanel;
    Panel1: TPanel;
    ThemeDBGrid1: TThemeDBGrid;
    TreeView1: TTreeView;
    TB_Modulo: TClientDataSet;
    TB_ModuloCodigo: TIntegerField;
    TB_ModuloDescricao: TStringField;
    DataSource1: TDataSource;
    TB_Tipo: TClientDataSet;
    TB_TipoCodigo: TIntegerField;
    TB_TipoDescricao: TStringField;
    TB_AuditoriaTipoVirtual: TStringField;
    TB_AuditoriaModuloVirtual: TStringField;
    Label1: TLabel;
    Func_Source: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    TB_Login: TADOQuery;
    TB_LoginCodigo: TAutoIncField;
    TB_LoginUser: TIntegerField;
    TB_LoginData: TDateTimeField;
    TB_LoginUsuario: TStringField;
    ThemeDBGrid2: TThemeDBGrid;
    Log_source: TDataSource;
    TB_LoginMac: TIntegerField;
    TB_LoginIp: TIntegerField;
    TB_IP: TADOQuery;
    TB_MAC: TADOQuery;
    TB_IPCodigo: TAutoIncField;
    TB_IPDescricao: TWideStringField;
    TB_MACCodigo: TAutoIncField;
    TB_MACDescricao: TWideStringField;
    TB_LoginIPVirtual: TStringField;
    TB_LoginMACVirtual: TStringField;
    TB_Audi_Pedido: TADOQuery;
    TB_Audi_PedidoCodigo: TAutoIncField;
    TB_Audi_PedidoID_Pedido: TIntegerField;
    TB_Audi_PedidoID_Mercadoria: TIntegerField;
    TB_Audi_PedidoID_Mercadoria_Estoque: TIntegerField;
    TB_Audi_PedidoCampo: TWideStringField;
    TB_Audi_PedidoNewValue: TWideStringField;
    TB_Audi_PedidoOldValue: TWideStringField;
    TB_Audi_PedidoTipo: TIntegerField;
    TB_Audi_PedidoID_Auditoria: TIntegerField;
    TB_Audi_PedidoTipoVirtual: TStringField;
    Pedido_Source: TDataSource;
    GRID_Pedido: TThemeDBGrid;
    TB_Erro: TADOQuery;
    TB_ErroCodigo: TAutoIncField;
    TB_ErroData: TDateTimeField;
    TB_ErroClasse: TWideStringField;
    TB_ErroMessage: TWideStringField;
    TB_ErroUser: TIntegerField;
    TB_ErroVersao: TWideStringField;
    TB_ErroRelatorio: TBlobField;
    TB_ErroUser_Virtual: TStringField;
    Erro_Source: TDataSource;
    Grid_Erro: TThemeDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure TB_AuditoriaAfterOpen(DataSet: TDataSet);
    procedure TB_AuditoriaBeforeClose(DataSet: TDataSet);
    procedure FormHide(Sender: TObject);
    procedure TreeView1Editing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeView1Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    Procedure SetDateSql(DataSet:Tadoquery);
    procedure TB_AuditoriaBeforeOpen(DataSet: TDataSet);
    procedure SearchDate(DataSet : TADOQuery);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    Procedure VisibleGrid(grid : Shortint);
    procedure TB_LoginBeforeOpen(DataSet: TDataSet);
    procedure TB_LoginAfterOpen(DataSet: TDataSet);
    procedure TB_LoginBeforeClose(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ThemeDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TB_Audi_PedidoAfterOpen(DataSet: TDataSet);
    procedure TB_Audi_PedidoBeforeClose(DataSet: TDataSet);
    procedure codCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TB_ErroAfterOpen(DataSet: TDataSet);
    procedure TB_ErroBeforeClose(DataSet: TDataSet);
    procedure TB_ErroBeforeOpen(DataSet: TDataSet);
    procedure Grid_ErroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    UsingDate : Boolean;
    Cod_Draw : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAuditoria: TFAuditoria;

implementation


uses UDados, Math;
  Function ModuloCount: Byte;stdcall; external 'SysABase.dll';
  Function GetModulo(index:byte): ShortString;stdcall;external 'SysABase.dll';
  Function TipoCount: Byte;stdcall;external 'SysABase.dll';
  Function GetTipo(index:byte): ShortString;stdcall;external 'SysABase.dll';
{$R *.dfm}

procedure TFAuditoria.FormCreate(Sender: TObject);
var
  i : byte;
begin
Cod_Draw := 0;

UsingDate := false;

Banco.LoadIndexOf(TB_Auditoria);
Banco.LoadIndexOf(TB_Login);
Banco.LoadIndexOf(TB_Audi_Pedido);
Banco.LoadIndexOf(TB_Erro);



for i := 0 to TB_Auditoria.Fields.Count - 1 do
if  TB_Auditoria.Fields[i].Tag <> 0 then
TB_Auditoria.Fields[i].Visible := false;



try
  TB_Tipo.CreateDataSet;
  TB_Modulo.CreateDataSet;
  TB_Func.Open;
  TB_Auditoria.Active := true;
  TB_Auditoria.Open;
Except
on e:Exception do
begin
  banco.Create_Erro(e.ClassName,e.Message);
  MessageDlg('Erro ao ativar tabelas'+#13+e.Message,mtError,[mbok],0);
  close;
end;
end;

For i := 0 to ModuloCount do
begin
  TB_Modulo.Insert;
  TB_ModuloCodigo.Value := i+1;
  TB_ModuloDescricao.Value := GetModulo(i);
  try
    TB_Modulo.Post;
  except
    TB_Modulo.Cancel;
  end;
end;


For i := 0 to TipoCount do
begin
  TB_Tipo.Insert;
  TB_TipoCodigo.Value := i+1;
  TB_TipoDescricao.Value := GetTipo(i);
  try
    TB_Tipo.Post;
  except
    TB_Tipo.Cancel;
  end;
end;

end;

procedure TFAuditoria.TB_AuditoriaAfterOpen(DataSet: TDataSet);
begin
Banco.LoadColumns(ThemeDBGrid1);


end;

procedure TFAuditoria.TB_AuditoriaBeforeClose(DataSet: TDataSet);
begin
Banco.SaveColumns(ThemeDBGrid1);



end;

procedure TFAuditoria.FormHide(Sender: TObject);
begin
Banco.SaveIndexOf(TB_Auditoria);
Banco.SaveIndexOf(TB_Login);
Banco.SaveIndexOf(TB_Audi_Pedido);
banco.SaveIndexOf(TB_Erro);

TB_Login.Close;
TB_Login.Active := false;

TB_Auditoria.Close;
TB_Auditoria.Active := false;

TB_IP.Close;
TB_IP.Active := false;

TB_MAC.Close;
TB_MAC.Active := false;

TB_Audi_Pedido.Close;
TB_Audi_Pedido.Active := false;

TB_Erro.Close;
TB_Erro.Active := false;
end;

procedure TFAuditoria.TreeView1Editing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
AllowEdit := false;

end;

procedure TFAuditoria.TreeView1Click(Sender: TObject);
begin
if TreeView1.Selected.Index = 0 then
begin
TB_Auditoria.Close;
TB_Auditoria.SQL.Clear;
TB_Auditoria.SQL.Add('Select * from TB_auditoria');
SearchDate(TB_Auditoria);
VisibleGrid(1);
end;

if TreeView1.Selected.Index = 1 then
begin
TB_Erro.Close;
TB_Erro.SQL.Clear;
TB_Erro.SQL.Add('select * from tb_exception');
SearchDate(TB_Erro);
VisibleGrid(4);
end;


if TreeView1.Selected.Text = 'Funcionários' then
begin
TB_Auditoria.Close;
TB_Auditoria.SQL.Clear;
TB_Auditoria.SQL.Add('Select * from TB_auditoria');
TB_Auditoria.SQL.add('where modulo = 1');
SearchDate(TB_Auditoria);
VisibleGrid(1);
end;

if TreeView1.Selected.Text = 'Pedidos' then
begin
TB_Auditoria.Close;
TB_Auditoria.SQL.Clear;
TB_Auditoria.SQL.Add('Select * from TB_auditoria');
TB_Auditoria.SQL.add('where modulo = 2');
SearchDate(TB_Auditoria);
VisibleGrid(1);
end;

if TreeView1.Selected.Text = 'Estoque' then
begin
TB_Auditoria.Close;
TB_Auditoria.SQL.Clear;
TB_Auditoria.SQL.Add('Select * from TB_auditoria');
TB_Auditoria.SQL.add('where modulo = 3');
SearchDate(TB_Auditoria);
VisibleGrid(1);
end;

if TreeView1.Selected.Text = 'Clientes' then
begin
TB_Auditoria.Close;
TB_Auditoria.SQL.Clear;
TB_Auditoria.SQL.Add('Select * from TB_auditoria');
TB_Auditoria.SQL.add('where modulo = 4');
SearchDate(TB_Auditoria);
VisibleGrid(1);
end;

if TreeView1.Selected.Text = 'Agenda' then
begin
TB_Auditoria.Close;
TB_Auditoria.SQL.Clear;
TB_Auditoria.SQL.Add('Select * from TB_auditoria');
TB_Auditoria.SQL.add('where modulo = 5');
SearchDate(TB_Auditoria);
VisibleGrid(1);
end;


if TreeView1.Selected.Text = 'Histórico Login' then
begin
TB_Login.close;
SearchDate(TB_Login);
VisibleGrid(2);
end;


end;

procedure TFAuditoria.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
if not (Sender as TThemeDBGrid).Visible then
exit;


HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
  else
  if (Sender as TThemeDBGrid).DataSource.DataSet = TB_Auditoria then
  begin
    if (LowerCase(TB_AuditoriaCampo.Value) = LowerCase('codigo')) or (LowerCase(TB_AuditoriaCampo.Value) = LowerCase('Id_cliente')) then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Clred
    else

    if LowerCase(TB_AuditoriaCampo.Value) = LowerCase('Mercadorias') then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := clBtnFace
    else

    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;

  end;



 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);


end;

procedure TFAuditoria.DBLookupComboBox1Click(Sender: TObject);
begin
  TB_Auditoria.Filtered := false;
  if DBLookupComboBox1.KeyValue = Null then
  TB_Auditoria.Filter := ''
  else
  begin
  TB_Auditoria.Filter := 'user = '+IntToStr(DBLookupComboBox1.KeyValue);
  TB_Auditoria.Filtered := true;
  end;

  TB_Login.Filtered := false;
  TB_Login.Filter := TB_Auditoria.Filter;
  TB_Login.Filtered := TB_Auditoria.Filtered;

  TB_Erro.Filtered := false;
  TB_Erro.Filter := TB_Auditoria.Filter;
  TB_Erro.Filtered := TB_Auditoria.Filtered;

end;

procedure TFAuditoria.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_delete then
begin
(sender as TDBLookupComboBox).KeyValue := null;
DBLookupComboBox1Click(DBLookupComboBox1);
end;

end;

procedure TFAuditoria.SpeedButton1Click(Sender: TObject);
begin
DBLookupComboBox1.KeyValue := null;
DBLookupComboBox1Click(DBLookupComboBox1);

end;

procedure TFAuditoria.SearchDate(DataSet : TADOQuery);
  procedure openset;
  begin
  try
  dataset.open;
  except
  close;
  end;
  end;

var
  IsWhere : Boolean;
  IsDate  : Boolean;
  i : Shortint;
  LinhaDate : Shortint;
  LinhaWhere: Shortint;
begin

  LinhaDate := -1 ;
  LinhaWhere := -1;

  IsWhere := false;
  If pos(LowerCase('where'),LowerCase(DataSet.SQL.Text)) <> 0 then   IsWhere := true;

  IsDate := false;

  if (Pos(LowerCase('data'),LowerCase(DataSet.SQL.Text)) <> 0) and (Pos(LowerCase('dtini'),LowerCase(DataSet.SQL.Text)) <> 0) then
  IsDate := true;

  For i := 0 to DataSet.SQL.Count -1 do
  begin
    if (Pos(LowerCase('data'),LowerCase(DataSet.SQL.Text)) <> 0) and (Pos(LowerCase('dtini'),LowerCase(DataSet.SQL.Text)) <> 0) then
    LinhaDate := i;

    if Pos(LowerCase('where'),LowerCase(DataSet.SQL.Text)) <> 0 then
    LinhaWhere := i;
  end;


if not UsingDate  then
begin
  if IsDate then
  if LinhaDate <> -1 then
  begin
  DataSet.Close;
 // ShowMessage(TB_Auditoria.SQL.Text);
  DataSet.SQL.Delete(LinhaDate);
 // ShowMessage(TB_Auditoria.SQL.Text);

  openset;
  end;

if (DataSet.State in [dsinactive]) then
  openset;

exit;
end;
//na verdade nos devemos verificar, se não tiver a data, devemos acrescentar,
//por causa que ja existe uma variavel

 DataSet.Close;
if not IsDate then
begin
  if not IsWhere then
  DataSet.SQl.add ( 'Where data >= :dtIni AND data <= :dtFim')
  else
  DataSet.SQl.add ( 'and data >= :dtIni AND data <= :dtFim');
end;
 openset;












exit;
  if IsDate then
  begin
    DataSet.Close;
    if not IsWhere then
      DataSet.SQl[LinhaDate] := 'Where data >= :dtIni AND data <= :dtFim'
    else
    if (LinhaDate = LinhaWhere) and (LinhaDate <> -1) then
     DataSet.SQl[LinhaDate] := 'Where data >= :dtIni AND data <= :dtFim'
    else
      DataSet.SQl[LinhaDate] := 'and data >= :dtIni AND data <= :dtFim';

     openset;
  end
  else
  begin
    DataSet.Close;

    if not IsWhere then
      DataSet.SQl.add('Where data >= :dtIni AND data <= :dtFim')
    else
    if (LinhaDate = LinhaWhere) and (LinhaDate <> -1)  then
     DataSet.SQl.add ( 'Where data >= :dtIni AND data <= :dtFim')
    else
      DataSet.SQl.add( 'and data >= :dtIni AND data <= :dtFim' );
     openset;
  end;






end;

procedure TFAuditoria.SetDateSql(DataSet:Tadoquery);
begin
if DataSet.Parameters.Count = 2 then
begin
    DataSet.Parameters.ParamByName('dtIni').DataType := ftDateTime;
    DataSet.Parameters.ParamByName('dtFim').DataType := ftDateTime;
    DataSet.Parameters.ParamByName('dtIni').Value := FormatDateTime('YYYY/MM/DD',DateTimePicker1.Date);
    DataSet.Parameters.ParamByName('dtFim').Value := FormatDateTime('YYYY/MM/DD 23:59:59',DateTimePicker1.Date);
end;

end;

procedure TFAuditoria.TB_AuditoriaBeforeOpen(DataSet: TDataSet);
begin
SetDateSql(TB_Auditoria);
end;

procedure TFAuditoria.SpeedButton2Click(Sender: TObject);
begin
UsingDate := not (UsingDate);

if UsingDate then
  SpeedButton2.Caption := 'r'
else
  SpeedButton2.Caption := 'L';

{if ThemeDBGrid1.Visible then SearchDate(TB_Auditoria)
else
if ThemeDBGrid2.Visible then SearchDate(TB_Login)
else
if Grid_Erro.Visible then  SearchDate(TB_Erro);}

DateTimePicker1Change(DateTimePicker1);




end;

procedure TFAuditoria.DateTimePicker1Change(Sender: TObject);
begin
if ThemeDBGrid1.Visible then SearchDate(TB_Auditoria)
else
if ThemeDBGrid2.Visible then SearchDate(TB_Login)
else
if Grid_Erro.Visible then
SearchDate(TB_Erro);

end;

procedure TFAuditoria.VisibleGrid(grid: Shortint);
begin
if grid = 1 then
begin
ThemeDBGrid1.Visible := true;
ThemeDBGrid2.Visible := false;
GRID_Pedido.Visible  := false;
Grid_Erro.Visible := false;
end
else
if grid = 2 then
begin
ThemeDBGrid1.Visible := False;
GRID_Pedido.Visible := false;
ThemeDBGrid2.Visible := true;
Grid_Erro.Visible := false;
end
else
if grid = 3 then
begin
ThemeDBGrid1.Visible := False;
GRID_Pedido.Visible :=  true;
ThemeDBGrid2.Visible := false;
Grid_Erro.Visible := false;
end
else
begin
ThemeDBGrid1.Visible := False;
GRID_Pedido.Visible :=  false;
ThemeDBGrid2.Visible := false;
Grid_Erro.Visible := true;
end;


end;

procedure TFAuditoria.TB_LoginBeforeOpen(DataSet: TDataSet);
begin
SetDateSql(TB_Login);
end;

procedure TFAuditoria.TB_LoginAfterOpen(DataSet: TDataSet);
begin
Banco.LoadColumns(ThemeDBGrid2);
end;

procedure TFAuditoria.TB_LoginBeforeClose(DataSet: TDataSet);
begin
Banco.SaveColumns(ThemeDBGrid2);

end;

procedure TFAuditoria.FormShow(Sender: TObject);
begin
DateTimePicker1.Date := now;

 TreeView1.FullExpand;

TB_IP.Open;
TB_MAC.Open;
TB_IP.DisableControls;
TB_MAC.DisableControls;
TB_Modulo.DisableControls;
TB_Tipo.DisableControls;

VisibleGrid(1);

end;

procedure TFAuditoria.ThemeDBGrid1DblClick(Sender: TObject);
begin

if TB_Auditoriamodulo.Value = 2 then
if TB_AuditoriaCampo.Value = 'Mercadorias' then
begin
 try
  TB_Audi_Pedido.Close;
  TB_Audi_Pedido.SQL.Clear;
  TB_Audi_Pedido.SQL.Add('select * from tb_auditoria_mercadoria');
  TB_Audi_Pedido.SQL.Add('where id_auditoria = '+IntToStr(TB_AuditoriaCodigo.Value));
  TB_Audi_Pedido.Open;
  
  VisibleGrid(3);
  except
  end;

end;




end;

procedure TFAuditoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
begin
key := 0;

if GRID_Pedido.Visible then
VisibleGrid(1)
else
close;
end;



end;

procedure TFAuditoria.TB_Audi_PedidoAfterOpen(DataSet: TDataSet);
begin
Banco.LoadColumns(GRID_Pedido);
end;

procedure TFAuditoria.TB_Audi_PedidoBeforeClose(DataSet: TDataSet);
begin
Banco.SaveColumns(GRID_Pedido);

end;

procedure TFAuditoria.codCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
if not (Sender as TThemeDBGrid).Visible then
exit;

HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
   Cod_Draw := TB_Audi_PedidoID_Mercadoria_Estoque.Value;
  end
  else
  begin
    if  Cod_Draw = TB_Audi_PedidoID_Mercadoria_Estoque.Value then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := clBtnFace
    else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := clWhite;

   (Sender as TThemeDBGrid).Canvas.Font.Color := clBlack;
end;

 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;



procedure TFAuditoria.TB_ErroAfterOpen(DataSet: TDataSet);
begin
Banco.LoadColumns(Grid_Erro);
end;

procedure TFAuditoria.TB_ErroBeforeClose(DataSet: TDataSet);
begin
Banco.SaveColumns(Grid_Erro);
end;

procedure TFAuditoria.TB_ErroBeforeOpen(DataSet: TDataSet);
begin
SetDateSql(TB_Erro);
end;

procedure TFAuditoria.Grid_ErroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end;
(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
