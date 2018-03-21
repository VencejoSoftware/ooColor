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
unit ooColor.RGB.Hexadecimal;

interface

uses
  SysUtils,
  ooColor.RGB, ooColor.RGB.Convert;

type
{$REGION 'documentation'}
{
  @abstract(Native type for hexadecimal)
}
{$ENDREGION}
  THex = String[6];

{$REGION 'documentation'}
{
  @abstract(Convert RGB to hexadecimal and viceversa interface)
}
{$ENDREGION}

  IRGBConvertHex = interface(IRGBConvert<THex>)
    ['{0E2AC56C-3E31-4AA2-BD0F-634E778342AF}']
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IRGBConvertHex))
  @member(ToValue @seealso(IRGBConvertHex.ToValue))
  @member(FromValue @seealso(IRGBConvertHex.FromValue))
  @member(New Create a new @classname as interface)
}
{$ENDREGION}

  TRGBConvertHex = class sealed(TInterfacedObject, IRGBConvertHex)
  public
    function ToValue(const RGB: IRGB): THex;
    function FromValue(const Hex: THex): IRGB;
    class function New: IRGBConvertHex;
  end;

implementation

function TRGBConvertHex.FromValue(const Hex: THex): IRGB;
begin
  Result := TRGB.New(StrToInt('$' + Copy(Hex, 1, 2)), StrToInt('$' + Copy(Hex, 3, 2)), StrToInt('$' + Copy(Hex, 5, 2)));
end;

function TRGBConvertHex.ToValue(const RGB: IRGB): THex;
begin
  Result := IntToHex(RGB.Red, 2) + IntToHex(RGB.Green, 2) + IntToHex(RGB.Blue, 2);
end;

class function TRGBConvertHex.New: IRGBConvertHex;
begin
  Result := TRGBConvertHex.Create;
end;

end.
