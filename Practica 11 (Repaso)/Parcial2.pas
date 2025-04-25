
Program Parcial2022;

Const 
  PARTIDOS = 136;
  ANIOPAS = 2022;

Type 

  VecPersVac = array [1..PARTIDOS] Of integer;

  fe = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;

  vacunacion = Record
    fecha: fe;
    codPar: integer;
    codZona: 1..6;
    cantVac: integer;
  End;


  Lista = ^nodo;
  nodo = Record
    datos: vacunacion;
    sig: Lista;
  End;

  VectorListas = Array[1..6] Of Lista; {OrdenadaPorCodigoPartido}

  vectorCodigo = Array [1..PARTIDOS] Of string;




Procedure TotalVacunados (Datos:vacunacion ;Var VecCon:VecPersVac);
Begin
  VecCon[Datos.codPar] := VecCon[Datos.codPar] + Datos.cantVac;
End;



Procedure IngresarOrdenado (D:vacunacion;Var pri:Lista);
//POR CODIGO DE PARTIDO 

Var ant,act,nue: Lista;
Begin
  New (nue);
  nue^.datos := D;
  ant := pri;
  act := pri;
  While (act <> Nil) And (act^.datos.codPar < D.codPar) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then {Es el primer elemento o esta vacia}
    pri := nue
  Else
    ant^.sig := nue;
  nue^.sig := act
End;


Procedure EliminarNodo (Var pri:Lista;Var ant,act:Lista);

Var borrar: Lista;
Begin
  borrar := act;
  If (act=pri) Then
    pri := pri^.sig
  Else
    ant^.sig := act^.sig;
  act := act^.sig;
  dispose(borrar);
End;


Procedure RecorrerLista (Var L:Lista;Var VecCon:VecPersVac ;Var  VecList:VectorListas);

Var ant,act: Lista;
Begin
  ant := L;
  act := L;
  While ( act <> Nil) Do
    Begin
      If (act^.datos.fecha.anio <> ANIOPAS) Then
        EliminarNodo(L,ant,act) {a}
      Else
        Begin
          TotalVacunados(L^.datos,VecCon); {b}
          IngresarOrdenado(L^.datos,VecList[L^.datos.codZona]);
          ant := act;
          act := act^.sig;
        End;
    End;
End;


Procedure InformarMax(VecCon:VecPersVac;VecDisp:vectorCodigo);

Var pos1,pos2,max1,max2,i: integer;
Begin
  pos1 := -1;
  max1 := -1;
  max2 := -1;
  pos2 := -1;
  For i:= 1 To PARTIDOS Do
    Begin
      If ( VecCon[i] > max1) Then
        Begin
          max2 := max1;
          max1 := VecCon[i];
          pos2 := pos1;
          pos1 := i;
        End
      Else
        If (VecCon[i] > max2) Then
          Begin
            max2 := VecCon[i];
            pos2 := i;
          End;
    End;
  Writeln('El partido con mas vacunas:   ',   VecDisp[pos1]    ,'  vacuno   ',   VecCon[pos1]   ,'el anio pasado' );
  Writeln('El segundo partido con mas vacunas:   ',   VecDisp[pos2]    ,'  vacuno   ',   VecCon[pos2]   ,
          'el anio pasado' );
End;


Procedure InicializarVector(Var VecCon:VecPersVac ; Var VecList:VectorListas);

Var i: integer;
Begin
  For i:= 1 To PARTIDOS Do
    VecCon[i] := 0;
  For i:= 1 To 6 Do
    VecList[i] := Nil;
End;


Procedure LiberarMemoria(Var pri:Lista);

Var aux: Lista;
Begin
  While (pri <> Nil) Do
    Begin
      aux := pri;
      pri := pri^.sig;
      dispose(aux);
    End;
End;



Procedure LiberarVectorListas (Var VecList:VectorListas);

Var i: integer;
Begin
  For i:=1 To 6 Do
    LiberarMemoria(VecList[i]);
End;

Var  L: Lista;
  VecCon: VecPersVac;
  VecList: VectorListas;
  VecDisp: vectorCodigo;
Begin
  L := Nil;
  CargarLista(L);
  //Se dispone 
  InicializarVector(VecCon,VecList);
  RecorrerLista(L,VecCon,VecList);
  InformarMax(VecCon,VecDisp);
  LiberarMemoria(L);
  LiberarVectorListas(VecList);
End.
