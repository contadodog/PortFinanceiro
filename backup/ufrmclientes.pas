unit uFrmClientes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, MaskEdit, ActnList, uFrmDataModule, ufrmlocalizaclientes, db,
  DBCtrls;

type

  { TFrmClientes }

  TFrmClientes = class(TForm)
    BtnIncCliente: TBitBtn;
    BtnExcCliente: TBitBtn;
    BtnAltCliente: TBitBtn;
    BtnConCliente: TBitBtn;
    BtnCanCliente: TBitBtn;
    BtnImpCliente: TBitBtn;
    BtnSairCliente: TBitBtn;
    BtnLocCliente: TBitBtn;
    edtEstado: TDBComboBox;
    edtNome: TDBEdit;
    edtEndereco: TDBEdit;
    edtTelefone: TDBEdit;
    edtTelefone2: TDBEdit;
    edtCidade: TDBEdit;
    edtID: TDBEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    procedure BtnAltClienteClick(Sender: TObject);
    procedure BtnCanClienteClick(Sender: TObject);
    procedure BtnConClienteClick(Sender: TObject);
    procedure BtnExcClienteClick(Sender: TObject);
    procedure BtnImpClienteClick(Sender: TObject);
    procedure BtnIncClienteClick(Sender: TObject);
    procedure BtnLocClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //procedure controlaBotoes;
    //procedure habilitaEdicao(Status:Boolean);
  public
        procedure controlaBotoesClientes;
        procedure habilitaEdicaoClientes(Status:Boolean);
  end;

var
  FrmClientes: TFrmClientes;

implementation

uses uFrmImpresaoClientes;

{$R *.lfm}

{ TFrmClientes }

procedure TFrmClientes.BtnAltClienteClick(Sender: TObject);
begin
    FrmDataM.dsPrincipal.DataSet.Edit;
    controlaBotoesClientes;
    habilitaEdicaoClientes(True);
end;

procedure TFrmClientes.BtnCanClienteClick(Sender: TObject);
begin
      FrmDataM.dsPrincipal.DataSet.Cancel;
      controlaBotoesClientes;
      habilitaEdicaoClientes(False);
end;

procedure TFrmClientes.BtnConClienteClick(Sender: TObject);
begin
      try
         begin
         FrmDataM.dsPrincipal.DataSet.Post;
         controlaBotoesClientes;
         habilitaEdicaoClientes(False);
         end;
      Except
        MessageDlg('Como não foi preenchido nenhum campo, o cadastro será cancelado',mtInformation,[mbOK],0);
      end;
end;

procedure TFrmClientes.BtnExcClienteClick(Sender: TObject);
begin
     if MessageDlg('Você deseja realmente excluir esse Cliente?', mtWarning,[mbYes,mbNo],0) = mrYes then
       begin
       FrmDataM.dsPrincipal.DataSet.Delete;
       controlaBotoesClientes;
       habilitaEdicaoClientes(False);
       end;
end;

procedure TFrmClientes.BtnImpClienteClick(Sender: TObject);
begin
  FrmImpressaoClientes.RLReport1.Prepare;
  FrmImpressaoClientes.RLReport1.PreviewModal;

end;

procedure TFrmClientes.BtnIncClienteClick(Sender: TObject);
begin
  FrmDataM.dsPrincipal.DataSet.Insert;
  controlaBotoesClientes; ;
  habilitaEdicaoClientes(True);
end;

procedure TFrmClientes.BtnLocClienteClick(Sender: TObject);
begin
      controlaBotoesClientes;
      habilitaEdicaoClientes(False);
      FrmLocalizaClientes.ShowModal;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
    controlaBotoesClientes;
    habilitaEdicaoClientes(False);
end;

procedure TFrmClientes.controlaBotoesClientes;
begin
     BtnIncCliente.Enabled:= not (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnExcCliente.Enabled:= not (FrmDataM.dsPrincipal.DataSet.State in [dsInsert, dsEdit]);
     BtnAltCliente.Enabled:= not (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnLocCliente.Enabled:= not (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnCanCliente .Enabled:= (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnConCliente.Enabled:= (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
end;

procedure TFrmClientes.habilitaEdicaoClientes(Status: Boolean);

var
  i: integer;
begin
     for i := 0 to ComponentCount -1 do
     begin
       if Components[i] is TDBEdit then
          begin
               TDBEdit(Components[i]).Enabled:= Status;
               TDBEdit(Components[i]).Color:= clWhite;
               TDBEdit(Components[i]).Font.Color:=clBlack;
          end
       else if Components[i] is TDBComboBox then
          begin
               TDBComboBox(Components[i]).Enabled:= Status;
               TDBComboBox(Components[i]).Color:= clWhite;
               TDBComboBox(Components[i]).Font.Color:=clBlack;
          end;
     end;
end;


end.

