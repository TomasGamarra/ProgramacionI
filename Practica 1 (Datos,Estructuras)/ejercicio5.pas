
Program ejercicio5;

Const 
  botellas = 12;

Var 
  totV,min1,min2,max1,max2,volB: real;
  i,botellas2000: integer;
Begin
  max1 := -1;
  min1 := 10000;
  totV := 0;
  botellas2000 := 0;
  For i:= (1) To (botellas) Do
    Begin
      WriteLn('Ingrese Volumen de la botella: ');
      read (volB);
      totV := totV+volB;
      If (volB>max1) Then
        Begin
          max2 := max1;
          max1 := volB;
        End
      Else
        Begin
          If (volB>max2) Then
            Begin
              max2 := volB;
            End;
        End;
      If (volB<min1) Then
        Begin
          min2 := min1;
          min1 := volB;
        End
      Else
        Begin
          If (volB<min2) Then
            Begin
              min2 := volB;
            End;
        End;
      If (volB>2000)Then
        Begin
          botellas2000 := botellas2000+1;
        End;
    End;
  WriteLn('Promedio de volumen es: ',totV/botellas:2:2);
  WriteLn('Maximo 1 es: ',max1:2:2);
  Writeln('Maximo2 es: ' ,max2:2:2);
  WriteLn('Minimo 1 es: ',min1:2:2);
  WriteLn('Minimo2 es: ' ,min2:2:2);
  WriteLn('Promedio de botellas mayor a 2000: ',botellas2000*100/12:2:2);
  {Informar promedio de botellas con mas de 2000cm3}
End.
