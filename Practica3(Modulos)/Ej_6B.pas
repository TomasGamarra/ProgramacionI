6. * Se lee una secuencia de caracteres terminada en ‘.’. Determinar si la
secuencia cumple con el
patrón A@B. En caso de no cumplir, informar las partes que no verificaron el
patrón.
A@B. donde:
            @ es el carácter ‘@’ que seguro existe.
            A debe ser una secuencia de letras mayúsculas.
            B debe ser una secuencia de caracteres que no aparecieron en A.
            Ejemplo: la siguiente secuencia cumple el patrón MTL@aePsz.


                     Program Ej_6B;
Begin
  read (car);
  While (car <> '.') Do
    Begin
      While (car <> '@') Do
        Begin
          If (car In A) Then
            cumpleA := true;
          Else
            Begin
              cumpleA := false;
            End
            read (car);
        End;
      B := [B]-[A];
      If (car In B) Then
        cumpleB := true
      Else
        cumpleB := false

    End;
