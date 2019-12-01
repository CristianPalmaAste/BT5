create or replace function f_cerrar_peco (Pidempr int
                                         ,Pmes    int
                                         ,Panno   int
                                         ,Pidusua int) returns varchar(1000) as
$$
declare
  Ves_posible_cerrar_peco varchar(1000);
  Vidpeco                 int;
  Vmes                    int;
  Vanno                   int;
begin
  select id
  into   Vidpeco
  from   periodos_contables
  where  idempr = Pidempr
  and    mes    = Pmes
  and    anno   = Panno
  ;
  if Vidpeco is null then
    return('N;No existe período contable para los parámetros empresa = ' || Pidempr || ', mes = ' || Pmes || ', año = ' || Panno);
  end if;
  Ves_posible_cerrar_peco := f_es_posible_cerrar_peco(Vidpeco);
  if Ves_posible_cerrar_peco = 'S' then
    if Pmes = 12 then
      Vmes  := 1        ;
      Vanno := Panno + 1;
    else
      Vmes  := Pmes + 1;
      Vanno := Panno   ;
    end if;
    update periodos_contables
    set    idespc = 2
    where  id     = Vidpeco
    ;
    insert into periodos_contables values (nextval('peco_seq'), Pidempr, Vmes, Vanno, 1, Pidusua, current_timestamp, null, null, null, null);
  end if;
  return(Ves_posible_cerrar_peco);
end;
$$ LANGUAGE plpgsql;

\q
