//Una empresa que vende juguetes por internet está interesada en procesar datos de las
//ventas de productos en promoción. De cada venta se conoce nombre del cliente y
//productos comprados. De cada producto se conoce la cantidad comprada, monto
//individual del producto y el código de producto (alfanumérico de hasta 8 caracteres,
//ej: ABC-1234 o ZYX-9876). Además, se dispone de una estructura de datos que
//contiene la información de los 40 productos promocionados. En ésta se almacena
//código y descripción de cada producto (ver más abajo) y se encuentra ordenada por código de producto.

Program EjercicioEntregableViejo;

Const 
  MAX_PRODUCTO = 40;
  //Proporcionado
  MAX_PRODCOMPRADOS = 10;

Type 
  TCodigoProducto = string[8];
  //Proporcionado
  TDescripProducto = string[50];
  //Proporcionado
  Cadena20 = String [20];

  TProducto = Record
    //Proporcionado
    codigo: TCodigoProducto;
    //Proporcionado
    descripcion: TDescripProducto;
    //Proporcionado
  End;
  TProductos = array[1..MAX_PRODUCTO] Of TProducto;
  //Proporcionado

  Producto = Record
    CantComprada: integer;
    Monto: real;
    codigo: TCodigoProducto;
  End;

  VectorProducto = Array [1..MAX_PRODCOMPRADOS] Of Producto;

  Venta = Record
    NombreCliente: Cadena20;
    ProdComprados: VectorProducto;
  End;

  ListaVentas = ^nodo;
  Nodo = Record
    datos: venta;
    sig: ListaVentas;
  End;



  //a) Implemente un módulo que recibe la estructura de datos de productos y un
  //código de producto y retorne el nombre de este. En caso de que el código no se
  //encuentre debe retornar un string vacío. Implemente una búsqueda
  // binaria/dicotómica

Procedure BusquedaDicotomica ( Var v:TProductos;elem:TCodigoProducto;Var nombre:TDescripProducto;dimL:integer);

Var pri,medio,ult: integer;
Begin
  nombre := '';
  //Necesario?
  pri := 1;
  ult := dimL;
  medio := (pri+ult) Div 2;
  While ( pri <= ult) And (elem <> v[medio].codigo) Do
    Begin
      If (elem < v[medio].codigo) Then
        ult := medio - 1
      Else
        pri := medio+1;
      medio := (pri+ult) Div 2;
    End;
  //Asigna en posición encontrada
  If (pri <= ult)Then
    nombre := v[medio].descripcion
  Else
    nombre := '';
End;



//b) Implemente un segundo módulo que determine si un código de producto existe,
//invocando al módulo del punto a)

Function Existe(v: TProductos;codigo: TCodigoProducto; dimL: integer): boolean;

Var n: TDescripProducto;
Begin
  BusquedaDicotomica(v,codigo,n,dimL);
  If (n = '') Then
    Existe := false
  Else
    Existe := true;
End;




//c) Generar una lista enlazada de ventas ordenada por nombre de cliente junto con
//los productos que compró. Los datos de cada cliente se ingresan desde el teclado.
//Primero se ingresa el nombre, luego la cantidad de productos comprados
//(máximo 10) y luego la información de cada producto. La carga finaliza al
//ingresar “zzz” como nombre. En caso de ingresar de ingresar una cantidad de
//productos mayor a 10 o un código de producto inválido debe volver a pedirse.

Procedure CargarListaVentaOrdenada (Var L:ListaVentas; V:venta)  {todos los clientes}

Var 
  nue,act,ant: : ListaVentas;

Begin
  New (nue);
  //Generamos espacio en M.D
  nue^.dato := V;
  //Ponemos el record en los datos del nodo
  act := L;
  //utilizamos Act para no modificar lista y recorrerla
  ant := L;
  nue^.sig := Nil;
  ←--  // Es necesario?                                  
  While (act<>Nil) And (nue^.dato.cliente>act^.dato.cliente) Do
    Begin
      ant := act;
      //guarda anterior y actual para seguir recorriendo
      act := act^.sig;
    End;

  If (act=L) Then   //Esta vacia lista, o va primero
    Begin
      nue^.sig := L;
      L := nue;
    End
  Else    //Esta en el medio ,o al final
    Begin
      ant^.sig := nue;
      //Une el anterior con el nuevo, y el nuevo con el actual
      nue^.sig := act;
    End;
End;


Procedure CargarDatoVenta (P:TProductos;Var L:ListaVentas{EN NIL INICIALMENTE});

Var 
  V: venta;
  //Se actualizará y no hace falta leer en prog.ppal
Begin
  writeln('Ingrese nombre del cliente');
  read(V.cliente);
  While (V.cliente <>'zzz') Do
    Begin
      writeln('Ingrese cantidad de productos comprados');
      read(V.cantprods);
      While (v.cantprods>10) Do
        read (v.cantprods);
      For i:= 1 To V.cantprods Do
        Begin
          writeln('Insertar cantidad comprada del producto');
          read (V.prods[i].cantCompras);
          writeln('Ingrese el precio del producto');
          read (V.prods[i].precio);
          writeln('Ingrese el codigo del producto');
          read (V.prods[i].codigo);
          While ( Not Existe(P,V.prods[i].codigo),dimL) Do
            read (V.prods[i].codigo);
        End;
      CargarListaVentaOrdenada (L,V);
      writeln('Ingrese el nombre del cliente');
      read(V.cliente);
    End;
End;
