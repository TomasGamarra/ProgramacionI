//Dada una lista de aviones (marca, modelo y cantidad de asientos), definir la estructura que permita
//almacenarlos y escribir un programa que implemente:
// a) Un módulo que reciba una lista de aviones y un avión y lo  agregue a la lista. Se sabe que la lista


// está ordenada por marca en forma descendente y se pide agregar el  avión a la lista de forma que  se mantenga el orden.
// b) Un módulo que reciba una lista de aviones y un avión, y elimine el elemento de la lista que
// coincida totalmente con el avión recibido. Además, debe retornar si la eliminación se realizó o no.

Program Ej_4;

Type 
  Avion = Record
    marca: string;
    modelo: string;
    asientos: integer;
  End;
  Lista = ^nodo;
  nodo = Record
    datos: Avion;
    sig: Lista;
  End;


Function Iguales (elem1,elem2:Avion): boolean;
Begin
  Iguales := (elem1.marca = elem2.marca) And (elem1.modelo = elem2.modelo) And (elem1.asientos = elem2.asientos);
End;


Procedure EliminarElemento (Var pri:Lista; elem:Avion;Var exito:boolean);

Var act,ant: Lista;
Begin
  exito := false;
  ant := pri;
  act := pri;
  While (act <> Nil) And (Iguales(act^.datos,elem)) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If ( act <> Nil)Then //No Esta vacia la lista
    Begin
      exito := true;
      //Encontre El Elemento
      If (act=pri) Then // El elemento a borrar es el primero
        pri := act^.sig
      Else
        ant^.sig := act^.sig;
      Dispose (act);
    End;
End;



Procedure AgregarAvion (Var L:Lista;av:Avion);

Var ant,act,nue: Lista;
Begin
  New(nue);
  nue^.datos := av;
  nue^.sig := Nil;
  ant := L;
  act := L;
  While (act <> Nil) And (act^.datos.marca > av.marca) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=L) Then
    Begin
      nue^.sig := act;
      L := nue;
    End
  Else
    Begin
      ant^.sig := nue;
      nue^.sig := act;
    End;
End;


Procedure AgregarAtras (Var L2:Lista ; info:Avion);

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

Procedure CargarLista(Var L:Lista);

Var info: Avion;
Begin
  Writeln('IngreseMarca');
  Readln(info.marca);
  Writeln('IngreseModelo');
  Readln(info.modelo);
  While (info.marca <> 'tomi') Do
    Begin
      AgregarAtras(L,info);
      Writeln('IngreseMarca');
      Readln(info.marca);
      Writeln('IngreseModelo');
      Readln(info.modelo);

    End;
End;


Procedure ImprimirLista(L:Lista);
Begin
  While (L <> Nil) Do
    Begin
      writeln(L^.datos.marca);
      writeln(L^.datos.modelo);
      L := L^.sig;
    End;
  writeln('Se Imprimio la lista');
End;


Var L: Lista;
  info: Avion;
Begin
  CargarLista(L);
  writeln('Ingrese un avion en la lista');
  Writeln('IngreseMarca');
  Readln(info.marca);
  Writeln('IngreseModelo');
  Readln(info.modelo);
  AgregarAvion(L,info);
  ImprimirLista(L);
End.
