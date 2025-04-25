
Program ejercicio5c;

Var 
  car,ant: char;
  carT,carA,Sa: integer;
Begin
  Write('Ingrese caracter: ');
  read (car);
  While (car=' ') Do
    read (car);
  carT := 0;
  carA := 0;
  Sa := 0;
  While (car <> '.') Do
    Begin
      If (car='A') Then
        carA := carA+1;
      carT := carT+1;
      ant := car;
      Read (car);
      If (ant='s') And (car='a') Then
        Sa := Sa+1;
    End;
  WriteLn('La Cantidad de Caracteres leidos es de: ',carT);
  WriteLn('La Cantidad de Caracteres A leidos es de: ',carA);
  WriteLn('La Cantidad de Caracteres s seguidos de la letra a es de: ',Sa);
End.
