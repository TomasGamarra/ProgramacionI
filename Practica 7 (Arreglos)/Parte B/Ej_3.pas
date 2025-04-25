//Realizar un módulo que reciba dos vectores A y B y un valor I, y que devuelva el vector A en el que
//se insertan las componentes del vector B entre las componentes I e I+1 del vector A. Se debe validar
//que el parámetro I esté en un rango permitido.

Program Ej_3;

Const 
  dimF = 10;

Type 
  vector = Array [1..dimF] Of integer;

Procedure Cargar (Var A,B:vector;dimLA,dimLB:integer);

Var 
  i,j: integer;
Begin
  For i:=1 To dimLA Do
    Begin
      writeln('Cargue Vector A');
      Readln(A[i]);
    End;
  For j:=1 To dimLB Do
    Begin
      writeln('Cargue Vector B');
      Readln(B[j]);
    End;
End;

Procedure DevolverA  (Var A:vector;B:vector;I:integer;Var dimLA:integer ;dimLB:integer);

Var p,k,aux,aux2: integer;
Begin
  If (I >= 1) And (I <= dimLA) And (dimLA + dimLB <= dimF)Then
    Begin
      aux := I+1;
      For p:= 1 To dimLB Do
        Begin
          For k:= dimLA Downto aux Do
            Begin
              A[k+1] := A[k];
            End;
          A[aux] := B[p];
          aux := aux+1;
          dimLA := dimLA+1;
        End;
    End;
End;


Procedure ImprimirA(A:vector;dimLA:integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimLA Do
    Write('[' , A[i] ,']');
End;

Var 
  dimLA,dimLB,I: integer;
  A,B: vector;
Begin
  Writeln('Ingrese dimLA');
  Readln(dimLA);
  Writeln('Ingrese dimLB');
  Readln(dimLB);
  Writeln('Ingrese I');
  Readln(I);
  Cargar(A,B,dimLA,dimLB);
  writeln();
  writeln();
  DevolverA(A,B,I,dimLA,dimLB);
  writeln();
  ImprimirA(A,dimLA);
  writeln();
End.
