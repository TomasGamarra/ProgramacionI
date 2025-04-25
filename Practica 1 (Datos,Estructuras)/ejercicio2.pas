
Program ejercicio2;

Var 
  cantan,hora,i: Integer;
  max1: Integer;
Begin
  max1 := -1;
  For i:=(1) To (24) Do
    Begin
      read (cantan);
      If (cantan > max1)Then
        Begin
          max1 := cantan;
          hora := i;
        End;
    End;
  writeln(max1);
  Writeln(hora);
End.
