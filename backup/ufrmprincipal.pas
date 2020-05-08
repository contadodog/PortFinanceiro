unit uFrmPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Menus, uFrmClientes, uFrmTipoPagamento, uFrmUsuarios;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    BtnSair: TBitBtn;
    BtnClientes: TBitBtn;
    BtnReceber: TBitBtn;
    BtnPagar: TBitBtn;
    BtnRelatorios: TBitBtn;
    ImageList1: TImageList;
    Cadastros: TMenuItem;
    Clientes_Forne: TMenuItem;
    Financeiro: TMenuItem;
    MenuItem1: TMenuItem;
    MenuTipoPagamento: TMenuItem;
    MenuFormasPagamento: TMenuItem;
    MenuPrincipal: TMainMenu;
    Panel1: TPanel;
    procedure BtnClientesClick(Sender: TObject);
    procedure CadastrosClick(Sender: TObject);
    procedure Clientes_ForneClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuFormasPagamentoClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuTipoPagamentoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uFrmFormasPagamento, uFrmAcessoUsuario;

{$R *.lfm}

{ TFrmPrincipal }


procedure TFrmPrincipal.BtnClientesClick(Sender: TObject);
begin
     FrmClientes.ShowModal;
end;

procedure TFrmPrincipal.CadastrosClick(Sender: TObject);
begin

end;


procedure TFrmPrincipal.Clientes_ForneClick(Sender: TObject);
begin
  FrmClientes.ShowModal;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  FrmAcesso.ShowModal;
  FrmPrincipal.Visible:=false;
end;

procedure TFrmPrincipal.MenuFormasPagamentoClick(Sender: TObject);
begin
     FrmFormasPagamento.showModal;
end;

procedure TFrmPrincipal.MenuItem1Click(Sender: TObject);
begin
     FrmUsuarios.showModal;
end;

procedure TFrmPrincipal.MenuTipoPagamentoClick(Sender: TObject);
begin
  FrmTipoPagamento.showModal;
end;

procedure TFrmPrincipal.Image1Click(Sender: TObject);
begin

end;

end.

