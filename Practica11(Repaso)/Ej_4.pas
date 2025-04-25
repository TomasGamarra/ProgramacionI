



{Una empresa de la ciudad de La Plata, que realiza entregas de paquetes dentro del casco
urbano, está interesada en procesar la información de sus paquetes. De cada paquete se conoce la
fecha de envío, si pudo ser entregado al destinatario y la dirección que está compuesta por los
campos: calle (de 1 a 122), número, piso y departamento.
Se dispone de una lista con los envíos del pasado año. Se requiere procesar la lista recorriéndola
una sola vez para:
a. Informar la cantidad de envíos realizados para cada calle.
b. Informar el nombre del mes con mayor cantidad de paquetes enviados.
c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario.
d. Generar 10 nuevas listas con los envíos de las calles 11 a la 20. Cada lista debe estar ordenada
por el número de la dirección.}

Program Ej_4;

Type 

  vectorcontador = Array [1..122] Of integer;
  vectormes = Array[1..12] Of integer;

  direccion = Record
    calle: 1..122;
    num: integer;
    piso: 1..30;
    depa: integer;
  End;

  fe = Record
    dia: 1..31;
    mes: 1..12;
  End;

  paquete = Record
    fecha: fe;
    pudo: boolean;
    dire: direccion;
  End;

  Lista = ^nodo;
  nodo = Record
    datos: paquete;
    sig: Lista;
  End;


Procedure EliminarNodo (Var pri:Lista; ant,act:Lista);

Var aux: Lista;
Begin
  If (act=pri) Then
    pri := pri^.sig
  Else
    ant^.sig := act^.sig;
  aux := act^.sig;
  dipose (act);
  act := aux;
End;

Procedure RecorrerLista (Var pri:Lista; Var VCalle:vectorcontador;Var VMes:vectormes);

Var act,ant: Lista;
Begin
  act := pri;
  While (act <> Nil) Do
    Begin
      ant := act;
      If (act^.datos.pudo = false ) Then
        EliminarNodo(pri,ant,act)



        act := act^.sig;
    End;

End;


Var L: Lista;
  VecCalle: vectorcontador;
  VecMes: vectormes;
Begin
  InicializarVector(VecCalle);
  InicializarVectorM(VecMes);
  RecorrerLista(L,VecCalle,VecMes);

End.
