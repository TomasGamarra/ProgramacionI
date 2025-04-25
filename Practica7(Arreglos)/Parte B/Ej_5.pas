//Dada una matriz de números enteros de 50 x 50, realizar un programa para:
//a) Imprimir los elementos de las filas pares
// de la matriz.
// b) Imprimir los elementos de las columnas
//impares de la matriz.
// c) Imprimir los elementos de la diagonal
// principal.

Program Ej_5;

Const 
  maxfil = 50;
  maxcol = 50;

Type 
  matriz = Array [1..maxfil,1..maxcol] Of integer;


Function Validar(dimLF,dimLC:integer): boolean;
Begin
  If (dimLF<=maxfil)And(dimLC<=maxcol)Then
    Begin
      Validar := true;
    End
  Else
    Validar := false;
End;

Procedure CargarMatriz (Var m:matriz;Var dimLF,dimLC:integer);

Var i,a: integer;
Begin
  readln(dimLF);
  readln(dimLC);
  If (Validar(dimLF,dimLC))Then
    Begin
      For i:= 1 To dimLF Do
        For a:=1 To dimLC Do
          Begin
            Writeln('Ingrese');
            Read(m[i,a]);
          End;
    End;
End;

Procedure ImprimirFilasPares (m:matriz;dimLF,dimLC:integer);

Var i,a: integer;
Begin
  For i:=1 To dimLF Do
    For a:=1 To dimLC Do
      If ((i Mod 2)=0) Then
        Begin
          Writeln('Fila Par');
          writeln(m[i,a]);
        End;
End;

Procedure ImprimirColumnasImpares (m:matriz;dimLF,dimLC:integer);

Var i,a: integer;
Begin
  For i:= 1 To dimLC Do
    For a:= 1 To dimLF Do
      If ((i Mod 2)=1) Then
        Begin
          Writeln('Columna Par');
          writeln(m[a,i]);
        End;
End;

Procedure ImprimirDiagonalPrincipal(m:matriz;dimLF,dimLC:integer);

Var i: integer;
Begin
  For i:= 1 To dimLC Do
    Writeln(m[i,i]);
End;


Var dimLF,dimLC: integer;
  m: matriz;
Begin
  CargarMatriz(m,dimLF,dimLC);
  If (dimLF <>0) And ( dimLC <>0) Then
    Begin
      ImprimirFilasPares(m,dimLF,dimLC);
      ImprimirColumnasImpares(m,dimLF,dimLC);
      ImprimirDiagonalPrincipal(m,dimLF,dimLC);
    End;
End.
