{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooColor.RGB_test in '..\code\ooColor.RGB_test.pas',
  ooColor.RGB.Convert_test in '..\code\ooColor.RGB.Convert_test.pas',
  ooColor.RGB.Hexadecimal_test in '..\code\ooColor.RGB.Hexadecimal_test.pas';

{R *.RES}

begin
  Run;

end.
