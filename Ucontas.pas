unit Ucontas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,db, Grids, DBGrids, ThemeDBGrid, ExtCtrls, ImgList;

type
  TFContas = class(TForm)
    MainMenu1: TMainMenu;
    Parcelamentos1: TMenuItem;
    ThemeDBGrid1: TThemeDBGrid;
    portador1: TMenuItem;
    Fatura1: TMenuItem;
    Image1: TImage;
    Img1: TImage;
    Img2: TImage;
    Img3: TImage;
    Img4: TImage;
    Img5: TImage;
    Img6: TImage;
    Img7: TImage;
    Img8: TImage;
    cor1: TMenuItem;
    Contas1: TMenuItem;
    Editar1: TMenuItem;
    Novo1: TMenuItem;
    N1: TMenuItem;
    Editar2: TMenuItem;
    Pesquisar1: TMenuItem;
    N2: TMenuItem;
    Colunas1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Listar1: TMenuItem;
    SelecionarLinha1: TMenuItem;
    Sobre1: TMenuItem;
    Timer1: TTimer;
    ImageList1: TImageList;
    Fonte1: TMenuItem;
    HistricodoCliente1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Receberconta1: TMenuItem;
    Img9: TImage;
    Receber1: TMenuItem;
    ReceberestaConta1: TMenuItem;
    N5: TMenuItem;
    HistricodeAlteraes1: TMenuItem;
    procedure Parcelamentos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure portador1Click(Sender: TObject);
    procedure Fatura1Click(Sender: TObject);
    procedure Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cor1Click(Sender: TObject);
    procedure SelecionarLinha1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Save;
    procedure Editar2Click(Sender: TObject);
    procedure Img4Click(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img1Click(Sender: TObject);
    procedure HistricodoCliente1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Img8Click(Sender: TObject);
    procedure Img9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img9Click(Sender: TObject);
    procedure ReceberestaConta1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Img6Click(Sender: TObject);
    procedure Img5Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
    procedure DrawColumnCellPersonalizado(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  private
    { Private declarations }
  public
   JaExec : Boolean;

  end;

var
  FContas: TFContas;

implementation

uses Uparcelas, Uprinciapl, UDados, UPortador, UformaPag, Uvisible,
  Ucontas_New, Urecebe, UinfoConta, UPesquisa;

{$R *.dfm}
procedure TFContas.Save;
var
  i : integer;
begin
for i := 0 to Banco.TB_Contas.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(Banco.TB_Contas.Name+'_Position',Banco.TB_Contas.Fields[i].FieldName,  Banco.TB_Contas.Fields[i].Index);
  Banco.Config.WriteBool   (Banco.TB_Contas.Name+'_Visible' ,Banco.TB_Contas.Fields[i].FieldName,  Banco.TB_Contas.Fields[i].Visible);
end;

end;
procedure TFContas.Parcelamentos1Click(Sender: TObject);
begin
if not banco.Cont_Alter_Parcelamentos then Banco.NotPermissao;

fprincipal.showparcelas;

end;

procedure TFContas.FormShow(Sender: TObject);
var
  i : integer;
begin
if Banco.Color_Contas_active then
ThemeDBGrid1.OnDrawColumnCell := DrawColumnCellPersonalizado;


Color := Image1.Canvas.Pixels[2,2];

JaExec := false;
ThemeDBGrid1.Font := banco.font_grid[5];

banco.ImgForm := FContas;
banco.Img[1] := Img1.ComponentIndex;
banco.Img[2] := Img2.ComponentIndex;
banco.Img[3] := Img3.ComponentIndex;
banco.Img[4] := Img4.ComponentIndex;
banco.Img[5] := Img5.ComponentIndex;
banco.Img[6] := Img6.ComponentIndex;
banco.Img[7] := Img7.ComponentIndex;
banco.Img[8] := Img8.ComponentIndex;
banco.Img[9] := Img9.ComponentIndex;
banco.calcpos;


Color := Image1.Canvas.Pixels[2,2];

For i := 0 to Banco.TBClientes.Fields.Count -1 do
if Banco.TBClientes.Fields[i].Tag =1 then
Banco.TBClientes.Fields[i].Visible := false;


if banco.TB_FormaPagamento.SQL.Count > 1 then
begin
  if  not (Banco.TB_FormaPagamento.State in [dsInactive]) then   Banco.TB_FormaPagamento.close;
  banco.TB_FormaPagamento.SQL.Clear;
  banco.TB_FormaPagamento.SQL.Add('Select * from tb_forma_pagamento');
end;
if (Banco.TB_FormaPagamento.State in [dsInactive]) then Banco.TB_FormaPagamento.Open;

if banco.TB_Parcelamento.SQL.Count > 1 then
begin
  if  not (Banco.TB_Parcelamento.State in [dsInactive]) then   Banco.TB_Parcelamento.close;
  banco.TB_Parcelamento.SQL.Clear;
  banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
end;
if (Banco.TB_Parcelamento.State in [dsInactive]) then Banco.TB_Parcelamento.Open;

if banco.TB_Contas.SQL.Text <> banco.Sql_Tb_contas_Default then
begin
 banco.TB_Contas.BeforeClose := nil;
  if  not (Banco.TB_Contas.State in [dsInactive]) then   Banco.TB_Contas.close;
  banco.TB_Contas.SQL.Clear;
  banco.TB_Contas.SQL.Text := banco.Sql_Tb_contas_Default;

 banco.tb_contas.BeforeClose := Banco.TB_ContasBeforeClose;
end;
if (Banco.TB_Contas.State in [dsInactive]) then  Banco.TB_Contas.Open;

if (Banco.TB_ContasFuncAux.State in [dsInactive]) then  Banco.TB_ContasFuncAux.Open;

Banco.LoadColumns(ThemeDBGrid1);

end;

procedure TFContas.portador1Click(Sender: TObject);
begin
if not banco.Cont_Alter_Portador then Banco.NotPermissao;

try
Application.CreateForm(TFPortador,FPortador) ;
FPortador.ShowModal;
finally
FreeAndNil(FPortador);
end;

end;

procedure TFContas.Fatura1Click(Sender: TObject);
begin
if not banco.Cont_Alter_Faturas then Banco.NotPermissao;


try
Application.CreateForm(TFFormaPag,FFormaPag);
FFormaPag.ShowModal;
finally
FreeAndNil(FFormaPag);
end;

end;

procedure TFContas.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img1_Visible;
end;

procedure TFContas.Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img2_Visible;
end;

procedure TFContas.Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img3_Visible;
end;

procedure TFContas.Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img4_Visible;
end;

procedure TFContas.Img5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img5_Visible;
end;

procedure TFContas.Img6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img6_Visible;
end;

procedure TFContas.Img7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img7_Visible;
end;

procedure TFContas.Img8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img8_Visible;
end;

procedure TFContas.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Image1Move(x,y);
end;

procedure TFContas.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

if not JaExec then
if not banco.Config_GRID_Foco[5] then
begin
showScrollBar((Sender as TThemeDBGrid).Handle,SB_HORZ,false);
(Sender as TThemeDBGrid).Options := (Sender as TThemeDBGrid).Options + [dgRowSelect];
JaExec := true;
end
else
begin
JaExec := true;
ShowScrollBar((Sender as TThemeDBGrid).Handle,SB_HORZ,true);
(Sender as TThemeDBGrid).Options := (Sender as TThemeDBGrid).Options - [dgRowSelect];
end;


HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
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


procedure TFContas.cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [5];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[5] := Banco.ColorDialog.Color;
ThemeDBGrid1.Refresh;
end;
end;

procedure TFContas.SelecionarLinha1Click(Sender: TObject);
begin
Banco.Config_GRID_Foco[5] := not(banco.config_grid_foco[5]);
FPrincipal.Img4Click(FPrincipal.Img4);

{banco.Last_Grid_Select[5] := banco.TB_ContasCodigo.Value;
Timer1.Enabled := true;}

end;

procedure TFContas.Timer1Timer(Sender: TObject);
begin
(sender as ttimer).enabled :=false;
banco.TB_Contas.Locate(Banco.TB_ContasCodigo.FieldName,Banco.Last_Grid_Select[5],[]);




end;

procedure TFContas.FormHide(Sender: TObject);
begin
banco.Last_Grid_Select[5] := Banco.TB_ContasCodigo.Value;;
banco.SaveColumns(ThemeDBGrid1);
Save;

end;

procedure TFContas.Editar2Click(Sender: TObject);
var
  AuxBitmap : TBitmap;
begin

if banco.Config_GRID_Foco[5] then
SelecionarLinha1.Caption := '&Selecionar Linha'
else
SelecionarLinha1.Caption := '&Selecionar Coluna';



Try
  AuxBitmap := TBitmap.Create;
  AuxBitmap.Width := 16;
  AuxBitmap.Height := 16;
  AuxBitmap.Canvas.Brush.Color := banco.cor_grid[5];
  AuxBitmap.Canvas.Pen.Color := AuxBitmap.Canvas.Brush.Color;
  AuxBitmap.Canvas.Rectangle(0,0,AuxBitmap.Width,AuxBitmap.Height);
  if ImageList1.Count = 0 then
  Cor1.ImageIndex := ImageList1.Add(AuxBitmap,AuxBitmap)
  else
  ImageList1.Replace(Cor1.ImageIndex,AuxBitmap,AuxBitmap);


finally
  FreeAndNil(AuxBitmap);
end;

end;


procedure TFContas.Img4Click(Sender: TObject);
begin
banco.ListaQuery(banco.TB_Contas,'Contas a Receber',banco.TB_ContasDescricao.Index);

end;

procedure TFContas.Img7Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to Banco.TB_Contas.FieldCount -1 do
    if Banco.TB_Contas.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TB_Contas.Fields[i].DisplayLabel,)] := Banco.TB_Contas.Fields[i].Visible;

    banco.Clearimg;
    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     Banco.TB_Contas.Fields[Banco.SearchField(Banco.TB_Contas,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     save;

     end;

   FreeAndNil(FVisible);
end;
end;



procedure TFContas.Img1Click(Sender: TObject);
begin
if not banco.Cont_Novo then Banco.NotPermissao;


try
Application.CreateForm(TFConta_new,Fconta_new);
fconta_new.showmodal;
finally
FreeAndNil(Fconta_new);
end;

end;

procedure TFContas.HistricodoCliente1Click(Sender: TObject);
begin

banco.HistoricoCliente(banco.TB_ContasID_Cliente.Value);


end;

procedure TFContas.Contas1Click(Sender: TObject);
begin
HistricodoCliente1.Enabled := not (banco.TB_ContasID_Cliente.IsNull);
if HistricodoCliente1.Enabled then
HistricodoCliente1.Enabled := banco.Cli_Vis_Hist;


Novo1.Enabled := banco.Cont_Novo;
Editar1.Enabled := banco.Cont_Editar;
Receber1.Enabled := banco.Cont_Receber_conta;
portador1.Enabled := banco.Cont_Alter_Portador;
Parcelamentos1.Enabled := banco.Cont_Alter_Parcelamentos;
HistricodeAlteraes1.Enabled := banco.Cont_Hist_Cont;
Fatura1.Enabled := banco.Cont_Alter_Faturas;




end;

procedure TFContas.Img2Click(Sender: TObject);
begin
if not banco.Cont_Editar then Banco.NotPermissao;

if banco.TB_Contas.RecordCount = 0 then
exit;

{if banco.TB_ContasPagada.Value then
begin
MessageDlg('A conta já foi receida, não pode ser alterada',mtInformation,[mbok],0);
exit;
end;}


try
Application.CreateForm(TFConta_new,Fconta_new);
Fconta_New.Editing := true;
fconta_new.showmodal;
finally
FreeAndNil(Fconta_new);
end;

end;

procedure TFContas.Img8Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[5];

if Banco.FontDialog.Execute then
begin
banco.Clearimg;

banco.Font_Grid[5] := banco.FontDialog.Font;
Banco.Font_Grid[5].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;

end;

procedure TFContas.Img9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img9_Visible;
end;

procedure TFContas.Img9Click(Sender: TObject);
begin
try
Application.CreateForm(TFRecebe,FRecebe);
banco.Clearimg;

FRecebe.ShowModal;
Finally
FreeAndNil(FRecebe);
end;

end;

procedure TFContas.ReceberestaConta1Click(Sender: TObject);
begin

if banco.TB_Contas.RecordCount = 0 then
exit;

if banco.TB_ContasPagada.Value then
exit;



try
Application.CreateForm(TFRecebe,FRecebe);
FRecebe.ContaRecebe := banco.TB_ContasCodigo.Value;
FRecebe.ShowModal;
Finally
FreeAndNil(FRecebe);
end;


end;

procedure TFContas.PopupMenu1Popup(Sender: TObject);
begin
ReceberestaConta1.Enabled := true;

if banco.TB_Contas.RecordCount = 0 then
ReceberestaConta1.Enabled := false
else
if banco.TB_ContasPagada.Value then
ReceberestaConta1.Enabled := false;


end;

procedure TFContas.Img6Click(Sender: TObject);
begin
try
  Application.CreateForm(TFinfoConta,FinfoConta);
  FinfoConta.ShowModal;
finally
FreeAndNil(FinfoConta);
end;

end;

procedure TFContas.Img5Click(Sender: TObject);
begin
if not banco.Cont_Excluir then Banco.NotPermissao;

if banco.TB_Contas.RecordCount = 0 then
exit;

if banco.TB_ContasPagada.Value = true then
begin
MessageDlg('A conta já foi recebida, não pode ser excluída',mtWarning,[mbok],00);
exit;
end;

if MessageDlg('Tem certeza que deseja excluir a conta '+IntToStr(banco.TB_ContasCodigo.Value)+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;

try
  banco.ADOConnection1.BeginTrans;

  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  Banco.ExecSQLTB.SQL.Add('DELETE FROM tb_cont_hist');
  Banco.ExecSQLTB.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  Banco.ExecSQLTB.ExecSQL;

  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  banco.ExecSQLTB.SQL.Add('delete from TB_Cont_Descri');
  banco.ExecSQLTB.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  banco.ExecSQLTB.ExecSQL;

  banco.ExecSQLTB.Close;
  banco.ExecSQLTB.SQL.Clear;
  Banco.ExecSQLTB.SQL.Add('DELETE FROM tb_contas');
  Banco.ExecSQLTB.SQL.Add('where codigo = '+IntToStr(banco.TB_ContasCodigo.Value));
  Banco.ExecSQLTB.ExecSQL;

 banco.ADOConnection1.CommitTrans;
 banco.Refresh(banco.TB_Contas);

Except
  on e:exception do
  begin
    banco.Create_Erro(e.ClassName, e.Message);
    MessageDlg(e.message,mtError,[mbok],0);
    banco.ADOConnection1.RollbackTrans;
  end;
end;


end;

procedure TFContas.Img3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPesquisa,FPesquisa);
  FPesquisa.Table := Banco.TB_Contas;
  banco.Clearimg;
  FPesquisa.ShowModal;
Finally
FreeAndNil(FPesquisa);
end;
end;

procedure TFContas.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;













procedure TFContas.DrawColumnCellPersonalizado(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

if not JaExec then
if not banco.Config_GRID_Foco[5] then
begin
showScrollBar((Sender as TThemeDBGrid).Handle,SB_HORZ,false);
(Sender as TThemeDBGrid).Options := (Sender as TThemeDBGrid).Options + [dgRowSelect];
JaExec := true;
end
else
begin
JaExec := true;
ShowScrollBar((Sender as TThemeDBGrid).Handle,SB_HORZ,true);
(Sender as TThemeDBGrid).Options := (Sender as TThemeDBGrid).Options - [dgRowSelect];
end;


HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   // procurar a cor da fonte \\
   if banco.TB_ContasPagada.Value then
   (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Color_Contas_Perso[5]
   else
   if Banco.TB_ContasDataVencimento.Value = Date then //está vencendo hoje
   (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Color_Contas_Perso[3]
   else        // mais dias
   if banco.TB_ContasDataVencimento.Value < date then
   (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Color_Contas_Perso[1]
   else
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
 

   if ColorToRGB((sender as TThemeDBGrid).Canvas.Font.Color) < 100 then
   (sender as TThemeDBGrid).Canvas.Font.Color := clwhite;

   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
 end
 else
  begin //vamos primeiro verificar aqueles que não estão selecionados
      if banco.TB_ContasPagada.Value then // se for pagada
      begin
        (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Color_Contas_Perso[5];
        (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Color_Contas_Perso[6];
      end
      else
      begin //não foram pagas
        if Banco.TB_ContasDataVencimento.Value = Date then //está vencendo hoje
        begin
        (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Color_Contas_Perso[3];
        (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Color_Contas_Perso[4];
        end
        else
        if banco.TB_ContasDataVencimento.Value < date then  // mais dias
        begin
        (Sender as TThemeDBGrid).Canvas.Font.Color := Banco.Color_Contas_Perso[1];
        (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Color_Contas_Perso[2];
        end
        else
        begin   //não foram pagas, mais não estão vencidas
             (Sender as TThemeDBGrid).Font.Color := clBlack;
             if Banco.Cor_Grid[5] <> clwhite then
             if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
             (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[5]
             else
             (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
        end;
      end;
   end;
 (Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
