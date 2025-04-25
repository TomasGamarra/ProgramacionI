
Program OperacionesVectores;

----------{AgregarAlFinal}------------

Procedure AgregarFinal (Var v: vector; Var dimL: integer; elemento: integer; Var exito: boolean);
Begin
  exito := false;
  //Verificar espacio suficiente
  If (dimL < dimF) Then
    Begin
      exito := true;
      dimL := dimL+1;
      //Actualizar cantidad de elementos
      v [dimL] := elemento;
    End;
End;


----------{InsertarElementoEnPosDeterminada}-------------

Procedure InsertarElem (Var v:vector; Var dimL: integer; elemento: integer; pos: integer; Var exito:boolean);

Var i : integer;
Begin
  exito := false;
  If (dimL < dimF) And ((pos>=1) And (pos<= dimL)) //Chequeo espacio y posicion 
    Then
    Begin
      exito := true;
      For i:= dimL Downto pos Do
        v [ i + 1 ] := v [ i ] ;
      v [pos] := elemento;
      dimL := dimL + 1;
    End;
End;

-----------{InsertarElementoEnVectorOrdenado}--------------

Procedure InsertarElemOrd (Var v: vector; Var dimL: indice; elem : TipoElem; Var exito: boolean);

Function DeterminarPosicion ( x: integer; v:Vector; dimL: Indice): Indice;

Var pos : Indice;
Begin
  pos := 1;
  While (pos<=dimL) And (x > v[pos]) Do
    pos := pos+1;
  DeterminarPosicion := pos;
End;

Procedure Insertar (Var v:vector; Var dimL:Indice; pos: Indice; elem:integer);

Var j: indice;
Begin
  For j:= dimL Downto pos Do
    v [ j + 1 ] := v [ j ] ;
  v [ pos ] := elem;
  dimL := dimL + 1;
End;

Var pos: indice;
Begin
  exito := false;
  If (dimL < dimF) Then
    Begin
      pos := DeterminarPosicion (elem, v, dimL);
      Insertar (v, dimL, pos, elem);
      exito := true;
    End;
End;
-------------{BuscarPosElemNoOrdenado}-----------------

Function BuscarPosElem (x:integer; v:vector; dimL: Indice): Indice;

Var pos: Indice;
  exito: boolean;
Begin
  pos := 1;
  exito := false;
  While (pos <= dimL) And (Not exito) Do
    If (x = v[pos]) Then
      exito := true
    Else
      pos := pos+1;
  If (exito = false) Then
    pos := 0;
  BuscarPosElem := pos;
End;

-----------{BusquedaPosEnVectorOrdenado}------------------

-----------{SecuencialOptimizada}----------------
Function BuscarPosElemOrden (x:integer ; v:vector ; dimL:integer): integer;

Var pos: integer;
Begin
  pos := 1;
  While (pos<= dimL) And (x > v[pos]) Do
    pos := pos+1;
  If (pos > dimL) Or (x < v[pos]) Then
    pos := 0;
  BuscarPosElemOrden := pos;
End;

-------------{Binaria/Dicotomica}---------------
Procedure BusquedaBin ( Var v: Vector; Var pos: Indice; dimL: Indice, x : TipoElem);

Var pri, ult, medio : Indice ;
Begin
  pos := 0 ;
  pri := 1 ;
  ult := dimL;
  medio := (pri + ult ) Div 2 ;
  While ( pri < = ult ) And ( x <> v [medio]) Do
    Begin
      If ( x < v [ medio ] ) Then
        ult := medio -1 ;
      Else
        pri := medio+1 ;
      medio := ( pri + ult ) Div 2 ;
    End ;
  If pri < = ult Then
    pos := medio
  Else
    pos := 0 ;
End ;

Procedure buscarNombre (P:TProductos; codigo:CadenaCodigo; Var nombre:cadenaDescrip);

Var 
  {retorna un nombre a partir de un codigo por parametro}
  i: integer;
  fin: integer;
  medio: integer;
  exito: boolean;
Begin
  exito := false;
  i := 1;
  fin := MAX_PRODUCTO;
  While (i<=fin)And (Not exito) Do
    //Importante
    Begin
      medio := (i+fin) Div 2;
      If (P[medio].codigo=codigo) Then exito := true;
      If (P[medio].codigo<codigo) Then i := medio+1;
      If (P[medio].codigo>codigo) Then fin := medio -1;
    End;
  If (exito=true) Then  nombre := P[i].descripcion
  Else nombre := '';
End;



-------------{BorrarElementoPosDeterminada}--------------
Procedure BorrarPos (Var v: vector;  Var dimL: integer; pos: posicion; Var exito: boolean );

Var i: integer;
Begin
  exito := false;
  If (pos >=1 And pos <= dimL)
    Then
    Begin
      exito := true;
      For i:= pos + 1 To dimL Do
        v [ i - 1 ] := v [ i ] ;
      dimL := dimL - 1 ;
    End;
End;
