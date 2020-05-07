unit ufrmlocalizaclientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DBCtrls, Buttons, uFrmDataModule;

type

  { TFrmLocalizaClientes }

  TFrmLocalizaClientes = class(TForm)
    btnFiltroClientes: TBitBtn;
    cbxFiltro: TComboBox;
    DBGrid1: TDBGrid;
    EdtFiltro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnFiltroClientesClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private

  public

  end;

var
  FrmLocalizaClientes: TFrmLocalizaClientes;

implementation

uses uFrmClientes;

{$R *.lfm}

{ TFrmLocalizaClientes }

procedure TFrmLocalizaClientes.btnFiltroClientesClick(Sender: TObject);
begin
  FrmDataM.qrClientes.Close;
  FrmDataM.qrClientes.SQL.Clear;
  FrmDataM.qrClientes.sql.Add('select * from clientes where Nome like :pPesquisa');
  //FrmDataM.qrClientes.ParamByName('pFiltro').AsString:= cbxFiltro.Items.Strings[cbxFiltro.ItemIndex];
  FrmDataM.qrClientes.ParamByName('pPesquisa').AsString:= '%' + EdtFiltro.Text + '%';
  FrmDataM.qrClientes.Open;

end;

procedure TFrmLocalizaClientes.DBGrid1DblClick(Sender: TObject);
begin
     FrmClientes.edtNome.Text:= IntToStr(FrmDataM.qrClientes.FieldByName('ID').AsInteger);
     FrmClientes.edtNome.Text:= FrmDataM.qrClientes.FieldByName('NOME').AsString;
     FrmClientes.edtEndereco.Text:= FrmDataM.qrClientes.FieldByName('ENDERECO').Value;
     FrmClientes.edtTelefone.Text:= IntToStr(FrmDataM.qrClientes.FieldByName('TELEFONE').AsInteger);
     FrmClientes.edtTelefone2.Text:= IntToStr(FrmDataM.qrClientes.FieldByName('TELEFONE').AsInteger);
     FrmClientes.edtCidade.Text:= FrmDataM.qrClientes.FieldByName('CIDADE').AsString;
     FrmClientes.edtEstado.Text:= FrmDataM.qrClientes.FieldByName('ESTADO').AsString;
     FrmLocalizaClientes.close;
end;



end.

