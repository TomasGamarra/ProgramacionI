//Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene
//en una lista simple. Utilizando la lista creada implementar:
// a) un módulo que reciba la lista y devuelva como resultado  la cantidad de números con 3 dígitos.
// b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La
// búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
// c) Un módulo que reciba la lista y libere la memoria reservada.

Program Ej_1;

Type 

  lista = ^nodo;
  nodo = Record
    datos: integer;
    sig: lista;
  End;

Procedure CargarLista ( Var L:lista );

Procedure AgregarAdelante (Var L:lista;num:integer);

Var Nue: Lista;
Begin
  New(Nue);
  Nue^.datos := num;
  Nue^.sig := L;
  L := Nue;

End;

Var num: integer;
Begin
  Writeln('Ingrese numero');
  Read(num);
  While (num <> 999) Do
    Begin
      AgregarAdelante(L,num);
      Writeln('Ingrese numero');
      Read(num);
    End;
End;

Procedure ImprimirLista(L:lista);
Begin
  While (L <> Nil) Do
    Begin
      writeln(L^.datos);
      L := L^.sig;
    End;
  writeln('Se Imprimio la lista');
End;

Function tresDigitos (L:Lista): integer;

Var tresdig: integer;
Begin
  tresdig := 0;
  While (L<>Nil) Do
    Begin
      If (L^.datos > 99) And (L^.datos < 1000) Then
        tresdig := tresdig+1;
      L := L^.sig;
    End;
  tresDigitos := tresdig;
End;

Function Existe (L:Lista;num:Integer): boolean;

Var encontre: boolean;
Begin
  encontre := false;
  While (L <> Nil) And (Not encontre) Do
    Begin
      If ( L^.datos = num) Then
        encontre := true
      Else
        L := L^.sig;
    End;
  Existe := encontre;
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



Var L: lista;
  num: integer;
Begin
  L := Nil;
  CargarLista(L);
  ImprimirLista(L);
  Writeln('Existen esta cantidad de numeros con 3 digitos: ',  tresDigitos(L) );
  writeln('Ingrese un numero para verificar si existe en la lista ');
  read(num);
  If (Existe(L,num)) Then
    writeln('Existe')
  Else
    writeln('No Existe');
  BorrarMemoriaDinamica(L);
  ImprimirLista(L);
End.
