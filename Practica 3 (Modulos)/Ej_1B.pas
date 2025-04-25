
Program Ej_1B;
Function Potencia(num1,pot:integer): integer;

Var producto,i: integer;
Begin
  producto := 1;
  For i:= 1 To pot Do
    producto := producto * num1
End;

Var num1,pot: integer;
Begin
  writeln ('Ingrese el numero 1: ');
  read (num1);
  writeln ('Ingrese la potencia: ');
  read (pot);
  Writeln(Potencia (num1,pot));
End.
