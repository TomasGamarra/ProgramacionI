
Program DarVueltaPalabra;

Const FIN = 10;

Type 

  vector = Array[1..FIN] Of char;

Procedure CargarVector (Var V:vector);

Var i: integer;
Begin
  For i:= 1 To FIN Do
    Begin
      Read(V[i]);
    End;
End;

Procedure InformarVectorAlReves (V:vector);

Var i: integer;
Begin
  For i:= FIN Downto 1 Do
    Begin
      Write(V[i]);
    End;
End;

Var V: vector;
Begin
  CargarVector(V);
  InformarVectorAlReves(V);
End.
