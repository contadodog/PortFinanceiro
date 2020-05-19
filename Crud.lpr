program Crud;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zplain, zcomponent, uFrmPrincipal, uFrmClientes,
  uFrmDataModule, ufrmlocalizaclientes, uFrmImpresaoClientes,
  uFrmContasAReceber, uFrmTipoPagamento, uFrmFormasPagamento, uFrmUsuarios,
  uFrmAcessoUsuario
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmClientes, FrmClientes);
  Application.CreateForm(TFrmDataM, FrmDataM);
  Application.CreateForm(TFrmLocalizaClientes, FrmLocalizaClientes);
  Application.CreateForm(TFrmImpressaoClientes, FrmImpressaoClientes);
  Application.CreateForm(TFrmContasReceber, FrmContasReceber);
  Application.CreateForm(TFrmTipoPagamento, FrmTipoPagamento);
  Application.CreateForm(TFrmFormasPagamento, FrmFormasPagamento);
  Application.CreateForm(TFrmUsuarios, FrmUsuarios);
  Application.CreateForm(TFrmAcesso, FrmAcesso);
  Application.Run;
end.

