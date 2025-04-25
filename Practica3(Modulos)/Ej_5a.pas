
Program Ej5;

Function Inverso (num,cant:integer): integer;

Var dig,inv,i: integer;
Begin
  inv := 0;
  For i:= 1 To cant Do
    Begin
      dig := num Mod 10;
      inv := (inv*10)+dig;
      num := num Div 10;
    End;
  Inverso := inv;
End;

Var num,cant: Integer;
Begin
  Writeln('Ingrese un numero y la cantidad de digitos que desea invertir');
  Read (num,cant);
  WriteLn(Inverso(num,cant));
End.
