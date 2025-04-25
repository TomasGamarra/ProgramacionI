
Program Ej_1;

Type Medidas = Record
  ancho: real;
  alto: real;
  prof: real;
End;
Procedure LeerMedidas(Var Med:Medidas);
Begin
  Writeln('Ingrese el ancho');
  Read (Med.ancho);
  Writeln('Ingrese el alto');
  Read (Med.alto);
  Writeln('Ingrese la prof');
  Read (Med.prof);
End;
Function SacarVol (Med:Medidas): real;
Begin
  SacarVol := Med.ancho * Med.alto * Med.prof ;
End;
Function SacarArea (Med:Medidas): real;
Begin
  SacarArea := ((2 * Med.ancho * Med.alto )+ (2 * Med.prof * Med.alto) + (2 *
               Med. ancho * Med.prof));
End;

Var Med: Medidas;
Begin
  LeerMedidas(Med);
  Writeln(SacarVol(Med): 2: 2);
  Writeln(SacarArea(Med): 2: 2);
End.
