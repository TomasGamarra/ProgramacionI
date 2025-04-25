

Program Ej_2a;
Function Factorial (num:integer): integer;

Var i,fac,x: integer;
Begin
  x := 1;
  fac := 1;
  For i:= 1 To num Do
    Begin
      fac := fac*x;
      x := x+1;
    End;
  Factorial := fac;
End;

Var num: integer;
Begin
  Writeln('Ingrese el numero que quiere factorizar: ');
  read (num);
  Writeln('El Factorial es: ' , Factorial(num));
End.
