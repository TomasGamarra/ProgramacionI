
Program ejercicio4;

Var num,inv,dig: integer;
Begin
  read (num);
  inv := 0;
  While (num <> 0) Do
    Begin
      dig := num Mod 10;
      inv := (inv *10)+dig;
      num := num Div 10;
    End;
  write('El numero es: ',inv);
End.
