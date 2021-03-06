library SysConf;
 {Created by Fazzioni}
uses
  SysUtils,
  NB30,
  Classes,
  forms,
  IdIPWatch,
  Encryp in 'Encryp.pas';

{$R *.res}
Const
  Key = 'Fazzi';


function GetAdapterInfo(Lana: Char): String;
var
 Adapter: TAdapterStatus;
 NCB: TNCB;
begin
 FillChar(NCB, SizeOf(NCB), 0);
 NCB.ncb_command := Char(NCBRESET);
 NCB.ncb_lana_num := Lana;
 if Netbios(@NCB) <> Char(NRC_GOODRET) then
 begin
   Result := '00-00-00-00-00-00';
   Exit;
 end;
 FillChar(NCB, SizeOf(NCB), 0);
 NCB.ncb_command := Char(NCBASTAT);
 NCB.ncb_lana_num := Lana;
 NCB.ncb_callname := '*';
 FillChar(Adapter, SizeOf(Adapter), 0);
 NCB.ncb_buffer := @Adapter;
 NCB.ncb_length := SizeOf(Adapter);
 if Netbios(@NCB) <> Char(NRC_GOODRET) then
 begin
   Result := '00-00-00-00-00-00';
   Exit;
 end;
 Result :=
   IntToHex(Byte(Adapter.adapter_address[0]), 2) + '-' +
   IntToHex(Byte(Adapter.adapter_address[1]), 2) + '-' +
   IntToHex(Byte(Adapter.adapter_address[2]), 2) + '-' +
   IntToHex(Byte(Adapter.adapter_address[3]), 2) + '-' +
   IntToHex(Byte(Adapter.adapter_address[4]), 2) + '-' +
   IntToHex(Byte(Adapter.adapter_address[5]), 2);
end;
function GetMACAddress: string;
var
 AdapterList: TLanaEnum;
 NCB: TNCB;
begin
 FillChar(NCB, SizeOf(NCB), 0);
 NCB.ncb_command := Char(NCBENUM);
 NCB.ncb_buffer := @AdapterList;
 NCB.ncb_length := SizeOf(AdapterList);
 Netbios(@NCB);
 if Byte(AdapterList.length) > 0 then
   Result := GetAdapterInfo(AdapterList.lana[0])
 else
   Result := '00-00-00-00-00-00';
end;

Function Encript(Value:ShortString):ShortString;stdcall;
var
  CriptComonent : TTomEncryption;
  Form : TForm;
begin
Result := '';
try
  Form := TForm.Create(nil);
  Form.Visible := false;
  try
    CriptComonent := TTomEncryption.Create(Form);
    CriptComonent.Action := atEncryption;
    CriptComonent.Input := Value;
     try
     CriptComonent.Execute;
     Result := CriptComonent.Output;
     except
     result := '';
     end;
  Finally
    FreeAndNil(CriptComonent);
  end;
finally
  FreeAndNil(Form);
end;
end;

Function Descript(Value:ShortString):ShortString;stdcall;
var
  CriptComonent : TTomEncryption;
  Form : TForm;
begin
Result := '';
try
  Form := TForm.Create(nil);
  Form.Visible := false;
  try
    CriptComonent := TTomEncryption.Create(Form);
    CriptComonent.Action := atDecryption;
    CriptComonent.Input := Value;
     try
     CriptComonent.Execute;
     Result := CriptComonent.Output;
     except
     result := '';
     end;
  Finally
    FreeAndNil(CriptComonent);
  end;
finally
  FreeAndNil(Form);
end;
end;


Function GetMac : ShortString; stdcall;
begin
   Result := '00-00-00-00-00-00';
 Result := GetMACAddress;
end;

Function GetIp:ShortString; stdcall;
var 
r : TIdIPWatch;
begin
 Result := '0.0.0.0';
 r := TIdIPWatch.Create(nil);
 Result := r.LocalIP;
 r.free; 
end;


exports
getmac, getip, Encript,Descript;

begin
end.
