unit uFrmContasAReceber;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls, DBGrids, DBDateTimePicker;

type

  { TFrmContasReceber }

  TFrmContasReceber = class(TForm)
    BtnLocalizarClienteDR: TBitBtn;
    BtnAltContasReceber: TBitBtn;
    BtnCanContasReceber: TBitBtn;
    BtnConContasReceber: TBitBtn;
    BtnExcContasReceber: TBitBtn;
    BtnImpContasReceber: TBitBtn;
    BtnIncContasReceber: TBitBtn;
    BtnLocalizarTipPag: TBitBtn;
    BtnLocalizarFormaPagamento: TBitBtn;
    BtnLocContasReceber: TBitBtn;
    BtnSairContasReceber: TBitBtn;
    DBGrid1: TDBGrid;
    edtStatus: TDBComboBox;
    edtNumParcDR: TDBEdit;
    edtValorDR: TDBEdit;
    edtNumDR: TDBEdit;
    edtClienteDR: TDBEdit;
    edtTipoDR: TDBEdit;
    edtFormDR: TDBEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    labelindicativa: TLabel;
    Valor: TLabel;
    Panel1: TPanel;
    procedure BtnAltContasReceberClick(Sender: TObject);
    procedure BtnCanContasReceberClick(Sender: TObject);
    procedure BtnConContasReceberClick(Sender: TObject);
    procedure BtnExcContasReceberClick(Sender: TObject);
    procedure BtnIncContasReceberClick(Sender: TObject);
    procedure BtnLocalizarFormaPagamentoClick(Sender: TObject);
    procedure BtnLocalizarTipPagClick(Sender: TObject);
    procedure BtnLocalizarClienteDRClick(Sender: TObject);
  private
         procedure habilitaEdicaoContasReceber(Status: boolean);
         procedure controlaBotoesContasReceber;
  public

  end;

var
  FrmContasReceber: TFrmContasReceber;

implementation

uses uFrmDataModule, ufrmlocalizaclientes, uFrmTipoPagamento,
  uFrmFormasPagamento;

{$R *.lfm}

{ TFrmContasReceber }

procedure TFrmContasReceber.BtnLocalizarClienteDRClick(Sender: TObject);
begin
  FrmLocalizaClientes.ShowModal;
end;

procedure TFrmContasReceber.controlaBotoesContasReceber;
begin
     BtnIncContasReceber.Enabled := not (FrmDataM.dsContasReceber.State in [dsInsert, dsEdit]);
     BtnExcContasReceber.Enabled := not (FrmDataM.dsContasReceber.DataSet.State in [dsInsert, dsEdit]);
     BtnAltContasReceber.Enabled := not (FrmDataM.dsContasReceber.State in [dsInsert, dsEdit]);
     BtnCanContasReceber.Enabled := (FrmDataM.dsContasReceber.State in [dsInsert, dsEdit]);
     BtnConContasReceber.Enabled := (FrmDataM.dsContasReceber.State in [dsInsert, dsEdit]);
end;

procedure TFrmContasReceber.habilitaEdicaoContasReceber(Status: boolean);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      begin
        TDBEdit(Components[i]).Enabled := Status;
        TDBEdit(Components[i]).Color := clWhite;
        TDBEdit(Components[i]).Font.Color := clBlack;
      end
    else if Components[i] is TDBComboBox then
      begin
        TDBComboBox(Components[i]).Enabled := Status;
        TDBComboBox(Components[i]).Color := clWhite;
        TDBComboBox(Components[i]).Font.Color := clBlack;
      end;
  end;
end;

procedure TFrmContasReceber.BtnLocalizarTipPagClick(Sender: TObject);
begin
  FrmTipoPagamento.ShowModal;
end;

procedure TFrmContasReceber.BtnLocalizarFormaPagamentoClick(Sender: TObject);
begin
  FrmFormasPagamento.ShowModal;
end;

procedure TFrmContasReceber.BtnIncContasReceberClick(Sender: TObject);
begin
     FrmDataM.dsContasReceber.DataSet.Insert;
     controlaBotoesContasReceber;
     habilitaEdicaoContasReceber(True);
end;

procedure TFrmContasReceber.BtnExcContasReceberClick(Sender: TObject);
begin
     if MessageDlg('Você deseja realmente excluir essa Fatura?', mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin
           FrmDataM.dsContasReceber.DataSet.Delete;
           controlaBotoesContasReceber;
           habilitaEdicaoContasReceber(False);
        end;
end;

procedure TFrmContasReceber.BtnAltContasReceberClick(Sender: TObject);
begin
     FrmDataM.dsContasReceber.DataSet.Edit;
     controlaBotoesContasReceber;
     habilitaEdicaoContasReceber(True);
end;

procedure TFrmContasReceber.BtnCanContasReceberClick(Sender: TObject);
begin
     FrmDataM.dsContasReceber.DataSet.Cancel;
     controlaBotoesContasReceber;
     habilitaEdicaoContasReceber(True);
end;

procedure TFrmContasReceber.BtnConContasReceberClick(Sender: TObject);
begin
     FrmDataM.dsContasReceber.DataSet.Post;
     controlaBotoesContasReceber;
     habilitaEdicaoContasReceber(False);
end;

{ TFrmContasReceber }



end.

