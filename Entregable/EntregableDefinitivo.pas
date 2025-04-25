
Program EntregableDefinitivo;

Const 
  MAX_PRODUCTO = 40;
  MAX_COMPRA = 10;

Type 

  CadenaCodigo = string[8];
  CadenaDescrip = string[50];

  producto = Record
    cantCompras: integer;
    precio: real;
    codigo: CadenaCodigo;
  End;

  VecProds = array[1..MAX_COMPRA] Of producto;  {vector de compras}

  CadenaNombre = String[30];

  venta = Record
    cliente: CadenaNombre;
    ProdsComprados: integer;
    prods: VecProds;
  End;

  ListaVentas = ^nodoVenta;
  nodoVenta = Record
    dato: venta;
    sig: ListaVentas;
  End;


  TProducto = Record
    codigo: CadenaCodigo;
    descripcion: CadenaDescrip;
  End;

  TProductos = array [1..MAX_PRODUCTO] Of TProducto;

Const 
  PRODUCTOS: TProductos = ((codigo: 'ABC-0123'; descripcion: 'Muñeca de trapo'),
                          (codigo: 'ABC-1234'; descripcion: 'Set de pinturas acrilicas para niños'),
                          (codigo: 'BCD-2345'; descripcion: 'Juego de construccion de bloques'),
                          (codigo: 'BCD-3456'; descripcion: 'Puzzle de madera con formas geometricas'),
                          (codigo: 'CDE-4567'; descripcion: 'Set de maquillaje para niñas'),
                          (codigo: 'CDE-5678'; descripcion: 'Juego de mesa de Monopoly'),
                          (codigo: 'DEF-6789'; descripcion: 'Coche teledirigido'),
                          (codigo: 'DEF-7890'; descripcion: 'Rompecabezas de 100 piezas'),
                          (codigo: 'EFG-8901'; descripcion: 'Rompecabezas de 50 piezas'),
                          (codigo: 'EFG-9012'; descripcion: 'Rompecabezas de 25 piezas'),
                          (codigo: 'GHI-0123'; descripcion: 'Pelota de futbol'),
                          (codigo: 'GHI-1234'; descripcion: 'Kit de pinturas al oleo para niños'),
                          (codigo: 'HIJ-2345'; descripcion: 'Juego de mesa de ajedrez'),
                          (codigo: 'HIJ-3456'; descripcion: 'Patinete con ruedas de silicona'),
                          (codigo: 'JKL-4567'; descripcion: 'Muñeco de accion con accesorios'),
                          (codigo: 'JKL-5678'; descripcion: 'Juego de herramientas de plastico'),
                          (codigo: 'KLM-6789'; descripcion: 'Cocinita de juguete'),
                          (codigo: 'KLM-7890'; descripcion: 'Set de construccion de pista de carreras'),
                          (codigo: 'LMN-8901'; descripcion: 'Juego de cartas Uno'),
                          (codigo: 'LMN-9012'; descripcion: 'Cubo de Rubik'),
                          (codigo: 'MNO-0123'; descripcion: 'Muñeca de juguete con accesorios'),
                          (codigo: 'MNO-1234'; descripcion: 'Juego de construccion de aviones de juguete'),
                          (codigo: 'NOP-0123'; descripcion: 'Juego de mesa de la oca'),
                          (codigo: 'NOP-1234'; descripcion: 'Kit de experimentos de ciencias para niños'),
                          (codigo: 'PQR-2345'; descripcion: 'Set de herramientas de carpinteria de juguete'),
                          (codigo: 'PQR-3456'; descripcion: 'Juego de cocina de juguete'),
                          (codigo: 'QRS-4567'; descripcion: 'Set de experimentos de quimica para niños'),
                          (codigo: 'QRS-5678'; descripcion: 'Kit de jardineria de juguete'),
                          (codigo: 'STU-6789'; descripcion: 'Puzzle de suelo con letras y numeros'),
                          (codigo: 'STU-7890'; descripcion: 'Kit de arte y manualidades para niños'),
                          (codigo: 'TUV-8901'; descripcion: 'Set de construccion de robots de juguete'),
                          (codigo: 'TUV-9012'; descripcion: 'Juego de bolos de juguete'),
                          (codigo: 'UVW-0123'; descripcion: 'Juego de mesa de damas chinas'),
                          (codigo: 'UVW-1234'; descripcion: 'Set de sellos y tinta para niños'),
                          (codigo: 'VWX-2345'; descripcion: 'Set de tren de juguete'),
                          (codigo: 'VWX-3456'; descripcion: 'Kit de modelado de plastilina'),
                          (codigo: 'WXY-4567'; descripcion: 'Juego de mesa de Parches'),
                          (codigo: 'WXY-5678'; descripcion: 'Helicoptero de control remoto'),
                          (codigo: 'XYZ-6789'; descripcion: 'Puzzle 3D de monumentos famosos'),
                          (codigo: 'XYZ-7890'; descripcion: 'Juego de construccion de castillo de juguete'));

Procedure CargarVector(Var v:TProductos);

Var i: integer;
Begin
  For i:= 1 To MAX_PRODUCTO Do
    v[i] := PRODUCTOS[i];
End;


//a) Implemente un módulo que recibe la estructura de datos de productos y un código de producto
// y retorne el nombre de este. En caso de que el código no se encuentre debe retornar 
//un string vacío. Implemente una búsqueda binaria/dicotómica. 

Procedure BusquedaDicotomica ( Var v:TProductos;codigo:CadenaCodigo;Var nombre:CadenaDescrip;dimL:integer);

Var pri,medio,ult: integer;
Begin
  nombre := '';
  //Necesario?
  pri := 1;
  ult := dimL;
  medio := (pri+ult) Div 2;
  While ( pri <= ult) And (codigo <> v[medio].codigo) Do
    Begin
      If (codigo < v[medio].codigo) Then
        ult := medio - 1
      Else
        pri := medio+1;
      medio := (pri+ult) Div 2;
    End;
{asigna en posición encontrada}
  If (pri <= ult)Then
    nombre := v[medio].descripcion
  Else
    nombre := '';
End;


//b) Implemente un segundo módulo que determine si un código de producto existe, invocando al módulo del punto a) 

Function Existe( v:TProductos; codigo:CadenaCodigo; dimL: integer): boolean;

Var nombre: CadenaDescrip;
Begin
  BusquedaDicotomica(v,codigo,nombre,dimL);
  If (nombre = '') Then
    Existe := false
  Else
    Existe := true;
End;


//-Punto C Generar una lista enlazada de ventas ordenada por nombre de cliente junto con los productos que compró
//-Los datos de cada cliente se ingresan desde el teclado. Primero se ingresa el nombre, luego la cantidad de productos 
//-comprados (máximo 10) y luego la información de cada producto. 
//-La carga finaliza al ingresar “zzz” como nombre. En caso de ingresar una cantidad de productos mayor a 10 o un 
//-código de producto inválido debe volver a pedirse.


Procedure CargarListaVentaOrdenada (Var pri:ListaVentas; V:venta);

Var 
  nue, ant, lugar: ListaVentas;
Begin
  new (nue);
  nue^.dato := V;
  nue^.sig := Nil;
  lugar := pri;
  ant := pri;
  While (lugar <> Nil) And (nue^.dato.cliente > lugar^.dato.cliente) Do
    //Buscamos la posicion a insertar
    Begin
      ant := lugar;
      lugar := lugar^.sig;
    End;
  If (lugar = pri) Then //No avanzo en el While , pues esta vacia o inserta adelante
    Begin
      nue^.sig := pri;
      pri := nue;
    End
  Else //Avanzo en el while sirve para medio y fin de la lista
    Begin
      ant^.sig := nue;
      nue^.sig := lugar;
      //Cuando inserta al final, LUGAR vale NIL
    End;
End;

Procedure GenerarLista (Var L:ListaVentas; vecProd:TProductos;dimL:integer);

Var V: venta;
  i: integer;
Begin
  Writeln('Ingrese el nombre de cliente');
  Readln(V.cliente);
  While (V.cliente <> 'zzz') Do
    Begin
      Writeln('Ingrese la cantidad de productos comprados');
      Readln(V.ProdsComprados);
      While ( V.ProdsComprados > MAX_COMPRA) Do
        Begin
          Writeln('Ingrese nuevamente la cantidad de productos comprados');
          readln(v.ProdsComprados);
        End;
      For i:= 1 To v.ProdsComprados Do
        Begin
          write('Ingrese cantidad comprada del producto: ',  i  );
          readln (V.prods[i].cantCompras);
          writeln('Ingrese el precio del producto ');
          readln (V.prods[i].precio);
          writeln('Ingrese el codigo del producto ');
          readln(V.prods[i].codigo);
          While ( Not Existe (vecProd,V.prods[i].codigo,dimL)) Do
            Begin
              writeln('Ingrese nuevamente el codigo del producto');
              readln(V.prods[i].codigo);
            End;
        End;
      CargarListaVentaOrdenada (L,V);
      writeln('Ingrese el nombre del cliente');
      readln(V.cliente);
    End;
End;

//-----PuntoD------
//Una vez generada la lista se pide recorrerla una única vez para: d) Informar para cada cliente: 
//-Nombre ------
//- Monto total de la compra ------
//-Nombre, código y cantidad del producto en el que más dinero gastó.

Procedure Informar (v:venta);

Var i: integer;
  TotalGastado: real;
  Max: producto;
  n: CadenaDescrip;
Begin
  TotalGastado := 0;
  Max.precio := -1;
  Max.cantCompras := 0;
  Max.codigo := '';
  writeln('El nombre del cliente es:  ', v.cliente);
  For i:= 1 To v.ProdsComprados Do
    Begin
      TotalGastado := TotalGastado + (v.prods[i].cantCompras * v.prods[i].precio);
      If ((v.prods[i].cantCompras * v.prods[i].precio) > Max.precio) Then
        Max := v.prods[i];
    End;
  Writeln('El monto total de la compra es : ', TotalGastado:2:2);
  BusquedaDicotomica(PRODUCTOS,Max.codigo,n,MAX_PRODUCTO);
  Writeln('El nombre del producto que mas dinero gasto es : ', n);
  Writeln('Elcodigo del producto que mas dinero gasto es: ' ,Max.codigo);
  Writeln('La cantidad del producto que mas dinero gasto es: ' ,Max.cantCompras);
End;

Procedure RecorrereInformar (Var L:ListaVentas);

Var  aux: ListaVentas;
Begin
  aux := L;
  While (L <> Nil) Do
    Begin
      Informar(L^.dato);
      L := aux^.sig;
      dispose(aux);
      aux := L;
    End;
End;


//--------ProgPrincipal---------

Var L: Listaventas;
  VectorCatalogo: TProductos;
  dimL: integer;
Begin
  L := Nil;
  dimL := MAX_PRODUCTO;
  CargarVector(VectorCatalogo);
  GenerarLista(L,VectorCatalogo,dimL);
  RecorrereInformar(L);
End.
