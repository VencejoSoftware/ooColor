unit MainForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,
  ooRGB, ooRGBConvert, ooRGBGreyscale, ooRGBHexadecimal;

type
  TMainForm = class(TForm)
    btnSelect: TButton;
    lblHex: TLabel;
    shpColor: TShape;
    ColorDialog1: TColorDialog;
    shpGreyscale: TShape;
    procedure btnSelectClick(Sender: TObject);
  end;

var
  NewMainForm: TMainForm;

implementation

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

procedure TMainForm.btnSelectClick(Sender: TObject);
var
  RGB: IRGB;
begin
  if ColorDialog1.Execute{$IFNDEF FPC}(Handle){$ENDIF} then
  begin
    RGB := TRGBTColor.New.FromValue(ColorDialog1.Color);
    shpColor.Brush.Color := ColorDialog1.Color;
    lblHex.Caption := '#' + TRGBHexadecimal.New.ToValue(RGB);
    shpGreyscale.Brush.Color := TRGBTColor.New.ToValue(TRGBGreyscale.New(RGB));
  end;
end;

end.
