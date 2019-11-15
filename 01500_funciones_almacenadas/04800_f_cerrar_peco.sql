create or replace function f_cerrar_peco (Pidpeco int
                                         ,Pidusua int) returns varchar(1000) as
$$
declare
  Ves_posible_cerrar_peco varchar(1000);
  Vidempr                 int;
  Vmes                    int;
  Vanno                   int;
begin
  Ves_posible_cerrar_peco := f_es_posible_cerrar_peco(Pidpeco);
  if Ves_posible_cerrar_peco = 'S' then
    select idempr
          ,mes
          ,anno
    into   Vidempr
          ,Vmes
          ,Vanno
    from   periodos_contables
    where  id = Pidpeco
    ;
    if Vmes = 12 then
      Vmes  := 1;
      Vanno := Vanno + 1;
    else
      Vmes  := Vmes + 1;
    end if;
    update periodos_contables
    set    idespc = 2
    where  id     = Pidpeco
    ;
    insert into periodos_contables values (nextval('peco_seq'), Vidempr, Vmes, Vanno, 1, Pidusua, current_timestamp, null, null, null, null);
  end if;
  return(Ves_posible_cerrar_peco);
end;
$$ LANGUAGE plpgsql;

\q

