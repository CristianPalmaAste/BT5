create or replace function f_valor_linea_det_vta (numeric
                                                 ,numeric
                                                 ,numeric
                                                 ,numeric
                                                 ,numeric
                                                 ) returns numeric as
$$
declare
  Pidpais          numeric := $1;
  Pidprod          numeric := $2;
  Pidserv          numeric := $3;
  Pcantidad        numeric := $4;
  Pmonto_dscto     numeric := $5;
  Vtotal_linea     numeric;
  aux              numeric;
  Vvalorunitario   numeric;
  Vidtipr          numeric;
  Vestaexento      char(1);
  Vsub_total       numeric;
  Vvalor_impuesto  numeric;
  Vimpuesto        numeric;
  C_impuestos cursor for
    select valor
    from   impuestos
    where  idpais      = Pidpais
    and    obligatorio = 'S'
    and    Vestaexento = 'N'
    union
    select impu.valor
    from   tipos_productos_impuestos tipi
          ,impuestos                 impu
    where  tipi.idimpu      = impu.id
    and    tipi.idtipr      = Vidtipr
    and    impu.obligatorio = 'N'
    and    impu.idpais      = Pidpais
    ;
begin
  /* esta función debe ser invocada con Pidpais, (Pidprod o Pidserv), solo uno de los 2, y con Pcantidad y Pmonto_dscto (el cual puede ser 0) */
  if Pidpais is null or (Pidprod is null and Pidserv is null) or Pcantidad is null or Pmonto_dscto is null then
    return(0);
  end if;
  if Pidprod is not null and Pidserv is not null then
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
    select estaexento
    into   Vestaexento
    from   tipos_productos
    where  id = Vidtipr
    ;
    Vsub_total   := Pcantidad*Vvalorunitario - Pmonto_dscto;
    Vtotal_linea := Vsub_total;
    open C_impuestos;
    loop
      fetch C_impuestos into Vvalor_impuesto;
      exit when not found;
      Vimpuesto    := round((Vsub_total * Vvalor_impuesto) / 100);
      Vtotal_linea := Vtotal_linea + Vimpuesto;
    end loop;
    close C_impuestos;
  else
Vtotal_linea:=0;
  end if;
  return(Vtotal_linea);
end;
$$ LANGUAGE plpgsql;

select f_valor_linea_det_vta(1, 1   , null, 5, 100);
select f_valor_linea_det_vta(1, 16  , null, 1, 100);
select f_valor_linea_det_vta(1, 17  , null, 1, 100);
select f_valor_linea_det_vta(1, null, 1   , 5, 100);

