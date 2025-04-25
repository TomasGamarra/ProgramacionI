
Program ejercicio1e;

Var num,dig,cantDig: integer;
Begin
  cantDig := 0;
  Repeat
    writeln('ingrese numero: ');
    Read (num);
    While (num<>0) Do
      Begin
        dig := num Mod 10;
        If (dig Mod 3=0)Then
          Begin
            WriteLn('el digito es multiplo de 3: ' ,dig);
          End;
        cantDig := cantDig+1;
        num := num Div 10;
      End;
  Until (cantDig >=4);
  WriteLn ('fin');
End.
