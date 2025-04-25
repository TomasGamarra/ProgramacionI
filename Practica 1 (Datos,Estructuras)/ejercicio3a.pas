
Program ejercicio3a;

Var 
  i,cantC,totH,cantH,Ciud: integer;
Begin
  totH := 0;
  For i:=(1) To (135) Do
    Begin
      Read (cantC);
      For Ciud:=(1) To (cantC) Do
        Begin
          Read (cantH);
          totH := totH + cantH ;
        End;
    End;
  Write(totH Div 135);
End.
