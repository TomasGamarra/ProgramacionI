
Program Ej5b;

Function Inverso (num:integer): integer;

Var cant,dig,inv,i: integer;
Begin
  If (num >= 10000) Then
    Begin
      cant := 5;
    End
  Else
    Begin
      cant := 3;
    End;
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
  Writeln ('Ingrese un numero');
  Read (num);
  While (num <> 0 ) Do
    Begin
      WriteLn(Inverso(num));
      Read (num);
    End;
End.
