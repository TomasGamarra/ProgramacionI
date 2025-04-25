
Program Ej_5b;

Type 
  todas = set Of char;
  vocales = set Of char;
  consonantes = set Of char;
Procedure LeerPalabras;

Var todass: todas;
  vocaless: vocales;
  consonantess: consonantes;
  car: char;
  cantCons,cantVoc,NumPalabra: integer;
Begin
  todass := ['a'..'z'];
  vocaless := ['a','e','i','o','u'];
  consonantess := todass - vocaless;
  cantCons := 0;
  cantVoc := 0;
  NumPalabra := 0;
  read (car);
  While (car = ' ') Do
    read (car);
  While (car <> '*') Do
    Begin
      cantCons := 0;
      cantVoc := 0;
      While (car <> ' ') And (car <> '*') Do
        Begin
          If (car In consonantess) Then
            cantCons := cantCons+1;
          If (car In vocaless) Then
            cantVoc := cantVoc+1;
          read (car);
          If (car= ' ') Then
            NumPalabra := NumPalabra+1;
          While (car = ' ') Do
            read (car);
        End;
      Writeln('Esta palabra tiene vocales: ',cantVoc);
      Writeln('Esta palabra tiene consonantes: ',cantCons);
    End;
End;
Begin
  Writeln('Ingrese secuencia de caractes: ');
  LeerPalabras;
End.
