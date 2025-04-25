
Program Ej_4B;

Type letras = set Of char;
Procedure ContarLetras (car:char; Var abecedario:letras);
Begin
  If (car In abecedario) Then
    abecedario := abecedario - [car];

End;
Procedure ImprimirResultado(abecedario:letras);

Var i : char;
Begin
  For i:= 'a' To 'z' Do
    Begin
      If ( i In abecedario) Then
        writeln(i);
    End;
End;

Var abecedario: letras;
  car: char;
Begin
  abecedario := ['a'..'z'];
  Read (car);
  While (car <> '#') Do
    Begin
      ContarLetras(car,abecedario);
      read (car);
    End;
  ImprimirResultado(abecedario);
End.
