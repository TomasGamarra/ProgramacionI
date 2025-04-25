
Program Ej_8;

Type 
  cadena25 = string[25];
  cien = 0..100;
  Info = Record
    NyA: cadena25;
    Cont: cadena25;
    Nota: cien;
  End;

Procedure LeerInfo(Var e:Info);
Begin
  Writeln('Ingrese nombre y apellido');
  Readln(e.NyA);
  If (e.NyA <> 'zzz') Then
    Begin
      Writeln('Ingrese Continente');
      Readln(e.Cont);
      Writeln('Ingrese Nota');
      Readln(e.Nota);
    End;
End;

Procedure CalcularMax (e:Info; Var max:integer; Var Participante:String);
Begin
  If (e.Nota > max) Then
    Begin
      max := e.Nota;
      Participante := e.NyA;
    End;
End;

Procedure AprobadosPro (e:Info; Var aprobados:integer ; Var promocionados:
                        integer);
Begin
  If (e.Nota > 70) And (e.Nota < 90) Then
    aprobados := aprobados+1;
  If (e.Nota >= 90) Then
    promocionados := promocionados+1;
End;

Procedure PromEur (e:info;Var prom:integer; Var alumnos:integer);
Begin
  prom := prom+e.Nota;
  alumnos := alumnos+1;
End;

Var aux: string;
  max,aprobados,promocionados,prom,alumnos: integer;
  examen: Info;
  Participante: string;
Begin
  max := -1;
  prom := 0;
  LeerInfo (examen);
  While (examen.NyA <> 'zzz') Do
    Begin
      aux := examen.Cont;
      aprobados := 0;
      alumnos := 0;
      promocionados := 0;
      While (examen.NyA <> 'zzz') And (aux = examen.Cont) Do
        Begin
          CalcularMax (examen,max,Participante);
          If (examen.Cont = 'Europa') Then
            PromEur(examen,prom,alumnos);
          LeerInfo(examen);
          AprobadosPro(examen,aprobados,promocionados);
        End;
      Writeln('la cantidad de aprobados fue de: ',aprobados);
      Writeln('la cantidad de promocionados fue de: ',promocionados);
    End;
  Writeln('El participante con mejor nota fue: ',Participante);
  Writeln('El Promedio de los europeos fue de : ',(prom/alumnos): 2: 2);
End.
