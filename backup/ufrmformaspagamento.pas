unit uFrmFormasPagamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  StdCtrls, DBCtrls, DBGrids;

type

  { TFrmFormasPagamento }

  TFrmFormasPagamento = class(TForm)
    BtnAltFormPag: TBitBtn;
    BtnCanFormPag: TBitBtn;
    BtnConFormPag: TBitBtn;
    BtnExcFormPag: TBitBtn;
    BtnIncFormPag: TBitBtn;
    BtnSairFormPag: TBitBtn;
    cbxDiasVencFormPag: TDBComboBox;
    cbxNParcFormPag: TDBComboBox;
    DBComboBox1: TDBComboBox;
    edtIdFormPag: TDBEdit;
    EdtDescFormPag: TDBEdit;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    procedure BtnAltFormPagClick(Sender: TObject);
    procedure BtnCanFormPagClick(Sender: TObject);
    procedure BtnConFormPagClick(Sender: TObject);
    procedure BtnExcFormPagClick(Sender: TObject);
    procedure BtnIncFormPagClick(Sender: TObject);
  private
         procedure habilitaEdicaoFormPag(Status: boolean);
         procedure controlaBotoesFormPag;
  public

  end;

var
  FrmFormasPagamento: TFrmFormasPagamento;

implementation

uses uFrmDataModule;

{$R *.lfm}

{ TFrmFormasPagamento }

procedure TFrmFormasPagamento.BtnIncFormPagClick(Sender: TObject);
begin
     FrmDataM.dsFormasPagamento.DataSet.Insert;
     controlaBotoesFormPag;
     habilitaEdicaoFormPag(True);
end;

procedure TFrmFormasPagamento.BtnAltFormPagClick(Sender: TObject);
begin
     FrmDataM.dsFormasPagamento.DataSet.Edit;
     controlaBotoesFormPag;
     habilitaEdicaoFormPag(True);
end;

procedure TFrmFormasPagamento.BtnCanFormPagClick(Sender: TObject);
begin
     FrmDataM.dsFormasPagamento.DataSet.Cancel;
     controlaBotoesFormPag;
     habilitaEdicaoFormPag(True);
end;

procedure TFrmFormasPagamento.BtnConFormPagClick(Sender: TObject);
begin
     FrmDataM.dsFormasPagamento.DataSet.Post;
     controlaBotoesFormPag;
     habilitaEdicaoFormPag(False);
end;

procedure TFrmFormasPagamento.BtnExcFormPagClick(Sender: TObject);
begin
    if MessageDlg('Você deseja realmente excluir essa Forma de Pagamento?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
         FrmDataM.dsFormasPagamento.DataSet.Delete;
         controlaBotoesFormPag;
         habilitaEdicaoFormPag(False);
    end;
end;

procedure TFrmFormasPagamento.habilitaEdicaoFormPag(Status: boolean);
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

procedure TFrmFormasPagamento.controlaBotoesFormPag;
begin
     BtnIncFormPag.Enabled:= not (FrmDataM.dsFormasPagamento.State in [dsInsert, dsEdit]);
     BtnExcFormPag.Enabled:= not (FrmDataM.dsFormasPagamento.DataSet.State in [dsInsert, dsEdit]);
     BtnAltFormPag.Enabled:= not (FrmDataM.dsFormasPagamento.State in [dsInsert, dsEdit]);
     BtnCanFormPag.Enabled:= (FrmDataM.dsFormasPagamento.State in [dsInsert, dsEdit]);
     BtnConFormPag.Enabled:= (FrmDataM.dsFormasPagamento.State in [dsInsert, dsEdit]);
end;

end.

