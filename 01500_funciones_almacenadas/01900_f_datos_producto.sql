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
  Vvalorunitario             numeric;
  Vporcentajedescuento       numeric;
  Vmontodescuento            numeric;
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
    select delp.valorunitario
    into   Vvalorunitario
    from   listas_precios          lipr
          ,detalles_listas_precios delp
    where  lipr.id     = delp.idlipr
    and    lipr.idesre = 1
    and    delp.idprod = Pidprod
    ;
    return(Vvalorunitario);
  elsif Pdato_deseado between 7 and 8 then
    select porcentajedescuento
          ,montodescuento
    into   Vporcentajedescuento
          ,Vmontodescuento
    from   descuentos
    where  idprod = Pidprod
    ;
    if Vporcentajedescuento is not null or Vmontodescuento is not null then
      if Vporcentajedescuento is not null then
        if Pdato_deseado = 7 then
          return(Vporcentajedescuento);
        else
          return('P');
        end if;
      else
        if Pdato_deseado = 7 then
          return(Vmontodescuento);
        else
          return('M');
        end if;
      end if;
    else
      select sfpr.idfapr
            ,sfpr.idsfpr
      into   Vidfapr
            ,Vidsfpr
      from   productos              prod
            ,sub_familias_productos sfpr
      where  prod.idsfpr = sfpr.id
      and    prod.id     = Pidprod
      ;


return('');
    end if;
  else
    return('-----');
  end if;
end;
$$ LANGUAGE plpgsql;

select 'descuento       : ' || f_datos_producto(1 , 7);
select 'tipo descuento  : ' || f_datos_producto(1 , 8);
select 'descuento       : ' || f_datos_producto(3 , 7);
select 'tipo descuento  : ' || f_datos_producto(3 , 8);
select 'descuento       : ' || f_datos_producto(5 , 7);
select 'tipo descuento  : ' || f_datos_producto(5 , 8);
select 'descuento       : ' || f_datos_producto(7 , 7);
select 'tipo descuento  : ' || f_datos_producto(7 , 8);
select 'descuento       : ' || f_datos_producto(9 , 7);
select 'tipo descuento  : ' || f_datos_producto(9 , 8);
select 'descuento       : ' || f_datos_producto(11, 7);
select 'tipo descuento  : ' || f_datos_producto(11, 8);
select 'descuento       : ' || f_datos_producto(13, 7);
select 'tipo descuento  : ' || f_datos_producto(13, 8);
select 'descuento       : ' || f_datos_producto(15, 7);
select 'tipo descuento  : ' || f_datos_producto(15, 8);
select 'descuento       : ' || f_datos_producto(17, 7);
select 'tipo descuento  : ' || f_datos_producto(17, 8);
select 'descuento       : ' || f_datos_producto(19, 7);
select 'tipo descuento  : ' || f_datos_producto(19, 8);

