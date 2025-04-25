
Program ejercicio2;

Var num, max1, max2, dig,Unidades: integer;
Begin
  max1 := -1;
  max2 := -1;
  Unidades := 0;
  Writeln('Ingrese numero: ');
  Read (num);
  While (num <> 9999) And (num <> 0) Do
    Begin
      dig := num Mod 10;
      If (dig>max1) Then
        Begin
          max2 := max1;
          max1 := dig;
        End
      Else
        If (dig>max2) Then
          max2 := dig;
      If (num Div 10=0) Then
        Begin
          Unidades := Unidades + num ;
        End;
      num := num Div 10;
      If (num Div 10=0) Then
        Begin
          Writeln('El maximo 1 es de: ',max1);
          Writeln('El maximo 2 es de: ',max2);
          Writeln('La suma de las unidades es de: ',Unidades);
        End;
      read (num);
    End;
End.
