
Program a;

Var num, max1, max2, dig,Unidades: integer;
Begin
  Writeln('Ingrese numero: ');
  Read (num);
  While (num <> 9999) Do
    Begin
      max1 := -1;
      max2 := -1;
      Unidades := 0;
      While (num <> 0) Do
        Begin
          dig := num Mod 10;
          If (dig>max1) Then
            Begin
              max2 := max1;
              max1 := dig;
            End
          Else
            If (dig>max2) Then
              Begin
                max2 := dig;
              End;
          num := num Div 10;
        End;
      Writeln('Ingrese numero: ');
      ReadLn(num);
    End;
  Writeln('El maximo 1 es de: ',max1);
  Writeln('El maximo 2 es de: ',max2);
  Writeln('La suma de las unidades es de: ',Unidades);
End.
