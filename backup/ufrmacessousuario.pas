unit uFrmAcessoUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  uFrmDataModule, uFrmPrincipal;

type

  { TFrmAcesso }

  TFrmAcesso = class(TForm)
    BtnAcesso: TButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnAcessoClick(Sender: TObject);
  private

  public

  end;

var
  FrmAcesso: TFrmAcesso;

implementation

{$R *.lfm}

{ TFrmAcesso }

procedure TFrmAcesso.BtnAcessoClick(Sender: TObject);
begin
     if edtUsuario.Text = '' then
        MessageDlg('Campo de usuário está em branco, verifique por gentileza!', mtInformation,[mbOK],0);
     if edtSenha.Text = '' then
        MessageDlg('Campo de senha está em branco, verifique por gentileza!', mtInformation,[mbOK],0);
     if edtUsuario.Text <> FrmDataM.qrUsuarios.FieldByName('Nome').AsString then
     begin
          MessageDlg('Campo usuario ou a senha estão incorreto, verifique por gentileza!', mtInformation,[mbOK],0);
          abort
     end;
     if edtSenha.Text = FrmDataM.qrUsuarios.FieldByName('Senha').AsString then
     begin
         ShowMessage('Bem Vindo ao sistema');
         FrmAcesso.Close;
         FrmPrincipal.Visible:=true;
     end
     else
         begin
         MessageDlg('Campo usuario ou a senha estão incorreto, verifique por gentileza!', mtInformation,[mbOK],0);
         abort
         end;

end;

end.

