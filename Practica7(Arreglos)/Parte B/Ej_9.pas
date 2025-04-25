Program Ej_9;

Type 
  Color = Record
    r: integer;
    g: integer;
    b: integer;
  End;

  ImagenRGB = Record
    ancho: integer;
    alto: integer;
    datos: array[1..1024, 1..1024] Of Color;
  End;






{a) Implemente módulos que permitan
copiar el contenido de una imagen en otra.
rotar 90 grados una imagen.
“espejar” horizontalmente una imagen.}

Procedure Copiar (imag1:ImagenRGb;imag2:ImagenRGB);

Var i,j: Integer;
Begin
  For i:= 1 To imag1.ancho Do
    For j:=1 To imag1.alto Do
      imag2.datos[i,j] := imag1.datos[i,j];
  imag2.ancho := imag1.ancho;
  imag2.alto := imag1.alto;
End;

Procedure Rotar90 (imag1,imag2:ImagenRGB);

Var 
Begin
  imag2.ancho:=imag1.alto;
  imag2.alto:=imag1.ancho;
  For i:= 1 To imag1.ancho Do
    For j:= 1 To imag1.alto Do
      imag2.datos[i,num] := imag1[i,j];

End;
