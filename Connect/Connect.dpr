program Connect;

uses
  Forms,
  UConnect in 'UConnect.pas' {Fprincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFprincipal, Fprincipal);
  Application.Run;
end.
