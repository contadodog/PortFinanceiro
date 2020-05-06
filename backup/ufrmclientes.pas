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
    procedure BtnIncClienteClick(Sender: TObject);
    procedure BtnLocClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure controlaBotoes;
    procedure habilitaEdicao(Status:Boolean);
  public

  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.lfm}

{ TFrmClientes }

procedure TFrmClientes.BtnAltClienteClick(Sender: TObject);
begin
    FrmDataM.dsPrincipal.DataSet.Edit;
    controlaBotoes;
    habilitaEdicao(True);
end;

procedure TFrmClientes.BtnCanClienteClick(Sender: TObject);
begin
      FrmDataM.dsPrincipal.DataSet.Cancel;
      controlaBotoes;
      habilitaEdicao(False);
end;

procedure TFrmClientes.BtnConClienteClick(Sender: TObject);
begin
      try
         begin
         FrmDataM.dsPrincipal.DataSet.Post;
         controlaBotoes;
         habilitaEdicao(False);
         end;
      Except
        FrmDataM.dsPrincipal.DataSet.Cancel;
        MessageDlg('Como não foi preenchido nenhum campo, o cadastro será cancelado',mtInformation,[mbOK],0);
      end;
end;

procedure TFrmClientes.BtnExcClienteClick(Sender: TObject);
begin
     if MessageDlg('Você deseja realmente excluir esse Cliente?', mtWarning,[mbYes,mbNo],0) = mrYes then
       begin
       FrmDataM.dsPrincipal.DataSet.Delete;
       controlaBotoes;
       habilitaEdicao(False);
       end;
end;

procedure TFrmClientes.BtnIncClienteClick(Sender: TObject);
begin
  FrmDataM.dsPrincipal.DataSet.Insert;
  controlaBotoes;
  habilitaEdicao(True);
end;

procedure TFrmClientes.BtnLocClienteClick(Sender: TObject);
begin
      controlaBotoes;
      habilitaEdicao(False);
      FrmLocalizaClientes.ShowModal;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  controlaBotoes;
  habilitaEdicao(False);
end;

procedure TFrmClientes.controlaBotoes;
begin
     BtnIncCliente.Enabled:= not (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnExcCliente.Enabled:= not (FrmDataM.dsPrincipal.DataSet.State in [dsInsert, dsEdit]);
     BtnAltCliente.Enabled:= not (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnLocCliente.Enabled:= not (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnCanCliente .Enabled:= (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
     BtnConCliente.Enabled:= (FrmDataM.dsPrincipal.State in [dsInsert, dsEdit]);
end;

procedure TFrmClientes.habilitaEdicao(Status: Boolean);

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

