unit Ulista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, Buttons,ppClass,ppRelatv, ppComm,
  ppProd, ppReport, ppBands, ppCache, ppDesignLayer, ppParameter, ppPrnabl,
  ppCtrls,db;

type
  TFlista = class(TForm)
    Label1: TLabel;
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    Function Widthcaption(Txt:ShortString):Single;
    Function CalcFieldsWidth(Field:ShortString;Dataset:TDataSet):Single;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flista: TFlista;

implementation

uses UDados;

{$R *.dfm}

procedure TFlista.SpeedButton1Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox1.ItemIndex > 0 then
  begin
    Index := CheckListBox1.ItemIndex -1;
    CheckListBox1.Items.Move(CheckListBox1.ItemIndex, Index);
    CheckListBox1.ItemIndex := Index;
  end;
  CheckListBox1.SetFocus;
end;

procedure TFlista.SpeedButton2Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox1.ItemIndex in [0..CheckListBox1.Items.Count -2] then
  begin
    Index := CheckListBox1.ItemIndex +1;
    CheckListBox1.Items.Move(CheckListBox1.ItemIndex, Index);
    CheckListBox1.ItemIndex := Index;
  end;
  CheckListBox1.SetFocus;
end;

procedure TFlista.SpeedButton3Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox1.ItemIndex > 0 then
  begin
    Index := 0;
    CheckListBox1.Items.Move(CheckListBox1.ItemIndex, Index);
    CheckListBox1.ItemIndex := Index;
  end;
  CheckListBox1.SetFocus;
end;

procedure TFlista.SpeedButton4Click(Sender: TObject);
var
  Index :Integer;
begin
  if CheckListBox1.ItemIndex in [0..CheckListBox1.Items.Count -2] then
  begin
    Index := CheckListBox1.Items.Count -1;
    CheckListBox1.Items.Move(CheckListBox1.ItemIndex, Index);
    CheckListBox1.ItemIndex := Index;
  end;
  CheckListBox1.SetFocus;
end;

procedure TFlista.Button1Click(Sender: TObject);
var
     PPLabel:array[0..30] of TppLabel;
    PPDbText:array[0..30] of TppDBText;
  Desc,Campo:array[0..30] of String;
     Largura:Array[0..30] of single;
     MaxTxt :Array[0..30] of integer;
  Num_Fields, i : integer;
  DataSet : Tdataset;

  PaginaWidth:Integer;
  BordaLeft, BordaRigth : integer;

  JaMeidos,Medindo : Single;

begin
JaMeidos := 0;
Medindo := 0;
for i := 0 to 30 do
begin
Largura[i] := 0;
Desc[i] := '';
campo[i] := '';


end;

PaginaWidth := banco.Rp_funcionarios.DetailBand.spWidth;

DataSet := banco.TB_Funcionarios;
Num_Fields := 0;

for i := 0 to CheckListBox1.Items.Count - 1 do
if CheckListBox1.Checked[i] then
begin
   Desc[i] := CheckListBox1.Items[i];
  Campo[i] := DataSet.Fields[banco.SearchField(DataSet,CheckListBox1.Items[i],false) ].fieldname;//DataSet.Fields[i].FieldName;
Largura[i] := 30;
Inc(Num_Fields);
end;

for i := 0 to CheckListBox1.Items.Count - 1 do
if CheckListBox1.Checked[i] then
begin

PPLabel[i]         := TppLabel.Create(Banco.Rp_funcionarios.Bands[1]);
PPLabel[i].Band    := Banco.Rp_funcionarios.TitleBand;
PPLabel[i].Top     := 1;
PPLabel[i].Left    := StrToFloat('1,'+IntToStr(i*10));
PPLabel[i].Caption := desc[i];
largura[i]         := CalcFieldsWidth(campo[i],DataSet);
end;

for i := 0 to CheckListBox1.Items.Count - 1 do
if CheckListBox1.Checked[i] then
begin
JaMeidos := JaMeidos + largura[i];
if Largura[i] > 0 then
medindo := medindo + 1;
end;




ShowMessage('Total de Campos '+IntToStr(Num_Fields)+#13+'Medidos '+FloatToStr(Medindo)+#13'Page '+FloatToStr(JaMeidos)+' to '+FloatToStr(PaginaWidth));


//banco.ppImage1.Picture.Bitmap := banco.Empresa_Imagem.Bitmap;

banco.Rp_funcionarios.Print;



end;







function TFlista.Widthcaption(Txt: ShortString): Single;
var
  pplabel_ : TppLabel;
begin
try
pplabel_ := TppLabel.Create(self);
pplabel_.Caption := Txt;
pplabel_.AutoSize := true;
Result := pplabel_.Width;
Finally
FreeAndNil(pplabel_);
end;

end;

function TFlista.CalcFieldsWidth(Field: ShortString;
  Dataset: TDataSet): Single;
var
  NumField : integer;
  i : integer;
begin
NumField := -1;

For i := 0 to Dataset.Fields.Count -1 do
if Dataset.Fields[i].FieldName = Field then
NumField := Dataset.Fields[i].Index;


Result := 0;

if NumField = -1 then
exit;



Field := LowerCase(Field);

if (Dataset.Fields[NumField] is TDateTimeField) then
result := 81
else
if Field = LowerCase('cpf') then
result := 49
else
if field = LowerCase('cep') then
result := 77
else
if Dataset.Fields[NumField].Size = 2 then
result := 25
else
if Field = LowerCase('numero') then
result := 50
else
if Dataset.Fields[NumField].Size = 16 then
result := 76;




end;

end.
