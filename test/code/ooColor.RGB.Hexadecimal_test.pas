{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooColor.RGB.Hexadecimal_test;

interface

uses
  SysUtils,
  Graphics,
  ooColor.RGB, ooColor.RGB.Hexadecimal,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TRGBConvertHexTest = class sealed(TTestCase)
  published
    procedure ToValueReturnPurple;
    procedure FromValuePurple;
  end;

implementation

procedure TRGBConvertHexTest.FromValuePurple;
var
  RGB: IRGB;
begin
  RGB := TRGBConvertHex.New.FromValue('AD7FA8');
  CheckEquals(173, RGB.Red);
  CheckEquals(127, RGB.Green);
  CheckEquals(168, RGB.Blue);
end;

procedure TRGBConvertHexTest.ToValueReturnPurple;
var
  RGB: IRGB;
  Value: THex;
begin
  RGB := TRGB.New(173, 127, 168);
  Value := TRGBConvertHex.New.ToValue(RGB);
  CheckTrue(Value = 'AD7FA8');
end;

initialization

RegisterTest(TRGBConvertHexTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
