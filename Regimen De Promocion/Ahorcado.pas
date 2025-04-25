
Program Ahorcado;

Const 
  JUGADORES = 2;
  FINISH = 'AHORCADO'; {String que usaremos para informar los errores}
  MAXERRORES = 8;
  CATEGORIAS = 5;
  MAXPALABRAS = 26;  {Cantidad max de palabras en una categoria}

Type 
  Lista = ^nodo;
  nodo = Record
    datos: string;
    sig: Lista;
  End;

  Conjunto = set Of 0..MAXPALABRAS;
  {Incluimos el 0 , ya que seria si esta vacio el conjunto , y ponemos un max estimado de 50 palabras x categoria}

  VecConjunto = Array [1..CATEGORIAS] Of Conjunto;
  {Vector donde se almacenaran los numeros que representan palabras que ya fueron dichas}

  Vecpuntos = Array[1..JUGADORES] Of integer; {Puntaje de cada Jugador}

  VectorListas = array [1..CATEGORIAS] Of Lista; {Lista para cada categoria}

  VectorPalabras = Array  [1..CATEGORIAS] Of integer; {Vector para la cantidad de palabras de cada cat}



Procedure AgregarAdelante (Var pri:Lista;palabra:String);

Var nue: Lista;
Begin
  New(nue);
  nue^.datos := palabra;
  nue^.sig := pri;
  pri := nue;
End;



Procedure ExtraerPalabras (Var VecList:VectorListas;Var VPalabras:VectorPalabras);
{Traemos las palabras desde el archivo al VList}

Var 
  palabra,numero: string;
  arch: TextFile;
  i: integer;
Begin
  For i:= 1 To CATEGORIAS Do {Para cada archivo(Categoria) extraemos las palabras}
    Begin
      Str(i,numero);
      Assign(arch , 'D:\Prueba\archivo' + numero + '.txt');
      {Utilizamos una variable(string) para acceder a cada archivo}
      Reset (arch);
      While (Not Eof(arch)) Do
        Begin
          ReadLn(arch,palabra);
          AgregarAdelante(VecList[i],palabra); {Agregamos en la lista la palabra extraida}
          VPalabras[i] := VPalabras[i]+1; {Sumamos 1 al vector que cuenta las palabras x categoria}
        End;
      Close(arch);
    End;
End;

Procedure InicializarVList (Var V:VectorListas);
{Inicializamos En Nil El vector de listas que tendra las palabras de cada categoria}

Var i: integer;
Begin
  For i:= 1 To CATEGORIAS Do
    V[i] := Nil;
End;

Procedure InicializarVecCon(Var V:Vecpuntos); {Inicializamos el Vec que contara los puntos de cada jugador}

Var i: integer;
Begin
  For i:= 1 To JUGADORES Do
    V[i] := 0;
End;

Procedure InicializarVecPalabras(Var V:VectorPalabras);
{Inicializamos el vector que tendra la cantidad total de palabras x categoria}

Var i: integer;
Begin
  For i:= 1 To CATEGORIAS Do
    V[i] := 0;
End;


Procedure CambioJugador (Var JugadorActual:integer);
Begin
  If (JugadorActual=1) Then
    JugadorActual := 2
  Else
    JugadorActual := 1
End;

Procedure Chequear (Var Errores:integer;Palabra:String;Letra:String;Var aux:String);

Var 
  i,distintos: integer;
  yadijo: boolean;
  unavez: boolean;
Begin
  unavez := false; {variable para que no informe que ha acertado la letra por cada vez que este en la palabra}
  distintos := 0;
  For i:= 1 To Length(Palabra) Do
    Begin
      If (Letra = Palabra[i]) And (Letra <> aux[i]) Then {Si la letra que dijo pertenece a la palabra}
        Begin
          aux[i] := Palabra[i];
          If (Not unavez) Then
            Writeln('Felicitaciones has acertado!!');
          unavez := true;
        End
      Else
        Begin
          If (Letra = aux[i]) Then {Si ya dijo la letra}
            yadijo := true
          Else
            distintos := distintos+1; {variable para ver si la letra no esta en la palabra}
        End;
    End;
  If (distintos = Length(Palabra)) Or (yadijo) Then {Si la letra no pertenecia o ya fue dicha}
    Begin
      Errores := Errores+1;
      If (yadijo)Then
        writeln('Esa letra ya fue dicha')
      Else
        writeln('Esa letra no pertenece a la palabra');
    End;
  Writeln();
  Writeln('Tu palabra queda asi :  ',   aux);
  Writeln();
End;


Procedure Puntuacion (Var Puntos:integer;Palabra,aux:String;Errores:integer);
Begin
  If (Palabra=aux) And (Errores < 5) Then
    Begin
      Puntos := Puntos+3;
      Writeln('Felicitaciones has ganado 3 puntos!! Tu puntuacion actual es de:  ', Puntos ,' puntos');
    End
  Else
    If (Palabra=aux) And (Errores >= 5) And (Errores < MAXERRORES) Then
      Begin
        Puntos := Puntos+1;
        Writeln('Felicitaciones has ganado 1 punto!! Tu puntuacion actual es de:  ', Puntos ,' puntos');
      End;
End;

Procedure MostrarFiguraAhorcado(Errores: Integer);
Begin
  Writeln();
  Case Errores Of 
    0:
       Begin
         Writeln('   ___             ');
         Writeln('  |   |            ');
         Writeln('      |            ');
         Writeln('      |            ');
         Writeln('      |     O      ');
         Writeln('      |    /|\     ');
         Writeln('      |     |      ');
         Writeln('=========  / \     ');
       End;

    1:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln(' /|\  |');
         Writeln('  |   |');
         Writeln(' / \  |');
         Writeln('      |');
         Writeln('=========');
       End;
    2:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln(' /|\  |');
         Writeln('  |   |');
         Writeln(' /    |');
         Writeln('      |');
         Writeln('=========');
       End;
    3:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln(' /|\  |');
         Writeln('  |   |');
         Writeln('      |');
         Writeln('      |');
         Writeln('=========');
       End;
    4:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln(' /|\  |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('=========');
       End;
    5:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln(' /|   |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('=========');
       End;
    6:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln('  |   |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('=========');
       End;
    7:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('  O   |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('=========');
       End;
    8:
       Begin
         Writeln('   ___');
         Writeln('  |   |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('      |');
         Writeln('=========');
       End;
  End;
  Writeln();
End;


Procedure InformarAhorcado (Errores:integer);

Var i: integer;
Begin
  If (Errores > 0) Then
    Begin
      Writeln('Ten cuidado!! Tenes los dias contados: ');
      For i:= 0 To Errores Do {De 0 a Errores por si los errores son = 1 }
        Begin
          Write(FINISH[i]); {Informamos la constante 'AHORCADO' para la cantidad de errores cometidos}
        End;
    End;
  MostrarFiguraAhorcado(Errores); {Segun los errores informa la imagen del munieco}
End;

Procedure InformarGanador (JugadorActual:integer;puntos:integer;Jug1,Jug2:String);
Begin
  If (puntos < 10) And (JugadorActual = 1) Then
    Begin
      Writeln('Has perdido ', Jug1  ,'!!!  Sigue participando...');
      Writeln('El Ganador Es : ',    Jug2  );
    End
  Else
    If  (puntos < 10) And (JugadorActual = 2) Then
      Begin
        Writeln('Has perdido ', Jug2  ,'!!!  Sigue participando...');
        Writeln('El Ganador Es : ',    Jug1  );
      End
  Else
    If (JugadorActual=1) And (puntos >= 10) Then
      Writeln('Felicitaciones ',  Jug1 , ' has ganado con un total de: ',   puntos  ,'puntos!!!')
  Else
    Writeln('Felicitaciones ',  Jug2   ,' has ganado con un total de: ',   puntos  ,'puntos!!!')
End;



Procedure InicializarAux (Var aux:String);

Var i: integer;
Begin
  For i:= 1 To Length(aux) Do
    aux[i] := '_';
End;

Procedure InformarEspacios(aux:String);
Begin
  Writeln();
  Writeln('Tu palabra tiene ' ,  Length(aux)  , ' letras');
  Writeln(aux);
End;


Function TerminoTurno (Errores:integer;aux,Palabra:String): boolean;
Begin
  If (Errores = MAXERRORES) Then {Si se equivoco lo maximo posible}
    TerminoTurno := True
  Else
    If (aux=Palabra) Then {Si acerto la palabra}
      TerminoTurno := True
  Else
    TerminoTurno := false;
End;

Procedure LeerJugadores(Var J1,J2:String);

Begin
  Writeln('Ingrese el nombre del Jugador 1: ');
  Readln(J1);
  Writeln('Ingrese el nombre del Jugador 2: ');
  Readln(J2);
End;

Function Termino ( Errores,puntos:integer): boolean;
Begin
  If Errores = MAXERRORES Then
    Termino := true
  Else
    Begin
      If (puntos >= 10) Then
        Termino := true
      Else
        Termino := false;
    End;
End;

Procedure RecorroLista(pri:Lista;num:integer;Var Palabra:String);

Var i: integer;
Begin
  For i:= 1 To num Do
    pri := pri^.sig;
  Palabra := pri^.datos;
End;


Procedure ElegirPalabra (VList:VectorListas;VecPalabras:VectorPalabras;Var Palabra:String;Var VecConj:VecConjunto);

Var i,j: integer;
  valido: boolean;
Begin
  valido := false;
  While (Not valido) Do
    Begin
      Randomize;
      i := Random(CATEGORIAS)+1;
      Randomize;
      j := Random(VecPalabras[i]) + 1;
      If (Not (j In VecConj[i])) Then
        Begin
          Include(VecConj[i],j);
          valido := true;
        End;
    End;
  RecorroLista(VList[i],j,Palabra);
End;

Procedure TurnoDe (J1,J2:String;JAct:integer);

Begin
  WriteLn();
  WriteLn();
  If (JAct = 1) Then
    Write('Te toca ',  J1  ,' !!!! Mucha Suerte.')
  Else
    Write('Te toca ',  J2  ,' !!!! Mucha Suerte.')
End;


Procedure PasarAMayuscula (Var Letra:String);
Begin
  Letra := UpCase(Letra);
End;

Procedure Juego (Var VPuntos:Vecpuntos;VList:VectorListas;VecPalabras:VectorPalabras;Var VecConj:VecConjunto);

Var Jugador1,Jugador2: string; {Nombres de cada jugador}
  Palabra,aux: string;
  Errores: integer;
  JugadorActual: integer; {Identificador del jug act en integer}
  Letra: string; {Letra que ingresara el jugador act}
Begin
  LeerJugadores(Jugador1,Jugador2);
  JugadorActual := 1; {Inicia el Jug 1}
  Errores := 0;
  While (Not Termino(Errores,VPuntos[JugadorActual])) Do
    Begin
      ElegirPalabra(VList,VecPalabras,Palabra,VecConj);
      Errores := 0; {Inicializamos en 0 los errores ya que es un nuevo turno}
      aux := Palabra; {Nos guardamos en un aux la palabra seleccionada para trabajar con ella}
      InicializarAux(aux); {Cambiamos la palabra por guiones, para mostrar en pantalla}
      TurnoDe(Jugador1,Jugador2,JugadorActual); {Informamos a quien le toca jugar, con su respectivo nombre}
      InformarEspacios(aux); {Informamos la cantidad de letras que tiene la palabra}
      InformarAhorcado(Errores);
      {muestra la imagen sin errores , para una mejor comprension de como evoluciona la imagen}
      While (Not TerminoTurno(Errores,aux,Palabra)) Do
        Begin
          Writeln('Ingrese una letra : ');
          Readln(Letra);
          PasarAMayuscula(Letra);
          Writeln();
          Chequear(Errores,Palabra,Letra,aux); {Chequea si la letra ingresada pertenece o no a la palabra a adivinar}
          InformarAhorcado(Errores); {Se muestra la imagen segun los errores cometidos}
        End;
      Puntuacion(VPuntos[JugadorActual],Palabra,aux,Errores); {Actualizamos los puntos del jugador actual}
      If (VPuntos[JugadorActual] < 10) Then
        CambioJugador(JugadorActual);
    End;
  If (Not(VPuntos[JugadorActual] >= 10))Then
    CambioJugador(JugadorActual);
  InformarGanador (JugadorActual,VPuntos[JugadorActual],Jugador1,Jugador2);
End;


Procedure InformarReglas;
Begin
  Writeln(









'Bienvenidos participantes al juego AHORCADO , desarrollado por Tomas Gamarra y Luciano Soto , a continuacion les detallaremos las reglas y como funciona el juego: '
  );
  Writeln(








'El juego consiste en adivinar palabras relacionadas con conceptos de Programacion 1, para eso las palabras estaran divididas en 5 categorias: '
  );
  Writeln('   -Conceptos de organizacion');
  Writeln('   -Algoritmos y estructuras de control');
  Writeln('   -Tipos y estructuras de datos');
  Writeln('   -Alocacion dinamica y estatica');
  Writeln('   -Eficiencia y correcion');
  Writeln('Se seleccionara una categoria al azar y luego una palabra la cual el jugador de turno tendra que adivinar..')
  ;
  Writeln('El juego termina cuando uno de los jugadores suma 10 o mas puntos , o bien uno de los dos jugadores pierda.')
  ;
  Writeln(








    'Un jugador pierde si completa 8 errores en un turno , completando la palabra AHORCADO que se mostrara en pantalla.'
  );
  Writeln('SISTEMA DE PUNTUACION:');
  Writeln('  - Si un jugador acierta la palabra con menos de 5 errores , el jugador conseguira 3 puntos');
  Writeln('  - Si un jugador acierta la palabra con 5 errores o mas , el jugador conseguira 1 punto');
  Writeln('Ahora si.. A JUGAR!!!!');
  Writeln();
End;

Procedure InicializarVecConj (Var V:VecConjunto);

Var i: integer;
Begin
  For i:= 1 To CATEGORIAS Do
    Include(V[i],0);
End;

Var VList: VectorListas;
  VecCon: Vecpuntos;
  VecPalabras: VectorPalabras;
  VecConj: VecConjunto;
Begin
  InicializarVecCon(VecCon);
  InicializarVecConj(VecConj);
  InicializarVecPalabras(VecPalabras);
  InicializarVList(VList);
  InformarReglas;
  ExtraerPalabras(VList,VecPalabras);
  Juego (VecCon,VList,VecPalabras,VecConj);
End.
