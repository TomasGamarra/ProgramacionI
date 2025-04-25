
Program Ej_10;

Const 
  dimF = 2000;

Type 
  vectornombre = Array [1..dimF] Of string;

Procedure Cargar(Var v:vectornombre;dimL:integer);

Var i: integer;
Begin
  For i:=1 To dimL Do
    Begin
      writeln('Cargue vector');
      readln(v[i]);
    End;
End;

Function BuscarPosElemOrd (v:vectornombre; nombre:String ; dimL:integer): integer;

Var pos: integer;
Begin
  pos := 1;
  While (pos<= dimL) And ( nombre > v[pos]) Do
    Begin
      pos := pos+1;
    End;
  If ( pos > dimL) Or ( nombre < v[pos]) Then
    Begin
      pos := 0;
    End;
  BuscarPosElemOrd := pos;
End;

Procedure InsertarElemOrd(Var v:vectornombre; nombre:String;Var dimL:integer);

Function DeterminarPosicion (v:vectornombre;nombre:String;dimL:integer): integer;

Var pos: integer;
Begin
  pos := 1;
  While (dimL<= dimF) And (nombre > v[pos]) Do
    pos := pos+1;
  DeterminarPosicion := pos;
End;

Procedure InsertarElem(Var v:vectornombre;nombre:String;Var dimL:integer;pos:integer);

Var i: integer;
Begin
  For i:= dimL Downto pos Do
    v[i+1] := v[i];
  v[pos] := nombre;
  dimL := dimL+1;
End;

Var 
  pos: integer;
Begin
  If (dimL < dimF)Then
    Begin
      pos := DeterminarPosicion(v,nombre,dimL);
      If (pos<=dimL) And (pos <>0) Then
        Begin
          InsertarElem(v,nombre,dimL,pos);
        End;
    End;
End;


Procedure EliminarElemOrd(Var v:vectornombre;nombre:String;Var dimL:integer);

Function BuscarPosElem(v:vectornombre;nombre:String;dimL:integer): integer;

Var pos: integer;
  exito: boolean;
Begin
  exito := false;
  pos := 1;
  While (dimL<=dimF)And (Not exito) Do
    If (nombre = v[pos])Then
      Begin
        exito := true;
      End
    Else
      pos := pos+1;
  If (exito=false) Then
    pos := 0;
  BuscarPosElem := pos;
End;

Procedure BorrarElemento (Var v:vectornombre;nombre:String;Var dimL:integer;pos:integer);

Var i: integer;
Begin
  For i:= (pos+1) To dimL Do
    v[i-1] := v[i];
  dimL := dimL-1;
End;

Var pos: integer;
Begin
  pos := BuscarPosElem(v,nombre,dimL);
  If ( pos <> 0) Then
    BorrarElemento(v,nombre,dimL,pos);
End;

Procedure ImprimirVector (v:vectornombre;dimL:integer);

Var i: integer;
Begin
  For i:= 1 To dimL Do
    writeln(v[i]);
End;

Var v: vectornombre;
  nombre: string;
  dimL: integer;
  pos: integer;
Begin
  //Se dispone dimL y nombre;
  Writeln('Ingrese dimL');
  Readln(dimL);
  Cargar(v,dimL);
  Writeln('Ingrese nombre a buscar');
  Readln(nombre);
  writeln();
  pos := BuscarPosElemOrd(v,nombre,dimL);
  writeln();
  InsertarElemOrd(v,nombre,dimL);
  writeln();
  EliminarElemOrd(v,nombre,dimL);
  writeln();
  //EliminarElemOrdMod(v,nombre,dimL);
  ImprimirVector(v,dimL);
End.
