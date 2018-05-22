{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program demo;

uses
  Forms,
  Interfaces,
  MainForm in '..\code\form\MainForm.pas';

{$R *.res}

begin
{$ifopt D+}
  SetHeapTraceOutput('heaptrace.log');
{$endif}
  Application.Initialize;
  Application.CreateForm(TMainForm, NewMainForm);
  Application.Run;

end.
