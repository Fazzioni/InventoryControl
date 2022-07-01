unit UParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ThemeDBGrid, ExtCtrls, StdCtrls,db;

type
  TFParcelas = class(TForm)
    ThemeDBGrid1: TThemeDBGrid;
    Image1: TImage;
    Img1: TImage;
    Img2: TImage;
    Img3: TImage;
    Img4: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img3Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParcelas: TFParcelas;

implementation

uses UDados, UParcelas_new, Uprinciapl;

{$R *.dfm}

procedure TFParcelas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFParcelas.Button1Click(Sender: TObject);
begin
try
Application.CreateForm(TFparcelas_New,Fparcelas_New);
Fparcelas_New.editing := false;
Fparcelas_New.ShowModal;
finally
FreeAndNil(Fparcelas_New);
end;
end;

procedure TFParcelas.Button2Click(Sender: TObject);
begin
if banco.TB_Parcelamento.RecordCount = 0 then
exit;

try
Application.CreateForm(TFparcelas_New,Fparcelas_New);
Fparcelas_New.editing := true;
Fparcelas_New.ShowModal;
finally
FreeAndNil(Fparcelas_New);
end;
end;

procedure TFParcelas.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

HoldColor := ThemeDBGrid1.Brush.Color;

 if (gdselected in State) or (gdfocused in State) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if Banco.Browser_COlor <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := banco.Browser_COlor
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;

 end;

if banco.TB_Parcelamentoativo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style + [fsItalic];
(Sender as TThemeDBGrid).Canvas.Font.Color  := clGray;
end
else
(Sender as TThemeDBGrid).Canvas.Font.Style := (Sender as TThemeDBGrid).Canvas.Font.Style - [fsItalic];

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

if banco.TB_Parcelamento.RecordCount > 0 then
if banco.TB_Parcelamentoativo.Value = false then
begin
(Sender as TThemeDBGrid).Canvas.Pen.Color   := clGray;
(Sender as TThemeDBGrid).Canvas.Pen.Width := 1;
(Sender as TThemeDBGrid).Canvas.MoveTo(Rect.Left, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
(Sender as TThemeDBGrid).Canvas.LineTo(Rect.Right, Rect.Top +((Rect.Bottom - Rect.Top) div 2));
end;
end;

procedure TFParcelas.FormShow(Sender: TObject);
var
  i  :integer;

begin
Color := Image1.Canvas.Pixels[2,2];
banco.LoadColumns(ThemeDBGrid1);

For i := 0 to Banco.TB_Parcelamento.Fields.Count -1 do
if Banco.TB_Parcelamento.Fields[i].Tag =1 then
Banco.TB_Parcelamento.Fields[i].Visible := false;

if banco.TB_Parcelamento.SQL.Count > 1 then
begin
  if  not (Banco.TB_Parcelamento.State in [dsInactive]) then   Banco.TB_Parcelamento.close;
  banco.TB_Parcelamento.SQL.Clear;
  banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
end;

if (Banco.TB_Parcelamento.State in [dsInactive]) then
Banco.TB_Parcelamento.Open;


banco.ImgForm := FParcelas;
banco.Img[1] := Img1.ComponentIndex;
banco.Img[2] := Img2.ComponentIndex;
banco.Img[3] := Img3.ComponentIndex;
banco.Img[4] := Img4.ComponentIndex;
banco.Img[5] := -1;
banco.Img[6] := -1;
banco.Img[7] := -1;
banco.Img[8] := -1;
banco.Img[9] := -1;
banco.calcpos;


end;

procedure TFParcelas.Button3Click(Sender: TObject);
begin
if banco.TB_Parcelamento.RecordCount = 0 then
exit;

if MessageDlg('Deseja excluir o parcelamento &'+banco.TB_ParcelamentoDescricao.Value+'?',mtWarning,[mbyes,mbno],0) = mrno then
exit;

try
banco.TB_Parcelamento.Delete;
MessageDlg('Parcelamento excluido com sucesso',mtInformation,[mbok],0);
Except
  on e : exception do
    if Pos('Venda_Info',e.Message) <> 0 then
    begin
      MessageDlg('Não é possível excluir o registro'+#13+'Existe pedido relacionado',mtError,[mbok],0);
    end
    else
    begin
      MessageDlg('Não foi possível excluir o registro, mensagem original'+#13+e.Message,mtError,[mbOK],0);
      Banco.Create_Erro(e.ClassName,e.Message+#13+#13+#13+#13+'Excluindo registro Parcelas');
    end;
end;
end;


procedure TFParcelas.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img1_Visible;
end;

procedure TFParcelas.Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img2_Visible;
end;

procedure TFParcelas.Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img3_Visible;
end;

procedure TFParcelas.Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img4_Visible;
end;

procedure TFParcelas.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
banco.Image1Move(x,y);
end;

procedure TFParcelas.Img3Click(Sender: TObject);
var
  Aux : Shortint;
begin
aux := MessageDlg('Deseja imprimir apenas os parcelamentos ativos?',mtConfirmation,[mbYes,mbNo],0);

if Aux = mrNo then
banco.ListaQuery(banco.TB_Parcelamento,'Parcelamentos do Sistema',banco.TB_ParcelamentoDescricao.Index)
else
begin
banco.TB_Parcelamento.Close;
banco.TB_Parcelamento.SQL.Clear;
banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
banco.tb_parcelamento.SQL.Add('Where ativo = true');
banco.TB_Parcelamento.Open;

banco.TB_Parcelamentoativo.Visible := false;

banco.ListaQuery(banco.TB_Parcelamento,'Parcelamentos do Sistema',banco.TB_ParcelamentoDescricao.Index);

banco.TB_Parcelamento.Close;
banco.TB_Parcelamento.SQL.Clear;
banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
banco.TB_Parcelamentoativo.Visible := true;
banco.TB_Parcelamento.Open;


end;
end;

procedure TFParcelas.FormHide(Sender: TObject);
begin
banco.SaveColumns(ThemeDBGrid1);
end;

procedure TFParcelas.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;

end.
