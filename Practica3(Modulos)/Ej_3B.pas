
Program Uno;

Var pri,cuar: integer;
Procedure DatosDos( pri: integer; Var cuar: integer);
Begin
  pri := (pri + 8) * cuar;
  cuar := pri + cuar;
  writeln(cuar);

End;
Procedure DatosUno( Var pri: integer; cuar: integer);
Begin
  cuar := cuar + ((pri * 2) + 3);
  If ( cuar < 6) Then
    datosDos(cuar, pri)
  Else
    Begin
      cuar := 4;
      datosDos(cuar, pri);
    End;
  writeln(pri);
  writeln(cuar);

End;
Begin
  pri := 4;
  cuar := 8;
  datosUno(cuar, pri);
  writeln(pri);
  writeln(cuar);
End.
