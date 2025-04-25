
{Se desea modelar un nuevo juego que consiste en un tablero de 15 filas por 15 columnas y que se
juega de a 2 jugadores. Cada casillero del tablero contiene un número del 0 al 10 y un valor que
indica si la celda fue utilizada a lo largo de la partida.
La partida consiste de 10 rondas donde en cada una de las rondas los 2 jugadores eligen una
celda del tablero. Las celdas elegidas en cada ronda se analizan y obtiene un punto el jugador que
eligió la celda que contiene el mayor número.
- En caso de que ambos jugadores hayan, en una ronda, elegido una celda que contiene el mismo número ninguno suma puntos.
- En caso de que algún jugador seleccione una celda que ya haya sido utilizada a lo largo de la partida, dicho jugador
pierde la ronda y se le suma un punto a su oponente. 
-En caso de que en una ronda ambos jugadores seleccionen celdas que ya hayan sido utilizadas a lo largo de la partida, ninguno suma
puntos. 
Se pide:
a. Implemente un módulo que inicialice el tablero de juego. El modulo recibe el tablero y una lista
con los valores que va a tener cada celda del tablero. Cada elemento de la lista almacena: fila,
columna y número para la celda (0 a 10). Además, 
-cada casillero se debe marcar como no utilizada. 
-En caso de que el valor para una celda no venga en la lista, dicha celda se inicializara con el valor 0 (cero).
b. Implemente un módulo que reciba el tablero y simule el juego. Los valores que cada jugador va
eligiendo son leídos de teclado. Al finalizar el juego, informar los puntos obtenidos por cada
jugador y cuál es el ganador.}

Program Ej_5;

Type 

  casillero = Record
    num: 0..10;
    usada: boolean;
  End;

  Tablero = Array [1..15,1..15] Of casillero;

  celda = Record
    fila: 1..15;
    columna: 1..15;
    numero: 0..10;
  End;

  Lista = ^nodo;
  nodo = Record
    datos: celda;
    sig: Lista;
  End;

  jugador = Record
    fila: 1..15;
    columna: 1..15;
    puntos: integer;
  End;

Procedure InicializoUsado (Var T:Tablero);

Var i,j: integer;
Begin
  For i:= 1 To 15 Do
    For j:= 1 To 15 Do
      T[i,j].usada := true;
End;

Procedure ChequeoTablero (Var T:Tablero);

Var i,j: integer;
Begin
  For i:= 1 To 15 Do
    For j:= 1 To 15 Do
      If (T[i,j].usada = true) Then
        Begin
          T[i,j].num := 0;
          T[i,j].usada := false;
        End;
End;
Procedure InicializarTablero (Var T:Tablero;L:Lista);

Var 
Begin
  While (L <> Nil) Do
    Begin
      T[L^.datos.fila,L^.datos.columna].num := L^.datos.numero;
      T[L^.datos.fila,L^.datos.columna].usada := false;
      L := L^.sig;
    End;
  ChequeoTablero(T);
End;

Procedure Juego (T:Tablero);

Var J1,J2: jugador;
  i: integer;
Begin
  J1.puntos := 0;
  J2.puntos := 0;
  For i:= 1 To 10 Do
    Begin
      Writeln('Ingrese celda Jugador 1');
      Readln(  J1.fila ,  J1.columna  );
      Writeln('Ingrese celda Jugador 2');
      Readln(  J2.fila ,  J2.columna  );
      If (T[J1.fila,J1.columna].usada = true ) And (T[J2.fila,J2.columna].usada = true) Then
        Writeln('Ninguno Suma Puntos')
      Else
        Begin
          If (T[J1.fila,J1.columna].usada = true ) Or (T[J2.fila,J2.columna].usada = true) Then
            Begin
              If (T[J1.fila,J1.columna].usada = true ) Then
                J2.puntos := J2.puntos+1
              Else
                J1.puntos := J1.puntos+1
            End
          Else
            Begin
              If (T[J1.fila,J1.columna].num = T[J2.fila,J2.columna].num) Then
                Writeln('Ninguno Suma Puntos')
              Else
                Begin
                  If ( T[J1.fila,J1.columna].num > T[J2.fila,J2.columna].num) Then
                    J1.puntos := J1.puntos+1
                  Else
                    J2.puntos := J2.puntos+1;
                End;
            End;
        End;
    End;
  writeln(J1.puntos);
  Writeln(J2.puntos);
  Writeln('El Ganador es : ');
  If (J1.puntos > J2.puntos) Then
    writeln('Jugador 1')
  Else
    Writeln('Jugador 2');
End;


Var T: Tablero;
  L: Lista;
Begin
  InicializarTablero(T,L)

End;
