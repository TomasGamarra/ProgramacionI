
Program Operacionesconlistas;

--------------{CrearListaVacia}-------------

Begin
  ...
  L := Nil;
  (IMPORTANTE:NO SE USA NEW);
  ...
End.


--------------{RecorridoLista}--------------
Procedure recorrido ( pri : lista);
Begin
  While (pri <> Nil) Do
    Begin
      write (pri^.datos.nom,pri^.datos.edad);
      pri := pri^.sig
    End;
End;


--------------{BusquedaDeElemento}-------------
Function buscar (pri: lista; elem:cadena50): boolean;

Var 
  encontre : boolean;
Begin
  encontre := false;
  While (pri <> Nil) And (Not encontre) Do
    If (elem = pri^.datos.nom)Then
      encontre := true;
  Else
    pri := pri^.sig;
  buscar := encontre;
End;


--------------{AgregarAdelante}-------------
//Supongamos que se ingresan el nombre y la edad de personas, hasta que se ingresa
//la edad 0. Los datos de cada persona se deben guardar en una lista.

Type 
  cadena50 = string[50];
  persona = Record
    nom: cadena50;
    edad: integer;
  End;
  lista = ^nodo;
  nodo = Record
    datos: persona;
    sig: lista;
  End;

Procedure AgregarAdelante
(Var L:lista; per:persona);

Var nue: Lista;
Begin
  New(nue);
  // Se asigna memoria para el nuevo nodo
  nue^.datos := per;
  // Se asignan los datos de la persona al nuevo nodo
  nue^.sig := L;
  // El puntero al siguiente nodo se asigna a la lista original
  L := nue;
  // El puntero de la lista original se actualiza al nuevo nodo
End;

Var 
  L : Lista;
  p : persona;

Begin
  L := Nil;
  leerPersona (p);
  While (p.edad <> 0) Do
    Begin
      AgregarAdelante (L, p);
      leerPersona (p);
    End;
End.

--------------{AgregarAlFinalV1}-------------
//Supongamos que se ingresan el nombre y la edad de personas, hasta que se ingresa
//la edad 0. Los datos de cada persona se deben guardar en una lista, respetando el
//orden de ingreso.

Type  
  = que AgregarAtras;

Procedure AgregarAlFinal(Var pri: lista; per: persona);

Var act, nue: lista;
Begin
  // Se crea un nuevo nodo (nue) y se le asigna el valor del parámetro per.
  new(nue);
  nue^.datos := per;
  // Se asigna el valor NIL al puntero siguiente del nuevo nodo.
  nue^.sig := Nil;
  // Si la lista no está vacía, se recorre la lista hasta encontrar el último nodo.
  If pri <> Nil Then
    Begin
      act := pri;
      While (act^.sig <> Nil) Do
        act := act^.sig;
      // Una vez encontrado el último nodo, se le asigna el nuevo nodo como siguiente.
      act^.sig := nue;
    End
    // Si la lista está vacía, se asigna el nuevo nodo como primer elemento de la lista.
  Else pri := nue;
End;

Begin
  //prog. ppal
  L := Nil;
  leerPersona (p);
  While (p.edad <> 0) Do
    Begin
      AgregarAlFinal (L, p);
      leerPersona (p);
    End;
End.

------------{AgregarAlFinalV2}------------

Procedure AgregarAlFinal2(Var pri, ult: lista; per:persona);

Var 
  nue: lista;
Begin
  new(nue);
  // Asignar los datos del elemento a agregar al nodo
  nue^.datos := per;
  nue^.sig := Nil;
  // Establecer el siguiente nodo como NIL, ya que será el último de la lista
  If pri <> Nil Then // Verificar si la lista no está vacía
    Begin
      ult^.sig := nue;
      // Si la lista no está vacía, asignar el nodo nuevo como el siguiente del último nodo actual
    End
  Else
    Begin
      pri := nue;
      // Si la lista está vacía, asignar el nodo nuevo como el primer nodo de la lista
    End;
  ult := nue;
  // Asignar el nodo nuevo como el último nodo de la lista
End;

Begin {prog. ppal}
  L := Nil;
  ult := Nil;
  leerPersona (p);
  While (p.edad <> 0) Do
    Begin
      AgregarAlFinal2 (L, Ult, p);
      leerPersona (p);
    End;
End.

-----------{BorrarElemento}-----------

Procedure BorrarElemento (Var pri:lista; nom:cadena50; Var exito: boolean);

Var ant, act: lista;
Begin
  exito := false;
  act := pri;
  // Recorro mientras no se termine la lista y no encuentre el elemento
  While (act <> Nil) And (act^.datos.nom <> nom) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act <> Nil) Then // Si encontré el elemento, lo borro de la lista
    Begin
      exito := true;
      If (act = pri) Then // Si el elemento a borrar es el primero de la lista, el siguiente se convierte en el primero
        pri := act^.sig;
      Else
        ant^.sig := act^.sig;
      // Si no es el primero, el nodo anterior ahora apunta al siguiente nodo del que se va a borrar
      dispose (act);
      // Finalmente, libero la memoria del nodo a borrar
    End;
End;

Begin {prog. ppal}
  CargarLista (L);
  read (nombre);
  BorrarElemento(L, nombre, exito);
  If éxito Then
    writeln('Se eliminó');
  Else
    write ('No existe');
End.


------------{InsertarElemento}-------------
//Pasos a seguir:
//1. Pedir espacio en memoria para el nuevo nodo
//2. Guardar los datos en el nodo
//3. Buscar posición donde se debe insertar (secuencialmente a partir del puntero inicial)
//4. Reacomodar punteros. Considerar los tres casos:
//a. El nuevo elemento va en el inicio de la lista.
//b. El nuevo elemento va en el medio de dos existentes
//c. El nuevo elemento va al final de la lista.

Procedure InsertarElemento ( Var pri: lista; per: persona);

Var ant, nue, act: lista;
Begin
  // Se crea un nuevo nodo para el elemento a insertar.
  new (nue);
  nue^.datos := per;
  // Se inicializan los nodos 'act' y 'ant' con el primer elemento de la lista.
  act := pri;
  ant := pri;
  // Recorremos la lista buscando la posición donde debe ser insertado el nuevo nodo.
  While (act<>Nil) And (act^.datos.nombre < per.nombre) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  //Si la posición de inserción se encuentra al principio de la lista, se actualiza el puntero 'pri' con el nuevo nodo
  If (ant = act) Then
    pri := nue;
  Else
    ant^.sig := nue;
  // En caso contrario, se inserta el nuevo nodo entre otros dos nodos o al final.
  nue^.sig := act ;
  // Por último, se enlaza el nuevo nodo con el resto de la lista.
End;

Begin {prog. ppal}
  CargarLista (L);
  leerPersona (p);
  InsertarElemento (L, p);
End.


----------{InsertarElemEnListaOrdenado}-----------

Procedure InsertarOrdenado (Var pri: lista; num: integer);

Var 
  nue, ant, lugar: lista;
Begin
  new (nue);
  nue^.dato := num;
  nue^.sig := Nil;
  lugar := pri;
  ant := pri;
  While (lugar <> Nil) And (num > lugar ^ .dato) Do
    //Buscamos la posicion a insertar
    Begin
      ant := lugar;
      lugar := lugar^.sig;
    End;
  If (lugar = pri) Then //No avanzo en el While , pues esta vacia o inserta adelante
    Begin
      nue^.sig := pri;
      pri := nue;
    End
  Else //Avanzo en el while sirve para medio y fin de la lista
    Begin
      ant^.sig := nue;
      nue^.sig := lugar;
      //Cuando inserta al final, LUGAR vale NIL
    End;
End;

---------------{EliminarNodo}---------------
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
