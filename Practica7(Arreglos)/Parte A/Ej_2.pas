

{Un banco cuenta con 6 cajas. Implementar un programa que lea monto de los depó
sitos y nº de caja
hasta que se ingresa la caja con número 0. Acumule, para cada caja, el monto
total. Finalizada la
carga informar el nº de caja que más recaudó y el promedio de caja.}

Program Ej_2;

Const 
  cajas = 6;

Type 
  info = Record
    numcaja: 0..6;
    monto: real;
  End;
  vectormonto = Array [1..cajas] Of real;

Procedure InicializarVector ( Var m:vectormonto);

Var i: integer;
Begin
  For i:= 1 To cajas Do
    m[i] := 0;
End;

Procedure LeerDatos (Var d:info);
Begin
  Writeln('Ingrese numero de caja');
  Readln(d.numcaja);
  If (d.numcaja <> 0) Then
    Begin
      Writeln('Ingrese monto');
      Readln(d.monto);
    End;
End;

Procedure Sumar (Var m:vectormonto;d:info);
Begin
  m[d.numcaja] := m[d.numcaja] + d.monto;
End;

Procedure RecaudacionMaxima (m:vectormonto ; Var max:real;Var numcaja:integer);

Var i: integer;
Begin
  For i:= 1 To cajas Do
    Begin
      If (m[i] > max) Then
        Begin
          max := m[i];
          numcaja := i;
        End;
    End;
  Writeln('La caja con mayor recaudacion fue la caja numero: ',numcaja);
End;

Function PromediodeCaja (m:vectormonto): Real;

Var 
  total: real;
  i: integer;
Begin
  total := 0;
  For i:=1 To cajas Do
    total := total+ m[i];
  PromediodeCaja := (total/cajas);
End;

Var 
  m: vectormonto;
  datos: info;
  max1: real;
  numcaja: integer;
Begin
  max1 := -1;
  InicializarVector(m);
  LeerDatos(datos);
  While (datos.numcaja <> 0) Do
    Begin
      Sumar(m,datos);
      LeerDatos(datos);
    End;
  RecaudacionMaxima(m,max1,numcaja);
  Writeln('El promedio de caja es de: ',PromediodeCaja(m): 2: 2);
End.
