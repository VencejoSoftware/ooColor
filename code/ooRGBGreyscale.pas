{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Greyscale of RGB color
  @created(21/03/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooRGBGreyscale;

interface

uses
  ooRGB;

type
{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IRGB))
  Calculate a greyscale factor for RGB color
  @member(Red @seealso(IRGB.Red))
  @member(Green @seealso(IRGB.Green))
  @member(Blue @seealso(IRGB.Blue))
  @member(
    Create Object constructor
    @param(RGB RGB object to convert as greyscale)
  )
  @member(
    New Create a new @classname as interface
    @param(RGB RGB object to convert as greyscale)
  )
}
{$ENDREGION}
  TRGBGreyscale = class sealed(TInterfacedObject, IRGB)
  strict private
    _Factor: Byte;
  public
    function Red: Byte;
    function Green: Byte;
    function Blue: Byte;
    constructor Create(const RGB: IRGB);
    class function New(const RGB: IRGB): IRGB;
  end;

implementation

function TRGBGreyscale.Red: Byte;
begin
  Result := _Factor;
end;

function TRGBGreyscale.Green: Byte;
begin
  Result := _Factor;
end;

function TRGBGreyscale.Blue: Byte;
begin
  Result := _Factor;
end;

constructor TRGBGreyscale.Create(const RGB: IRGB);
begin
  _Factor := Round((0.30 * RGB.Red) + (0.59 * RGB.Green) + (0.11 * RGB.Blue));
end;

class function TRGBGreyscale.New(const RGB: IRGB): IRGB;
begin
  Result := TRGBGreyscale.Create(RGB);
end;

end.
