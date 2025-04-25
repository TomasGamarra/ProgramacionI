
Program ejercicio8;

Var 
  car: char;
  carT,cantP: integer;
Begin
  carT := 0;
  cantP := 0;
  WriteLn('Ingrese');
  Repeat
    read (car);
    While (car=' ') Do
      Begin
        carT := carT+1;
        read (car);
      End;
    While (car <> ' ') And (car <> 'z') And (carT<500) Do
      Begin
        carT := carT+1;
        Read (car);
      End;
    If (car=' ') Or (car='z')Then
      Begin
        cantP := cantP+1;
        carT := carT+1;
      End;
  Until (carT=500) Or (car='z');
  Writeln('La cantidad de palabras es de: ',cantP);
  Writeln('La cantidad de caracteres es de: ',carT);
End.
