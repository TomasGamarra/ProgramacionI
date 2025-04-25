7. * a) Escriba un procedimiento que lea la edad de una cantidad de personas y
devuelva el promedio
de estas. La cantidad de personas se recibe como parámetro.
b) Escriba un programa que procese la edad de 25 personas utilizando el módulo
desarrollado en a)
e informe el resultado.

Program Ej_7a;
Procedure Promedio(cantP:integer);

Var edad,Suma,i: integer;
  promedio: real;
Begin
  Suma := 0;
  For i:= 1 To cantP Do
    Begin
      writeln('Ingrese la edad');
      Read(edad);
      Suma := Suma+edad;
    End;
  promedio := (Suma /cantP);
  writeln('El promedio de edad es de: ',promedio: 2: 2);
End;

Var cantP: integer;
Begin
  writeln('Ingrese la cantidad de personas');
  Read (cantP);
  Promedio (cantP);
End.
