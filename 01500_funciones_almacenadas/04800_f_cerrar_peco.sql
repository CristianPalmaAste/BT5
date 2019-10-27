create or replace function f_cerrar_peco (Pidpeco int
                                         ,Pidusua int) returns varchar(1000) as
$$
declare
  aux        int;
begin

aqui voy

  Ves_posible_cerrar_peco := f_es_posible_cerrar_peco(Pidpeco);
  if Ves_posible_cerrar_peco = 'S' then
    update periodos_contables
    set    idespc = 2
    where  id     = Pidpeco
    ;
    insert into periodos_contables values (nextval('peco_seq'), Vidempr, Vmes, Vanno, 1, Pidusua, current_timestamp, null, null, null, null);

  else
  end if;
end;
$$ LANGUAGE plpgsql;

\q

