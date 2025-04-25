
Program prueba1;

Var 
  Palabra,aux: String;
  Letra: char;
  i,distintos: integer;

Begin
  aux := Palabra;
  distintos := 0;
  For i:= 1 To Length(Palabra) Do
    Begin
      If (Letra <> Palabra[i]) Then
        Begin
          aux[i] := '_';
          distintos := distintos+1;
        End;
    End;
  If (distintos = Length(Palabra)) Then
    Errores := Errores+1;
End.
