
Program Ej_7;

Const 
  Paises = 20;
  Representantes = 7;

Type 
  cadena25 = string [25];

  plato = Record
    Nombre: cadena25;
    FoC: char;
    IngP: cadena25;
  End;

  info = Record
    NomyA: cadena25;
    Pais: cadena25;
    Plato: plato;
    Sexo: char;
    Edad: integer;
  End;

Procedure LeerPLato(Var p:plato);
Begin
  Writeln('Ingrese Nombre: ');
  Readln(p.nombre);
  Writeln('Ingrese estado: ');
  Readln(p.FoC);
  Writeln('Ingrese ing P ');
  Readln(p.IngP);
End;

Procedure LeerInfo (Var datos:info);
Begin
  Writeln('Ingrese Mobre y ap ');
  Readln(datos.NomyA);
  Writeln('Ingrese pais ');
  Readln(datos.Pais);
  Writeln('Ingrese sexo ');
  Readln(datos.Sexo);
  Writeln('Ingrese edad ');
  Readln(datos.Edad);
  LeerPLato(datos.Plato);
End;

Procedure Calcular(d:info ; Var frios:integer);
Begin
  If (d.Plato.FoC = 'f') And (d.Sexo = 'f') Then
    frios := frios+1;
End;

Procedure Informar (d:info);
Begin
  If (d.Plato.FoC = 'c') And (d.Plato.IngP= 'pollo') Then
    Begin
      Writeln('El representante',d.NomyA);
      WriteLn('Perteneciente al pais: ',d.Pais);
      Write('Entrego caliente y con elemento principal pollo');
    End;
End;

Var a,i,frios,max,Prom: integer;
  datos: info;
  PromedioEdad: real;
  Pais: cadena25;
Begin
  max := -1;
  Prom := 0;
  For i:= 1 To Paises Do
    Begin
      frios := 0;
      For a:= 1 To Representantes Do
        Begin
          LeerInfo(datos);
          Calcular(datos,frios);
          Prom := Prom+datos.Edad;
          Informar(datos);
        End;
      If (frios > max) Then
        Begin
          max := frios;
          Pais := datos.Pais;
        End
    End;
  Writeln('El Pais con mayor platos frios servidos por una mujer es de: ',Pais);
  PromedioEdad := Prom/(Paises * Representantes);
  Writeln('El promedio de edad es de : ',PromedioEdad:2:2);
End.
