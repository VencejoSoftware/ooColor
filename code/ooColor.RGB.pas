{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Red green and blue color representation
  @created(21/03/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooColor.RGB;

interface

type
{$REGION 'documentation'}
{
  @abstract(Red green and blue color representation)
  @member(Red Red value)
  @member(Green Green value)
  @member(Blue Blue value)
}
{$ENDREGION}
  IRGB = interface
    ['{8251D725-0A18-47D7-81BE-F7C26D4260EC}']
    function Red: Byte;
    function Green: Byte;
    function Blue: Byte;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IRGB))
  @member(Red @seealso(IRGB.Red))
  @member(Green @seealso(IRGB.Green))
  @member(Blue @seealso(IRGB.Blue))
  @member(
    Create Object constructor
    @param(Red Red value)
    @param(Green Green value)
    @param(Blue Blue value)
  )
  @member(
    New Create a new @classname as interface
    @param(Red Red value)
    @param(Green Green value)
    @param(Blue Blue value)
  )
}
{$ENDREGION}

  TRGB = class sealed(TInterfacedObject, IRGB)
  strict private
    _Red, _Green, _Blue: Byte;
  public
    function Red: Byte;
    function Green: Byte;
    function Blue: Byte;
    constructor Create(const Red, Green, Blue: Byte);
    class function New(const Red, Green, Blue: Byte): IRGB;
  end;

implementation

function TRGB.Red: Byte;
begin
  Result := _Red;
end;

function TRGB.Green: Byte;
begin
  Result := _Green;
end;

function TRGB.Blue: Byte;
begin
  Result := _Blue;
end;

constructor TRGB.Create(const Red, Green, Blue: Byte);
begin
  _Red := Red;
  _Green := Green;
  _Blue := Blue;
end;

class function TRGB.New(const Red, Green, Blue: Byte): IRGB;
begin
  Result := TRGB.Create(Red, Green, Blue);
end;

end.
