library SysABase;

uses
  SysUtils,
  Classes;

{$R *.res}
COnst
  ListaModulo : Array[0..4] of String = ('Funcionário','Pedido','Estoque','Cliente','Agenda');
  ListaTipos  : Array[0..3] of String = ('Inserir','Editar','Deletar','Erro');

Function ModuloCount: Byte;stdcall;
begin
  Result := high(ListaModulo);
end;
Function GetModulo(index:byte): ShortString;stdcall;
begin
  if index > ModuloCount then
  Result := ''
  else
  Result := ListaModulo[index];
end;




Function TipoCount: Byte;stdcall;
begin
  Result := high(ListaTipos);
end;
Function GetTipo(index:byte): ShortString;stdcall;
begin
  if index > TipoCount then
  Result := ''
  else
  Result := ListaTipos[index];
end;


Exports
ModuloCount,GetModulo,TipoCount,GetTipo;


begin
end.
