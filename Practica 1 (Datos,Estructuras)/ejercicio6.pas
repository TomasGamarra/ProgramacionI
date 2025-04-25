
Program ejercicio6;

Var 
  Peso,PesoT,min1,max1,Promedio: Real;
  mesG,Emb: integer;
Begin
  PesoT := 0;
  Emb := 0;
  max1 := -1;
  min1 := 10000;
  Write('Escribir el mes de gestacion: ');
  Read (mesG);
  While (mesG>=0) Do
    Begin
      Write('Escribir el peso del bebe: ');
      read (Peso);
      PesoT := PesoT+Peso;
      Emb := Emb+1;
      If (Peso>max1) Then
        Begin
          max1 := Peso;
        End;
      If (Peso<min1) Then
        Begin
          min1 := Peso;
        End;
      Promedio := PesoT/Emb;
      If (mesG<5) Then
        Begin
          WriteLn ('El menor peso es de: ' ,min1:2:2);
          WriteLn('El promedio de peso es de: ' ,Promedio:2:2);
        End
      Else
        Begin
          If (mesG>=6) Then
            Begin
              WriteLn('El peso maximo es de: ' ,max1:2:2);
              WriteLn('El promedio es de: ' ,Promedio:2:2);
            End;
          Write('Escribir el mes de gestacion: ');
        End;
      Read (mesG);
    End;
End.
