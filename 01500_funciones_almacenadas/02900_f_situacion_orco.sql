create or replace function f_situacion_orco (Pidorco       numeric
                                            ,Pdato_deseado numeric
                                            ) returns varchar(100) as
$$
declare
  aux1        int;
  aux2        int;
  aux3        int;
  Vestado_num varchar(100);
  Vestado_txt varchar(100);
begin
  select count(*)
  into   aux1
  from   detalles_ordenes_compras
  where  idorco = Pidorco
  ;
  if aux1 = 0 then
    Vestado_num := 0;
    Vestado_txt := 'SIN INFORMACIÓN';
  else
    select count(*)
    into   aux2
    from   detalles_ordenes_compras
    where  idorco = Pidorco
    and    idedoc = 3
    ;
    if aux1 = aux2 then
      Vestado_num := 3;
      Vestado_txt := 'SATISFECHA';
    else
      select count(*)
      into   aux3
      from   detalles_ordenes_compras
      where  idorco = Pidorco
      and    idedoc = 2
      ;
      if aux3 = 0 then
        Vestado_num := 1;
        Vestado_txt := 'NO SATISFECHA';
      else
        Vestado_num := 2;
        Vestado_txt := 'PARCIALMENTE SATISFECHA';
      end if;
    end if;
  end if;
  if Pdato_deseado = 1 then
    return(Vestado_num);
  else
    return(Vestado_txt);
  end if;
end;
$$ LANGUAGE plpgsql;

select f_situacion_orco(1,1);
select f_situacion_orco(1,2);
select f_situacion_orco(2,1);
select f_situacion_orco(2,2);

\q
