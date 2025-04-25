


{Se dispone de una lista con la información de los ingresantes a la Facultad en el año anterior. De
cada ingresante se conoce: apellido, nombre, ciudad de origen, fecha de nacimiento (día, mes, año),
si presentó el título del colegio secundario y el código de la carrera en la que se inscribe (APU, LI,
LS). Con esta información de los ingresantes se pide que recorra la lista una vez para:
a. Informar el apellido de los ingresantes cuya ciudad origen es “Brandsen”.
b. Calcular e informar el año en que más ingresantes nacieron (asumir que los años de
nacimientos de los ingresantes pueden variar entre 1970 y 2000).
c. Informar la carrera con la mayor cantidad de inscriptos.
d. Eliminar de la lista aquellos ingresantes que no presentaron el título}

Program Ej_3;

Type 
  vectorcontador = Array [1970..2000] Of integer;
  vectorinscriptos = Array [1..3] Of integer;

  cadena20 = string[20];
  fe = Record
    dia: 1..31;
    mes: 1..12;
    ano: 1970..2000;
  End;
  estudiante = Record
    apellido: cadena20;
    nombre: cadena20;
    ciudad: cadena20;
    fecha: fe;
    presento: string;
    codigo: string;
  End;
  Lista = ^nodo;
  nodo = Record
    datos: estudiante;
    sig: Lista;
  End;



Procedure InformarBrandsen (E:estudiante);
Begin
  If (E.ciudad = 'Brandsen') Then
    write(E.apellido);
End;


Procedure CalcularIngresantesAno (F:fe;Var VecCon:vectorcontador);
Begin
  VecCon[F.ano] := VecCon[F.ano] +1;
End;

Procedure CalculoMax (num:integer;Var max:integer;i:integer;Var maxano:integer);
Begin
  If (num > max) Then
    Begin
      max := num;
      maxano := i;
    End;
End;


Procedure CalcularMaxEInformar (V:vectorcontador);

Var max: integer;
  maxano: integer;
  i: integer;
Begin
  max := -1;
  maxano := 0;
  For i:= 1970 To 2000 Do
    Begin
      CalculoMax(V[i],max,i,maxano);
    End;
  WRiteln('El ano con mayor cantidad de ingresantes fue el : ',  maxano   );
End;

Procedure SumoInscripto (codigo:String;Var VecIns:vectorinscriptos);
Begin
  Case codigo Of 
    'APU': VecIns[1] := VecIns[1]+1;
    'LI': VecIns[2] := VecIns[2]+1;
    'LS': VecIns[3] := VecIns[3]+1;
  End;
End;

Procedure CalculoMayInscriptos (V:vectorinscriptos);

Var i: integer;
  max: integer;
  carrera: integer;
Begin
  max := 0;
  For i:= 1 To 3 Do
    If (V[i] > max) Then
      Begin
        max := V[i];
        carrera := i;
      End;
  Case carrera Of 
    1: Writeln('La carrera con mas inscriptos es : APU');
    2: Writeln('La carrera con mas inscriptos es : LI');
    3: Writeln('La carrera con mas inscriptos es : LS');
  End;
End;


Procedure EliminarNodo (Var pri:Lista; Var act,ant:Lista);

Var borrar: Lista;
Begin
  borrar := act;
  If (act = pri) Then
    pri := act^.sig
  Else
    ant^.sig := act^.sig;
  act := act^.sig;
  dispose (borrar);
End;

Procedure RecorrerLista (Var L:Lista;Var V:vectorcontador; Var VecIns:vectorinscriptos);

Var ant,act: Lista;
Begin
  act := L;
  ant := L;
  While (act <> Nil) Do
    Begin
      If (act^.datos.presento = 'no' ) Then
        Begin
          EliminarNodo(L,act,ant);
        End
      Else
        Begin
          InformarBrandsen(act^.datos);
          CalcularIngresantesAno(act^.datos.fecha,V);
          SumoInscripto(act^.datos.codigo,VecIns);
          ant := act;
          act := act^.sig;
        End;
    End;
  CalcularMaxEInformar(V);
  CalculoMayInscriptos(VecIns);
End;

Procedure InicializarVector(Var V:vectorcontador);

Var i: integer;
Begin
  For i:= 1970 To 2000 Do
    v[i] := 0;
End;

Procedure InicializarVectorIns(Var V:vectorinscriptos);

Var i: integer;
Begin
  For i:= 1 To 3 Do
    v[i] := 0;
End;


Procedure AgregarEstudiante(Var lista: Lista; estudiante: Estudiante);

Var 
  nuevoNodo, actual: Lista;
Begin
  New(nuevoNodo);
  nuevoNodo^.datos := estudiante;
  nuevoNodo^.sig := Nil;

  If lista = Nil Then
    lista := nuevoNodo
  Else
    Begin
      actual := lista;
      While actual^.sig <> Nil Do
        actual := actual^.sig;
      actual^.sig := nuevoNodo;
    End;
End;

Procedure CargarLista(Var lista: Lista);

Var 
  est: estudiante;
Begin
  writeln('Ingrese los datos de los estudiantes (ingrese "." como apellido para finalizar):');
  Repeat
    write('Apellido: ');
    readln(est.apellido);

    If est.apellido <> '.' Then
      Begin
        write('Nombre: ');
        readln(est.nombre);

        write('Ciudad: ');
        readln(est.ciudad);

        write('Fecha (dd mm aaaa): ');
        readln(est.fecha.dia, est.fecha.mes, est.fecha.ano);

        Write ('Presento o no');
        Readln(est.presento);

        write('Código: ');
        readln(est.codigo);

        AgregarEstudiante(lista, est);
      End;
  Until est.apellido = '.';
End;

Procedure MostrarLista(lista: Lista);

Var 
  actual: Lista;
Begin
  writeln('Lista de estudiantes:');
  actual := lista;
  While actual <> Nil Do
    Begin
      writeln('Apellido: ', actual^.datos.apellido);
      writeln('Nombre: ', actual^.datos.nombre);
      writeln('Ciudad: ', actual^.datos.ciudad);
      writeln('Fecha: ', actual^.datos.fecha.dia, '/', actual^.datos.fecha.mes, '/', actual^.datos.fecha.ano);
      writeln('Presentó: ', actual^.datos.presento);
      writeln('Código: ', actual^.datos.codigo);
      actual := actual^.sig;
    End;
End;


Var V: vectorcontador;
  VecIns: vectorinscriptos;
  L: Lista;
Begin
  L := Nil;
  CargarLista(L);
  MostrarLista(L);
  InicializarVector(V);
  InicializarVectorIns(VecIns);
  RecorrerLista(L,V,VecIns);
  MostrarLista(L);
End.
