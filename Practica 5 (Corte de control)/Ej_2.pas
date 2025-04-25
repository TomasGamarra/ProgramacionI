
Program Ej_2;

Type 
  info = Record
    dni: integer;
    sueldo: real;
    dep: integer;
    suc: integer;
  End;

Procedure LeerInfo (Var d:info);
Begin
  Writeln('Ingresar numero de sucursal');
  Read(d.suc);
  If (d.suc <> -1) Then
    Begin
      Writeln('Ingresar numero de DEPTO');
      Readln(d.dep);
      Writeln('Ingresar SUELDO');
      Readln(d.sueldo);
      Writeln('Ingresar numero de DNI');
      Readln(d.dni);
    End;
End;

Procedure MayorSueldo (d:info ; Var max1:real; Var max2:real ; Var Dep1:integer
                       ; Var Dep2:integer; Var Suc1:integer ; Var Suc2:integer);
Begin
  If (d.sueldo > max1) Then
    Begin
      max2 := max1;
      max1 := d.sueldo;
      Dep1 := d.dep;
      Suc1 := d.suc;
    End
  Else
    Begin
      If (d.sueldo > max2) Then
        Begin
          max2 := d.sueldo;
          Dep2 := d.dep;
          Suc2 := d.suc;
        End;
    End;
End;

Procedure CalcSueldos (d:info ; Var Sueldo:real);
Begin
  Sueldo := Sueldo+d.sueldo;
End;

Var datos: info;
  ActDep,ActSuc: integer;
  Dep1,Dep2,Suc1,Suc2: integer;
  Sueldo: real;
  max1: real;
  max2: real;
Begin
  max1 := -1;
  max2 := -1;
  LeerInfo(datos);
  While (datos.suc <> -1) Do
    Begin
      ActSuc := datos.suc;
      Sueldo := 0;
      While (datos.suc <> -1) And (datos.suc = ActSuc) Do
        Begin
          ActDep := datos.dep;
          While (datos.suc <> -1) And (datos.suc =ActSuc) And (datos.dep =
                ActDep) Do
            Begin
              MayorSueldo(datos,max1,max2,Dep1,Dep2,Suc1,Suc2);
              CalcSueldos(datos,Sueldo);
              LeerInfo(datos);
            End;
        End;
      Writeln('La Sucursal: ',ActSuc,'tuvo un monto de sueldos de: ',Sueldo:2:
              2,
              '');
    End;
  Writeln('El dep con mayor mont de dinero fue el: ',Dep1,'de la sucursal: ',
          Suc1);
  Writeln('El dep con mayor mont de dinero fue el: ',Dep2);
  Writeln('de la sucursal: ',Suc2);
End.
