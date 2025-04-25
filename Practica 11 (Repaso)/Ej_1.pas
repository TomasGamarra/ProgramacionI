//.Un banco dispone de una lista en donde almacena la información de aquellos clientes que vienen a
//pagar impuestos. De cada cliente conoce: DNI, Nombre, Apellido, código de impuesto a pagar (1 a
// 9) y el monto a pagar. Se pide: a. Realizar la atención de los clientes hasta que se recaude al menos
//100.000 pesos o hasta que se terminen los clientes.
//b. Al finalizar la atención informar el código de impuesto que más veces se pagó por los clientes
//que fueron atendidos.c. Al finalizar la atención informar, en caso de que hayan quedado, la
//cantidad de clientes sin atender. Nota: Asumir que cada cliente paga un solo impuesto.

Program Ej_1;

Type 
  vector = Array [1..9] Of integer;

  Cliente = Record
    Dni: integer;
    Nombre: string;
    Apellido: string;
    Codigo: integer;
    Monto: real;
  End;

  Lista = ^nodo;
  nodo = Record
    dato: cliente;
    sig: Lista;
  End;

Procedure InicializarVector (Var V:vector);

Var i: integer;
Begin
  For i:=1 To 9 Do
    V[i] := 0;
End;

Procedure ContarCodigo (L:Lista;Var V:vector);
Begin
  V[L^.dato.Codigo] := V[L^.dato.Codigo] + 1;
End;


Procedure Atencion (Var L:Lista;Var V:vector);

Var total: real;
  aux: Lista;
Begin
  aux := L;
  total := 0;
  InicializarVector(V);
  While (total < 100000) And (L <> Nil) Do
    Begin
      ContarCodigo(L,V);
      total := total + L^.dato.monto;
      L := L^.sig;
      Dispose(aux);
      aux := L;
    End;
End;

Function CalcularMaximo(V:vector): integer;

Var i: integer;
  max: integer;
Begin
  max := -1;
  For i:= 1 To 9 Do
    If (V[i] > max) Then
      Begin
        max := V[i];
        CalcularMaximo := i;
      End;
End;

Function CantidadClientesSinAtender (L:Lista): Integer;

Var cant: integer;
Begin
  cant := 0;
  While (L <> Nil) Do
    Begin
      cant := cant+1;
      L := L^.sig;
    End;
  CantidadClientesSinAtender := cant;
End;

Procedure CargarLista (Var L:Lista);

Var 
Begin

  Readln(L^.dato.Dni);
  Readln(L^.dato.Nombre);
  Readln(L^.dato.Codigo);
  Readln(L^.dato.Monto);
  While (L^.dato.Dni <> 0) Do
    Begin
      Readln(L^.dato.Dni);
      Readln(L^.dato.Nombre);
      Readln(L^.dato.Apellido);
      Readln(L^.dato.Codigo);
      Readln(L^.dato.Monto);

    End;
End;

Var L: Lista;
  V: Vector;
Begin
  L := Nil;
  CargarLista(L);
  Atencion(L,V);
  Writeln('El codigo de impuesto mas pagado fue: ',  CalcularMaximo(V)  );
  WriteLn('La cantidad de clientes sin antender fue: ',    CantidadClientesSinAtender(L));
End.
