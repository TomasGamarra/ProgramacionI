----------{CargaDeDatos}----------
Procedure Cargar ( Var M:matriz; Var DimFila: rangof;  Var DimCol: rangoc);

Var i: rangoF;
  j: rangoc;
Begin
  readln(DimFila);
  readln(DimCol);
  If Validar(DimFila, DimCol) Then
    For i:=1 To DimFila Do
      For j:= 1 To DimCol Do
        readln(M[i,j]);
End;

-----------{Imprimir}------------

Procedure Imprimir (Var M: matriz; DimFila: rangof;DimCol: rangoc);

Var i: rangof;
  j: rangoc;
Begin
  For i:=1 To DimFila Do
    For j:= 1 To DimCol Do
      writeln(M[i,j]);
End;

-----------{BuscarElemento}-------------

Function Buscar ( M: matriz; DimFila: rangof; DimCol: rangoc; elem: integer): boolean;

Var 
  existe : boolean;
  i: rangof;
  j: rangoc;
Begin
  existe := false;
  i := 1;
  While ( i<= DimFila) And (Not existe) Do
    Begin
      j := 1;
      While ( j <= DimCol) And (Not existe) Do
        If M[i,j] = elem Then
          existe := true
        Else
          j := j+1;
      If Not existe Then
        i := i+1;
    End;
  Buscar := existe;
End;


------------{ElimnarFila}----------------

Procedure EliminarFila ( Var M: matriz; Var DimFila: rangoF; DimCol: rangoC; fila: rangoF; Var exito:boolean);

Var k: rangoC;
  f : rangoF;
Begin
  exito := false;
  If ( fila >0 And fila < DimFila ) { verifica que el índice es válido, para efectuar la operación}
    Then
    Begin
      exito := true;
      For f := fila To DimFila-1 Do
        For k := 1 To DimCol Do
          M [f, k] := M [f+1, k];
      DimFila := DimFila - 1
    End
  Else If (fila = DimFila) Then
         Begin
           DimFila := DimFila - 1;
           exito := true;
         End;
End;


------------{Sumar}------------
{solo se pueden sumar matrices de igual dimensión}
Procedure Sumar (Var M1, M2: matriz; Var M3: matriz;DimFila: rangof; DimCol: rangoc);

Var 
  i: rangof;
  j: rangoc;
Begin
  For i:=1 To DimFila Do
    For j:= 1 To DimCol Do
      M3[i,j] := M1[i,j] + M2[i,j];
End;
