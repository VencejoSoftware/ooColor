{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  RGB convert to hexadecimal and viceversa
  @created(21/03/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit RGBHexadecimal;

interface

uses
  SysUtils,
  RGB, RGBConvert;

type
{$REGION 'documentation'}
// @abstract(Native type for hexadecimal color)
{$ENDREGION}
  TColorHex = array [1 .. 6] of AnsiChar;

{$REGION 'documentation'}
{
  @abstract(Convert RGB to hexadecimal and viceversa interface)
  @member(
    FromStringValue Convert string value to RGB object
    @param(Text String value)
    @return(@link(IRGB RGB object))
  )
}
{$ENDREGION}

  IRGBHexadecimal = interface(IRGBConvert<TColorHex>)
    ['{0E2AC56C-3E31-4AA2-BD0F-634E778342AF}']
    function FromStringValue(const Text: AnsiString): IRGB;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IRGBHexadecimal))
  @member(ToValue @seealso(IRGBHexadecimal.ToValue))
  @member(FromValue @seealso(IRGBHexadecimal.FromValue))
  @member(FromStringValue @seealso(IRGBHexadecimal.FromStringValue))
  @member(New Create a new @classname as interface)
}
{$ENDREGION}

  TRGBHexadecimal = class sealed(TInterfacedObject, IRGBHexadecimal)
  public
    function ToValue(const RGB: IRGB): TColorHex;
    function FromValue(const Hex: TColorHex): IRGB;
    function FromStringValue(const Text: AnsiString): IRGB;
    class function New: IRGBHexadecimal;
  end;

implementation

function TRGBHexadecimal.FromStringValue(const Text: AnsiString): IRGB;
var
  Hex: TColorHex;
begin
  if Length(Text) < 1 then
    Hex := '000000'
  else
    Move(Text[1], Hex[1], Length(Text) * sizeof(AnsiChar));
  Result := FromValue(Hex);
end;

function TRGBHexadecimal.FromValue(const Hex: TColorHex): IRGB;
begin
  Result := TRGB.New(StrToInt('$' + Copy(String(Hex), 1, 2)), StrToInt('$' + Copy(String(Hex), 3, 2)),
    StrToInt('$' + Copy(String(Hex), 5, 2)));
end;

function TRGBHexadecimal.ToValue(const RGB: IRGB): TColorHex;
var
  Value: AnsiString;
begin
  Value := AnsiString(IntToHex(RGB.Red, 2) + IntToHex(RGB.Green, 2) + IntToHex(RGB.Blue, 2));
  Move(Value[1], Result[1], Length(Value) * sizeof(AnsiChar));
end;

class function TRGBHexadecimal.New: IRGBHexadecimal;
begin
  Result := TRGBHexadecimal.Create;
end;

end.
