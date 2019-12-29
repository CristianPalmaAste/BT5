create or replace function f_es_posible_cerrar_peco (Pidpeco int) returns varchar(1000) as
$$
declare
  aux        int;
  aux1       int;
  aux2       int;
  aux3       int;
  Vidempr    int;
  Vmes       int;
  Vanno      int;
  Vmensaje   varchar(1000);
  Vfecha     varchar(1000);
  Vfechas    varchar(1000);
  C_vtas_no_contab cursor for
    select distinct to_char(vent.fechaventa,'dd-mm-yyyy') fecha_venta
    from   ventas   vent
    where  vent.idempr                       = Vidempr
    and    to_char(vent.fechaventa,'yyyymm') = ltrim(rtrim(to_char(Vanno,'0009'))) || ltrim(rtrim(to_char(Vmes,'09')))
    and    vent.idasco                       is null
    order  by 1
    ;
begin
  -- Función que determina si se puede o no cerrar un período contable (PECO); retorna S o (N + la razón por la que no se puede cerrar el PECO)
  -- (la razón va después de la N separada por un ;)
  --
  -- Para que se pueda cerrar un período contable de una empresa, se debe cumplir:
  --
  -- 1) que estén contabilizadas todas las ventas del mes-año del PECO
  -- 2) que estén contabilizadas todas las compras del mes-año del PECO
  -- 3) que no haya asientos contables en estado 1 = CREADO
  --
  select count(*)
  into   aux
  from   periodos_contables
  where  id = Pidpeco
  ;
  if aux = 0 then
    return('N;No existe período contable ' || Pidpeco);
  end if;
  select idempr
        ,mes
        ,anno
  into   Vidempr
        ,Vmes
        ,Vanno
  from   periodos_contables
  where  id = Pidpeco
  ;
  --
  -- Revisión ventas
  select count(*)
  into   aux1
  from   ventas   vent
  where  vent.idempr                       = Vidempr
  and    to_char(vent.fechaventa,'yyyymm') = ltrim(rtrim(to_char(Vanno,'0009'))) || ltrim(rtrim(to_char(Vmes,'09')))
  and    vent.idasco                       is null
  ;
  --
  -- Revisión compras
  /*
    falta ver si hay compras no contabilizadas
  */
  aux2 := 0;
  --
  -- Revisión asientos contables
  select count(*)
  into   aux3
  from   asientos_contables   asco
  where  asco.idpeco                          = Pidpeco
  and    to_char(asco.fecha_asiento,'yyyymm') = ltrim(rtrim(to_char(Vanno,'0009'))) || ltrim(rtrim(to_char(Vmes,'09')))
  and    asco.idesac                          = 1
  ;
  --
  if aux1 != 0 or aux2 != 0 or aux3 != 0 then
    Vmensaje := '';
    if aux1 != 0 then
      Vfechas := '';
      open C_vtas_no_contab;
      loop
        fetch C_vtas_no_contab into Vfecha;
        exit when not found;
        Vfechas := Vfechas || ' - ' || Vfecha;
      end loop;
      close C_vtas_no_contab;
      Vfechas := substr(Vfechas,4,1000);
      Vmensaje := Vmensaje || ';Existen ' || aux1 || ' ventas no contabilizadas, fechas: ' || Vfechas;
    end if;
    if aux2 != 0 then
      Vmensaje := Vmensaje || ';Existen ' || aux2 || ' compras no contabilizadas';
    end if;
    if aux3 != 0 then
      Vmensaje := Vmensaje || ';Existen ' || aux3 || ' asientos contables pendientes';
    end if;
    return('N' || Vmensaje);
  else
    return('S');
  end if;
end;
$$ LANGUAGE plpgsql;

select f_es_posible_cerrar_peco (1);

\q