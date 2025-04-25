
Program ejercicio1a;

Var num,dig: integer;
Begin
  read (num);
  While (num<>0) Do
    Begin
      dig := num Mod 10;
      If (dig Mod 3=0) Then
        WriteLn('El digito: ',dig,'es multiplo de 3');
      num := num Div 10;
    End;
End.
