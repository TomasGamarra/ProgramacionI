



















{*Dada una secuencia de 1000 tuits correspondientes al mes pasado que fueron seleccionados para
calcular algunas estadísticas. Sabiendo que cada tuit contiene información de la fecha y del texto (de
                                                                                                      un máximo 140
                                                                                                      caracteres) en que
fue publicado se pide calcular e informar:
                                           a) La cantidad de hashtags (palabras que empiezan con el carácter ‘#’) y
                                           usuarios (palabras que
                                                     empiezan con carácter ‘@’).
                                           b) La cantidad de tuits publicados cada día.
                                           c) La cantidad promedio de palabras de un tuit.}

Program Ej_7;

Const 
  total = 3;

Type 
  dia = 1..31;
  cadena140 = String[140];
  tuit = Record
    fecha: dia;
    texto: cadena140;
  End;
  vectortuit = Array [1..total] Of tuit;

Procedure Cargar (Var v:vectortuit);

Var i: integer;
Begin
  For i:=1 To total Do
    Begin
      Writeln('Cargadia');
      readln(v[i].fecha);
      Writeln('Carga texto');
      readln(v[i].texto);
    End;
  Writeln('termine')
End;

Procedure Recorrer (v:tuit;Var cantH,cantAr:integer);

Var cantChar: integer;
Begin
  cantChar := 0;
  While (cantChar<=140 ) Do
    Begin
      read(v.texto);
      While (v.texto = ' ') Do
        read(v.texto);
      While (cantChar<=140) And (v.texto <> ' ') Do
        Begin
          If (v.texto='@') Then
            cantAr := cantAr+1;
          If (v.texto = '#')Then
            cantH := cantH+1;
          readln(v.texto);
        End;
    End;
End;

Var v: vectortuit;
  cantH,cantAr,i: integer;
Begin
  Cargar(v);
  cantH := 0;
  cantAr := 0;
  For i:= 1 To total Do
    Recorrer(v[i],cantH,cantAr)
End.
