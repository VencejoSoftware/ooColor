seguir
unit ooColor.RGB.Greyscale;

interface

uses
  ooColor.RGB;

type
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
