unit UPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, Mask, ToolEdit, DBCtrls, ComCtrls;

type
  TFPesquisa = class(TForm)
    Button2: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Button3: TButton;
    DBComboBox1: TDBLookupComboBox;
    ComboBox3: TComboBox;
    Button4: TButton;
    Label8: TLabel;
    ComboBox5: TComboBox;
    RadioGroup4: TRadioGroup;
    Edit: TEdit;
    Label9: TLabel;
    DataEdit: TDateTimePicker;
    Button1: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Lista: TRichEdit;
    Button6: TButton;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    Function SearchField(Value:ShortString):integer;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadCid;
    procedure ComboBox3Select(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    Procedure DescriptSql;
    Function  NextSpace(s:ShortString;Index:byte):byte;
    Procedure PaintLista;
    procedure FormResize(Sender: TObject);
    procedure ListaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    Function GetCaracters(ListaVal:TStrings;Posi:Smallint):integer;
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
     Table : TADOQuery;
     Data_Inicial, Data_Final : Tdate;
     FieldSelect : integer;
     Loaded : Boolean;
     Sql_Temp : TStringList;
     
    { Public declarations }
  end;

var
  FPesquisa: TFPesquisa;
Const
  sIgual = 'Igual';
  sDif   = 'Diferente';
  sMaior = 'Maior';
  sMenor = 'Menor';
  sCon   = 'Contendo';
  sTer   = 'Terminando';
  sIni   = 'Iniciando';
implementation

uses DateUtils, UDados, IniFiles;

{$R *.dfm}

procedure TFPesquisa.FormShow(Sender: TObject);
var
  i : integer;
begin
DataEdit.Date := now;

Loaded := false;


For i := 0 to Table.Fields.Count -1 do
if Table.Fields[i].Tag = 0 then
if Table.Fields[i].FieldName <> banco.TB_ContasFuncVirtual.FieldName then
ComboBox1.Items.Add(Table.Fields[i].DisplayLabel);

ComboBox1.ItemIndex := 0;
ComboBox1Select(ComboBox1);
//RadioGroup1.Height := (RadioGroup1.Items.Count * 22);


Sql_Temp.Clear;

Sql_Temp.AddStrings(Table.SQL);
DescriptSql;

end;

procedure TFPesquisa.LoadCid;
begin
Loaded := true;

Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
Banco.TB_Municipio_new.sql.Add('Where UF like '+chr(39)+ComboBox3.Text+chr(39));
banco.TB_Municipio_new.SQL.Add('Order by Cidade asc');

Banco.TB_Municipio_new.Open;
DescriptSql;
end;

procedure TFPesquisa.ComboBox1Select(Sender: TObject);
var
  NumField : integer;
begin
DBComboBox1.KeyField := '';
DBComboBox1.ListField := '';
DBComboBox1.ListSource := nil;


DBComboBox1.Left := Edit.Left;
DBComboBox1.Width:= Edit.Width;

Edit.Visible := true;
DBComboBox1.Visible := false;
DataEdit.Visible := false;
ComboBox3.Visible := false;
DBLookupComboBox1.Visible := false;


ComboBox5.Clear;
ComboBox5.ItemIndex := -1;
NumField := SearchField(ComboBox1.Text);
if NumField = -1 then exit;
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Município') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    ComboBox3.Visible := true;
    LoadCid;
    DBComboBox1.ListSource := Banco.Municipio_Source_new;
    DBComboBox1.KeyField  :=  Banco.TB_Municipio_newCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_Municipio_newCidade.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);

    DBComboBox1.Left := ComboBox3.Left + 3 + ComboBox3.Width;
    DBComboBox1.Width:= ClientWidth - 10 - DBComboBox1.Left;

    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Situação') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.Situacao_Source;
    DBComboBox1.KeyField  :=  Banco.TB_SituacaoCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_SituacaoDescri.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('setor') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.Emprego_Source;
    DBComboBox1.KeyField :=  Banco.TB_SetorCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_SetorDescricao.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else //tipo agenda
    if (LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Tipo')) and (Table.Name = banco.TB_Agenda.Name) then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.Agenda_Tipo;
    DBComboBox1.KeyField  :=  Banco.TB_Agenda_TipoCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_Agenda_TipoDescricao.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Tipo') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.TBLOG_Source;
    DBComboBox1.KeyField  :=  Banco.TBLograCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TBLograTipo.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('unidade') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource :=  Banco.un_source;
    DBComboBox1.KeyField   :=  Banco.TBEstUnCodigo.FieldName;
    DBComboBox1.ListField  :=  Banco.TBEstUnSinb.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Portador') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.Portador_Source;
    DBComboBox1.KeyField :=  Banco.TB_PortadorCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_PortadorDescricao.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Fatura') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.Forma_Pagamento;
    DBComboBox1.KeyField :=  Banco.TB_FormaPagamentocodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_FormaPagamentoForma.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else //Contato
    if (LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Contato')) and (Table.Name = banco.TB_Agenda.Name) then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBComboBox1.ListSource := Banco.Agenda_Contato;
    DBComboBox1.KeyField  :=  Banco.TB_Agenda_ContatoCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_Agenda_ContatoDescricao.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);
    end
    else
    if LowerCase(Table.Fields[NumField].DisplayLabel) = LowerCase('Parcelamento') then
    begin
    Edit.Visible := false;
    DBComboBox1.Visible := true;
    DBLookupComboBox1.Visible := true;

    DBComboBox1.ListSource := Banco.Parcelamento_Source;
    DBComboBox1.KeyField :=  Banco.TB_ParcelamentoCodigo.FieldName;
    DBComboBox1.ListField :=  Banco.TB_ParcelamentoDescricao.FieldName;
    ComboBox5.Items.Add(sIgual);
    ComboBox5.Items.Add(sDif);

    DBComboBox1.Left := DBLookupComboBox1.Left + 3 + DBLookupComboBox1.Width;
    DBComboBox1.Width:= ClientWidth - 10 - DBLookupComboBox1.Left;

      try DBLookupComboBox1.KeyValue := 0; except end;
      banco.TB_Parcelamento.Close;
      banco.TB_Parcelamento.SQL.Clear;
      banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
      banco.TB_Parcelamento.SQL.Add('Where formaPagamento = '+IntToStr(DBLookupComboBox1.KeyValue));
      banco.TB_Parcelamento.open;
      DBLookupComboBox1.KeyValue := null;

    end
else
if (( Table.Fields[NumField] is TAutoIncField )) or
   ( (Table.Fields[NumField] is TIntegerField) ) or
   ( (Table.Fields[NumField] is TBCDField))      or
   ( (Table.Fields[NumField] is TCurrencyField)) then
begin
 ComboBox5.Items.Add(sIgual);
 ComboBox5.Items.Add(sDif);
 ComboBox5.Items.Add(sMaior);
 ComboBox5.Items.Add(sMenor);
end
else
if ( Table.Fields[NumField] is TDateTimeField ) then
begin
 ComboBox5.Items.Add(sIgual);
 ComboBox5.Items.Add(sDif);
 ComboBox5.Items.Add(sMaior);
 ComboBox5.Items.Add(sMenor);
 Edit.Visible := false;
 DataEdit.Visible := true;
end
else
if (Table.Fields[NumField] is TBooleanField ) then
begin
 ComboBox5.Items.Add(sIgual);
 ComboBox5.Items.Add(sDif);
end
else
begin
 ComboBox5.Items.Add(sIgual);
 ComboBox5.Items.Add(sDif);
 ComboBox5.Items.Add(sCon);
 ComboBox5.Items.Add(sTer);
 ComboBox5.Items.Add(sIni);

end;

end;

function TFPesquisa.SearchField(Value: ShortString): integer;
var
  i : integer;
begin
result := -1;

For i := 0 to Table.Fields.Count -1 do
if (Table.Fields[i].DisplayLabel = Value) then
if (Table.Fields[i].Tag = 1) then
  Result := i
else
if (Table.Fields[i].Tag = 0) and (result = -1) then
Result := i;



end;



procedure TFPesquisa.Button3Click(Sender: TObject);
begin
Sql_Temp.Clear;
if Table.Name = Banco.TBClientes.Name      then Sql_Temp.Add('Select * from Cliente_Cadastro');
if Table.Name = Banco.TB_Funcionarios.Name then Sql_Temp.Add(Banco.Sql_Tb_Funcio_Default);
if Table.Name = Banco.TB_Pedido.Name       then Sql_Temp.Add(banco.Sql_Tb_Pedido_Default);
if Table.Name = Banco.TB_Agenda.Name       then Sql_Temp.Add(Banco.Sql_Tb_Agenda_Default);
if Table.Name = Banco.TB_Contas.Name       then Sql_Temp.Add(Banco.Sql_Tb_contas_Default);
if Table.Name = Banco.TBEstoque.Name       then Sql_Temp.Add('Select * from Estoque');

if Sql_Temp.Count = 0 then
ShowMessage('No sql in '+table.Name);

DescriptSql;

end;

procedure TFPesquisa.FormCreate(Sender: TObject);
begin
Sql_Temp := TStringList.Create;
end;

procedure TFPesquisa.ComboBox3Select(Sender: TObject);
begin
LoadCid;

end;

procedure TFPesquisa.FormHide(Sender: TObject);
begin

if Loaded then
begin
Banco.TB_Municipio_new.Close;
Banco.TB_Municipio_new.SQL.Clear;
Banco.TB_Municipio_new.SQL.Add('Select * from Cliente_local');
banco.TB_Municipio_new.SQL.Add('Order by Cidade asc');
Banco.TB_Municipio_new.Open;
end;


FreeAndNil(sql_Temp);

end;


procedure TFPesquisa.Button2Click(Sender: TObject);
begin
ModalResult := mrCancel;

end;

procedure TFPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_Escape then
close;

end;

procedure TFPesquisa.Button4Click(Sender: TObject);
 Function VirgulaToPonto(value:Extended):ShortString;
 Var   Posi : Byte;
 begin
 Result := FloatToStr(value);
 Posi := pos(',',FloatToStr(value));
 if posi <> 0 then
 Result := copy(FloatToStr(value),1,Posi-1)+'.'+copy(FloatToStr(value),posi+1,length(Result));
 end;


var
  Inicio : ShortString;
  AuxOperac : ShortString;
  Operacao : ShortString;
  Field  : Shortint;
  Valor  : ShortString;
  Aux:ShortString;
begin
Field := -1;
Field := Banco.SearchField(Table,ComboBox1.Items[ComboBox1.itemindex],true);
if Field = -1 then
exit;

if Edit.Visible then
begin
    if Edit.Text = '' then exit;


   if ( (Table.Fields[Field] is TBCDField))      or
      ( (Table.Fields[Field] is TCurrencyField)) then
   begin
    try
      StrToFloat(Edit.Text);

    Except
    MessageDlg('O campo '+ComboBox1.Items[ComboBox1.itemindex]+' aceita apenas números',mtInformation,[mbok],0);
    exit;
    end;
  end
   else
    if (( Table.Fields[Field] is TAutoIncField )) or
    ( (Table.Fields[Field] is TIntegerField) ) then
    begin
     if not banco.IsInt(Edit.Text) then
     begin
     MessageDlg('O campo '+ComboBox1.Items[ComboBox1.itemindex]+' aceita apenas números',mtInformation,[mbok],0);
     exit;
     end;
      if (LowerCase(Table.Fields[Field].FieldName) = LowerCase('codigo')) and (StrToInt(Edit.Text) = 0) then
      begin
      MessageDlg('Sintax não permitida',mtInformation,[mbok],0);
      exit;
      end;

    end;

   if Table.Fields[field] is TBooleanField then
   if (LowerCase(Edit.Text) <> LowerCase('sim'))  and
      (LowerCase(Edit.Text) <> LowerCase('não')) and
      (LowerCase(Edit.Text) <> LowerCase('nao')) then
   begin
     MessageDlg('O campo '+ComboBox1.Items[ComboBox1.itemindex]+' aceita apenas valores "Sim" e "Não"',mtInformation,[mbok],0);
     exit;
   end;
end
else
if (DBComboBox1.Visible) and (DBComboBox1.KeyValue = null) then
exit;






/// iniciando procedimentos \\\


inicio := 'and';

if pos(LowerCase('Where'),LowerCase(Sql_Temp.Text)) = 0 then
Inicio := 'where'
else
if RadioGroup4.ItemIndex = 1 then
Inicio := 'or'
else
Inicio := 'and';



auxOperac := '';
auxOperac := ComboBox5.Items[ComboBox5.Itemindex];
if auxOperac = '' then
exit;

Valor := '';
if Edit.Visible then Valor := Edit.Text
else
if DataEdit.Visible then
Valor :='#'+FormatDateTime('yyyy/mm/dd',DataEdit.Date)+'#'
else
if DBComboBox1.Visible then
Valor := VarToStr(DBComboBox1.KeyValue);




if Valor = '' then
exit;

Operacao := '';
if auxOperac = sIgual then Operacao := ' = '
else
if AuxOperac = sdif   then Operacao := ' <> '
else
if AuxOperac = smaior then Operacao := ' > '
else
if AuxOperac = smenor then Operacao := ' < '
else
if AuxOperac = sCon then
begin
Operacao := ' like ';
Valor := '%'+Valor+'%';
end
else
if AuxOperac = sTer then
begin
Operacao := ' like ';
Valor := '%'+Valor;
end
else
if AuxOperac = sIni then
begin
Operacao := ' like ';
Valor := Valor+'%';
end;


if Table.Fields[field] is TBooleanField then
begin
  if LowerCase(Valor) = LowerCase('sim') then
  Valor := 'true'
  else
  if (LowerCase(Valor) = LowerCase('não')) or (LowerCase(Valor) = LowerCase('nao'))  then
  Valor := 'false'
end
else
  if (not (Table.Fields[Field] is TAutoIncField) ) and
     (not (Table.Fields[Field] is TIntegerField) ) and
     (not (Table.Fields[Field] is TDateTimeField)) and
     (not (Table.Fields[Field] is TBCDField)     ) and
     (not (Table.Fields[Field] is TCurrencyField)) then
      Valor := chr(39)+Valor+chr(39);

if  (Table.Fields[Field] is TBCDField)      or
    (Table.Fields[Field] is TCurrencyField) then
    try
    Valor := VirgulaToPonto(StrToFloat(Valor));
    Except
    MessageDlg('Valor incorreto',mtError,[mbok],0);
    exit;
    end;

  Aux := '';
  if ((table.Fields[Field] = banco.TB_ContasCodigo) and (Table = banco.TB_Contas)) or
     ((table.Fields[Field] = banco.TB_AgendaCodigo) and (Table = banco.TB_Agenda)) then
  Aux := aux + 'A.';

 if Pos(LowerCase(Aux+Table.Fields[field].FieldName+Operacao+Valor), LowerCase(Sql_Temp.Text)) <> 0 then
 begin
 MessageDlg('A sintax informada já existe',mtInformation,[mbok],0);
 exit;
 end;


Sql_Temp.Add(Inicio+' '+Aux+Table.Fields[field].FieldName+Operacao+Valor);
DescriptSql;

end;

procedure TFPesquisa.Button1Click(Sender: TObject);
var
  BackupSql : TStringList;
begin
Try
  BackupSql := TStringList.Create;

  BackupSql.Clear;
  BackupSql.AddStrings(Table.SQL);

  try
    Table.Close;
    Table.SQL := Sql_Temp;
    Table.Open;
  Except
  on e : exception do
  begin
    MessageDlg('Sintax da pesquisa incorreto, tente novamente',mtError,[mbok],0);
    banco.Create_Erro(e.ClassName,'Sintax Pesquisa.  |||'+e.Message);
  table.SQL := BackupSql;
  Table.Open;
  Sql_Temp.Clear;
  Sql_Temp.AddStrings(BackupSql);
  DescriptSql;
  end;
  end;

Finally
  FreeAndNil(BackupSql);
end;
  close;
end;


function TFPesquisa.NextSpace(s: ShortString; Index: byte): byte;
var
  i : byte;
begin
Result := 0;

For i := Index+1 to length(s) do
if s[i] = ' 'then
Result := i;
end;

procedure TFPesquisa.DescriptSql;
 function FormatDate(value: ShortString): ShortString;
 begin
 Result := copy (value,9,2) + '/'+ copy(value,6,2) + '/'+ copy(value,1,4);
 end;

 Function RemovePoint(value:ShortString):ShortString;
 Begin
  Result := value;
  If Pos('.',value) <> 0 then
  Result := copy(value, pos('.',value)+1, length(value));
 end;

var
  I,A, IniWhere : Shortint;
  Linha : ShortString;
  aux : Byte;
  AuxS: ShortString;

  Lista_Parametros : TStringList;
  Field : Shortint;
begin
if Table.SQL.Count = 0 then      Button3Click(Button3);

Lista.Clear;
IniWhere := 0;
Linha := '';

If POS(LowerCase('where'),LowerCase(Sql_Temp.Text)) = 0 then
exit
else
for i := 0 to Sql_Temp.Count -1 do
if  pos(LowerCase('where'),LowerCase(Sql_Temp[i])) <> 0 then
IniWhere := i;

if IniWhere = 0 then
Inc(IniWhere);

try
Lista_Parametros := TStringList.Create;

For i:= IniWhere to Sql_Temp.Count - 1 do
begin


 //criando os parametros
 Lista_Parametros.Clear;
 Linha := '';

 aux := 1;
 For a := 1 to length(Sql_Temp[i]) do
 if (Sql_Temp[i][a] = ' ') then
 begin
  Lista_Parametros.Add(copy(Sql_Temp[i],aux, a - aux));
  aux := a+1;
 end;
 Lista_Parametros.Add(copy(Sql_Temp[i],aux,length(Sql_Temp[i]) ));


 //criando a linha
 if Lista_Parametros[0] = 'or' then Linha := Linha + 'Ou '
 else                               Linha := Linha + ' E ';

 Field := -1;
 try
 Lista_Parametros[1] := RemovePoint(Lista_Parametros[1]);
 if Table.FieldByName(Lista_Parametros[1]) = nil then
 except
 Continue;
 end;

 Linha := linha +Table.FieldByName(Lista_Parametros[1]).DisplayLabel+' ';

//pegando a operação
 aux := 0;
 if Lista_Parametros[2] =    '=' then Linha := Linha + sIgual;
 if Lista_Parametros[2] =   '<>' then Linha := Linha + sDif;
 if Lista_Parametros[2] =    '>' then Linha := Linha + sMaior;
 if Lista_Parametros[2] =    '<' then Linha := Linha + sMenor;
 if LowerCase(Lista_Parametros[2]) = LowerCase('like') then aux := 1;

 if aux = 1 then
 begin
   if (Lista_Parametros[3][2] = '%') and (Lista_Parametros[3][length(Lista_Parametros[3])-1] = '%') then
   Linha := Linha + sCon
   else
   if (Lista_Parametros[3][2] = '%') then
   Linha := Linha + sTer
   else
   if (Lista_Parametros[3][length(Lista_Parametros[3])-1] = '%') then
   Linha := Linha + sIni
end;
//ok, agora vamos pegar o valor da pesquisa;
if Table.FieldByName(Lista_Parametros[1]) is TBooleanField then
if LowerCase(Lista_Parametros[3]) = LowerCase('true') then Lista_Parametros[3]:= 'Sim'
else                                                      Lista_Parametros[3]:= 'Não';

if (Lista_Parametros[3][1] = '#')     then Lista_Parametros[3] := copy(Lista_Parametros[3],2,length(Lista_Parametros[3])-1);
if (Lista_Parametros[3][1] = chr(39)) then Lista_Parametros[3] := copy(Lista_Parametros[3],2,length(Lista_Parametros[3])-1);
if (Lista_Parametros[3][1] = '%')     then Lista_Parametros[3] := copy(Lista_Parametros[3],2,length(Lista_Parametros[3])-1);
if (Lista_Parametros[3][length(Lista_Parametros[3])] = chr(39))then Lista_Parametros[3] := copy(Lista_Parametros[3],1,length(Lista_Parametros[3])-1);
if (Lista_Parametros[3][length(Lista_Parametros[3])] = '%')    then Lista_Parametros[3] := copy(Lista_Parametros[3],1,length(Lista_Parametros[3])-1);
if (Lista_Parametros[3][length(Lista_Parametros[3])] = '#')    then Lista_Parametros[3] := copy(Lista_Parametros[3],1,length(Lista_Parametros[3])-1);

// vamos procurar o municipio
if Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TBClientesMuniciopio.FieldName then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TBMunicipio.State in [dsinactive]) then banco.TBMunicipio.Open;
  if banco.TBMunicipio.Locate(banco.TBMunicipioCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TBMunicipioUF.Value+'-'+banco.TBMunicipioCidade.Value;
end;
//Situação
if Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_Pedidosituacao.FieldName then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_Situacao.State in [dsinactive]) then banco.TB_Situacao.Open;
  if banco.TB_Situacao.Locate(banco.TB_SituacaoCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_SituacaoDescri.Value;
end;
//setor
if Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_FuncionariosSetor.FieldName then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_Setor.State in [dsinactive]) then banco.TB_Setor.Open;
  if banco.TB_Setor.Locate(banco.TB_SetorCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_SetorDescricao.Value;
end;
//Unidade
if Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TBEstoqueUn.FieldName then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TBEstUn.State in [dsinactive]) then banco.TBEstUn.Open;
  if banco.TBEstUn.Locate(banco.TBEstUnCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TBEstUnSinb.Value+'-'+banco.TBEstUnDescri.Value;
end;
//tipo
if (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TBClientesLogr_Tipo.FieldName) or (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_FuncionariosLogr_Tipo.FieldName) then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TBLogra.State in [dsinactive]) then banco.TBLogra.Open;
  if banco.TBLogra.Locate(banco.TBLograCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TBLograTipo.Value;
end;
//fatura
if (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_PedidoFatura.FieldName) then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_FormaPagamento.State in [dsinactive]) then banco.TB_FormaPagamento.Open;
  if banco.TB_FormaPagamento.Locate(banco.TB_FormaPagamentocodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_FormaPagamentoForma.Value;
end;
//Parcelamentos
if (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_PedidoParcelamento.FieldName) then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_Parcelamento_Lista.State in [dsinactive]) then banco.TB_Parcelamento_Lista.Open;
  if banco.TB_Parcelamento_Lista.Locate(banco.TB_Parcelamento_ListaCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_Parcelamento_ListaDescricao.Value;
end;
//Portador
if (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_ContasPortador.FieldName) then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_Portador.State in [dsinactive]) then banco.TB_Portador.Open;
  if banco.TB_Portador.Locate(banco.TB_PortadorCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_PortadorDescricao.Value;
end;

//Tipo agenda
if (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_AgendaTipo.FieldName) then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_Agenda_Tipo.State in [dsinactive]) then banco.TB_Agenda_Tipo.Open;
  if banco.TB_Agenda_Tipo.Locate(banco.TB_Agenda_TipoCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_Agenda_TipoDescricao.Value;
end;
//Contato agenda
if (Table.FieldByName(Lista_Parametros[1]).FieldName = banco.TB_AgendaContato_Forma.FieldName) then
if Banco.IsInt(Lista_Parametros[3]) then
begin
  if (banco.TB_Agenda_Contato.State in [dsinactive]) then banco.TB_Agenda_Contato.Open;
  if banco.TB_Agenda_Contato.Locate(banco.TB_Agenda_ContatoCodigo.FieldName,Lista_Parametros[3],[]) then
  Lista_Parametros[3] := banco.TB_Agenda_ContatoDescricao.Value;
end;


if Table.FieldByName(Lista_Parametros[1]) is TDateTimeField then
Lista_Parametros[3] := FormatDate(Lista_Parametros[3]);



Linha := Linha + ' '+chr(39)+Lista_Parametros[3]+chr(39);

Lista.Lines.Add(Linha);



end;


Finally
  FreeAndNil(Lista_Parametros);
  PaintLista;
end;

end;





procedure TFPesquisa.PaintLista;
Var
  i,First : Integer;
begin
try
First := 0;
FOr i := 1 to length(Lista.Text) do
if Lista.Text[i] = chr(39) then
if First = 0 then
First := i
else
begin
  Lista.SelStart := First;
  Lista.SelLength:= i - First-1;
  Lista.SelAttributes.Color := clred;
  Lista.SelAttributes.Style := [fsItalic];
  First := 0;
end;
except
on e :exception do
ShowMessage(e.classname +'  > = '+e.Message);

end;

end;




procedure TFPesquisa.FormResize(Sender: TObject);
const
 largura = 10;
begin
ComboBox1.Width := (ClientWidth * 30) div 100;
ComboBox5.Left := ComboBox1.Left + ComboBox1.Width + largura;
Label8.left := combobox5.left;

Edit.Left := ComboBox5.Left + ComboBox5.Width + largura;
Edit.Width := ClientWidth - Edit.Left-largura;
Label9.Left := Edit.Left;
DataEdit.Left := Edit.Left;
DataEdit.Width := Edit.Width;
ComboBox3.Left := Edit.Left;
DBLookupComboBox1.Left := Edit.Left;

if ComboBox3.Visible then
begin
DBComboBox1.Left := ComboBox3.Left + 3 + ComboBox3.Width;
DBComboBox1.Width:= ClientWidth - largura - DBComboBox1.Left;
end
else
if DBLookupComboBox1.Visible then
begin
DBComboBox1.Left := DBLookupComboBox1.Left + 3 + DBLookupComboBox1.Width;
DBComboBox1.Width:= ClientWidth - largura - DBLookupComboBox1.Left - DBLookupComboBox1.Width;
end
else
begin
DBComboBox1.Left := Edit.Left;
DBComboBox1.Width:= Edit.Width;
end;

Button4.Left := ClientWidth - largura - Button4.Width;
Button6.Left := Button4.Left;

Button1.Left := ClientWidth - (largura*2) - Button1.Width;
Button2.Left := Button1.Left - largura - Button2.Width;
Button3.Left := Button2.Left - largura - Button3.Width;

Button1.Top := ClientHeight - largura - Button1.Height;
Button2.Top := ClientHeight - largura - Button2.Height;
Button3.Top := ClientHeight - largura - Button3.Height;

Lista.Width := Button4.left - lista.Left - largura;
Lista.Height := Button3.Top - Lista.Top - largura;



end;

procedure TFPesquisa.ListaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  aux : integer;
begin
Lista.ReadOnly := true;

  aux := (y+GetScrollPos(Lista.Handle,SB_VERT)) div 17;
  if (aux > -1) and (aux <= lista.Lines.Count -1) then
  begin
  Lista.SelStart := GetCaracters(lista.lines,aux-1);
  Lista.SelLength:= LENGTH(Lista.Lines[aux]);
  end

end;

procedure TFPesquisa.ListaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Lista.ReadOnly := false;
end;

procedure TFPesquisa.ListaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = vk_delete then Button6Click(Button6);

key := 0;

end;

procedure TFPesquisa.ListaKeyPress(Sender: TObject; var Key: Char);
begin
key :=#0;

end;

procedure TFPesquisa.DBLookupComboBox1Enter(Sender: TObject);
begin
DBLookupComboBox1.Width := DBLookupComboBox1.Width * 2;

end;

procedure TFPesquisa.DBLookupComboBox1Exit(Sender: TObject);
begin
DBLookupComboBox1.Width := DBLookupComboBox1.Width div 2;

end;

procedure TFPesquisa.DBLookupComboBox1Click(Sender: TObject);
begin
if DBLookupComboBox1.KeyValue = null then
exit;

  banco.TB_Parcelamento.Close;
  banco.TB_Parcelamento.SQL.Clear;
  banco.TB_Parcelamento.SQL.Add('Select * from tb_parcelamento');
  banco.TB_Parcelamento.SQL.Add('Where formaPagamento = '+IntToStr(DBLookupComboBox1.KeyValue));
  banco.TB_Parcelamento.open;

  DBComboBox1.KeyValue := null;
end;

procedure TFPesquisa.DBComboBox1Enter(Sender: TObject);
begin
if DBLookupComboBox1.Visible then
if DBLookupComboBox1.KeyValue = null then
DBLookupComboBox1.SetFocus;

end;

Function TFPesquisa.GetCaracters(ListaVal:TStrings;Posi:Smallint):integer;
begin
Result := 0;
while Posi <> -1 do
begin
  Result := result + length(ListaVal[posi])+2;
  Posi := Posi -1;
end;

end;

procedure TFPesquisa.Button6Click(Sender: TObject);
var
  Text_Temp : String;
  i : integer;
  length_temp:Integer;
  DeleteLine :Integer;

  LineWhere : integer;
begin

  length_temp:=Lista.SelLength;
  Text_Temp := copy(Lista.Lines.Text,Lista.SelStart+1,length_temp);
  DeleteLine := -1;

  For i := 0 to Lista.Lines.Count - 1 do
  if Lista.Lines[i] = Text_Temp then
  DeleteLine := i;

  if DeleteLine = -1 then
  begin
  MessageDlg('Selecione a linha para excluir',mtError,[mbok],0);
  exit;
  end;


  LineWhere := -1;
  for i := 0 to Sql_Temp.Count - 1do
  if pos(LowerCase('where'),LowerCase(Sql_Temp[i])) <> 0 then
  if LineWhere = -1 then
  LineWhere := i;


 if DeleteLine = 0 then
 if Sql_Temp.Count-1 >= (DeleteLine+LineWhere+1) then
 begin
  if LowerCase(copy(Sql_Temp[DeleteLine+LineWhere+1],1,3)) = 'and' then
  Sql_Temp[DeleteLine+LineWhere+1] := 'Where'+copy( Sql_Temp[DeleteLine+LineWhere+1],4,length(Sql_Temp[DeleteLine+LineWhere+1]))
  else
  Sql_Temp[DeleteLine+LineWhere+1] := 'Where'+copy( Sql_Temp[DeleteLine+LineWhere+1],3,length(Sql_Temp[DeleteLine+LineWhere+1]))
 end;


 Sql_Temp.Delete(DeleteLine+LineWhere);
 DescriptSql;

end;

end.
