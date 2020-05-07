unit uFrmContasAReceber;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls;

type

  { TFrmContasReceber }

  TFrmContasReceber = class(TForm)
    BtnAltCliente: TBitBtn;
    BtnCanCliente: TBitBtn;
    BtnConCliente: TBitBtn;
    BtnExcCliente: TBitBtn;
    BtnImpCliente: TBitBtn;
    BtnIncCliente: TBitBtn;
    BtnLocCliente: TBitBtn;
    BtnSairCliente: TBitBtn;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
  private

  public

  end;

var
  FrmContasReceber: TFrmContasReceber;

implementation

{$R *.lfm}

end.

