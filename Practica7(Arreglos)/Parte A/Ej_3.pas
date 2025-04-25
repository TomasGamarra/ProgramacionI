



{Realizar un programa que lea de teclado un vector de 600 caracteres.
Finalizada
la carga informar:
                   a) La cantidad y porcentaje de consonantes sobre el total de
                   caracteres alfabéticos.
                   b) La cantidad y porcentaje de caracteres que son dígitos,
                   letras mayúsculas, letras minúsculas
                   sobre el total de caracteres ingresados.}


Program Ej_3;

Const 
  dimF = 10;

Type 
  vectorcaracteres = Array [1.. dimF] Of char;
  letras = set Of char;
  digitos = set Of char;


Procedure LeerVector(Var c:vectorcaracteres);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      Writeln('Ingresar Caracter');
      Readln(c[i]);
    End;
End;

Procedure LetrasTotales ( c:vectorcaracteres; alfabeto:letras;Var cantL:integer)
;

Var 
  i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      If (c[i] In alfabeto) Then
        cantL := cantL+1;
    End;
End;


Procedure Consonantes ( Var c:vectorcaracteres; cons:letras;cantL:integer);

Var 
  i: integer;
  cantCons: integer;
Begin
  cantCons := 0;
  For i:= 1 To dimF Do
    If (c[i] In cons) Then
      cantCons := cantCons+1;
  writeln('La cantidad de consonantes es de: ',cantCons,
          'y el porcentaje de consonantes es de: ',((100*cantCons)/cantL): 2: 2)
  ;
End;

Procedure PuntoB (c:vectorcaracteres;dig:digitos; alfabeto:letras);

Var i: integer;
  cant: integer;
Begin
  cant := 0;
  For i:= 1 To dimF Do
    Begin
      If (c[i] In dig) Or (c[i] In alfabeto) Then
        cant := cant+1;
    End;
  Writeln('La cantidad de digitos y letras totales es de: ',cant,
          'con un porcentaje del: ',(((100*cant)/dimF)): 2: 2);
End;

Var car: vectorcaracteres;
  alfabeto: letras;
  cantL: integer;
  cons: letras;
  dig: digitos;
Begin
  alfabeto := ['a'..'z'] + ['A'..'Z'];
  cantL := 0;
  cons := alfabeto - ['a','e','i','o','u','A','E','I','O','U'];
  dig := ['0'..'9'];
  LeerVector(car);
  LetrasTotales(car,alfabeto,cantL);
  Consonantes(car,cons,cantL);
  PuntoB(car,dig,alfabeto);
End.
