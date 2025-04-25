
Program ejercicio5b;

Var 
  car: char;
  carT,carA: integer;
Begin
  Write('Ingrese caracter: ');
  read (car);
  While (car=' ') Do
    read (car);
  carT := 0;
  carA := 0;
  While (car <> '.') Do
    Begin
      If (car='A') Then
        carA := carA+1;
      carT := carT+1;
      Read (car);
    End;
  Write('La Cantidad de Caracteres leidos es de: ',carT);
  Write('La Cantidad de Caracteres A leidos es de: ',carA);
End.
