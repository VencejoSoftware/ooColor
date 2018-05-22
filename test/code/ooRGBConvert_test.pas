{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooRGBConvert_test;

interface

uses
  SysUtils,
  Graphics,
  ooRGB, ooRGBConvert,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TRGBTColorTest = class sealed(TTestCase)
  published
    procedure ToValueReturnPurple;
    procedure FromValuePurple;
  end;

implementation

procedure TRGBTColorTest.FromValuePurple;
var
  RGB: IRGB;
begin
  RGB := TRGBTColor.New.FromValue(clPurple);
  CheckEquals(128, RGB.Red);
  CheckEquals(0, RGB.Green);
  CheckEquals(128, RGB.Blue);
end;

procedure TRGBTColorTest.ToValueReturnPurple;
var
  RGB: IRGB;
  Value: TColor;
begin
  RGB := TRGB.New(128, 0, 128);
  Value := TRGBTColor.New.ToValue(RGB);
  CheckTrue(Value = clPurple);
end;

initialization

RegisterTest(TRGBTColorTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
