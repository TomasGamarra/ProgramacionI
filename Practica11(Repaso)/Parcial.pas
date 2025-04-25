
Program Parcial;

Type 

  hs = Record
    horas: 1..24;
    min: 1..60;
  End;
  fe = Record
    dia: 1..31;
    mes: 1..12;
    ano: 2022..2023;
  End;

  funcion = Record
    codigo: integer;
    codigoSala: 1..550;
    fecha: fe;
    hora: hs;
    codigoPais: 1..25;
    codigoPelicula: 1..350;
    entradasVend: integer;
  End;

  Lista = ^nodo;
  nodo = Record
    datos: funcion;
    sig: Lista;
  End;

  vectorpeli = Array[1..350] Of string;

  Tabla = Array[1..25,1..350] Of real;

  vectormontopeli = Array [1..350] Of real;

  Maximo = Record
    codigoSala: 1..550;
    fecha: fe;
    hora: hs;
    cantEntradas: integer;
  End;

Procedure AgregarOrdenado (Var L1;F:funcion);

Var nue,act,ant: Lista;
Begin
  New(nue);
  nue^.datos := F;
  act := L1;
  ant := L1;
  While (act <> Nil) And (act^.datos.codigo < F.codigo) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    L1 := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;


Function Cumple (numero:integer): Boolean;

Var dig: integer;
  suma: integer;
Begin
  suma := 0;
  While ( numero <> 0) Do
    Begin
      dig := numero Mod 10;
      numero := numero Div 10;
      suma := suma+dig;
    End;
  If (suma Mod 2 = 0) Then
    Cumple := true
  Else
    Cumple := false;
End;


Procedure CalculoMaximoDeEntradas (Var Max:Maximo;F:funcion);
Begin
  If (F.entradasVend > Max.cantEntradas) Then
    Begin
      Max.codigoSala := F.codigoSala;
      Max.fecha := F.fecha;
      Max.hora := F.hora;
    End;
End;

Procedure InformarD (Max:Maximo);

Var 
Begin
  writeln('El codigo de la funcion que mas entradas vendio es: ',   Max.codigoSala);
  writeln('La fecha de la funcion que mas entradas vendio es: ',   Max.fecha.dia  ,   Max.fecha.mes    , Max.fecha.ano);
  writeln('La hora de la funcion que mas entradas vendio es: ',   Max.hora.horas ,   Max.hora.min    );
End;

Procedure RecorrerLista (L:Lista;Var L1:Lista;Var V:vectormontopeli; M:matriz;Var Max:Maximo);

Var entradas: integer;
Begin
  writeln('Ingrese el valor de la cantidad de entradas minimo para la nueva lista: ');
  Readln(entradas);
  While (L <> Nil) Do
    Begin
      If (L^.datos.entradasVend > entradas) Then  {a}
        AgregarOrdenado(L1,L^.datos);
      If (Cumple(L^.datos.codigo))Then {b}
        writeln('El codigo que suma digitos pares es: ',    L^.datos.codigo );
      V[L^.datos.codigo] := V[L^.datos.codigo] + M[L^.datos.codigoPais,L^.datos.codigoPelicula]; {c}
      CalculoMaximoDeEntradas(Max,L^.datos);
      L: L^.sig;
    End;
End;


Procedure InformarC (V:vectormontopeli;Vpeli:vectorpeli);

Var j: integer;
Begin
  For j:=1 To 350 Do
    writeln('El monto recaudado por la pelicula ', Vpeli[j] , 'es de: ',   V[j]);
End;

Procedure InicializarVector (Var V:vectormontopeli);

Var i: integer;
Begin
  For i:= 1 To 350 Do
    V[i] := 0;
End;


Procedure LiberarMemoria (Var pri:Lista);

Var aux: Lista;
Begin
  aux := pri;
  While (pri <> Nil) Do
    Begin
      pri := pri^.sig;
      dipose(aux);
      aux := pri;
    End;
End;

Var L,L1: Lista;
  V: vectormontopeli;
  Vpeli: vectorpeli;
  M: Tabla;
  Max: Maximo;
Begin
  L := Nil;
  L1 := Nil;
  CargarLista(L);
  //Se Dispone
  CargarMatriz(M);
  //Se dispone
  CargarVectorPeli(Vpeli);
  //Se dispone
  InicializarVector(V);
  RecorrerLista(L,V);
  InformarC(V,Vpeli);
  InformarD(Max);
  LiberarMemoria(L);
  LiberarMemoria(L1);
End.
