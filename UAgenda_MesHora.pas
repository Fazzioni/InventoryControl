unit UAgenda_MesHora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGrids, ThemeDBGrid, DBClient,
  StdCtrls, Buttons;

type
  TFAgenda_MesHora = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    TB_Agenda: TADOQuery;
    Panel7: TPanel;
    ThemeDBGrid1: TThemeDBGrid;
    TB_Manha: TClientDataSet;
    TB_Tarde: TClientDataSet;
    TB_Noite: TClientDataSet;
    TB_ManhaEfetuado: TBooleanField;
    TB_ManhaAssunto: TWideStringField;
    TB_ManhaTipo: TIntegerField;
    TB_ManhaContato: TIntegerField;
    TB_ManhaRazao: TWideStringField;
    TB_ManhaCPF: TWideStringField;
    TB_AgendaData: TDateTimeField;
    TB_AgendaEfetuado: TBooleanField;
    TB_AgendaContato_Forma: TIntegerField;
    TB_AgendaAssunto: TWideStringField;
    TB_Agendanome_razao: TWideStringField;
    TB_Agendanome: TWideStringField;
    TB_AgendaUF: TWideStringField;
    TB_Agendacpf: TWideStringField;
    TB_Agendaid_cliente: TIntegerField;
    TB_ManhaHora: TTimeField;
    Manha_Source: TDataSource;
    Tarde_Source: TDataSource;
    Noite_Source: TDataSource;
    ThemeDBGrid2: TThemeDBGrid;
    ThemeDBGrid3: TThemeDBGrid;
    TB_ManhaCodCliente: TIntegerField;
    TB_ManhaTipo_Virtual: TStringField;
    TB_ManhaContato_Virtual: TStringField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TB_TardeCodCliente: TIntegerField;
    TB_TardeRazao: TWideStringField;
    TB_TardeCPF: TWideStringField;
    TB_TardeEfetuado: TBooleanField;
    TB_TardeHora: TTimeField;
    TB_TardeAssunto: TWideStringField;
    TB_TardeTipo_Virtual: TStringField;
    TB_TardeContato_Virtual: TStringField;
    TB_TardeTipo: TIntegerField;
    TB_TardeContato: TIntegerField;
    TB_NoiteCodCliente: TIntegerField;
    TB_NoiteRazao: TWideStringField;
    TB_NoiteCPF: TWideStringField;
    TB_NoiteEfetuado: TBooleanField;
    TB_NoiteHora: TTimeField;
    TB_NoiteAssunto: TWideStringField;
    TB_NoiteTipo_Virtual: TStringField;
    TB_NoiteContato_Virtual: TStringField;
    TB_NoiteTipo: TIntegerField;
    TB_NoiteContato: TIntegerField;
    SpeedButton6: TSpeedButton;
    TB_AgendaagTipo: TIntegerField;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TB_ManhaAfterOpen(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure ThemeDBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    Procedure SetField(Table:TDataSet;FieldName:ShortString;Index : Shortint);
    procedure FormHide(Sender: TObject);
    procedure TB_TardeAfterOpen(DataSet: TDataSet);
    procedure TB_NoiteAfterOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ThemeDBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ThemeDBGrid2DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ThemeDBGrid3DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Cor : array [1..3] of TColor;
      { Private declarations }
  public
    ManhaTime : TTime;
    TardeTIme : TTime;
    Dia : TDate;

    { Public declarations }
  end;

var
  FAgenda_MesHora: TFAgenda_MesHora;
Const
  ClBtnManha = $0000F4F4;
  ClBtnTarde = $0047C5FA;
  ClBtnNoite = $00696969;
  
implementation

uses UDados, Uagenda_HoraEdit, Uvisible, IniFiles;

{$R *.dfm}

procedure TFAgenda_MesHora.FormResize(Sender: TObject);
var
  NumModes : Shortint;
begin

Panel7.Font.Size := (Panel7.Width * 2) div 100;

SpeedButton3.Left := Panel7.Width - SpeedButton4.Left - SpeedButton3.Width;
SpeedButton2.Left := SpeedButton3.Left - SpeedButton2.Width - SpeedButton4.Left;
SpeedButton1.Left := SpeedButton2.Left - SpeedButton1.Width - SpeedButton4.Left;


NumModes := 0;
if Panel1.Visible then inc(NumModes);
if Panel2.Visible then inc(NumModes);
if Panel3.Visible then inc(NumModes);


if NumModes = 0 then exit;

Panel1.Width := ClientWidth;
Panel2.Width := Panel1.Width;
Panel3.Width := Panel1.Width;

Panel1.Left := 0;
Panel2.Left := 0;
Panel3.Left := 0;

Panel1.Height := (self.ClientHeight - Panel7.Height) div NumModes;
Panel2.Height := Panel1.Height;
Panel3.Height := Panel1.Height;

Panel1.Top := Panel7.Height;
Panel2.Top := Panel1.Top;  Panel3.Top := Panel1.Top;
if Panel1.Visible then     begin
Panel2.Top := Panel2.Top+  Panel1.Height;
Panel3.Top := Panel3.Top+  Panel1.Height;
end;
if Panel2.Visible then     Panel3.Top := Panel3.Top+ Panel2.Height;



Panel4.Font.Size := (Panel4.Width * 2) div 100;
Panel4.Font.name :='courier new';
Panel4.Height := Panel4.Font.Size + 2;

Panel5.Font := Panel4.Font;
Panel5.Height := Panel4.Height;
Panel6.Font := Panel4.Font;
Panel6.Font.Color := clWhite;
Panel6.Height := Panel4.Height;



{ThemeDBGrid1.Height := Panel1.Height;
ThemeDBGrid1.Width := Panel1.Width;
ThemeDBGrid1.Top := 0;
ThemeDBGrid1.Left := 0;

ThemeDBGrid2.Height := Panel2.Height;
ThemeDBGrid2.Width := Panel2.Width;
ThemeDBGrid2.Top := 0;
ThemeDBGrid2.Left := 0;

ThemeDBGrid3.Height := Panel3.Height;
ThemeDBGrid3.Width := Panel3.Width;
ThemeDBGrid3.Top := 0;
ThemeDBGrid3.Left := 0;}






end;

procedure TFAgenda_MesHora.FormShow(Sender: TObject);
begin
  Banco.LoadIndexOf(TB_Manha);
  Banco.LoadIndexOf(TB_Tarde);
  Banco.LoadIndexOf(TB_Noite);
  
  TB_Agenda.Close;
  TB_Agenda.SQL.Clear;
  TB_Agenda.SQL.Add('Select A.Data,A.Efetuado,A.agTipo,A.Contato_Forma,A.Assunto,A.id_cliente,B.nome_razao,B.nome, B.UF,B.cpf from tb_Agenda A');
  TB_Agenda.SQL.Add('Left join Cliente_cadastro B on');
  TB_Agenda.SQL.Add('A.id_cliente = b.codigo');
  TB_Agenda.SQL.Add('WHERE data >= :dtIni AND data <= :dtFim');

  TB_Agenda.Parameters.ParamByName('dtIni').DataType := ftDateTime;
  TB_Agenda.PARAMETERS.ParamByName('dtIni').Value := FormatDateTime('YYYY/MM/DD',dia);

  TB_Agenda.Parameters.ParamByName('dtFim').DataType := ftDateTime;
  TB_Agenda.Parameters.ParamByName('dtFim').Value := FormatDateTime('YYYY/MM/DD 23:59:59',dia);


  TB_Agenda.Open;

  TB_Agenda.DisableControls;
// dia := TB_AgendaData.Value;

  TB_Agenda.First;
  while not TB_Agenda.Eof do
  begin
      //verificar se ? dia
      if TB_AgendaData.Value < StrToDateTime(FormatDateTime('DD/MM/YYYY ',dia)+TimeToStr(ManhaTime)) then
      begin
      //Manha
        if not TB_Manha.Active then
        TB_Manha.CreateDataSet;


      TB_Manha.Insert;
      TB_ManhaAssunto.Value := TB_AgendaAssunto.Value;
      TB_ManhaHora.Value := StrToTime(FormatDateTime('hh:mm:ss',TB_AgendaData.Value));
      TB_ManhaEfetuado.Value := TB_AgendaEfetuado.Value;
      TB_ManhaTipo.Value := TB_AgendaagTipo.Value;
      TB_ManhaContato.Value := TB_AgendaContato_Forma.Value;
      TB_ManhaCodCliente.Value := TB_Agendaid_cliente.Value;
      TB_ManhaCPF.Value := TB_Agendacpf.Value;
      TB_ManhaRazao.Value := TB_Agendanome_razao.Value;
      TB_Manha.Post;

      end
      else
      //Tarde
      if TB_AgendaData.Value < StrToDateTime(FormatDateTime('DD/MM/YYYY ',dia)+TimeToStr(TardeTIme)) then
      begin
      if not TB_Tarde.Active then      TB_Tarde.CreateDataSet;

    { TB_Tarde.Insert;
      //TB_ManhaAssunto.Value := TB_AgendaAssunto.Value;
      TB_TardeHora.Value := StrToTime(FormatDateTime('hh:mm:ss',TB_AgendaData.Value));
      TB_Tarde.Post;}

      TB_Tarde.Insert;
      TB_TardeAssunto.Value := TB_AgendaAssunto.Value;
      TB_TardeHora.Value := StrToTime(FormatDateTime('hh:mm:ss',TB_AgendaData.Value));
      TB_TardeEfetuado.Value := TB_AgendaEfetuado.Value;
      TB_TardeTipo.Value := TB_AgendaagTipo.Value;
      TB_TardeContato.Value := TB_AgendaContato_Forma.Value;
      TB_TardeCodCliente.Value := TB_Agendaid_cliente.Value;
      TB_TardeCPF.Value := TB_Agendacpf.Value;
      TB_TardeRazao.Value := TB_Agendanome_razao.Value;
      TB_Tarde.Post;

      end
      else
      begin
      // noite
      if not TB_Noite.Active then      TB_Noite.CreateDataSet;

      TB_Noite.Insert;
      TB_NoiteAssunto.Value := TB_AgendaAssunto.Value;
      TB_NoiteHora.Value := StrToTime(FormatDateTime('hh:mm:ss',TB_AgendaData.Value));
      TB_NoiteEfetuado.Value := TB_AgendaEfetuado.Value;
      TB_NoiteTipo.Value := TB_AgendaagTipo.Value;
      TB_NoiteContato.Value := TB_AgendaContato_Forma.Value;
      TB_NoiteCodCliente.Value := TB_Agendaid_cliente.Value;
      TB_NoiteCPF.Value := TB_Agendacpf.Value;
      TB_NoiteRazao.Value := TB_Agendanome_razao.Value;
      TB_Noite.Post;
      end;


   TB_Agenda.Next;
  end;


  Panel7.Caption := FormatDateTime('dddd, dd',Dia)+' de '+FormatDateTime('mmmm',Dia)+' de '+FormatDateTime('yyyy',dia);


Panel1.Visible:=banco.Config.ReadBool('Agenda_ListCont','Manha',true);
Panel2.Visible:=banco.Config.ReadBool('Agenda_ListCont','Tarde',true);
Panel3.Visible:=banco.Config.ReadBool('Agenda_ListCont','Noite',false);

if not Panel1.Visible then SpeedButton1.Font.Color := clWhite;
if not Panel2.Visible then SpeedButton2.Font.Color := clWhite;
if not Panel3.Visible then SpeedButton3.Font.Color := clWhite;


if (Panel1.Visible = false) and (Panel2.Visible = false) and (Panel3.Visible = false) then
begin
SpeedButton1.Font.Color := clbtnmanha;
Panel1.Visible := True;
end;


Width :=banco.Config.ReadInteger('Agenda_ListCont','Width',Width);
Height :=banco.Config.ReadInteger('Agenda_ListCont','Height',Height);


end;

procedure TFAgenda_MesHora.FormCreate(Sender: TObject);
begin

ManhaTime := StrToTime('12:00:00');
TardeTIme := StrToTime('17:30:00');

Dia := now;


Cor[1] := banco.Config.ReadInteger('Agenda_ListCont','Cor_01',ColorToRGB($0091FFFF));
Cor[2] := banco.Config.ReadInteger('Agenda_ListCont','Cor_02',ColorToRGB($00A6C2FF));
Cor[3] := banco.Config.ReadInteger('Agenda_ListCont','Cor_03',ColorToRGB($00D5BBD2));


//ManhaTime  := banco.Config.ReadTime('Agenda_ListCont','Time_Manha',ManhaTime);
//TardeTIme  := banco.Config.ReadTime('Agenda_ListCont','Time_Tarde',TardeTIme);

if banco.Locate(18) then
Try
ManhaTime := StrToTime(Banco.TB_ConfigValor.Value);
Except
ManhaTime := StrToTime('12:00:00');
end;

if banco.Locate(19) then
Try
TardeTIme := StrToTime(Banco.TB_ConfigValor.Value);
Except
TardeTIme := StrToTime('17:30:00');
end;





end;

procedure TFAgenda_MesHora.TB_ManhaAfterOpen(DataSet: TDataSet);
begin
banco.LoadColumns(ThemeDBGrid1);

end;

procedure TFAgenda_MesHora.Button2Click(Sender: TObject);
var
  i : integer;
begin
  Try
    Application.CreateForm(TFVisible,FVisible);

    for i := 0 to TB_Manha.FieldCount -1 do
    if TB_Manha.Fields[i].Tag = 0 then
    FVisible.CheckListBox1.Checked[FVisible.CheckListBox1.Items.Add(TB_Manha.Fields[i].DisplayLabel,)] := TB_Manha.Fields[i].Visible;

    FVisible.ShowModal;
  Finally
    if FVisible.ModalResult = 1 then
    begin
     for i := 0 to FVisible.CheckListBox1.Items.Count -1 do
     begin
     TB_Manha.Fields[Banco.SearchField(TB_Manha,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];
     TB_Tarde.Fields[Banco.SearchField(TB_Tarde,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];
     TB_Noite.Fields[Banco.SearchField(TB_Noite,FVisible.CheckListBox1.Items[i],false)].Visible := FVisible.CheckListBox1.Checked[i];
    end;


     //save;

     end;

   FreeAndNil(FVisible);
end;
end;




procedure TFAgenda_MesHora.ThemeDBGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i : Shortint;
begin

For i := 0 to TB_Manha.FieldCount - 1 do
begin
SetField(TB_Tarde,TB_Manha.Fields[i].FieldName,TB_Manha.Fields[i].Index);
SetField(TB_Noite,TB_Manha.Fields[i].FieldName,TB_Manha.Fields[i].Index);

end;


end;

procedure TFAgenda_MesHora.SetField(Table: TDataSet;
  FieldName: ShortString; Index: Shortint);
var
  i : Shortint;
begin
For i := 0 to Table.FieldCount - 1 do
//if Table.Fields[i].Tag = 0 then
if table.Fields[i].FieldName = FieldName  then
Table.Fields[i].Index := Index;

end;

procedure TFAgenda_MesHora.FormHide(Sender: TObject);
begin
banco.SaveColumns(ThemeDBGrid1);
banco.SaveColumns(ThemeDBGrid2);
banco.SaveColumns(ThemeDBGrid3);

  Banco.SaveIndexOf(TB_Manha);
  Banco.SaveIndexOf(TB_Tarde);
  Banco.SaveIndexOf(TB_Noite);
  
banco.Config.WriteBool('Agenda_ListCont','Manha',Panel1.Visible);
banco.Config.WriteBool('Agenda_ListCont','Tarde',Panel2.Visible);
banco.Config.WriteBool('Agenda_ListCont','Noite',Panel3.Visible);

banco.Config.WriteInteger('Agenda_ListCont','Width',Width);
banco.Config.WriteInteger('Agenda_ListCont','Height',Height);
end;

procedure TFAgenda_MesHora.TB_TardeAfterOpen(DataSet: TDataSet);
begin
banco.LoadColumns(ThemeDBGrid2);
end;

procedure TFAgenda_MesHora.TB_NoiteAfterOpen(DataSet: TDataSet);
begin
banco.LoadColumns(ThemeDBGrid3);
end;

procedure TFAgenda_MesHora.SpeedButton1Click(Sender: TObject);
begin
if (Sender as TSpeedButton).Font.Color = clWhite then
begin
(Sender as TSpeedButton).Font.Color := clbtnmanha;
Panel1.Visible := true
end
else
begin
(Sender as TSpeedButton).Font.Color := clWhite;
Panel1.Visible := false;
end;



FormResize(Self);

end;

procedure TFAgenda_MesHora.SpeedButton2Click(Sender: TObject);
begin
if (Sender as TSpeedButton).Font.Color = clWhite then
begin
(Sender as TSpeedButton).Font.Color := ClBtnTarde;
Panel2.Visible := true
end
else
begin
(Sender as TSpeedButton).Font.Color := clWhite;
Panel2.Visible := false;
end;



FormResize(Self);

end;

procedure TFAgenda_MesHora.SpeedButton3Click(Sender: TObject);
begin
if (Sender as TSpeedButton).Font.Color = clWhite then
begin
(Sender as TSpeedButton).Font.Color := ClBtnNoite;
Panel3.Visible := true
end
else
begin
(Sender as TSpeedButton).Font.Color := clWhite;
Panel3.Visible := false;
end;



FormResize(Self);

end;

procedure TFAgenda_MesHora.SpeedButton4Click(Sender: TObject);
begin
try
Application.CreateForm(TFAgenda_HoraEdit,FAgenda_HoraEdit);
FAgenda_HoraEdit.DateTimePicker1.Time := ManhaTime;
FAgenda_HoraEdit.DateTimePicker2.Time := TardeTIme;
FAgenda_HoraEdit.ShowModal;
finally
FreeAndNil(FAgenda_HoraEdit);
end;
end;

procedure TFAgenda_MesHora.Button1Click(Sender: TObject);
begin
if TB_Manha.Filtered = false then
begin
// 1
     TB_Manha.Filtered := false;
     TB_Manha.Filter :='Efetuado = true';
     TB_Manha.Filtered := true;

     TB_Tarde.Filtered := false;
     TB_Tarde.Filter :='Efetuado = true';
     TB_Tarde.Filtered := true;

     TB_Noite.Filtered := false;
     TB_Noite.Filter :='Efetuado = true';
     TB_Noite.Filtered := true;

     MessageDlg('Filtro Aplicado'+#13+'Apenas registros efetuados',mtInformation,[mbok],0);
     (Sender as TSpeedButton).Caption := 'a';

end
else
if  TB_Manha.Filter ='Efetuado = true' then
begin
     TB_Manha.Filtered := false;
     TB_Manha.Filter :='Efetuado = false';
     TB_Manha.Filtered := true;

     TB_Tarde.Filtered := false;
     TB_Tarde.Filter :='Efetuado = false';
     TB_Tarde.Filtered := true;

     TB_Noite.Filtered := false;
     TB_Noite.Filter :='Efetuado = false';
     TB_Noite.Filtered := true;

     MessageDlg('Filtro Aplicado'+#13+'Apenas registros pendentes',mtInformation,[mbok],0);
     (Sender as TSpeedButton).Caption := 'r';

end
else
begin
     TB_Manha.Filtered := false;
     TB_Manha.Filter :='';

     TB_Tarde.Filtered := false;
     TB_Tarde.Filter :='';

     TB_Noite.Filtered := false;
     TB_Noite.Filter :='';


      MessageDlg('Filtro removido'+#13+'Todos os registros ser?o mostrados',mtInformation,[mbok],0);
     (Sender as TSpeedButton).Caption := '?';

end;





end;

procedure TFAgenda_MesHora.ThemeDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
HoldColor := ThemeDBGrid1.Brush.Color;
 IF (Sender as TThemeDBGrid).Focused and ((gdselected in State) or (gdfocused in State)) then //Se selecionado ou com foco
 begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := cor[1]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

if TB_ManhaEfetuado.Value = true then (Sender as TThemeDBGrid).Canvas.Font.Color  := banco.Contas_Color_Pagada;
(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);


end;

procedure TFAgenda_MesHora.ThemeDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
HoldColor := ThemeDBGrid1.Brush.Color;
 IF (Sender as TThemeDBGrid).Focused and ((gdselected in State) or (gdfocused in State)) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := cor[2]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

if TB_tardeEfetuado.Value = true then (Sender as TThemeDBGrid).Canvas.Font.Color  := banco.Contas_Color_Pagada;
(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFAgenda_MesHora.ThemeDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  HoldColor : TColor;
begin
HoldColor := ThemeDBGrid1.Brush.Color;
 IF (Sender as TThemeDBGrid).Focused and ((gdselected in State) or (gdfocused in State)) then //Se selecionado ou com foco
  begin
   (Sender as TThemeDBGrid).Canvas.Brush.Color := clBlack;
   (Sender as TThemeDBGrid).Canvas.Font.Color := clWhite;
  end
 else
  begin
   if (Sender as TThemeDBGrid).DataSource.DataSet.RecNo mod 2 = 1 then
    (Sender as TThemeDBGrid).Canvas.Brush.Color := cor[3]
   else
    (Sender as TThemeDBGrid).Canvas.Brush.Color := HoldColor;
 end;

if TB_NoiteEfetuado.Value = true then (Sender as TThemeDBGrid).Canvas.Font.Color  := banco.Contas_Color_Pagada;

(Sender as TThemeDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);


end;

procedure TFAgenda_MesHora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

if (ssctrl in Shift) and (key = 80) then
begin
  if ThemeDBGrid1.Focused then
  Banco.ListaQuery(TB_Manha,Panel7.Caption +' per?odo Matutino',TB_ManhaAssunto.Index);

  if ThemeDBGrid2.Focused then
  Banco.ListaQuery(TB_Tarde,Panel7.Caption +' per?odo Vespertino',TB_TardeAssunto.Index);

  if ThemeDBGrid3.Focused then
  Banco.ListaQuery(TB_Noite,Panel7.Caption +' per?odo Noturno',TB_NoiteAssunto.Index);
  

end;

end;

end.
