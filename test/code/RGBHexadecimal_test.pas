{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit RGBHexadecimal_test;

interface

uses
  SysUtils,
  Graphics,
  RGB, RGBHexadecimal,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TRGBHexadecimalTest = class sealed(TTestCase)
  published
    procedure ToValueReturnPurple;
    procedure FromValuePurple;
  end;

implementation

procedure TRGBHexadecimalTest.FromValuePurple;
var
  RGB: IRGB;
begin
  RGB := TRGBHexadecimal.New.FromValue('AD7FA8');
  CheckEquals(173, RGB.Red);
  CheckEquals(127, RGB.Green);
  CheckEquals(168, RGB.Blue);
end;

procedure TRGBHexadecimalTest.ToValueReturnPurple;
var
  RGB: IRGB;
  Value: TColorHex;
begin
  RGB := TRGB.New(173, 127, 168);
  Value := TRGBHexadecimal.New.ToValue(RGB);
  CheckTrue(Value = 'AD7FA8');
end;

initialization

RegisterTest(TRGBHexadecimalTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
