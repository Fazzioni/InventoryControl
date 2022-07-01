unit UAbcCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, DBClient, Grids, DBGrids, ComCtrls;

type
  TFABCCliente = class(TForm)
    Button1: TButton;
    TB_Pedido: TADOQuery;
    TB_ABC: TClientDataSet;
    TB_ABCCodCliente: TIntegerField;
    TB_ABCTotal: TCurrencyField;
    TB_Pedidoid_cliente: TIntegerField;
    TB_Pedidopreco: TBCDField;
    TB_PedidoSituacao: TIntegerField;
    TB_Pedidocodigo: TAutoIncField;
    TB_Pedidobaixaestoque: TBooleanField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    TB_Pedidodata_hora: TDateTimeField;
    TB_ABCUltimaCompra: TDateField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABCCliente: TFABCCliente;

implementation

uses UDados;

{$R *.dfm}

procedure TFABCCliente.Button1Click(Sender: TObject);
begin
TB_Pedido.Active := false;
TB_Pedido.SQL.Clear;
TB_Pedido.SQL.Add('Select  A.id_cliente, A.preco, A.data_hora, A.Situacao, B.codigo, B.baixaestoque from');
TB_Pedido.SQL.Add('Venda_info A left join situacao_pedido B on');
TB_Pedido.SQL.Add('A.situacao = b.codigo');
tb_pedido.SQL.Add('Where b.baixaestoque = true');

if CheckBox1.Checked then
TB_Pedido.SQL.Add('and A.data_hora between #'+FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date)+'# and #'+FormatDateTime('mm/dd/yyyy',DateTimePicker2.Date)+'#');

tb_pedido.open;

// selecionada função acima para listar os clientes

// criando tb
TB_ABC.Active := false;
TB_ABC.IndexFieldNames := '';
TB_ABC.IndexDefs.Clear;




TB_ABC.CreateDataSet;

TB_pedido.First;
WHile not TB_Pedido.Eof do
begin
  if not TB_ABC.Locate(TB_ABCCodCliente.FieldName,TB_Pedidoid_cliente.Value,[]) then
  begin
  TB_ABC.Insert;
  TB_ABCCodCliente.Value   := TB_Pedidoid_cliente.Value;
  TB_ABCUltimaCompra.Value := TB_Pedidodata_hora.Value;
  TB_ABCTotal.Value        := TB_Pedidopreco.Value;
  end
  else
  begin
  // cliente ja adicionado, atualizar dados
  TB_ABC.Edit;
  TB_ABCTotal.Value :=TB_ABCTotal.Value + TB_Pedidopreco.Value;

  if TB_Pedidodata_hora.Value > TB_ABCUltimaCompra.Value then
  TB_ABCUltimaCompra.Value := TB_Pedidodata_hora.Value;

  tb_abc.Post;
  end;

TB_Pedido.Next;
end;


with TB_ABC.IndexDefs.AddIndexDef do
begin
  Name := 'comprou';
  Fields := TB_ABCTotal.FieldName;
  Options := [ixDescending];//ixAscending
end;



TB_ABC.IndexName := 'comprou';





Banco.ListaQuery(TB_ABC,'',0);


TB_ABC.Active := false;

end;

end.
