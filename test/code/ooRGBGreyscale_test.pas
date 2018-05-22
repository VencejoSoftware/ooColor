{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooRGBGreyscale_test;

interface

uses
  SysUtils,
  ooRGB,
  ooRGBGreyscale,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TRGBGreyscaleTest = class sealed(TTestCase)
  strict private
    _RGB: IRGB;
  public
    procedure SetUp; override;
  published
    procedure RedIs108;
    procedure GreenIs108;
    procedure BlueIs108;
  end;

implementation

procedure TRGBGreyscaleTest.RedIs108;
begin
  CheckEquals(108, _RGB.Red);
end;

procedure TRGBGreyscaleTest.GreenIs108;
begin
  CheckEquals(108, _RGB.Green);
end;

procedure TRGBGreyscaleTest.BlueIs108;
begin
  CheckEquals(108, _RGB.Blue);
end;

procedure TRGBGreyscaleTest.SetUp;
begin
  inherited;
  _RGB := TRGBGreyscale.New(TRGB.New(100, 110, 120));
end;

initialization

RegisterTest(TRGBGreyscaleTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
