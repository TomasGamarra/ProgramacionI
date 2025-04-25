
Program ejercicio11;

Var alfa, beta, gama, epsilon: integer;
Procedure calcular(alfa: integer; Var gama: integer; Var beta:integer; Var
                   epsilon: integer);
Begin
  alfa := beta - 1 ; {12}
  beta := alfa + 8; {20}
  gama := beta + 15; {35}
  epsilon := beta - gama; {-15}
  writeln(alfa); {12}
  writeln(beta);{20}
  writeln(gama); {35}
  WriteLn(epsilon); {-15}
End;
Begin
  alfa := 6;
  beta := 13;
  gama := -6;
  epsilon := 2;
  calcular(epsilon, alfa, beta, gama);
  writeLn(alfa); {35}
  writeLn(beta); {20}
  writeln(gama); {-15}
  writeln(epsilon); {2}
End.
