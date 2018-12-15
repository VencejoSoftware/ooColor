{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  RGB convert interfaces
  @created(21/03/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit RGBConvert;

interface

uses
  Graphics,
  RGB;

type
{$REGION 'documentation'}
{
  @abstract(Generic RGB representation convert interface)
  @member(
    ToValue Convert RGB object to generic value
    @param(RGB RGB representation)
    @return(Generic value)
  )
  @member(
    FromValue Convert generic value to RGB object
    @param(Value Generic value)
    @return(@link(IRGB RGB object))
  )
}
{$ENDREGION}
  IRGBConvert<T> = interface
    ['{D35A61F2-5D07-41BC-9953-C04B280F5501}']
    function ToValue(const RGB: IRGB): T;
    function FromValue(const Value: T): IRGB;
  end;

{$REGION 'documentation'}
{
  @abstract(Convert RGB to TColor and viceversa interface)
}
{$ENDREGION}

  IRGBTColor = interface(IRGBConvert<TColor>)
    ['{13805C76-7EF2-4094-8B4F-F9B9117300E9}']
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IRGBTColor))
  @member(ToValue @seealso(IRGBTColor.ToValue))
  @member(FromValue @seealso(IRGBTColor.FromValue))
  @member(New Create a new @classname as interface)
}
{$ENDREGION}

  TRGBTColor = class sealed(TInterfacedObject, IRGBTColor)
  public
    function ToValue(const RGB: IRGB): TColor;
    function FromValue(const Color: TColor): IRGB;
    class function New: IRGBTColor;
  end;

implementation

function TRGBTColor.FromValue(const Color: TColor): IRGB;
var
  SysColor: Longint;
begin
  SysColor := Graphics.ColorToRGB(Color);
  Result := TRGB.New(Byte(SysColor), Byte(SysColor shr 8), Byte(SysColor shr 16));
end;

function TRGBTColor.ToValue(const RGB: IRGB): TColor;
begin
  Result := (RGB.Blue shl 16) or (RGB.Green shl 8) or RGB.Red;
end;

class function TRGBTColor.New: IRGBTColor;
begin
  Result := TRGBTColor.Create;
end;

end.
