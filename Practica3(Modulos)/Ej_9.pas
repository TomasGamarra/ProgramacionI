
Program Ej_9;
Procedure Evaluacion (secuencia:char);

Var carAnt: char;
  Palabras: integer;
Begin
  Palabras := 0;
  While (secuencia <> '.') And (secuencia <> ' ') Do
    Begin
      carAnt := secuencia;
      read (secuencia);
      If (carAnt='a') And (secuencia='p') Then
        Begin
          Palabras := Palabras+1;
          While (secuencia <> '.') And (secuencia <> ' ') Do
            Read (secuencia);
        End;
      While (secuencia=' ') Do
        read(secuencia);
    End;
  Writeln('La cantidad de palabras es de: ',Palabras)
End;

Var secuencia: char;
  Palabras: integer;
Begin
  writeln ('Ingrese la secuencia de caracateres: ');
  Read (secuencia);
  While (secuencia = ' ') Do
    read (secuencia);
  If (secuencia <> '.') Then
    Evaluacion(secuencia);
End.
