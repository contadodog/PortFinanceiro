unit uFrmTipoPagamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls, DBGrids;

type

  { TFrmTipoPagamento }

  TFrmTipoPagamento = class(TForm)
    BtnAltTipoPag: TBitBtn;
    BtnCanTipoPag: TBitBtn;
    BtnConTipoPag: TBitBtn;
    BtnExcTipoPag: TBitBtn;
    BtnIncTipoPag: TBitBtn;
    BtnSairTipPag: TBitBtn;
    cbxTipoPag: TDBComboBox;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    EdtDescTipoPag: TDBEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure BtnAltTipoPagClick(Sender: TObject);
    procedure BtnCanTipoPagClick(Sender: TObject);
    procedure BtnConTipoPagClick(Sender: TObject);
    procedure BtnExcTipoPagClick(Sender: TObject);
    procedure BtnIncTipoPagClick(Sender: TObject);
  private
    procedure habilitaEdicaoTipPag(Status: boolean);
    procedure controlaBotoesTipoPag;
  public

  end;

var
  FrmTipoPagamento: TFrmTipoPagamento;

implementation

uses uFrmDataModule;

{$R *.lfm}

{ TFrmTipoPagamento }

procedure TFrmTipoPagamento.BtnIncTipoPagClick(Sender: TObject);
begin
  FrmDataM.dsTipoPagamento.DataSet.Insert;
  controlaBotoesTipoPag;
  habilitaEdicaoTipPag(True);
end;

procedure TFrmTipoPagamento.habilitaEdicaoTipPag(Status: boolean);
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

procedure TFrmTipoPagamento.controlaBotoesTipoPag;
begin
  BtnIncTipoPag.Enabled := not (FrmDataM.dsTipoPagamento.State in [dsInsert, dsEdit]);
  BtnExcTipoPag.Enabled := not (FrmDataM.dsTipoPagamento.DataSet.State in [dsInsert, dsEdit]);
  BtnAltTipoPag.Enabled := not (FrmDataM.dsTipoPagamento.State in [dsInsert, dsEdit]);
  BtnCanTipoPag.Enabled := (FrmDataM.dsTipoPagamento.State in [dsInsert, dsEdit]);
  BtnConTipoPag.Enabled := (FrmDataM.dsTipoPagamento.State in [dsInsert, dsEdit]);
end;

procedure TFrmTipoPagamento.BtnAltTipoPagClick(Sender: TObject);
begin
  FrmDataM.dsTipoPagamento.DataSet.Edit;
  controlaBotoesTipoPag;
  habilitaEdicaoTipPag(True);
end;

procedure TFrmTipoPagamento.BtnCanTipoPagClick(Sender: TObject);
begin
  FrmDataM.dsTipoPagamento.DataSet.Cancel;
  controlaBotoesTipoPag;
  habilitaEdicaoTipPag(False);
end;

procedure TFrmTipoPagamento.BtnConTipoPagClick(Sender: TObject);
begin
  FrmDataM.dsTipoPagamento.DataSet.Post;
  controlaBotoesTipoPag;
  habilitaEdicaoTipPag(False);
end;

procedure TFrmTipoPagamento.BtnExcTipoPagClick(Sender: TObject);
begin
  if MessageDlg('Você deseja realmente excluir esse Tipo de Pagamento?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    FrmDataM.dsTipoPagamento.DataSet.Delete;
    controlaBotoesTipoPag;
    habilitaEdicaoTipPag(False);
  end;
end;


end.
