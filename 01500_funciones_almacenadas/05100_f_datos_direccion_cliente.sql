create or replace function f_datos_direccion_cliente (Pidclie          numeric
                                                     ,Pidtidi          int
                                                     ,Pdato_solicitado int
                                                     ) returns varchar(100) as
$$
declare
  Viddicl                  int;
  Vcalle                   varchar(100);
  Vnumero                  varchar(100);
  Vunidad_territorial1     varchar(100);
  Vunidad_territorial2     varchar(100);
  Vtelefono                varchar(100);
begin
  select min(id)
  into   Viddicl
  from   direcciones_clientes
  where  idclie = Pidclie
  and    idtidi = Pidtidi
  ;
  select dicl.calle
        ,coalesce(dicl.numero,'-')
        ,unte1.nombre
        ,unte2.nombre
        ,coalesce(dicl.telefono,'-')
  into   Vcalle
        ,Vnumero
        ,Vunidad_territorial1
        ,Vunidad_territorial2
        ,Vtelefono
  from   direcciones_clientes   dicl
        ,unidades_territoriales unte1
        ,unidades_territoriales unte2
  where  dicl.idunte       = unte1.id
  and    unte1.iduntepadre = unte2.id
  and    dicl.id           = Viddicl
  ;
  if Vcalle               is null then Vcalle                := '-'; end if;
  if Vnumero              is null then Vnumero               := '-'; end if;
  if Vunidad_territorial1 is null then Vunidad_territorial1  := '-'; end if;
  if Vunidad_territorial2 is null then Vunidad_territorial2  := '-'; end if;
  if Vtelefono            is null then Vtelefono             := '-'; end if;
  if    Pdato_solicitado = 1 then
    return(Vcalle);
  elsif Pdato_solicitado = 2 then
    return(Vnumero);
  elsif Pdato_solicitado = 3 then
    return(Vunidad_territorial1);
  elsif Pdato_solicitado = 4 then
    return(Vunidad_territorial2);
  elsif Pdato_solicitado = 5 then
    return(Vtelefono);
  else
    return(null);
  end if;
end;
$$ LANGUAGE plpgsql;

\q

select f_datos_direccion_cliente(4 , 1, 1);
select f_datos_direccion_cliente(4 , 1, 2);
select f_datos_direccion_cliente(4 , 1, 3);
select f_datos_direccion_cliente(4 , 1, 4);
select f_datos_direccion_cliente(4 , 1, 5);
select f_datos_direccion_cliente(2 , 1, 1);
select f_datos_direccion_cliente(2 , 1, 2);
select f_datos_direccion_cliente(2 , 1, 3);
select f_datos_direccion_cliente(2 , 1, 4);
select f_datos_direccion_cliente(2 , 1, 5);
select f_datos_direccion_cliente(15, 9, 8);

\q


