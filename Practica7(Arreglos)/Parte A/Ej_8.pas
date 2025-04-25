
Program Ej_8;

Const 
  dimF = 10;

Type 
  vectorcar = Array [1..dimF] Of char;

Procedure Cargar (Var v:vectorcar);

Var 
  i: integer;
Begin
  For i:= 1 To dimF Do
    Readln(v[i]);
End;



Procedure DescartarBlancos(v:vectorcar;Var i:integer);
Begin
  While (v[i] =' ') And (i <= dimF)  Do
    i := i+1;
End;

Function  CantidadPalabras(v:vectorcar): integer;

Var i: integer;
  cantP: integer;
Begin
  i := 1;
  cantP := 0;
  DescartarBlancos (v,i);
  While (i <= dimF) Do
    Begin
      While (v[i] <> ' ') And (i <= dimF) Do
        Begin
          i := i+1;
        End;
      cantP := cantP+1;
      DescartarBlancos(v,i);
    End;
  CantidadPalabras := cantP;
End;

Procedure CantidadPalabrasUltPos(v:vectorcar;dimL:integer);

Var i: integer;
  cantP: integer;
Begin
  i := 1;
  cantP := 0;
  DescartarBlancos (v,i);
  While (i <= dimL) Do
    Begin
      While (v[i] <> ' ') And (i <= dimL) Do
        Begin
          i := i+1;
        End;
      cantP := cantP+1;
      DescartarBlancos(v,i);
    End;
End;

Procedure CantidadPalabrasHastaPunto(v:vectorcar);

Var i: integer;
  cantP: integer;
Begin
  i := 1;
  cantP := 0;
  DescartarBlancos (v,i);
  While (i <= dimF) And ( v[i] <> '.') Do
    Begin
      While (v[i] <> '.') And  (v[i] <> ' ') And (i <= dimF) Do
        Begin
          i := i+1;
        End;
      cantP := cantP+1;
      DescartarBlancos(v,i);
    End;
End;



Var v: vectorcar;
  dimL: integer;
Begin
  //DIML RECIBIDA
  dimL := dimF;
  Cargar(v);
  Writeln('La cantidad de palabras es de: ',CantidadPalabras(v));
  CantidadPalabrasUltPos(v,dimL);
  CantidadPalabrasHastaPunto(v);
End.
