
Program PruebaRecorrerPalabra;

Type 
  Cadena10 = String[10];

Procedure InformarCadaLetra (Palabra:char);

Var cantA: integer;
Begin
  cantA := 0;
  While (Palabra <> '.') Do
    Begin
      If (Palabra = 'a')Then
        Begin
          cantA := cantA+1;
          Writeln('pase por if)')
        End;
      read(Palabra);
    End;
  writeln('La cantidad de letras A de la palabra',    Palabra    ,'son : ',   cantA );
End;

Var Palabra: char;
Begin
  WriteLn('Escribe una palabra de no mas de 10 caracteres :  ');
  Read(Palabra);
  writeln(Palabra);
  InformarCadaLetra(Palabra);
End.


Procedure BorrarElemento (Var pri:lista; nom:cadena50; Var exito: boolean);

Var ant, act: lista;
Begin
  exito := false;
  act := pri;
{Recorro mientras no se termine la lista y no encuentre el elemento}
  While (act <> Nil) And (act^.datos.nom <> nom) Do
    Begin
      ant := act;
      act := act^.sig
    End;
  If (act <> Nil) Then
    Begin
      exito := true;
      If (act = pri) Then
        pri := act^.sig;
      Else
        ant^.sig := act^.sig;
      dispose (act);
    End;

End
