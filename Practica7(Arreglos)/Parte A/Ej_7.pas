

Program Ej_7;

Const 
  dimL = 3;

Type 
  vectorconj = Array [1..dimL] Of char;
  vectorunion = Array ['a'..'z'] Of char;

Procedure Cargar (Var c1,c2:vectorconj);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Readln(c1[i]);
  For i:= 1 To dimL Do
    Readln(c2[i]);
End;

Function Pertenece (c:vectorconj;car:char): boolean;

Var exito: boolean;
  pos: integer;
Begin
  exito := false;
  pos := 1;
  While (pos <= dimL) And ( Not exito) Do
    Begin
      If (c[pos]=car)Then
        Begin
          exito := true;
        End
      Else
        Begin
          pos := pos+1;
        End;
    End;
  If (exito=true) Then
    Begin
      Pertenece := true;
    End
  Else
    Pertenece := false;
End;


Procedure Union (c1,c2:vectorconj;Var cU:vectorunion);

Var i: char;
Begin
  For i:= 'a' To 'z' Do
    Begin
      If (Pertenece(c1,i)) Or (Pertenece(c2,i))Then
        cU[i] := i;
    End;
End;

Procedure Diferencia (c1,c2:vectorconj;Var cD:vectorunion);

Var i: char;
Begin
  For i:= 'a' To 'z' Do
    If (Pertenece(c1,i) = true ) And ( Not Pertenece(c2,i) ) Then
      Begin
        cD[i] := i;
      End;
End;


Var conj1,conj2: vectorconj;
  conjU: vectorunion;
  conjD: vectorunion;
  i: char;
Begin
  Cargar(conj1,conj2);
  Union(conj1,conj2,conjU);
  For i:= 'a' To 'z' Do                 { esto tambien}
    Writeln('aaaaaa: ',conjU[i]); {verificar resultado , no va en el algoritmo}
  Diferencia(conj1,conj2,conjD);
  For i:= 'a' To 'z' Do
    Writeln('El conjunto diferencia es: ',conjD[i]);
End.
