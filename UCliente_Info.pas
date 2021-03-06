unit UCliente_Info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, StdCtrls, Buttons, DBCtrls, Mask, ppParameter,
  ppDesignLayer, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TFInfo_Cliente = class(TForm)
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel10: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppLabel27: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLine5: TppLine;
    ppMemo1: TppMemo;
    ppLabel28: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
  Procedure Print;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInfo_Cliente: TFInfo_Cliente;

implementation

uses UDados;

{$R *.dfm}





procedure TFInfo_Cliente.Print;
begin
  if Banco.TBClientes.RecordCount = 0 then
  exit;
  

  ppLabel10.Caption:= 'C?digo '+IntToStr(Banco.TBClientesCodigo.Value);

   ppLabel3.Caption :=Banco.Format_CNPJANDCPF(Banco.TBClientesCPF.Value,true);    //
   ppLabel26.Caption :='IE.: '+Banco.TBClientesIE.Value;
   If Banco.TBClientesIM.Value <> '' then
   ppLabel11.Caption :='IM.: '+Banco.TBClientesIM.Value;


  ppLabel2.Caption := 'Contato '+Banco.TBClientesNome.Value;
  ppLabel12.Caption :='Raz?o Social '+Banco.TBClientesNome_Razao.Value;


  ppLabel6.Caption := 'CEP '+Banco.FormataCEP(Banco.TBClientesCep.Value) +'     '+Banco.TBClientesUF.Value + ' - '+Banco.TBClientesCidade_Virtual.Value;



 ppLabel15.Caption := Banco.TBClientesLogTypeVirtual.Value +' '+ Banco.TBClientesLogradouro.Value;

  If Banco.TBClientesNumero.Value <> '' then
  ppLabel15.Caption := ppLabel15.Caption +', '+ Banco.TBClientesNumero.Value;
  If Banco.TBClientesComplemento.Value <> '' then
  ppLabel15.Caption := ppLabel15.Caption +', '+ Banco.TBClientesComplemento.Value;

  ppLabel19.Caption :='Bairro '+Banco.TBClientesBairro.Value;





   ppLabel20.Caption := 'Tel. Residencial.: '+Banco.FormataTel(Banco.TBClientesDDD_Res.Value,Banco.TBClientesTel_Res.Value);
   PPLabel22.Caption := 'Tel. Comercial...: '+Banco.FormataTel(Banco.TBClientesDDD_Come.Value,Banco.TBClientesTel_Come.Value);
   ppLabel24.Caption := 'Celular.: '+Banco.FormataTel(Banco.TBClientesDDD_Cel.Value, Banco.TBClientesTel_Cel.Value);
   ppLabel7.Caption  := 'Fax...: '+Banco.FormataTel(Banco.TBClientesDDD_Fax.Value,Banco.TBClientesTel_Fax.Value);

   ppLabel17.Caption := 'E-mail..: ' +Banco.TBClientesEmail.Value;
   
   ppMemo1.Lines.Add( Banco.TBClientesOBS.Value);

   ppLabel27.Caption :='Relat?rio gerado em '+DateToStr(date)+' '+FormatDateTime('HH:mm',time); 

   ppReport1.Print;
end;

end.
