
Program Ej_6;

Const Sucursales = 7;
  Meses = 12;

Type info = Record
  bicivend: integer;
  monto: real;
  bicidef: integer;
  montodef: real;
  mes: 1..12;
End;

Procedure LeerInfo (Var datos:info);
Begin
  Writeln('Ingresar bicis vendidas');
  Readln(datos.bicivend);
  Writeln('Ingresar monto');
  Readln(datos.monto);
  Writeln('Ingresar bicis defectuosas');
  Readln(datos.bicidef);
  Writeln('Ingresar monto');
  Readln(datos.montodef);
End;

Procedure Facturar (datos:info; Var Ingreso:real; Var Perdida:real);
Begin
  Ingreso := Ingreso + datos.monto;
  Perdida := Perdida +datos.montodef;
End;

Procedure CalcularGanMin (Ingreso:real ;Perdida:real; Var min:real; i:integer;
                          Var Sucursal:integer);

Var Ganancia: real;
Begin
  Ganancia := Ingreso - Perdida ;
  If (Ganancia < min) Then
    Begin
      min := Ganancia;
      Sucursal := i;
    End;
End;

Procedure MesMayVent (datos:info ; Var MejorMes:integer ;mes:integer;  Var max:
                      real);
Begin
  If (datos.monto > max) Then
    Begin
      max := datos.monto;
      MejorMes := mes;
    End;
End;

Procedure PromMarzo (datos:info; Var Recaudacion:real);
Begin
  Recaudacion := Recaudacion + (datos.monto - datos.montodef);
End;


Var Ingreso,Perdida,min,max,Recaudacion: real;
  i,mes,Sucursal,MejorMes: integer;
  datos: info;

Begin
  max := -1;
  min := 9999;
  Recaudacion := 0;
  For i:= 1 To Sucursales Do
    Begin
      Ingreso := 0;
      Perdida := 0;
      For mes:= 1 To Meses Do
        Begin
          LeerInfo(datos);
          Facturar(datos,Ingreso,Perdida);
          MesMayVent (datos,MejorMes,mes,max);
          If (mes=3)Then
            PromMarzo(datos,Recaudacion);
        End;
      CalcularGanMin(Ingreso,Perdida,min,i,Sucursal);
      Writeln('El mes en que mas vendio la sucursal: ',i,'fue el mes: ',MejorMes
      );
    End;
  Writeln('La sucursal con menor ganancia fue: ',Sucursal);
  Write('El promedio de recaudacion en  marzo fue de: ',(Recaudacion/Sucursales)
  : 2: 2
       );
End.
