*1. El municipio requiere procesar la información correspondiente a la
recaudación impositiva de los
colectivos de transporte público:
                                   a) Se cuenta con información del número de
                                   línea, patente del vehículo y monto
                                   recaudado. Se
                                   debe informar el monto recaudado por dicha l�
                                   �nea. Asuma que la información se ingresa
                                   por teclado ordenada por número de línea y
                                   finaliza cuando se ingresa el número cero.}

                                   Program Ej_1a;

Type 
  info = Record
    Num: integer;
    Pat: string;
    Monto: real;
  End;


Procedure LeerInfo(Var l:info);
Begin
  Writeln('Ingrese num de linea: ');
  Readln(l.Num);
  If (l.num <> 0)Then
    Begin
      Writeln('Ingrese patente: ');
      Readln(l.Pat);
      Writeln('Ingrese monto: ');
      Readln(l.Monto);
    End;
End;

Procedure CalculoMonto (l:info;Var monto:real);
Begin
  monto := monto+l.Monto;
End;

Var linea: info;
  actual: integer;
  monto: real;
Begin
  LeerInfo(linea);
  While (linea.Num <> 0) Do
    Begin
      actual := linea.Num;
      monto := 0;
      While (linea.Num <> 0) And (actual = linea.Num) Do
        Begin
          CalculoMonto(linea,monto);
          LeerInfo(linea);
        End;
      Writeln('El monto recaudado por la linea fue de : ',monto:2:2);
    End;
End.
