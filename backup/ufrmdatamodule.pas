unit uFrmDataModule;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, ZConnection, ZDataset, ZSqlUpdate;

type

  { TFrmDataM }

  TFrmDataM = class(TDataModule)
    dsParcelasReceber: TDataSource;
    dsContasReceber: TDataSource;
    FrmDataM: TDataSource;
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
    qrContasReceberCODIGO: TLongintField;
    qrContasReceberCODIGO_CLIENTE: TLongintField;
    qrContasReceberCODIGO_FORMA_PAGAMENTO: TLongintField;
    qrContasReceberCODIGO_TIPO_PAGAMENTO: TLongintField;
    qrContasReceberNUMERO_DOC_DR: TSmallintField;
    qrContasReceberPARCELAS: TLongintField;
    qrContasReceberSTATUS: TStringField;
    qrContasReceberVALOR: TFloatField;
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
    upContasReceber: TZUpdateSQL;
    qrContasReceber: TZQuery;
    qrParcelasReceber: TZQuery;
    qrParcelasReceberCODIGO: TLongintField;
    qrParcelasReceberCODIGO_CONTAS_RECEBER: TSmallintField;
    qrParcelasReceberDATA_VENCIMENTO: TDateField;
    qrParcelasReceberPARCELA: TLongintField;
    qrParcelasReceberVALOR: TLongintField;
    upParcelasReceber: TZUpdateSQL;
  private

  public

  end;

var
  FrmDataM: TFrmDataM;

implementation

uses ufrmlocalizaclientes;

{$R *.lfm}

{ TFrmDataM }






end.

