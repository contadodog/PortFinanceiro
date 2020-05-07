unit uFrmDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, ZConnection, ZDataset, ZSqlUpdate;

type

  { TFrmDataM }

  TFrmDataM = class(TDataModule)
    dsTipoPagamento: TDataSource;
    dsPrincipal: TDataSource;
    dsClientes: TDataSource;
    conexao: TZConnection;
    qrClientesCIDADE: TStringField;
    qrClientesENDERECO: TStringField;
    qrClientesESTADO: TStringField;
    qrClientesID: TLongintField;
    qrClientesNOME: TStringField;
    qrClientesTELEFONE: TLongintField;
    qrClientesTELEFONE2: TLongintField;
    qrTipPagCODIGO: TLongintField;
    qrTipPagDESCRICAO: TLongintField;
    qrTipPagTIPO: TLongintField;
    tbClientes: TZQuery;
    tbClientesCIDADE: TStringField;
    tbClientesENDERECO: TStringField;
    tbClientesESTADO: TStringField;
    tbClientesID: TLongintField;
    tbClientesNOME: TStringField;
    tbClientesTELEFONE: TLongintField;
    tbClientesTELEFONE2: TLongintField;
    conexaoBD: TZConnection;
    qrClientes: TZQuery;
    upClientes: TZUpdateSQL;
    qrTipPag: TZQuery;
    upTipoPag: TZUpdateSQL;
  private

  public

  end;

var
  FrmDataM: TFrmDataM;

implementation

{$R *.lfm}

{ TFrmDataM }




end.

