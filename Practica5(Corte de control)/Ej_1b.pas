
Program Ej_1b;

Type 
  info = Record
    Empresa: string;
    Num: integer;
    Pat: string;
    Monto: real;
  End;


Procedure LeerInfo(Var l:info);
Begin
  Writeln('Ingrese empresa: ');
  Read(l.Empresa);
  If (l.empresa <> 'fin') Then
    Begin
      Writeln('Ingrese num de linea: ');
      Readln(l.Num);
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

Procedure CalcularMontoEmp (monto:real;Var montoEmp:real);
Begin
  montoEmp := montoEmp+monto;
End;

Var linea: info;
  actual: integer;
  monto,montoEmp: real;
  actE: string;
  Lactual: integer;
Begin
  LeerInfo(linea);
  While (linea.Empresa <> 'fin') Do
    Begin
      actE := linea.Empresa;
      montoEmp := 0;
      While (linea.Empresa <> 'fin')And( actE = linea.Empresa) Do
        Begin
          Lactual := linea.Num;
          monto := 0;
          While (Lactual = linea.Num) And (linea.Empresa <> 'fin') And (actE =
                linea.Empresa) Do
            Begin
              CalculoMonto(linea,monto);
              LeerInfo(linea);
            End;
          Writeln('El monto recaudado por la linea fue de : ',monto:2:2);
          CalcularMontoEmp(monto,montoEmp);
        End;
      Writeln('El monto recaudado por la empresa fue de: ',montoEmp:2:2)
    End;
End.
