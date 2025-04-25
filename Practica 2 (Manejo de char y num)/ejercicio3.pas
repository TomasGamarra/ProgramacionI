
Program ejercicio3;

Const numeros = 10;

Var i,suma,num,dig: integer;
Begin
  For i:= (1) To (numeros) Do
    Begin
      Suma := 0;
      WriteLn ('Ingrese un numero: ');
      read (num);
      While (num Div 10 <> 0) Do
        Begin
          dig := num Mod 10;
          num := num Div 10;
          Suma := Suma+dig;
        End;
      Suma := Suma+num;
      Writeln('La suma de sus cifras es de: ',Suma);
    End;
End.
