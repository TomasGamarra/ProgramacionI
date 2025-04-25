
Program Ej_6;

Const 
  total = 4;

Type 
  vectorgases = Array [1..10] Of string;

  estrella = Record
    nombre: string;
    area: real;
    gases: vectorgases;
    distancia: integer;
  End;

  vectorestrella = Array [1..total] Of estrella;

Procedure Cargar (Var e:vectorestrella);

Var i: integer;
Begin
  For i:=1 To total Do
    Begin
      Readln(e[i].nombre);
      Readln(e[i].area);
      {Readln(e[i].gases);}
      Readln(e[i].distancia);
    End;
End;

Procedure MayorSuperficie(est:estrella;Var max1,max2:real;Var pos1,pos2:integer;i:integer);
Begin
  If (est.area > max1) Then
    Begin
      max2 := max1;
      max1 := est.area;
      pos2 := pos1;
      pos1 := i;
    End
  Else
    If (est.area > max2)Then
      Begin
        max2 := est.area;
        pos2 := i;
      End;
End;



{Function Estrellas5Gases (est:vectorestrella);

Var
 dimL:integer;
  i: integer;
Begin
  dimL:=0;
  while (dimL < 10) and (est[i].gases <> '') do begin
    dimL:=dimL+1;
  end;
  if (dimL > 5)then
  Estrellas5Gases := dimL;
End;}


Procedure ParImpar (est:estrella);

Var 
  aux: integer;
  dig: integer;
  sumapar: integer;
  sumaimpar: integer;
Begin
  aux := est.distancia; {para no modificar el arreglo}
  sumapar := 0;
  sumaimpar := 0;
  While (aux <> 0) Do
    Begin
      dig := aux Mod 10;
      If ((dig Mod 2)=0) Then
        Begin
          sumapar := sumapar + dig ;
        End
      Else
        sumaimpar := sumaimpar+dig;
      aux := aux Div 10;
    End;
  If (sumapar > sumaimpar) Then
    Begin
      Writeln('La suma de los pares de: ',est.nombre,'es mayor que la de los impares');
    End;
End;


Var est: vectorestrella;
  max1,max2: real;
  vecgas: vectorgases;
  pos1,pos2,i: integer;
Begin
  Cargar(est);
  max1 := -1;
  max2 := -1;
  For i:= 1 To total Do
    Begin
      MayorSuperficie(est[i],max1,max2,pos1,pos2,i); {El nombre de las 2 estrellas con mayor superficie.}
      ParImpar(est[i]);
    End;
  Writeln('La estrella: ',est[pos1].nombre,'tiene un area max1 de : ',est[pos1].area:2:2);
  Writeln('La estrella: ',est[pos2].nombre,'tiene un area max2 de : ',est[pos2].area:2:2);
End.
