unit uFrmUsuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls, DBGrids, uFrmDataModule, db;

type

  { TFrmUsuarios }

  TFrmUsuarios = class(TForm)
    BtnAltUsuario: TBitBtn;
    BtnCanUsuario: TBitBtn;
    BtnConfUsuario: TBitBtn;
    BtnExcUsuario: TBitBtn;
    BtnIncUsuario: TBitBtn;
    BtnSairBtnAltUsuario: TBitBtn;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure BtnAltUsuarioClick(Sender: TObject);
    procedure BtnCanUsuarioClick(Sender: TObject);
    procedure BtnConfUsuarioClick(Sender: TObject);
    procedure BtnExcUsuarioClick(Sender: TObject);
    procedure BtnIncUsuarioClick(Sender: TObject);
  private
         procedure habilitaEdicaoCadasUsu(Status: Boolean);
         procedure controlaBotoesCadastUsuario;
  public

  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

{$R *.lfm}

{ TFrmUsuarios }

procedure TFrmUsuarios.BtnIncUsuarioClick(Sender: TObject);
begin
     FrmDataM.dsUsuarios.DataSet.Insert;
     controlaBotoesCadastUsuario;
     habilitaEdicaoCadasUsu(True);
end;

procedure TFrmUsuarios.BtnExcUsuarioClick(Sender: TObject);
begin
     FrmDataM.dsUsuarios.DataSet.Delete;
     controlaBotoesCadastUsuario;
     habilitaEdicaoCadasUsu(False);
end;

procedure TFrmUsuarios.BtnAltUsuarioClick(Sender: TObject);
begin
     FrmDataM.dsUsuarios.DataSet.Edit;
     controlaBotoesCadastUsuario;
     habilitaEdicaoCadasUsu(True);
end;

procedure TFrmUsuarios.BtnCanUsuarioClick(Sender: TObject);
begin
     FrmDataM.dsUsuarios.DataSet.Cancel;
     controlaBotoesCadastUsuario;
     habilitaEdicaoCadasUsu(False);
end;

procedure TFrmUsuarios.BtnConfUsuarioClick(Sender: TObject);
begin
     FrmDataM.dsUsuarios.DataSet.Post;
     controlaBotoesCadastUsuario;
     habilitaEdicaoCadasUsu(False);
end;



procedure TFrmUsuarios.habilitaEdicaoCadasUsu(Status: Boolean);
var
  i : integer;
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

procedure TFrmUsuarios.controlaBotoesCadastUsuario;
begin
     BtnIncUsuario.Enabled:= not (FrmDataM.dsUsuarios.State in [dsInsert, dsEdit]);
     BtnExcUsuario.Enabled:= not (FrmDataM.dsUsuarios.DataSet.State in [dsInsert, dsEdit]);
     BtnAltUsuario.Enabled:= not (FrmDataM.dsUsuarios.State in [dsInsert, dsEdit]);
     BtnCanUsuario.Enabled:= (FrmDataM.dsUsuarios.State in [dsInsert, dsEdit]);
     BtnConfUsuario.Enabled:= (FrmDataM.dsUsuarios.State in [dsInsert, dsEdit]);
end;

end.

