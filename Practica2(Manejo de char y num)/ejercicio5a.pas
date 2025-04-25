
Program ejercicio5a;

Var 
  car: char;
  carT: integer;
Begin
  Write('Ingrese caracter: ');
  read (car);
  While (car=' ') Do
    Begin
      read (car);
    End;
  carT := 0;
  While (car <> '.') Do
    Begin
      carT := carT+1;
      Read (car);
    End;
  Write('La Cantidad de Caracteres leidos es de: ',carT);
End.
