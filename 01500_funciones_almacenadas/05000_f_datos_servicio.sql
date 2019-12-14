create or replace function f_datos_servicio (numeric
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
  Vpreciounitario            numeric;
  Vporcentajedescuento       numeric;
  Vidfapr                    numeric;
  Vidsfpr                    numeric;
  Vidpais                    numeric;
  Vidtipr                    numeric;
  Vestaexento                varchar(1);
  Vimptos_obligat            numeric;
  Vimptos_especif            numeric;
  Vcod_alfanumerico_prod     varchar(100);
begin
return('1');
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
       7    descuento (expresado como %)
       8    sumatoria de impuestos obligatorios a los que está afecto el producto
       9    sumatoria de impuestos específicos a los que está afecto el producto
       10   "código alfanumérico" del producto, esto es: familia + sub familia + correlativo en 4 dígitos

  */
  if Pdato_deseado not between 1 and 10 then
    return(null);
  end if;
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
    select delp.preciounitario
    into   Vpreciounitario
    from   listas_precios          lipr
          ,detalles_listas_precios delp
    where  lipr.id     = delp.idlipr
    and    lipr.idesre = 1
    and    delp.idprod = Pidprod
    ;
    return(Vpreciounitario);
  elsif Pdato_deseado = 7 then
    select porcentajedescuento
    into   Vporcentajedescuento
    from   descuentos
    where  idprod = Pidprod
    and    idesre = 1
    ;
    if Vporcentajedescuento is not null then
      return(Vporcentajedescuento);
    else
      select sfpr.idfapr
            ,sfpr.id
      into   Vidfapr
            ,Vidsfpr
      from   productos              prod
            ,sub_familias_productos sfpr
      where  prod.idsfpr = sfpr.id
      and    prod.id     = Pidprod
      ;
      select porcentajedescuento
      into   Vporcentajedescuento
      from   descuentos
      where  idsfpr = Vidsfpr
      and    idesre = 1
      ;
      if Vporcentajedescuento is not null then
        return(Vporcentajedescuento);
      else
        select porcentajedescuento
        into   Vporcentajedescuento
        from   descuentos
        where  idfapr = Vidfapr
        and    idesre = 1
        ;
        if Vporcentajedescuento is not null then
          return(Vporcentajedescuento);
        else
          return(0);
        end if;
      end if;
    end if;
  elsif Pdato_deseado = 8 then
    select tipr.estaexento
    into   Vestaexento
    from   productos       prod
          ,tipos_productos tipr
    where  prod.idtipr = tipr.id
    and    prod.id     = Pidprod
    ;
    if Vestaexento = 'S' then
      return(0);
    else
      select empr.idpais
      into   Vidpais
      from   productos prod
            ,empresas  empr
      where  prod.idempr = empr.id
      and    prod.id     = Pidprod
      ;
      select coalesce(sum(valor),0)
      into   Vimptos_obligat
      from   impuestos
      where  idpais      = Vidpais
      and    obligatorio = 'S'
      ;
      return(Vimptos_obligat);
    end if;
  elsif Pdato_deseado = 9 then
    select idtipr
    into   Vidtipr
    from   productos
    where  id = Pidprod
    ;
    select coalesce(sum(impu.valor),0)
    into   Vimptos_especif
    from   tipos_productos_impuestos tipi
          ,impuestos                 impu
    where  tipi.idimpu = impu.id
    and    tipi.idtipr = Vidtipr
    ;
    return(Vimptos_especif);
  elsif Pdato_deseado = 10 then
    select    fapr.cod_familia
           || sfpr.cod_sub_familia
           || prod.correlativoflia
    into   Vcod_alfanumerico_prod
    from   productos                  prod
          ,sub_familias_productos     sfpr
          ,familias_productos         fapr
    where  prod.idsfpr = sfpr.id
    and    sfpr.idfapr = fapr.id
    and    prod.id     = Pidprod
    ;
    return(Vcod_alfanumerico_prod);
  else
    return('-----');
  end if;
end;
$$ LANGUAGE plpgsql;

select f_datos_producto(1,10);
select f_datos_producto(2,10);

