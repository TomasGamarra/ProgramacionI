
Program Ej_5a;

Type 
  todas = set Of char;
  vocales = set Of char;
  consonantes = set Of char;
Procedure LeerPalabras;

Var todass: todas;
  vocaless: vocales;
  consonantess: consonantes;
  car: char;
  cantCons,cantVoc: integer;
Begin
  todass := ['a'..'z'];
  vocaless := ['a','e','i','o','u'];
  consonantess := todass - vocaless;
  cantCons := 0;
  cantVoc := 0;
  read (car);
  While (car <> ' ') And (car <> '*') Do
    Begin
      If (car In consonantess) Then
        cantCons := cantCons+1;
      If (car In vocaless) Then
        cantVoc := cantVoc+1;
      read (car);
    End;
  Writeln('La cantidad de vocales es de: ',cantVoc);
  Writeln('La cantidad de consonantes es de: ',cantCons);
End;
Begin
  Writeln('Ingrese secuencia de caractes: ');
  LeerPalabras;
End.
