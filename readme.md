[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Build Status](https://travis-ci.org/VencejoSoftware/ooColor.svg?branch=master)](https://travis-ci.org/VencejoSoftware/ooColor)

# ooColor - Object pascal color library
Library to use RGB color and convert between formats

### Example of RGB definition
```pascal
var
  RGB: IRGB;
begin
  RGB := TRGB.New(100, 110, 120);
end;
```

### Example of RGB-TColor convert
```pascal
var
  RGB: IRGB;
  Value: TColor;
begin
  RGB := TRGBTColor.New.FromValue(clPurple);
...
  Value := TRGBTColor.New.ToValue(RGB);
end;
```

### Example of RGB-Hexadecimal convert
```pascal
var
  RGB: IRGB;
  Value: TColorHex;
begin
  RGB := TRGB.New(100, 110, 120);
  Value := TRGBHexadecimal.New.ToValue(RGB);
...
  RGB := TRGBHexadecimal.New.FromValue('AD7FA8');
end;
```

### Example of RGB to greyscale
```pascal
var
  Greyscale: IRGB;
begin
  Greyscale := TRGBGreyscale.New(TRGB.New(100, 110, 120));
end;
```

### Documentation
If not exists folder "code-documentation" then run the batch "build_doc". The main entry is ./doc/index.html

### Demo
Before all, run the batch "build_demo" to build proyect. Then go to the folder "demo\build\release\" and run the executable.

## Built With
* [Delphi&reg;](https://www.embarcadero.com/products/rad-studio) - Embarcadero&trade; commercial IDE
* [Lazarus](https://www.lazarus-ide.org/) - The Lazarus project

## Contribute
This are an open-source project, and they need your help to go on growing and improving.
You can even fork the project on GitHub, maintain your own version and send us pull requests periodically to merge your work.

## Authors
* **Alejandro Polti** (Vencejo Software team lead) - *Initial work*