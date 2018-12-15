{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit RGB_test;

interface

uses
  SysUtils,
  RGB,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TRGBTest = class sealed(TTestCase)
  strict private
    _RGB: IRGB;
  public
    procedure SetUp; override;
  published
    procedure RedIs100;
    procedure GreenIs110;
    procedure BlueIs120;
  end;

implementation

procedure TRGBTest.RedIs100;
begin
  CheckEquals(100, _RGB.Red);
end;

procedure TRGBTest.GreenIs110;
begin
  CheckEquals(110, _RGB.Green);
end;

procedure TRGBTest.BlueIs120;
begin
  CheckEquals(120, _RGB.Blue);
end;

procedure TRGBTest.SetUp;
begin
  inherited;
  _RGB := TRGB.New(100, 110, 120);
end;

initialization

RegisterTest(TRGBTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
