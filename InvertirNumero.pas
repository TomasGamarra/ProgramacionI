
Program InvertirNumero;

Var num: integer;
  ult: integer;
  numInver: integer;
Begin
  numInver := 0;
  Writeln('Ingrese un numero a dar vuelta');
  Read(num);
  While (num <> 0) Do
    Begin
      ult := num Mod 10;
      numInver := (numInver * 10)+ult;
      num := num Div 10;
    End;
  Writeln(numInver);
End.
