create or replace function f_datos_linea_vta (numeric
                                             ,numeric
                                             ,numeric
                                             ,numeric
                                             ,numeric
                                             ) returns numeric as
$$
declare
  Pidprod          numeric := $1;
  Pidserv          numeric := $2;
  Pcantidad        numeric := $3;
  Pmonto_dscto     numeric := $4;
  Pdato_deseado    numeric := $5;
  Vidpais          numeric;
  aux              numeric;
  Vvalorunitario   numeric;
  Vidtipr          numeric;
  Vestaexento      char(1);
  Vsub_total       numeric;
  Vvalor_impuesto  numeric;
  Veste_impuesto   numeric;
  Vimpuestos       numeric;
  C_impuestos cursor for
    select valor
    from   impuestos
    where  idpais      = Vidpais
    and    obligatorio = 'S'
    and    Vestaexento = 'N'
    union
    select impu.valor
    from   tipos_productos_impuestos tipi
          ,impuestos                 impu
    where  tipi.idimpu      = impu.id
    and    tipi.idtipr      = Vidtipr
    and    impu.obligatorio = 'N'
    and    impu.idpais      = Vidpais
    ;
begin
  /*
    Esta función debe ser invocada con (Pidprod o Pidserv), solo uno de los 2, y con Pcantidad y Pmonto_dscto (el cual puede ser 0)
    Además, un parámetro extra que indica qué dato es el que se desea obtener, a saber:

    1: precio de venta (del producto o servicio)
    2: total exento
    3: total afecto
    4: impuestos
  */
  if (Pidprod is null and Pidserv is null) or Pcantidad is null or Pmonto_dscto is null or Pdato_deseado is null then
    return(0);
  end if;
  if Pidprod is not null and Pidserv is not null then
    return(0);
  end if;
  if Pdato_deseado not in (1, 2, 3, 4) then
    return(0);
  end if;
  if Pidprod is not null then
    select count(*)
    into   aux
    from   productos
    where  id = Pidprod
    ;
    if aux = 0 then
      return(0);
    end if;
    select valorunitario
          ,idtipr
    into   Vvalorunitario
          ,Vidtipr
    from   productos
    where  id = Pidprod
    ;
    if Pdato_deseado = 1 then
      return(Vvalorunitario);
    end if;
    select estaexento
    into   Vestaexento
    from   tipos_productos
    where  id = Vidtipr
    ;
    if Pdato_deseado in (2, 3) then
      if Vestaexento = 'S' then
        if Pdato_deseado = 2 then
          return(Pcantidad*Vvalorunitario - Pmonto_dscto);
        else
          return(0);
        end if;
      else
        if Pdato_deseado = 2 then
          return(0);
        else
          return(Pcantidad*Vvalorunitario - Pmonto_dscto);
        end if;
      end if;
    end if;
    select grem.idpais
    into   Vidpais
    from   grupos_empresariales grem
          ,empresas             empr
          ,productos            prod
    where  grem.id = empr.idgrem
    and    empr.id = prod.idempr
    and    prod.id = Pidprod
    ;
    Vsub_total := Pcantidad*Vvalorunitario - Pmonto_dscto;
    Vimpuestos := 0;
    open C_impuestos;
    loop
      fetch C_impuestos into Vvalor_impuesto;
      exit when not found;
      Veste_impuesto := round((Vsub_total * Vvalor_impuesto) / 100);
      Vimpuestos     := Vimpuestos + Veste_impuesto;
    end loop;
    close C_impuestos;
    return(Vimpuestos);
  else
return(0);
  end if;
end;
$$ LANGUAGE plpgsql;

select 'precio venta prod 1: ' || f_datos_linea_vta(1   , null, 0, 0  , 1);
select 'exento prod 1: '       || f_datos_linea_vta(1   , null, 5, 100, 2);
select 'afecto prod 1: '       || f_datos_linea_vta(1   , null, 5, 100, 3);
select 'impuestos prod 1: '    || f_datos_linea_vta(1   , null, 5, 100, 4);

select f_datos_linea_vta(16  , null, 1, 100, 1);
select f_datos_linea_vta(17  , null, 1, 100, 1);
select f_datos_linea_vta(null, 1   , 5, 100, 1);

