unit UEstoque_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons,db, ExtCtrls, ToolEdit,
  CurrEdit;

type
  TFEstoque_New = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Bevel1: TBevel;
    EditQuantidade: TCurrencyEdit;
    Label6: TLabel;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    function Focused: Integer;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    Editing : Boolean;
    { Public declarations }
  end;

var
  FEstoque_New: TFEstoque_New;

implementation

uses UDados;

{$R *.dfm}


procedure TFEstoque_New.FormShow(Sender: TObject);
begin
if Banco.TBEstoque_Quant.State in [dsInactive] then
Banco.TBEstoque_Quant.Open;

IF Editing then
begin
    Caption := 'Editando registro do Estoque...';
    BitBtn1.Caption := 'Editar';
    Banco.TBEstoque.Edit;

    if banco.TBEstoque_Quant.Locate(banco.TBEstoque_QuantID_Merca.FieldName,Banco.TBEstoqueCodigo.Value,[]) then
    begin
    EditQuantidade.Value := banco.TBEstoque_QuantQuant.Value;
    if not Banco.TBEstoque_QuantLastDate.IsNull then
    Edit2.Text := FormatDateTime('dd/mm/yyyy',Banco.TBEstoque_QuantLastDate.Value);

    if not Banco.TBEstoque_QuantCompraDate.IsNull then
    Edit1.Text := FormatDateTime('dd/mm/yyyy',Banco.TBEstoque_QuantCompraDate.Value);

    end;

end
else
begin
    Caption := 'Inserindo registro...';
    BitBtn1.Caption := 'Inserir';
    Banco.TBEstoque.Insert;
    banco.TBEstoqueUn.Value :=   1;
    banco.TBEstoqueAtivo.Value := true;

     {verificar o campo codigo}
    //sugerir cod
    if banco.TBEstoqueCodigo.ReadOnly  = false then
    begin
      banco.ExecSQLTB.Close;
      banco.ExecSQLTB.Fields.Clear;
      banco.ExecSQLTB.SQL.Clear;
      Banco.ExecSQLTB.SQL.Add('select codigo from estoque');
      Banco.ExecSQLTB.SQL.Add('order by codigo desc');
       try
       banco.ExecSQLTB.Open;
       except
       end;
     if not (banco.ExecSQLTB.State in [dsinactive]) then
     begin
      if Banco.ExecSQLTB.RecordCount = 0 then Banco.TBEstoqueCodigo.Value := 1
      else
      try
      banco.TBEstoqueCodigo.Value := banco.ExecSQLTB.FieldValues['codigo'] + 1;
      except end;
      
      banco.ExecSQLTB.Close;
      end;
    end;

end;

if Banco.TBEstoqueCodigo.ReadOnly then
DBEdit1.Color := clBtnFace
else
DBEdit1.Color := DBEdit4.Color;

DBEdit1.Enabled := not(Banco.TBEstoqueCodigo.ReadOnly);


Width := banco.Config.ReadInteger('Estoque_New','Width',Width);
Height := banco.Config.ReadInteger('Estoque_New','Height',Height);
end;

procedure TFEstoque_New.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

if Banco.TBEstoque.State in [dsedit, dsinsert] then
Banco.TBEstoque.Cancel;

end;

procedure TFEstoque_New.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then
BitBtn2Click(sender);
end;

procedure TFEstoque_New.BitBtn2Click(Sender: TObject);
begin
close;
Banco.TBClientes.Cancel;
end;

procedure TFEstoque_New.BitBtn1Click(Sender: TObject);
begin
if EditQuantidade.Text = '' then
begin
  EditQuantidade.Value := 0;
end;

{try
  StrToInt(EditQuantidade.Text);
except
  MessageDlg('Insira uma quantidade válida',mtInformation,[mbok],0);
  abort;
  exit;
end;}

If DBEdit4.Text = '' then
begin
 MessageDlg('O campo Descrição não pode ficar vazio',mtError,[mbOK],0);
 DBEdit4.SetFocus;
  abort;
  exit;
end;

If DBEdit9.Text = '' then
begin
 MessageDlg('O campo Valor não pode ficar vazio',mtError,[mbOK],0);
 DBEdit9.SetFocus;
  abort;
  exit;
end;


    Try
     if Editing then
     begin
        Banco.ADOConnection1.BeginTrans;
        banco.GravaAuditoria(Banco.TBEstoque,banco.TBEstoqueCodigo.Value,3, 2);
    End;

      Banco.TBEstoque.Post;

    if banco.TBEstoque_Quant.Locate(banco.TBEstoque_QuantID_Merca.FieldName,Banco.TBEstoqueCodigo.Value,[]) then
    begin
      if banco.TBEstoque_QuantQuant.Value <> EditQuantidade.Value then
      begin
      banco.TBEstoque_Quant.Edit;
      banco.TBEstoque_QuantQuant.Value := EditQuantidade.Value;
      banco.TBEstoque_QuantCompraDate.Value :=Date;
      banco.TBEstoque_Quant.Post;
      end;
    end
    else
    begin
    banco.TBEstoque_Quant.Insert;
    banco.TBEstoque_QuantID_Merca.Value := banco.TBEstoqueCodigo.Value;
    banco.TBEstoque_QuantQuant.Value := EditQuantidade.Value;
    banco.TBEstoque_QuantLastDate.Clear;

    if banco.TBEstoque_QuantQuant.Value > 0 then
    banco.TBEstoque_QuantCompraDate.Value :=Date
    else
    banco.TBEstoque_QuantCompraDate.Clear;

    banco.TBEstoque_Quant.Post;
    end;

     if Editing then
     Banco.ADOConnection1.CommitTrans;

     if Editing then
     MessageDlg('Produto editado com sucesso',mtInformation,[mbOK],0)
     else
     MessageDlg('Produto registrado com sucesso',mtInformation,[mbOK],0);

     close;

    Except
      on e: Exception do
      begin
      Banco.Create_Erro(e.ClassName,e.Message);
      MessageDlg(e.Message,mtError,[mbOK],0);

      if Editing then
      Banco.ADOConnection1.RollbackTrans;


      end;

     end;
end;

procedure TFEstoque_New.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
exit;
end;
end;

function TFEstoque_New.Focused: Integer;
begin
result := -1;
Result:= ActiveControl.ComponentIndex;

end;

procedure TFEstoque_New.FormCreate(Sender: TObject);
begin
EditQuantidade.Value := 0;
Edit2.Text := '';
Edit1.Text := '';
end;

procedure TFEstoque_New.Edit1KeyPress(Sender: TObject; var Key: Char);
begin


if key = #13 then
begin
Self.Perform(WM_NEXTDLGCTL,0,0);
Abort;
exit;
end;


if not (key in ['0'..'9',chr(8)]) then
key := #0;

end;

procedure TFEstoque_New.FormResize(Sender: TObject);
Const
  Largura = 10;
  EspaLabel=2;
Var
  Espaco : Smallint;
begin
Espaco := 0;
Bevel1.Width := ClientWidth - (Bevel1.Left * 2);
Bevel1.Height := ClientHeight - (Bevel1.Top * 2);

BitBtn1.Left := ClientWidth - Bevel1.Left - BitBtn1.Width - Largura;
BitBtn2.Left := BitBtn1.Left - Largura - BitBtn2.Width;

DBEdit9.Width := (ClientWidth * 35) div 100;
EditQuantidade.Width := DBEdit9.Width;
DBLookupComboBox1.Width := DBEdit9.Width;
DBEdit4.Width := DBLookupComboBox1.Left - Largura - DBEdit4.Left;


DBEdit9.Left := (Bevel1.Width + Bevel1.Left - Largura) - DBEdit9.Width;
EditQuantidade.Left := DBEdit9.left;
DBLookupComboBox1.Left:=DBEdit9.Left;

Label9.Left := DBEdit9.Left;
Label2.Left := DBEdit9.Left;
Label5.Left := DBEdit9.Left;

DBEdit1.Width := (Bevel1.Width * 20) div 100;

Edit1.Width := (Bevel1.Width * 30) div 100;
Edit2.Width := Edit1.Width;

Edit2.Left := Bevel1.Width + Bevel1.Left - Largura - Edit2.Width;
Edit1.Left := Edit2.Left - Largura - Edit1.Width;


Label6.left := Edit1.left;
Label3.Left := Edit2.Left;

BitBtn1.Top := Bevel1.Top + Bevel1.Height - Largura - BitBtn1.Height;
BitBtn2.Top := BitBtn1.Top;

//5 componentes que terao esse espaço
//        espaco total
Espaco := Bevel1.Height - Label3.Height -Edit2.Height -Label5.Height - DBLookupComboBox1.Height -Label2.Height-EditQuantidade.Height -Label9.Height - DBEdit9.Height - (EspaLabel * 4);

Espaco := Espaco div 4;

{Edit2.Top := Espaco + Bevel1.Top;
DBLookupComboBox1.Top := Bevel1.Top + (Espaco * 2);
EditQuantidade.Top := Bevel1.Top + (Espaco * 3);
DBEdit9.Top := Bevel1.Top + (Espaco * 4);}



Edit2.Top := Espaco + Bevel1.Top;
DBLookupComboBox1.Top := Espaco + Edit2.top + Edit2.Height;
EditQuantidade.Top := Espaco + DBLookupComboBox1.Height + DBLookupComboBox1.Top;
DBEdit9.Top := Espaco + EditQuantidade.Height + EditQuantidade.Top;

Edit1.Top := Edit2.Top;
DBEdit1.Top := Edit2.Top;
DBEdit4.Top := DBLookupComboBox1.Top;
DBCheckBox1.Top := DBEdit9.Top;

Label1.Top := DBEdit1.top - EspaLabel - Label1.Height;
Label6.top := Edit1.Top   - EspaLabel - Label6.Height;
Label3.top := Edit2.Top   - EspaLabel - Label3.Height;
Label4.top := DBEdit4.Top - EspaLabel - Label4.Height;
Label5.top := DBLookupComboBox1.Top   - EspaLabel - Label5.Height;
Label2.top := EditQuantidade.Top   - EspaLabel - Label2.Height;
Label9.top := DBEdit9.Top   - EspaLabel - Label9.Height;

end;

procedure TFEstoque_New.FormHide(Sender: TObject);
begin
banco.Config.WriteInteger('Estoque_New','Width',Width);
banco.Config.WriteInteger('Estoque_New','Height',Height);
end;

end.
