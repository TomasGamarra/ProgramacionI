

Program Ej_7a;
Procedure Promedio(cantP:integer);

Const Personas = 25;

Var edad,Suma,i: integer;
  promedio: real;
Begin
  Suma := 0;
  For i:= 1 To Personas Do
    Begin
      writeln('Ingrese la edad');
      Read(edad);
      Suma := Suma+edad;
    End;
  promedio := (Suma /Personas);
  writeln('El promedio de edad es de: ',promedio: 2: 2);
End;

Var cantP: integer;
Begin
  Promedio (cantP);
End.
