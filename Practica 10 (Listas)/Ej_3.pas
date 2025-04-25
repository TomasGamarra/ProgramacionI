//Dada una lista de lugares turísticos identificados por nombre y país, definir una estructura de datos
//para almacenarlos y escribir un programa que implemente los siguientes módulos
//a) Calcular la longitud de la lista.
//b) Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una
//vez, ya que puede haber diferentes lugares turísticos).
//c) Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
//d) Agregar al final de la lista creada en c) un nuevo lugar turístico. 

Program Ej_3;

Type 
  LugTuris = Record
    nombre: string;
    pais: string;
  End;

  Lista = ^nodo;
  nodo = Record
    datos: LugTuris;
    sig: Lista;
  End;

  //----(a)-----
Function LongitudLista (pri:Lista): integer;

Var Long: integer;
Begin
  Long := 0;
  While (pri <> Nil) Do
    Begin
      pri := pri^.sig;
      Long := Long+1;
    End;
  LongitudLista := Long;
End;

//----(b)-----
Function CantVecesPaisDado (pri:Lista;Pais:String): integer;

Var Cant: integer;
Begin
  Cant := 0;
  While (pri <> Nil ) Do
    Begin
      If (pri^.datos.pais = Pais ) Then
        Cant := Cant+1;
      pri := pri^.sig;
    End;
  CantVecesPaisDado := Cant;
End;

//----(c)-----

Procedure AgregarAtras (Var L2:Lista ; info:LugTuris);

Var nue,aux: Lista;
Begin
  New(nue);
  nue^.datos := info;
  nue^.sig := Nil;
  If (L2 <> Nil ) Then
    Begin
      aux := L2;
      While (aux^.sig <> Nil) Do
        aux := aux^.sig;
      aux^.sig := nue;
    End
  Else
    L2 := nue;
End;

Procedure GenerarListaAPartirDeUnPais (L:Lista;Var L2:Lista;Pais:String);
Begin
  While (L <> Nil) Do
    Begin
      If (L^.datos.pais = Pais) Then
        AgregarAtras(L2,L^.datos);
      L := L^.sig
    End;
End;


//--------(d)--------

Procedure AgregarNuevoLugTuristico (Var L2:Lista ; info:LugTuris);
Begin
  AgregarAtras(L2,info);
End;

Procedure BorrarMemoriaDinamica (Var L:Lista);

Var aux: Lista;
Begin
  aux := L;
  While (L <> Nil) Do
    Begin
      L := L^.sig;
      dispose (aux);
      aux := L
    End;
End;

Procedure CargarLista(Var L:Lista);

Var info: LugTuris;
Begin
  Writeln('IngresePais');
  Readln(info.pais);
  Writeln('IngreseNombre');
  Readln(info.nombre);
  While (info.nombre <> 'tomi') Do
    Begin
      AgregarAtras(L,info);
      Writeln('IngresePais');
      Readln(info.pais);
      Writeln('IngreseNombre');
      Readln(info.nombre);
    End;
End;


Procedure ImprimirLista(L:Lista);
Begin
  While (L <> Nil) Do
    Begin
      writeln(L^.datos.pais);
      writeln(L^.datos.nombre);
      L := L^.sig;
    End;
  writeln('Se Imprimio la lista');
End;


Var L: Lista;
  L2: Lista;
  pais: string;
  info: LugTuris;
Begin
  L := Nil;
  CargarLista(L);
  ImprimirLista(L);
  Writeln('La longitud de la lista es de :',   LongitudLista(L));
  writeln('Ingrese un pais :');
  Readln(pais);
  Writeln('La cantidad de veces que aparece un pais dado es de : ',  CantVecesPaisDado(L,pais));
  writeln('Ingrese un pais para generar lista a partir de el : ');
  Readln(pais);
  GenerarListaAPartirDeUnPais(L,L2,pais);
  ImprimirLista(L2);
  Writeln('IngresePais');
  Readln(info.pais);
  Writeln('IngreseNombre');
  Readln(info.nombre);
  AgregarNuevoLugTuristico(L2,info);
  ImprimirLista(L2);
End.
