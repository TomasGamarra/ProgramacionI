


{Un banco dispone de una lista con la información de pago de sus jubilados (Documento, apellido,
 nombre y monto a pagar). Debido a que la
cantidad de jubilados para cobrar es muy grande se
decidió pagarles en 10 días diferentes agrupándolos por el último dígito de su documento. Escribir un
programa que implemente la separación de la lista en 10 listas diferentes conservando el orden
original en cada lista.}

Program Santi;

Type 

  jubilado = Record
    dni: integer;
    apellido: string;
    nombre: string;
    monto: real;
  End;

  lista = ^nodo;
  nodo = Record
    dato: jubilado;
    sig: lista;
  End;
  Dias = array[0..9] Of lista;


Procedure AgregarAlFinal(Var pri:Lista; d:jubilado);

Var nue,act: Lista;
Begin
  new(nue);
  nue^.dato := d;
  nue^.sig := Nil;
  If ( pri <> Nil) Then
    Begin
      act := pri;
      While (act^.sig <> Nil) Do
        act := act^.sig;
      act^.sig := nue
    End
  Else
    pri := nue;
End;

Procedure CargarListaJub (Var LJub:lista);

Var Jub: jubilado;
Begin
  Repeat
    Writeln('Ingrese DNI');
    Readln(Jub.dni);
    Writeln('Ingrese Apellido');
    Readln(Jub.apellido);
    Writeln('Ingrese Nombre');
    Readln(Jub.nombre);
    Writeln('Ingrese Monto');
    Readln(Jub.monto);
    AgregarAlFinal(LJub,Jub);
  Until (Jub.dni = 0);
End;

Procedure InicializarVector (Var v:Dias);

Var i: integer;
Begin
  For i:=0 To 9 Do
    v[i] := Nil;
  writeln('inicialice bien');
End;



Procedure Separar (l:lista;Var v:Dias);

Var 
  num: integer;
Begin
  While (l<>Nil) Do
    Begin
      AgregarAlFinal(v[l^.dato.dni Mod 10],l^.dato);
      l := l^.sig;
    End;
End;

Procedure Informar (v:Dias);

Var i: integer;
  act: lista;
Begin
  For i:=0 To 9 Do
    Begin
      act := v[i];
      writeln('El elemento en la posicion ', i, ' :');
      If (act=Nil) Then
        writeln('no hay nada aca')
      Else
        While (act<>Nil) Do
          Begin
            writeln('DNI: ', act^.dato.dni);
            writeln('APELLIDO: ', act^.dato.apellido);
            writeln('NOMBRE: ', act^.dato.nombre);
            writeln('MONTO: ', act^.dato.monto:2:2);
            act := act^.sig;
          End;
    End;
End;



Var v: Dias;
  ListaJubilados: lista;
  num: integer;
Begin
  ListaJubilados := Nil;
  InicializarVector(v);
  CargarListaJub(ListaJubilados);
  Separar(ListaJubilados,v);
  informar(v);
End.
