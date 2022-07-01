unit UAgendaMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dateutils, XPMan, ComCtrls, DB, ADODB,
  Buttons, Menus;

type
  TFAgenda_Mes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    A1: TPanel;
    A2: TPanel;
    A3: TPanel;
    A4: TPanel;
    A5: TPanel;
    A6: TPanel;
    A7: TPanel;
    B1: TPanel;
    B2: TPanel;
    B3: TPanel;
    B4: TPanel;
    B5: TPanel;
    B6: TPanel;
    B7: TPanel;
    C1: TPanel;
    C2: TPanel;
    C3: TPanel;
    C4: TPanel;
    C5: TPanel;
    C6: TPanel;
    C7: TPanel;
    D1: TPanel;
    D2: TPanel;
    D3: TPanel;
    D4: TPanel;
    D5: TPanel;
    D6: TPanel;
    D7: TPanel;
    E1: TPanel;
    E2: TPanel;
    E3: TPanel;
    E4: TPanel;
    E5: TPanel;
    E6: TPanel;
    E7: TPanel;
    F1: TPanel;
    F2: TPanel;
    F3: TPanel;
    F4: TPanel;
    F5: TPanel;
    F6: TPanel;
    F7: TPanel;
    XPManifest1: TXPManifest;
    ADOConnection1: TADOConnection;
    TBAgenda: TADOQuery;
    TBAgendadata: TDateTimeField;
    Panel3: TPanel;
    T1: TPanel;
    T2: TPanel;
    T3: TPanel;
    T4: TPanel;
    T5: TPanel;
    T6: TPanel;
    T7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    PopupMenu1: TPopupMenu;
    Color1: TMenuItem;
    Selecionado1: TMenuItem;
    FinaldeSemana1: TMenuItem;
    tulo1: TMenuItem;
    tulodaSemana1: TMenuItem;
    DiasBloqueados1: TMenuItem;
    Diasnormais1: TMenuItem;
    SpeedButton3: TSpeedButton;
    SubTtulo11: TMenuItem;
    Borda1: TMenuItem;
    N1: TMenuItem;
    MostrarProgressodeatualizao1: TMenuItem;
    PopupMenu2: TPopupMenu;
    VisualizarRegistros1: TMenuItem;
    procedure PaintPanels;
    Function SearchComponent(Name_Search:TComponentName):integer;
    procedure A1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    Procedure SetDefaultColor(Index:Integer);
    Procedure UpdateReg;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    Function  DayOfPanel(day:byte):Integer;
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Setday(Dia : Shortint);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure tulo1Click(Sender: TObject);
    procedure tulodaSemana1Click(Sender: TObject);
    procedure Selecionado1Click(Sender: TObject);
    procedure FinaldeSemana1Click(Sender: TObject);
    procedure DiasBloqueados1Click(Sender: TObject);
    procedure Diasnormais1Click(Sender: TObject);
    Procedure UpdateColorTitle;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SubTtulo11Click(Sender: TObject);
    procedure Borda1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MostrarProgressodeatualizao1Click(Sender: TObject);
    procedure A1DblClick(Sender: TObject);
    procedure VisualizarRegistros1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Last_Select       : Integer;
    DefaultColor      : TColor;
    DefaultColor_Find : TColor;
    DefaultColor_block: TColor;
    WeekColor         : TColor;
    titlecolor        : TColor;
    SelectColor       : TColor;
    SubTitle1         : TColor;
    
    Painting : Boolean;
    FirstOperation : Boolean;
    BordeActive : Boolean;
    Progress_Visible : Boolean;
    

     Mes : Shortint;
    Ano : Cardinal;
    Dia : byte;
    { Public declarations }
  end;

var
  FAgenda_Mes: TFAgenda_Mes;

  DayCount : Shortint;
  First_Day : TDate;
COnst
  MesName : Array[1..12] of String = ('Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

implementation

uses UAgenda_Mes_SelectMes, UDados, IniFiles, UAgendaNew, UAgenda_MesHora;

{$R *.dfm}

procedure TFAgenda_Mes.PaintPanels;
Var
  Font_Heigth : Smallint;

  Tamanho_H, Tamanho_W : Cardinal;
  A, B : Shortint;

  NewTime : TTime;

  Component_Search_A : Array [1..7] of integer;
  Component_Search_B : Array [1..7] of integer;
  Component_Search_C : Array [1..7] of integer;
  Component_Search_D : Array [1..7] of integer;
  Component_Search_E : Array [1..7] of integer;
  Component_Search_F : Array [1..7] of integer;

  Component_Search_T : Array [1..7] of integer;



 LastPos : Shortint;
  Calc : Boolean;
begin
Calc := true;

if Panel2.Visible then
Calc := false;

if not Panel2.Visible then Panel2.Visible := true;
if not Panel3.Visible then Panel3.Visible := true;



Panel1.Caption := mesname[mes]+', '+IntToStr(Ano);



NewTime := now;

Tamanho_h := (Panel2.Height ) div 6;
Tamanho_W := (Panel2.Width  ) div 7;

if Painting then
exit;

Painting := true;
 For B := 1 to 7 do
 begin
  Component_Search_A[B] := SearchComponent('A'+IntToStr(B));
  Component_Search_B[B] := SearchComponent('B'+IntToStr(B));
  Component_Search_C[B] := SearchComponent('C'+IntToStr(B));
  Component_Search_D[B] := SearchComponent('D'+IntToStr(B));
  Component_Search_E[B] := SearchComponent('E'+IntToStr(B));
  Component_Search_F[B] := SearchComponent('F'+IntToStr(B));

  Component_Search_T[B] := SearchComponent('T'+IntToStr(B));


 {(Components[ Component_Search_A[B] ] as TPanel).Visible := False;
 (Components[ Component_Search_B[B] ] as TPanel).Visible := False;
 (Components[ Component_Search_C[B] ] as TPanel).Visible := False;
 (Components[ Component_Search_D[B] ] as TPanel).Visible := False;
 (Components[ Component_Search_E[B] ] as TPanel).Visible := False;
 (Components[ Component_Search_F[B] ] as TPanel).Visible := False;}

 if BordeActive then
 begin
 (Components[ Component_Search_A[B] ] as TPanel).BevelOuter := bvRaised;
 (Components[ Component_Search_B[B] ] as TPanel).BevelOuter := bvRaised;
 (Components[ Component_Search_C[B] ] as TPanel).BevelOuter := bvRaised;
 (Components[ Component_Search_D[B] ] as TPanel).BevelOuter := bvRaised;
 (Components[ Component_Search_E[B] ] as TPanel).BevelOuter := bvRaised;
 (Components[ Component_Search_F[B] ] as TPanel).BevelOuter := bvRaised;
 end
 else
 begin
 (Components[ Component_Search_A[B] ] as TPanel).BevelOuter := bvNone;
 (Components[ Component_Search_B[B] ] as TPanel).BevelOuter := bvNone;
 (Components[ Component_Search_C[B] ] as TPanel).BevelOuter := bvNone;
 (Components[ Component_Search_D[B] ] as TPanel).BevelOuter := bvNone;
 (Components[ Component_Search_E[B] ] as TPanel).BevelOuter := bvNone;
 (Components[ Component_Search_F[B] ] as TPanel).BevelOuter := bvNone;
 end;

 (Components[ Component_Search_T[B] ] as TPanel).BevelOuter := bvNone;


 if Calc then
 begin
  Font_Heigth :=  (Height * 5) div 100;
 (Components[ Component_Search_A[B] ] as TPanel).Font.Size := Font_Heigth;
 (Components[ Component_Search_B[B] ] as TPanel).Font.Size := Font_Heigth;
 (Components[ Component_Search_C[B] ] as TPanel).Font.Size := Font_Heigth;
 (Components[ Component_Search_D[B] ] as TPanel).Font.Size := Font_Heigth;
 (Components[ Component_Search_E[B] ] as TPanel).Font.Size := Font_Heigth;
 (Components[ Component_Search_F[B] ] as TPanel).Font.Size := Font_Heigth;

 (Components[ Component_Search_T[B] ] as TPanel).Font.Size := (Height * 5) div 200;;

 (Components[ Component_Search_A[B] ] as TPanel).Font.Name := 'courier new';
 (Components[ Component_Search_B[B] ] as TPanel).Font.Name := 'courier new';
 (Components[ Component_Search_C[B] ] as TPanel).Font.Name := 'courier new';
 (Components[ Component_Search_D[B] ] as TPanel).Font.Name := 'courier new';
 (Components[ Component_Search_E[B] ] as TPanel).Font.Name := 'courier new';
 (Components[ Component_Search_F[B] ] as TPanel).Font.Name := 'courier new';
 (Components[ Component_Search_T[B] ] as TPanel).Font.Name := 'courier new';

 (Components[ Component_Search_A[B] ] as TPanel).Height := Tamanho_H;
 (Components[ Component_Search_B[B] ] as TPanel).Height := Tamanho_H;
 (Components[ Component_Search_C[B] ] as TPanel).Height := Tamanho_H;
 (Components[ Component_Search_D[B] ] as TPanel).Height := Tamanho_H;
 (Components[ Component_Search_E[B] ] as TPanel).Height := Tamanho_H;
 (Components[ Component_Search_F[B] ] as TPanel).Height := Tamanho_H;

 (Components[ Component_Search_T[B] ] as TPanel).Height := Panel3.Height;

 (Components[ Component_Search_A[B] ] as TPanel).Width := Tamanho_W;
 (Components[ Component_Search_B[B] ] as TPanel).Width := Tamanho_W;
 (Components[ Component_Search_C[B] ] as TPanel).Width := Tamanho_W;
 (Components[ Component_Search_D[B] ] as TPanel).Width := Tamanho_W;
 (Components[ Component_Search_E[B] ] as TPanel).Width := Tamanho_W;
 (Components[ Component_Search_F[B] ] as TPanel).Width := Tamanho_W;

 (Components[ Component_Search_T[B] ] as TPanel).Width := Tamanho_W;


 (Components[ Component_Search_T[B] ] as TPanel).Top := 0;

 (Components[ Component_Search_A[B] ] as TPanel).Top := 1;
 (Components[ Component_Search_B[B] ] as TPanel).Top := A1.Top + a1.Height;
 (Components[ Component_Search_C[B] ] as TPanel).Top := B1.Top + B1.Height;
 (Components[ Component_Search_D[B] ] as TPanel).Top := C1.Top + C1.Height;
 (Components[ Component_Search_E[B] ] as TPanel).Top := D1.Top + D1.Height;
 (Components[ Component_Search_F[B] ] as TPanel).Top := E1.Top + E1.Height;

 (Components[ Component_Search_A[B] ] as TPanel).Left := (Tamanho_W * (B-1));
 (Components[ Component_Search_B[B] ] as TPanel).Left := (Tamanho_W * (B-1));
 (Components[ Component_Search_C[B] ] as TPanel).Left := (Tamanho_W * (B-1));
 (Components[ Component_Search_D[B] ] as TPanel).Left := (Tamanho_W * (B-1));
 (Components[ Component_Search_E[B] ] as TPanel).Left := (Tamanho_W * (B-1));
 (Components[ Component_Search_F[B] ] as TPanel).Left := (Tamanho_W * (B-1));


 (Components[ Component_Search_T[B] ] as TPanel).Left := (Components[ Component_Search_A[B] ] as TPanel).Left;
  end;

 (Components[ Component_Search_A[B] ] as TPanel).Caption := '';
 (Components[ Component_Search_B[B] ] as TPanel).Caption := '';
 (Components[ Component_Search_C[B] ] as TPanel).Caption := '';
 (Components[ Component_Search_D[B] ] as TPanel).Caption := '';
 (Components[ Component_Search_E[B] ] as TPanel).Caption := '';
 (Components[ Component_Search_F[B] ] as TPanel).Caption := '';


{ (Components[ Component_Search_A[B] ] as TPanel).Visible := True;
 (Components[ Component_Search_B[B] ] as TPanel).Visible := True;
 (Components[ Component_Search_C[B] ] as TPanel).Visible := True;
 (Components[ Component_Search_D[B] ] as TPanel).Visible := True;
 (Components[ Component_Search_E[B] ] as TPanel).Visible := True;
 (Components[ Component_Search_F[B] ] as TPanel).Visible := True;}
 end;

DayCount := DayOf(EndOfAMonth(Ano, mes));
First_Day := StrToDate('01/'+IntToStr(Mes)+'/'+IntToStr(Ano));

LastPos := 0;
LastPos := DayOfWeek(First_Day) - 1;

for A := 1 to  DayCount do
begin
inc(LastPos);
case LastPos of
 1: A1.Caption := FormatFloat('00',A);
 2: A2.Caption := FormatFloat('00',A);
 3: A3.Caption := FormatFloat('00',A);
 4: A4.Caption := FormatFloat('00',A);
 5: A5.Caption := FormatFloat('00',A);
 6: A6.Caption := FormatFloat('00',A);
 7: A7.Caption := FormatFloat('00',A);
 8: B1.Caption := FormatFloat('00',A);
 9: B2.Caption := FormatFloat('00',A);
10: B3.Caption := FormatFloat('00',A);
11: B4.Caption := FormatFloat('00',A);
12: B5.Caption := FormatFloat('00',A);
13: B6.Caption := FormatFloat('00',A);
14: B7.Caption := FormatFloat('00',A);
15: C1.Caption := FormatFloat('00',A);
16: C2.Caption := FormatFloat('00',A);
17: C3.Caption := FormatFloat('00',A);
18: C4.Caption := FormatFloat('00',A);
19: C5.Caption := FormatFloat('00',A);
20: C6.Caption := FormatFloat('00',A);
21: C7.Caption := FormatFloat('00',A);
22: D1.Caption := FormatFloat('00',A);
23: D2.Caption := FormatFloat('00',A);
24: D3.Caption := FormatFloat('00',A);
25: D4.Caption := FormatFloat('00',A);
26: D5.Caption := FormatFloat('00',A);
27: D6.Caption := FormatFloat('00',A);
28: D7.Caption := FormatFloat('00',A);
29: E1.Caption := FormatFloat('00',A);
30: E2.Caption := FormatFloat('00',A);
31: E3.Caption := FormatFloat('00',A);
32: E4.Caption := FormatFloat('00',A);
33: E5.Caption := FormatFloat('00',A);
34: E6.Caption := FormatFloat('00',A);
35: E7.Caption := FormatFloat('00',A);
36: F1.Caption := FormatFloat('00',A);
37: F2.Caption := FormatFloat('00',A);
38: F3.Caption := FormatFloat('00',A);
39: F4.Caption := FormatFloat('00',A);
40: F5.Caption := FormatFloat('00',A);
41: F6.Caption := FormatFloat('00',A);
42: F7.Caption := FormatFloat('00',A);
end;
end;

 For B := 1 to 7 do
 begin
 SetDefaultColor(Component_Search_A[B]);
 SetDefaultColor(Component_Search_B[B]);
 SetDefaultColor(Component_Search_C[B]);
 SetDefaultColor(Component_Search_D[B]);
 SetDefaultColor(Component_Search_E[B]);
 SetDefaultColor(Component_Search_F[B]);
 end;

For A := 0 to ComponentCount -1 do
if (Components[A] is TLabel) then
if (Components[A] as TLabel).Parent is TPanel then
if (Components[a] as TLabel).Tag = 2 then
(Components[a] as TLabel).Font.Size := Font_Heigth div 2;

//NewTime := Now - NewTime;
//Caption := FormatDateTime('hh:mm:ss:zz',NewTime);


UpdateReg;

Painting := False;

end;

function TFAgenda_Mes.SearchComponent(Name_Search: TComponentName): integer;
var
  i : integer;
begin
result := -1;

Name_Search := LowerCase(Name_Search);

For i := 0 to ComponentCount - 1 do
if Name_Search = LowerCase(Components[i].Name) then
Result := Components[i].ComponentIndex;



end;

procedure TFAgenda_Mes.A1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (Sender as TPanel).Caption  = '' then
exit;

if (Sender as TPanel).Tag  = 0 then
exit;


SetDefaultColor(Last_Select);

(sender As TPanel).Color := SelectColor;
(sender As TPanel).Font.Style := [fsBold,fsItalic];

Last_Select := (sender as TPanel).ComponentIndex;

end;

procedure TFAgenda_Mes.FormCreate(Sender: TObject);
{var
i : Integer;} 
begin
FirstOperation := false;
Painting := false;
BordeActive := false;
Progress_Visible := true;

 {for i := 0 to Componentcount-1 do
 if Components[i] is TPanel then
 with TControl (Components[i]) do
 ControlStyle := ControlStyle - [csParentBackground];}

 mes := MonthOf(Date);
 ano := YearOf(Date);

Last_Select := -1;

DefaultColor := clBtnFace;
DefaultColor_Find := clInactiveCaption;
DefaultColor_block:= clAppWorkSpace;
WeekColor := clOlive;
titlecolor := clRed;
SelectColor := clred;
SubTitle1 := clGreen;


DefaultColor      := Banco.Config.ReadInteger('Agenda_Mes','DefaultColor',DefaultColor);
DefaultColor_Find := Banco.Config.ReadInteger('Agenda_Mes','DefaultColor_Find',DefaultColor_Find);
DefaultColor_block:= Banco.Config.ReadInteger('Agenda_Mes','DefaultColor_block',DefaultColor_block);
WeekColor         := Banco.Config.ReadInteger('Agenda_Mes','WeekColor',WeekColor);
titlecolor        := Banco.Config.ReadInteger('Agenda_Mes','titlecolor',titlecolor);
SelectColor       := Banco.Config.ReadInteger('Agenda_Mes','SelectColor',SelectColor);

BordeActive := banco.config.ReadBool('Agenda_Mes','Borda',BordeActive);

Dia := DayOf(date);

end;

procedure TFAgenda_Mes.SetDefaultColor(Index: Integer);
begin


if Index <> -1 then
if Components[Index] <> nil then
Begin

 if (Components[Index] as TPanel).Caption = '' then //se estiver desativado
 begin
 (Components[Index] as TPanel).Color := DefaultColor_block;
 (Components[Index] as TPanel).BevelOuter := bvNone;
 (Components[Index] as TPanel).PopupMenu := nil;
 end
 else
 if (Components[index].Name[2] = '1') or (Components[index].Name[2] = '7') then
 (Components[Index] as TPanel).Color := DefaultColor_Find
 else
 (Components[Index] as TPanel).Color := DefaultColor;

 (Components[Index] as TPanel).Font.Style := [];
 (Components[Index] as TPanel).PopupMenu := PopupMenu2;

end;



end;

procedure TFAgenda_Mes.UpdateReg;
var
  IndexPanel : Integer;
  i : integer;

  Form_Lista_Progress : TForm;
  Label_Lista : TLabel;
  Progres_Lista : Tprogressbar;
begin

TBAgenda.Close;
TBAgenda.SQL.Clear;
TBAgenda.SQL.Add('Select A.data from tb_Agenda A');
TBAgenda.SQL.Add('left join tb_Agenda_Tipo B');
TBAgenda.SQL.Add('on a.agTipo = b.codigo');
TBAgenda.SQL.Add('where B.GregaAgenda = true');
TBAgenda.SQL.Add('and efetuado = false ');

TBAgenda.SQL.Add('and data between #'+FormatDateTime('mm/dd/yyyy',First_Day)+'# and #'+FormatDateTime('mm/dd/yyyy', StrToDate(IntToStr(DayCount) +'/'+IntToStr(mes)+'/'+IntToStr(ano) ))+'#');
TBAgenda.SQL.Add('order by data asc');

try
  TBAgenda.Open;
except
  on e :exception do
  begin
  banco.Create_Erro(e.ClassName,e.Message);
  exit;
  end;
end;


if (TBAgenda.RecordCount < 20) or ( not Progress_Visible) then
begin
  TBAgenda.DisableControls;

 // limpa os labels
 For I := 0 to ComponentCount -1 do
 if (Components[I] is TLabel) then
 if (Components[I] as TLabel).Parent is TPanel then
 if (Components[I] as TLabel).Tag = 2 then
 (Components[I] as TLabel).Caption := '';

 TBAgenda.First;
 while not TBAgenda.Eof do
 begin
 Application.ProcessMessages;

 // vamo nos labels dos dias, e incrimentar o valor
 IndexPanel := DayOfPanel(DayOf(TBAgendadata.Value));


 for I := 0 to ComponentCount -1 do
 if (Components[i] is TLabel) then
 if (Components[i] as TLabel).Tag = 2 then
 if (Components[i] as TLabel).Parent.ComponentIndex = IndexPanel then
 begin
  if (Components[i] as TLabel).Caption = '' then (Components[i] as TLabel).Caption := '0';
  (Components[i] as TLabel).Caption := IntToStr(StrToInt((Components[i] as TLabel).Caption)+1);
 end;

 TBAgenda.Next;
 end;

exit;
end;

try
  Form_Lista_Progress := TForm.Create(nil);
  Form_Lista_Progress.Width  := 355;
  Form_Lista_Progress.Height := 129;
  Form_Lista_Progress.BorderStyle := bsDialog;
  Form_Lista_Progress.BorderIcons := [];
  Form_Lista_Progress.Caption := 'Atualizando dados';
  Form_Lista_Progress.Position := poDesktopCenter;
  Form_Lista_Progress.KeyPreview := true;
  Form_Lista_Progress.OnKeyDown := FormKeyDown;
  Form_Lista_Progress.Ondeactivate := FormDeactivate;

  Label_Lista := TLabel.Create(Form_Lista_Progress);
  Label_Lista.Parent := Form_Lista_Progress;
  Label_Lista.AutoSize := false;
  Label_Lista.Width :=329;
  Label_Lista.Height :=19;
  Label_Lista.Font.Name :='Times New Roman';
  Label_Lista.Font.Size := 12;
  Label_Lista.Top := 8;
  Label_Lista.Left :=8;
  Label_Lista.Caption := 'Visualizando registros';
  Label_Lista.Alignment := taCenter;

  Progres_Lista := TProgressBar.Create(Form_Lista_Progress);
  Progres_Lista.Parent := Form_Lista_Progress;
  Progres_Lista.Position := 0;
  Progres_Lista.Width :=325;
  Progres_Lista.Height :=17;
  Progres_Lista.Left :=8;
  Progres_Lista.Top:= 64;

  Form_Lista_Progress.Show;



  TBAgenda.DisableControls;

 // limpa os labels
 For I := 0 to ComponentCount -1 do
 if (Components[I] is TLabel) then
 if (Components[I] as TLabel).Parent is TPanel then
 if (Components[I] as TLabel).Tag = 2 then
 (Components[I] as TLabel).Caption := '';


 TBAgenda.First;
 while not TBAgenda.Eof do
 begin
 Progres_Lista.Position := TBAgenda.RecNo;
 Progres_Lista.Max  := TBAgenda.RecordCount;
 Application.ProcessMessages;

 if not TBAgendadata.IsNull then
 Label_Lista.Caption := FormatDateTime('DD/MM/YYYY hh:mm:ss',TBAgendadata.Value);


 // vamo nos labels dos dias, e incrimentar o valor
 IndexPanel := DayOfPanel(DayOf(TBAgendadata.Value));


 for I := 0 to ComponentCount -1 do
 if (Components[i] is TLabel) then
 if (Components[i] as TLabel).Tag = 2 then
 if (Components[i] as TLabel).Parent.ComponentIndex = IndexPanel then
 begin
  if (Components[i] as TLabel).Caption = '' then (Components[i] as TLabel).Caption := '0';
  (Components[i] as TLabel).Caption := IntToStr(StrToInt((Components[i] as TLabel).Caption)+1);
 end;

 TBAgenda.Next;
 end;

Finally
  Form_Lista_Progress.OnDeactivate := nil;
  Form_Lista_Progress.Close;
  FreeAndNil(Form_Lista_Progress);
end;

end;

procedure TFAgenda_Mes.FormDeactivate(Sender: TObject);
begin
(sender as Tform).setfocus;
end;

procedure TFAgenda_Mes.FormShow(Sender: TObject);
Var
  CriaLbl : TLabel;
  i : Integer;
begin


For i := 0 to ComponentCount -1  do
if (Components[i] is TPanel) then
if (Components[i] as TPanel).Tag = 1 then
begin
  CriaLbl := TLabel.Create(self);
  CriaLbl.Parent := (  Components[i] as TPanel);
  CriaLbl.Align := alBottom;
  CriaLbl.Font.Name := 'Courier new';
  CriaLbl.Font.Size := 8;
  CriaLbl.Alignment := taCenter;
  CriaLbl.Tag := 2;
  CriaLbl.AutoSize := true;
  CriaLbl.OnMouseDown := Label1MouseDown;
  CriaLbl.font.Color := SubTitle1;
  CriaLbl.Font.Style := [fsBold];
  CriaLbl.Caption := '';
 // CriaLbl.Name := 'Lb1'+ (Components[i] as TPanel).Name;
end
else
if (Components[i] as TPanel).Tag = 3 then
( Components[i] as TPanel).Color := WeekColor
else
if (Components[i] as TPanel).Tag = 4 then
( Components[i] as TPanel).Color := titlecolor;





Width := Banco.Config.ReadInteger('Agenda_Mes','Width',Width);
Height:= Banco.Config.ReadInteger('Agenda_Mes','Height',Height);
Progress_Visible := banco.Config.ReadBool('Agenda_Mes','Progress_Visible',Progress_Visible);


FirstOperation := false;
PaintPanels;

Setday(dia);



end;

procedure TFAgenda_Mes.FormHide(Sender: TObject);
var
  i : integer;
begin
For i := ComponentCount -1 downto 0  do
if (Components[i] is TLabel) then
if (Components[i] as TLabel).Tag = 2 then
begin
if (components[i] as TLabel) <> nil then
(components[i] as TLabel).Free;


end;

Banco.Config.WriteInteger('Agenda_Mes','DefaultColor',      ColorToRGB(DefaultColor));
Banco.Config.WriteInteger('Agenda_Mes','DefaultColor_Find', ColorToRGB(DefaultColor_Find));
Banco.Config.WriteInteger('Agenda_Mes','DefaultColor_block',ColorToRGB(DefaultColor_block));
Banco.Config.WriteInteger('Agenda_Mes','WeekColor',         ColorToRGB(WeekColor));
Banco.Config.WriteInteger('Agenda_Mes','titlecolor',        ColorToRGB(titlecolor));
Banco.Config.WriteInteger('Agenda_Mes','SelectColor',       ColorToRGB(SelectColor));

Banco.Config.WriteInteger('Agenda_Mes','Width',Width);
Banco.Config.WriteInteger('Agenda_Mes','Height',Height);

banco.config.WriteBool('Agenda_Mes','Borda',BordeActive);
banco.Config.WriteBool('Agenda_Mes','Progress_Visible',Progress_Visible);




end;

function TFAgenda_Mes.DayOfPanel(day: byte): Integer;
var
  i : integer;
begin
For i := 0 to ComponentCount -1 do
if (Components[i] is TPanel) then
if (Components[i] as TPanel).Tag = 1 then
if (Components[i] as TPanel).caption = FormatFloat('00',day) then
Result := i;


end;

procedure TFAgenda_Mes.Label1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
A1MouseDown((sender as TLabel).Parent,Button,Shift,x,y);

end;

procedure TFAgenda_Mes.SpeedButton1Click(Sender: TObject);
begin
Inc(Mes);
if Mes = 13 then
begin
mes := 1;
inc(Ano);
end;

PaintPanels;
Setday(1);

end;

procedure TFAgenda_Mes.SpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
SpeedButton1.Font.Style := [fsUnderline];

end;

procedure TFAgenda_Mes.SpeedButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
SpeedButton2.Font.Style := [fsUnderline];
end;

procedure TFAgenda_Mes.Panel1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
SpeedButton1.Font.Style := [];
SpeedButton2.Font.Style := [];

if ( x > SpeedButton2.Left) and  ( x < SpeedButton1.Left) then
Panel1.Cursor := crHandPoint
else
Panel1.Cursor := crDefault;


end;

procedure TFAgenda_Mes.SpeedButton2Click(Sender: TObject);
begin
mes := mes - 1;

if Mes = 0 then
begin
mes := 12;
ano := ano - 1;
end;

PaintPanels;
Setday(1);
end;

procedure TFAgenda_Mes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = ord('H')) and ([ssCtrl] = Shift) then
begin
  Mes := MonthOf(Date);
  Ano := YearOf(date);
  PaintPanels;

  Setday(DayOf(date));



end;




if key = vk_left then
begin

if (Components[Last_Select] as TPanel).Caption = FormatFloat('00',1) then
begin
  SpeedButton2Click(SpeedButton2);
  Setday(DayCount);
end
else
if (Components[Last_Select -1] is TPanel) then
if (Components[Last_Select -1] as TPanel).caption <> '' then
if (Components[Last_Select -1] as TPanel).Tag = 1 then
A1MouseDown((Components[Last_Select -1] as TPanel), mbLeft,Shift,1,1);

key := 0;
end;


if key = vk_right then
begin

if (Components[Last_Select] as TPanel).Caption = FormatFloat('00',DayCount) then
begin
  SpeedButton1Click(SpeedButton1);
  Setday(1);
end
else
 if (Components[Last_Select +1] is TPanel) then
 if (Components[Last_Select +1] as TPanel).caption <> '' then
 if (Components[Last_Select +1] as TPanel).Tag = 1 then
 A1MouseDown((Components[Last_Select +1] as TPanel), mbLeft,Shift,1,1);

key := 0;
end;

if key = vk_up then
begin
if StrToInt( (Components[Last_Select] as TPanel).Caption)  -7 > 0 then
if (Components[Last_Select -7] is TPanel) then
if (Components[Last_Select -7] as TPanel).caption <> '' then
if (Components[Last_Select -7] as TPanel).Tag = 1 then
A1MouseDown((Components[Last_Select -7] as TPanel), mbLeft,Shift,1,1);
key := 0;
end;

if key = vk_down then
begin
if (Components[Last_Select +7] is TPanel) then
if (Components[Last_Select +7] as TPanel).caption <> '' then
if (Components[Last_Select +7] as TPanel).Tag = 1 then
A1MouseDown((Components[Last_Select +7] as TPanel), mbLeft,Shift,1,1);
key := 0;
end;

if key = vk_end then
begin
  Setday(DayCount);
key :=0;
end;

if key = vk_home then
begin
  Setday(1);
  key :=0;
end;

end;

procedure TFAgenda_Mes.Setday(Dia: Shortint);
var
  i : integer;
begin
{if (TBAgenda.State in [dsinactive]) then
exit;}

for i := 0 to ComponentCount - 1 do
if (Components[i] is TPanel) then
if (Components[i] as TPanel).Tag = 1 then
if (Components[i] as TPanel).Caption = FormatFloat('00',Dia) then
A1MouseDown((Components[i] as TPanel), mbLeft, [ssLeft], 1,1);

end;

procedure TFAgenda_Mes.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if not (( x > SpeedButton2.Left) and  ( x < SpeedButton1.Left)) then
Exit;


try
  Application.CreateForm(TFAgenda_Mes_SelectMes,FAgenda_Mes_SelectMes);

  FAgenda_Mes_SelectMes.SpinEdit1.Value := ano;
  FAgenda_Mes_SelectMes.RadioGroup1.ItemIndex := Mes -1;

  FAgenda_Mes_SelectMes.ShowModal;
Finally
  if FAgenda_Mes_SelectMes.ModalResult = mrok then
  begin
  Ano := FAgenda_Mes_SelectMes.SpinEdit1.Value;
  Mes := FAgenda_Mes_SelectMes.RadioGroup1.ItemIndex + 1;
  PaintPanels;

  Setday(1);
  end;

  FreeAndNil(FAgenda_Mes_SelectMes);
end;


end;

procedure TFAgenda_Mes.Panel4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
PaintPanels;
end;

procedure TFAgenda_Mes.FormResize(Sender: TObject);
begin


 Panel1.Font.Size := (Height * 9) div 200;

  SpeedButton1.Left:= ((Panel1.Width * 75) div 100 ) - (SpeedButton1.Width div 2);
  SpeedButton2.Left:= ((Panel1.Width * 25) div 100 )-  (SpeedButton1.Width div 2);

if FirstOperation then
begin
  Panel2.Visible := false;
  Panel3.Visible := false;
end
else
 FirstOperation := true;
 

  Panel4.Caption := 'Clique aqui para Atualizar';
  Panel4.Font.Size := (Height * 6) div 100;
  Panel4.Font.Name := 'Courier new';
end;

procedure TFAgenda_Mes.tulo1Click(Sender: TObject);
begin
banco.ColorDialog.Color := titlecolor;

if banco.ColorDialog.Execute then
begin
titlecolor := banco.ColorDialog.Color;
UpdateColorTitle;
end;


end;

procedure TFAgenda_Mes.tulodaSemana1Click(Sender: TObject);
begin
banco.ColorDialog.Color := WeekColor;

if banco.ColorDialog.Execute then
begin
WeekColor := banco.ColorDialog.Color;
UpdateColorTitle;
end;


end;

procedure TFAgenda_Mes.Selecionado1Click(Sender: TObject);
begin
banco.ColorDialog.Color := SelectColor;

if banco.ColorDialog.Execute then
begin
SelectColor := banco.ColorDialog.Color;
FormResize(Self);
end;


end;

procedure TFAgenda_Mes.FinaldeSemana1Click(Sender: TObject);
begin
banco.ColorDialog.Color := DefaultColor_Find;

if banco.ColorDialog.Execute then
begin
DefaultColor_Find := banco.ColorDialog.Color;
FormResize(Self);
end;


end;

procedure TFAgenda_Mes.DiasBloqueados1Click(Sender: TObject);
begin
banco.ColorDialog.Color := DefaultColor_block;

if banco.ColorDialog.Execute then
begin
DefaultColor_block := banco.ColorDialog.Color;
FormResize(Self);
end;


end;

procedure TFAgenda_Mes.Diasnormais1Click(Sender: TObject);
begin

banco.ColorDialog.Color := DefaultColor;

if banco.ColorDialog.Execute then
begin
DefaultColor := banco.ColorDialog.Color;
FormResize(Self);
end;



end;

procedure TFAgenda_Mes.UpdateColorTitle;
var
  i : integer;
begin
For i := 0 to ComponentCount -1  do
if (Components[i] is TPanel) then
if (Components[i] as TPanel).Tag = 3 then
( Components[i] as TPanel).Color := WeekColor
else
if (Components[i] as TPanel).Tag = 4 then
( Components[i] as TPanel).Color := titlecolor;

end;

procedure TFAgenda_Mes.SpeedButton3Click(Sender: TObject);
begin
PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);

end;

procedure TFAgenda_Mes.SubTtulo11Click(Sender: TObject);
var
  i : integer;
begin

banco.ColorDialog.Color := SubTitle1;

if banco.ColorDialog.Execute then
begin
SubTitle1 := banco.ColorDialog.Color;

FOr i := 0 to ComponentCount - 1 do
if  Components[i] is TLabel then
if  (Components[i] as TLabel).tag = 2 then
(Components[i] as TLabel).Font.Color  := SubTitle1;

end;




end;

procedure TFAgenda_Mes.Borda1Click(Sender: TObject);
begin
BordeActive := not (BordeActive);
FormResize(Self);
end;

procedure TFAgenda_Mes.PopupMenu1Popup(Sender: TObject);
begin
Borda1.Checked := BordeActive;
MostrarProgressodeatualizao1.Checked := Progress_Visible;
end;


procedure TFAgenda_Mes.MostrarProgressodeatualizao1Click(Sender: TObject);
begin
Progress_Visible := not (Progress_Visible);

end;

procedure TFAgenda_Mes.A1DblClick(Sender: TObject);
begin
if (sender as TPanel).Caption <> '' then
if FAgenda_New <> nil then
begin
  FAgenda_New.EditDate.Date := StrToDate((Sender as TPanel).Caption+'/'+IntToStr(Mes)+'/'+IntToStr(Ano));
  close;
  FAgenda_New.EditDate.SetFocus;
end;

end;

procedure TFAgenda_Mes.VisualizarRegistros1Click(Sender: TObject);
begin
if (Components[Last_Select] <> nil) then 
if (Components[Last_Select] is TPanel) then
if (Components[Last_Select] as TPanel).Caption <> '' then
try
  Application.CreateForm(TFAgenda_MesHora,FAgenda_MesHora);
  FAgenda_MesHora.Dia :=  StrToDate((Components[Last_Select] as TPanel).Caption+'/'+IntToStr(Mes)+'/'+IntToStr(Ano));
  FAgenda_MesHora.ShowModal;
finally
  FreeAndNil(FAgenda_MesHora);
end;


end;

end.

