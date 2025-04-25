
Program Descomponerrr;

Procedure Descomponer (num:integer);

Var dig,aux: integer;
  suma: integer;
Begin
  suma := 0;
  aux := num;
  While (aux > 9) Do
    Begin
      suma := 0;
      While (num <> 0) Do
        Begin
          dig := num Mod 10;
          num := num Div 10;
          suma := suma+dig;
        End;
      aux := suma;
      num := suma;
    End;
  Writeln('El numero obtenido es: ',   aux);
End;

Var num: integer;
Begin
  Writeln('Ingrese num a descomponer');
  Readln(num);
  Descomponer(num);
End.
