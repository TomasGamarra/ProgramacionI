
{6. * Defina un tipo de dato que permita almacenar una secuencia de 64 valores
binarios e implemente
módulos que realicen las operaciones AND, OR y NOT (vistas en la práctica de
                                                     operaciones lógicas),
junto con dos operandos o uno, según corresponda.}

Program Ej_6;

Const 
  dimF = 64;

Type 
  Arreglo = Array [1..dimF] Of boolean;

Function AND (bin1,bin2:boolean): Boolean;
Begin
  AND := bin1 And bin2;
End;

Function AND
Begin
  If (bin1=true) And (bin2=true) Then
    AND := true;
  Else
    AND := false;
End;

Function OR (bin1,bin2: boolean): Boolean;
Begin
  OR := bin1 Or bin2;
End;


Function NOT(bin1: boolean): Boolean;
Begin
  NOT := Not bin1
End;
