
Program ejercicio1d;

Var num,dig: integer;
Begin
  read (num);
  While (num<>-1) Do
    Begin
      While (num<>0) Do
        Begin
          dig := num Mod 10;
          If (dig Mod 2=0) Then
            WriteLn (dig);
          num := num Div 10;
        End;
      Read (num);
    End;
End.
