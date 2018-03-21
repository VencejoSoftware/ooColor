{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooColor.RGB.Convert_test;

interface

uses
  SysUtils,
  Graphics,
  ooColor.RGB, ooColor.RGB.Convert,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TRGBConvertTColorTest = class sealed(TTestCase)
  published
    procedure ToValueReturnPurple;
    procedure FromValuePurple;
  end;

implementation

procedure TRGBConvertTColorTest.FromValuePurple;
var
  RGB: IRGB;
begin
  RGB := TRGBConvertTColor.New.FromValue(clPurple);
  CheckEquals(128, RGB.Red);
  CheckEquals(0, RGB.Green);
  CheckEquals(128, RGB.Blue);
end;

procedure TRGBConvertTColorTest.ToValueReturnPurple;
var
  RGB: IRGB;
  Value: TColor;
begin
  RGB := TRGB.New(128, 0, 128);
  Value := TRGBConvertTColor.New.ToValue(RGB);
  CheckTrue(Value = clPurple);
end;

initialization

RegisterTest(TRGBConvertTColorTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
