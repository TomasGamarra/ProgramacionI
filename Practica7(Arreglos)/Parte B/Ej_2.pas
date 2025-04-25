
Program Ej_2;

Const 
  fin = 0;
  dimF = 10;

Type 
  vector = array [1..dimF] Of integer;

Procedure cargarVector (Var v:vector; Var dimL: integer);

Var 
  i: integer;
Begin
  i := 1;
  dimL := 1;
  readln (v [i]);
  While (i < dimF) And (v[i] <> fin) Do
    Begin
      i := i + 1;
      readln (v [i]);
      dimL := dimL + 1;
    End;
End;

Procedure imprimirVector (v: vector; dimL: integer);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      write (' [ ', v [i],' ] ');
    End;
End;

Procedure suprimirVector (Var v: vector; Var dimL: integer; I, J: integer);

Var 
  a, b: integer;
Begin
  For a:= I To J Do
    Begin
      For b:= I To dimL Do
        Begin
          v [b] := v [b + 1]
        End;
      dimL := dimL - 1;
    End;
End;


Var 
  dimL: integer;
  I,J: integer;
  v: vector;
Begin
  writeln ('Cargar vector: ');
  cargarVector (v, dimL);
  // se dispone
  imprimirVector (v, dimL);
  readln ();
  writeln ('Ingresar primer valor: ');
  read (I);
  writeln ('Ingresar segundo valor: ');
  read (J);
  suprimirVector (v, dimL, I, J);
  imprimirVector (v, dimL);
  readln ();
  readln ();
End.
