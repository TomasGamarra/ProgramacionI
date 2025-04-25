



















{La facultad de informática decide abrir 10 cursos de actualización (cuyos códigos se numeran del 1
al 10) para sus graduados. A cada inscripto se le solicita la siguiente información: DNI, apellido,
nombre, edad y el código del curso al que se desea inscribir (una persona se puede inscribir solo a
un curso). La facultad dispone de una estructura en la que se almacena para cada código de curso
el cupo máximo de personas que pueden inscribirse a ese curso. Se pide:
a. Simular el proceso de inscripción de los graduados a los cursos. El proceso de inscripción
finaliza cuando llega un graduado con apellido “zzz”. Para cada inscripción se debe controlar
que la cantidad de graduados ya inscriptos no supere el cupo máximo que cada curso tiene.
En caso de que el curso solicitado se encuentre completo se debe informar que no hay lugar
disponible en dicho curso.
b. Una vez finalizada la inscripción:
• Informar el código de aquellos cursos cuyo cupo máximo no se completó.
• Calcular e informar la cantidad de inscriptos al curso con código 2 que tienen entre 30 y
35 años.}

Program Ej_6;

Const 
  CURSOS = 10;

Type 
  cadena20 = string[20];

  inscripto = Record
    Dni: integer;
    apellido: cadena20;
    nombre: cadena20;
    edad: 18..100;
    codigo: 1..CURSOS;
  End;

  VectorCurso = Array[1..CURSOS] Of integer;


Procedure Leer (Var I:inscripto);
Begin
  Writeln('Apellido');
  Readln(I.apellido);
  If (I.apellido <> 'zzz') Then
    Begin
      Writeln('Dni');
      ReadLn(I.Dni);
      Writeln('Nombre');
      ReadLn(I.nombre);
      Writeln('Edad');
      ReadLn(I.edad);
      Writeln('Codigo');
      Readln(I.codigo);
    End;
End;


Procedure InicializarVector (Var V:VectorCurso);

Var i: integer;
Begin
  For i:= 1 To CURSOS Do
    V[i] := 0;
End;

Function HayEspacio (Ins:integer;Max:integer): Boolean;
Begin
  HayEspacio := (Ins < Max);
End;


Procedure SumarInscriptos (Var Inscriptos:VectorCurso;I:inscripto);
Begin
  Inscriptos[I.codigo] := Inscriptos[I.codigo]+1;
End;

Procedure InformarNoCompletados (Inscriptos:VectorCurso;Maximo:VectorCurso);

Var i: integer;
Begin
  For i:= 1 To CURSOS Do
    If (HayEspacio(Inscriptos[i],Maximo[i])) Then
      Writeln ('El curso : ',  i   , 'no se completo ');
End;

Procedure Inscripcion ( Var Inscriptos:VectorCurso ; Maximo:VectorCurso );

Var I: inscripto;
  Mayores: integer;
Begin
  Mayores := 0;
  Leer(I);
  While (I.apellido <> 'zzz') Do
    Begin
      If ( Not HayEspacio (Inscriptos[I.codigo],Maximo[I.codigo])) Then
        Writeln('No hay lugar en el curso: ',I.codigo)
      Else
        Begin
          SumarInscriptos(Inscriptos,I);
          If (I.codigo = 2) Then
            If (I.edad > 30) And (I.edad < 35) Then
              Mayores := Mayores+1;
        End;
      Leer(I);
    End;
  InformarNoCompletados(Inscriptos,Maximo);
  Writeln('La cantidad de mayores entre 30 y 35: ',  Mayores   );
End;

Procedure InicializarMaximo (Var V:VectorCurso);

Var  i: integer;
Begin
  For i:= 1 To CURSOS Do
    V[i] := 2;
End;

Var V: VectorCurso;
  VecIns: VectorCurso;
Begin
  InicializarVector(VecIns);
  InicializarMaximo(V); {Inscriptos en 0}
  Inscripcion(VecIns,V);
End.
