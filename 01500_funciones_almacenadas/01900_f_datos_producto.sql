create or replace function f_datos_producto (numeric
                                            ,numeric
                                            ) returns varchar as
$$
declare
  Pidprod                    numeric := $1;
  Pdato_deseado              numeric := $2;
  Vcod_familia               varchar(1000);
  Vcod_sub_familia           varchar(1000);
  Vunidad_medida_producto    varchar(1000);
  Vorigen_producto           varchar(1000);
  Vnombre_producto           varchar(1000);
begin
  /*

     Esta función retorna los sgtes. datos de un producto:

     Flag   Dato retornado
     ----   -----------------
       1    familia
       2    sub familia
       3    unidad de medida
       4    origen
       5    nombre
       6    precio
       7    descuento
       8    tipo descuento: P=porcentaje; M=monto

  */
  if    Pdato_deseado between 1 and 5 then
    select fapr.cod_familia
          ,sfpr.cod_sub_familia
          ,unmp.descripcioncorta
          ,orpr.descripcioncorta
          ,prod.nombre
    into   Vcod_familia
          ,Vcod_sub_familia
          ,Vunidad_medida_producto
          ,Vorigen_producto
          ,Vnombre_producto
    from   productos                  prod
          ,sub_familias_productos     sfpr
          ,familias_productos         fapr
          ,unidades_medidas_productos unmp
          ,origenes_productos         orpr
    where  prod.idsfpr = sfpr.id
    and    sfpr.idfapr = fapr.id
    and    prod.idunmp = unmp.id
    and    prod.idorpr = orpr.id
    and    prod.id     = Pidprod
    ;
    if    Pdato_deseado = 1 then
      return(Vcod_familia);
    elsif Pdato_deseado = 2 then
      return(Vcod_sub_familia);
    elsif Pdato_deseado = 3 then
      return(Vunidad_medida_producto);
    elsif Pdato_deseado = 4 then
      return(Vorigen_producto);
    elsif Pdato_deseado = 5 then
      return(Vnombre_producto);
    end if;
  elsif Pdato_deseado = 6 then
  elsif Pdato_deseado between 7 and 8 then
return('-----');
  else
    return('-----');
  end if;
end;
$$ LANGUAGE plpgsql;

select 'familia         : ' || f_datos_producto(1  , 1);
select 'sub familia     : ' || f_datos_producto(1  , 2);
select 'unidad de medida: ' || f_datos_producto(1  , 3);
select 'origen          : ' || f_datos_producto(1  , 4);
select 'nombre          : ' || f_datos_producto(1  , 5);
select 'precio          : ' || f_datos_producto(1  , 6);
select 'descuento       : ' || f_datos_producto(1  , 7);
select 'tipo descuento  : ' || f_datos_producto(1  , 8);
select 'otro dato       : ' || f_datos_producto(1  , 9);

