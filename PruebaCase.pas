
Program Ej;

Type 
  Letras = set Of char;

Var car: char;
  l: Letras;
  i: integer;
Begin
  l := ['a','z'];
  For i:= 1 To 3 Do
    Begin
      writeln('Ingrese caracter');
      Readln(car);
      Case car Of 
        'a' :
              Begin
                writeln('A');
                If ( car In l) Then Writeln('Esta');
              End;
        'b': Writeln('B');
        'c': Writeln('C');
        Else
          Begin
            writeln('Lucho');
            writeln('Tomi');
            If (car = 'h') Then
              writeln('es H');
          End;
      End;
    End;
End.
