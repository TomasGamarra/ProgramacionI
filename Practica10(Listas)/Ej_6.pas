//Un cine dispone de una lista con la información de los tickets del día (Nro. Caja, nro ticket, monto)
//correspondientes a sus 6 cajas. Escribir un programa que procese dicha lista y permita:


//a) Genere una nueva lista con los tickets con montos menores a $1000. {Recorrer la lista, crear una nuev para los montos < a 1000}
//b) Calcular e informar el monto promedio recaudado por caja. 
//c) Calcular que cajas que recaudaron más de $12000 con menos de 100 tickets. Luego vuelva a


//recorrer la lista para generar una nueva con los tickets pertenecientes a las cajas que cumplan dicha condición. Recuerde usar
//un conjunto para mejorar la eficiencia.

Program Ej_6;

Type 
  promedio = Record
    SumaMonto : real;
    CantTickets: integer;
  End;

  vectormonto = Array [1..6] Of promedio;

  ticket = Record
    NroCaja: 1..6;
    NroTicket: integer;
    Monto: real;
  End;

  Lista = ^nodo;
  nodo = Record
    datos: ticket;
    sig: Lista;
  End;



Procedure SumaMontoYCantCaja (T:Ticket;Var datos:promedio);
Begin
  datos.SumaMonto := datos.SumaMonto + T.Monto;
  datos.CantTickets := datos.CantTickets + 1;
End;


Procedure InformarMontoPromedio (V:vectormonto);

Var i: integer;
Begin
  For i:= 1 To 6 Do
    WriteLn('El monto promedio en la caja: ',  i  ,'es de: ',(V[i].SumaMonto/V[i].CantTickets): 2: 2);
End;



//--------(a)----------------

Procedure AgregarAdelante(T:ticket;Var pri:Lista);

Var nue: Lista;
Begin
  New(nue);
  nue^.datos := T;
  nue^.sig := pri;
  pri := nue;
End;

Procedure CrearNuevaLista ({Se Dispone}LTicket:Lista;Var List1000:Lista;Var V:vectormonto);
Begin
  While (LTicket <> Nil) Do
    Begin
      If (LTicket^.datos.Monto < 1000) Then
        AgregarAdelante(LTicket^.datos,List1000);
      SumaMontoYCantCaja(LTicket^.datos,V[LTicket^.datos.NroCaja]);
      LTicket := LTicket^.sig;
    End;
  InformarMontoPromedio(V);
End;

Procedure CargarLista(Var L:Lista);

Var info: ticket;
Begin
  Writeln('Ingrese Nro Caja: ');
  Readln(info.NroCaja);
  Writeln('Ingrese El Monto Gastado: ');
  Readln(info.Monto);
  While (info.Monto <> -1) Do
    Begin
      AgregarAdelante(info,L);
      Writeln('Ingrese Nro Caja: ');
      Readln(info.NroCaja);
      Writeln('Ingrese El Monto Gastado: ');
      Readln(info.Monto);
    End;
End;

Procedure InicializarVector(Var V:vectormonto);

Var i: integer;
Begin
  For i:= 1 To 6 Do
    Begin
      V[i].SumaMonto := 0;
      V[i].CantTickets := 0;
    End;
End;


Procedure ImprimirLista (L:Lista);
Begin
  While (L <> Nil) Do
    Begin
      writeln((L^.datos.Monto): 2: 2);
      writeln(L^.datos.NroCaja);
      writeln(L^.datos.NroTicket);
      L := L^.sig;
    End;
End;

Var LTicket,List1000: Lista;
  V: vectormonto;
Begin
  LTicket := Nil;
  CargarLista(LTicket);
  //SeDispone
  InicializarVector(V);
  List1000 := Nil;
  CrearNuevaLista(LTicket,List1000,V);
  ImprimirLista(List1000);
End.
