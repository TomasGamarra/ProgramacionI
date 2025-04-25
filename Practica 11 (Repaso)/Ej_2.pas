
Program Ej_2;

Type 
  vectordireccion = Array [1..70] Of Char;
  vectorextra = Array [1..4] Of Real;
  persona = Record
    nombre: string;
    apellido: string;
    cat: 1..4;
    montoBas: real;
    direccion: vectordireccion;
  End;
  Lista = ^nodo;
  nodo = Record
    datos: persona;
    sig: Lista;
  End;
  max = Record
    montomax: real;
    nombre: string;
  End;

Const 
  EXTRA = vectorextra;


Procedure CalcularMontoPorCat (Var v:real;base:real;extra:real);
Begin
  v := v + (base+extra);
End;

Procedure MaxCat2 (p:persona;Var Maximo:max);

Var 
Begin
  If (p.montoBas > Maximo.montomax) Then
    Begin
      Maximo.montomax := p.montoBas;
      Maximo.nombre := p.nombre;
    End;
End;

Procedure RecorrerLista (L:Lista;Var VecCat:vectorextra;Var Maximo:max;Tabla:vectorextra);

Var 
Begin
  While (L <> Nil) Do
    Begin
      CalcularMontoPorCat(VecCat[L^.datos.cat],L^.datos.montoBas,Tabla[L^.datos.cat]); {A}
      If (L^.datos.cat = 2) Then
        MaxCat2(L^.datos,Maximo);
      If (Cumple(L^.datos.direccion)) Then
        writelnd('Cumple')
      Else
        WriteLn('No Cumple');
      L := L^.sig;
    End;
End;




Procedure InformarMayorCat2 (Maximo:max);
Begin
  If (Maximo.montomax = -1) Then
    writeln('Nadie Pago esta categoria')
  Else
    writeln('La persona que mas pago la cat 2 fue: ',   Maximo.nombre);
End;


Function Cumple (VecDir:vectordireccion)