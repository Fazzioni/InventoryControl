unit UAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ToolEdit, RXDBCtrl, Mask, Buttons, ImgList,
  ExtCtrls, Grids, DBGrids, ThemeDBGrid, db, Menus;

type
  TFAgenda = class(TForm)
    Img8: TImage;
    Img7: TImage;
    Img6: TImage;
    Img5: TImage;
    Img4: TImage;
    Img3: TImage;
    Img2: TImage;
    Img1: TImage;
    ImageList1: TImageList;
    Image1: TImage;
    ThemeDBGrid1: TThemeDBGrid;
    MainMenu1: TMainMenu;
    ipo1: TMenuItem;
    Agenda1: TMenuItem;
    Novo1: TMenuItem;
    Editar1: TMenuItem;
    Exclior1: TMenuItem;
    Agenda2: TMenuItem;
    N2: TMenuItem;
    Exibir1: TMenuItem;
    Pesquisar1: TMenuItem;
    N3: TMenuItem;
    Cor1: TMenuItem;
    Fonte1: TMenuItem;
    N4: TMenuItem;
    Coluna1: TMenuItem;
    N5: TMenuItem;
    Listar1: TMenuItem;
    SelecionarLinha1: TMenuItem;
    Sobre1: TMenuItem;
    procedure FormShow(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Save;
    procedure Img1Click(Sender: TObject);
    procedure ipo1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
    procedure Img7Click(Sender: TObject);
    procedure Img4Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Img8Click(Sender: TObject);
    procedure SelecionarLinha1Click(Sender: TObject);
    procedure Exibir1Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Img6Click(Sender: TObject);
    procedure Img5Click(Sender: TObject);
    procedure Agenda2Click(Sender: TObject);
    procedure Img3Click(Sender: TObject);
    procedure ThemeDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
   JaExec : Boolean;
    { Public declarations }
  end;

var
  FAgenda: TFAgenda;

implementation

uses UDados, UAgendaNew, UAgendaTipo, UAgenda_Contato, Uvisible,
  Uprinciapl, UAgendaMes, UPesquisa;

{$R *.dfm}

procedure TFAgenda.FormShow(Sender: TObject);
var
  i : integer;
begin
ThemeDBGrid1.Font := banco.font_grid[9];

banco.ImgForm := FAgenda;
banco.Img[1] := Img1.ComponentIndex;
banco.Img[2] := Img2.ComponentIndex;
banco.Img[3] := Img3.ComponentIndex;
banco.Img[4] := Img4.ComponentIndex;
banco.Img[5] := Img5.ComponentIndex;
banco.Img[6] := Img6.ComponentIndex;
banco.Img[7] := Img7.ComponentIndex;
banco.Img[8] := Img8.ComponentIndex;
banco.Img[9] := -1;
banco.calcpos;

Color := Image1.Canvas.Pixels[2,2];

For i := 0 to Banco.TB_Agenda.Fields.Count -1 do
if Banco.TB_Agenda.Fields[i].Tag = 1 then
Banco.TB_Agenda.Fields[i].Visible := false;

if Banco.TB_Agenda_Contato.State in [dsInactive] then banco.TB_Agenda_Contato.Open;
if Banco.TB_Agenda_Tipo.State in [dsInactive] then banco.TB_Agenda_Tipo.Open;
if Banco.TBMunicipio.State in [dsInactive] then Banco.TBMunicipio.Open;

if Banco.TB_Agenda.State in [dsInactive] then banco.TB_Agenda.Open;

Banco.LoadColumns(ThemeDBGrid1);
end;

procedure TFAgenda.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img1_Visible;
end;

procedure TFAgenda.Img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img2_Visible;
end;

procedure TFAgenda.Img3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img3_Visible;
end;

procedure TFAgenda.Img4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img4_Visible;
end;

procedure TFAgenda.Img5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img5_Visible;
end;

procedure TFAgenda.Img6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img6_Visible;
end;

procedure TFAgenda.Img7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img7_Visible;
end;

procedure TFAgenda.Img8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Img8_Visible;
end;

procedure TFAgenda.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
banco.Image1Move(x,y);
end;

procedure TFAgenda.FormCreate(Sender: TObject);
begin
JaExec := false;

end;

procedure TFAgenda.FormHide(Sender: TObject);
begin
banco.Last_Grid_Select[9] := Banco.TB_AgendaCodigo.Value;
Banco.SaveColumns(ThemeDBGrid1) ;

Save;

if banco.TB_Agenda.SQL.Count > 3 then
begin
banco.TB_Agenda.close;
Banco.TB_Agenda.SQL.Clear;
banco.TB_Agenda.SQL.Add(banco.Sql_Tb_Agenda_Default);
end;

end;

procedure TFAgenda.Save;
var
  i : integer;
begin

for i := 0 to Banco.TB_Agenda.Fields.Count - 1 do
begin
  Banco.Config.WriteInteger(Banco.TB_Agenda.Name+'_Position',Banco.TB_Agenda.Fields[i].FieldName,  Banco.TB_Agenda.Fields[i].Index);
  Banco.Config.WriteBool   (Banco.TB_Agenda.Name+'_Visible' ,Banco.TB_Agenda.Fields[i].FieldName,  Banco.TB_Agenda.Fields[i].Visible);
end;


end;

procedure TFAgenda.Img1Click(Sender: TObject);
begin
if not banco.Agen_Novo then Banco.NotPermissao;

try
  Application.CreateForm(TFAgenda_new,Fagenda_new);
  FAgenda_new.showmodal;
Finally
FreeAndNil(Fagenda_new);
end;

end;

procedure TFAgenda.ipo1Click(Sender: TObject);
begin
try
  Application.CreateForm(TFAgenda_TIpo,FAgenda_TIpo);
  FAgenda_TIpo.ShowModal;
Finally
  FreeAndNil(FAgenda_TIpo);
end;

end;

procedure TFAgenda.Agenda1Click(Sender: TObject);
begin
try
  Application.CreateForm(TFAgenda_Contato,FAgenda_Contato);
  FAgenda_Contato.ShowModal;
Finally
  FreeAndNil(FAgenda_Contato);
end;

end;

procedure TFAgenda.Img2Click(Sender: TObject);
begin
if not banco.Agen_Editar then Banco.NotPermissao;

if banco.tb_Agenda.RecordCount = 0 then
exit;

try
  Application.CreateForm(TFAgenda_new,Fagenda_new);
  FAgenda_New.Editando := true;
  FAgenda_new.showmodal;
Finally
FreeAndNil(Fagenda_new);
end;
end;

procedure TFAgenda.Img7Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to Banco.TB_Agenda.FieldCount -1 do
    if Banco.TB_Agenda.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(Banco.TB_Agenda.Fields[i].DisplayLabel,)] := Banco.TB_Agenda.Fields[i].Visible;

    banco.Clearimg;
    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     Banco.TB_Agenda.Fields[Banco.SearchField(Banco.TB_Agenda,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];

     save;

     end;

   FreeAndNil(FVisible);
end;
end;



procedure TFAgenda.Img4Click(Sender: TObject);
begin
banco.ListaQuery(Banco.TB_Agenda,'Listando Agenda',banco.TB_AgendaAssunto.Index);

end;

procedure TFAgenda.Cor1Click(Sender: TObject);
begin
banco.ColorDialog.Color := Banco.Cor_Grid [9];

if banco.ColorDialog.Execute then
begin
Banco.Cor_Grid[9] := Banco.ColorDialog.Color;
ThemeDBGrid1.Refresh;
end;

end;

procedure TFAgenda.Img8Click(Sender: TObject);
begin
Banco.FontDialog.Font := banco.font_grid[9];

if Banco.FontDialog.Execute then
begin
banco.Img8_Visible;

banco.Font_Grid[9] := banco.FontDialog.Font;
Banco.Font_Grid[9].Style := [];
ThemeDBGrid1.Font := banco.FontDialog.Font;
end;

end;

procedure TFAgenda.SelecionarLinha1Click(Sender: TObject);
begin
Banco.Config_GRID_Foco[9] := not(banco.config_grid_foco[9]);
FPrincipal.Img5Click(FPrincipal.Img5);

end;

procedure TFAgenda.Exibir1Click(Sender: TObject);
var
  AuxBitmap : TBitmap;
begin
if banco.Config_GRID_Foco[9] then
SelecionarLinha1.Caption := '&Selecionar Linha'
else
SelecionarLinha1.Caption := '&Selecionar Coluna';



Try
  AuxBitmap := TBitmap.Create;
  AuxBitmap.Width := 16;
  AuxBitmap.Height := 16;
  AuxBitmap.Canvas.Brush.Color := banco.cor_grid[9];
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


procedure TFAgenda.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin

if not JaExec then
if not banco.Config_GRID_Foco[9] then
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
   if Banco.Cor_Grid[9] <> clwhite then
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := Banco.Cor_Grid[9]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;

end;
(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);


end;

procedure TFAgenda.Img6Click(Sender: TObject);
begin
TRY
  Application.CreateForm(TFAgenda_Mes,FAgenda_Mes);
  FAgenda_Mes.ShowModal;
Finally
  FreeAndNil(FAgenda_Mes);
end;

end;

procedure TFAgenda.Img5Click(Sender: TObject);
begin
if not banco.Agen_Excluir then Banco.NotPermissao;


end;

procedure TFAgenda.Agenda2Click(Sender: TObject);
begin

Novo1.Enabled := Banco.Agen_Novo;
Editar1.Enabled := Banco.Agen_Editar;
Exclior1.Enabled := Banco.Agen_Excluir;
Agenda1.Enabled := Banco.Agen_Alter_Contato;
{T}ipo1.Enabled := Banco.Agen_Alter_Tipo;


end;

procedure TFAgenda.Img3Click(Sender: TObject);
begin
try
  Application.CreateForm(TFPesquisa,FPesquisa);
  FPesquisa.Table := Banco.TB_Agenda;
//  FPesquisa.ComboBox1.Items.Add('Ativo');
  banco.Clearimg;
  FPesquisa.ShowModal;
Finally
FreeAndNil(FPesquisa);
end;

end;

procedure TFAgenda.ThemeDBGrid1TitleClick(Column: TColumn);
begin
Banco.OrdenaGrid(Column);
end;

end.
