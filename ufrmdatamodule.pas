unit uFrmDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, ZConnection, ZDataset, ZSqlUpdate;

type

  { TFrmDataM }

  TFrmDataM = class(TDataModule)
    dsUsuarios: TDataSource;
    dsFormasPagamento: TDataSource;
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
    qrFormPagDESCRICAO: TStringField;
    qrFormPagID: TLongintField;
    qrFormPagPARCELAS: TSmallintField;
    qrFormPagTIPO: TStringField;
    qrFormPagVENCIMENTO: TLongintField;
    qrTipPagCODIGO: TLongintField;
    qrTipPagDESCRICAO: TStringField;
    qrTipPagTIPO: TStringField;
    qrUsuariosCODIGO: TLongintField;
    qrUsuariosNOME: TStringField;
    qrUsuariosSENHA: TStringField;
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
    qrFormPag: TZQuery;
    upFormPag: TZUpdateSQL;
    qrUsuarios: TZQuery;
    upUsuarios: TZUpdateSQL;
  private

  public

  end;

var
  FrmDataM: TFrmDataM;

implementation

{$R *.lfm}

{ TFrmDataM }






end.

