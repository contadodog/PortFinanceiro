unit uFrmImpresaoClientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport, RLRichText,
  RLPDFFilter;

type

  { TFrmImpressaoClientes }

  TFrmImpressaoClientes = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
  private

  public

  end;

var
  FrmImpressaoClientes: TFrmImpressaoClientes;

implementation

uses uFrmDataModule;

{$R *.lfm}

{ TFrmImpressaoClientes }



{ TFrmImpressaoClientes }


end.

