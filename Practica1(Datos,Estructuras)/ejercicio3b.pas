
Program ejercicio3b;

Var 
  i,cantC,totH,cantH,Ciud,HabP: integer;
  Promedio,max1,min1: real;
Begin
  max1 := -1;
  min1 := 10000;
  totH := 0;
  For i:=(1) To (2) Do
    Begin
      HabP := 0;
      Writeln('Ingrese cantidad de ciudades: ');
      Read (cantC);
      For Ciud:=(1) To (cantC) Do
        Begin
          writeln('Ingrese cantidad de habitantes: ');
          Read (cantH);
          totH := totH + cantH ;
          HabP := HabP+cantH;
        End;
      Promedio := HabP/cantC;
      If (Promedio>max1)Then
        Begin
          max1 := Promedio;
        End;
      If (Promedio<min1) Then
        Begin
          min1 := Promedio;
        End;
    End;
  Writeln('El promedio por partido es: ');
  WriteLn(totH/135);
  Writeln('El promedio maximo es de: ');
  WriteLn(max1);
  Writeln('El promedio minimo es de: ');
  WriteLn(min1);
End.
