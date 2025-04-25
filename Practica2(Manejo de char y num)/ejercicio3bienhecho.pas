
Program ejercicio3;

Var 
  i,numero,digito,suma,suma2,suma3,ultimovalor: integer;
Begin
  For i:=1 To 10 Do
    Begin
      suma := 0;
      read(numero);
      While (numero<>0) Do
        Begin
          digito := numero Mod 10;
          suma := suma+digito;
          numero := numero Div 10;
        End;
      ultimovalor := suma;
      writeln(suma);
      suma2 := 0;
      If (suma>=10) Then
        Begin
          While (suma<>0) Do
            Begin
              digito := suma Mod 10;
              suma2 := suma2+digito;
              suma := suma Div 10;
            End;
          ultimovalor := suma2;
          writeln(suma2);
        End;
      suma3 := 0;
      If (suma2>=10) Then
        Begin
          While (suma2<>0) Do
            Begin
              digito := suma2 Mod 10;
              suma3 := suma3+digito;
              suma2 := suma2 Div 10;
            End;
          ultimovalor := suma3;
          writeln(suma3);
        End;
    End;
End.
