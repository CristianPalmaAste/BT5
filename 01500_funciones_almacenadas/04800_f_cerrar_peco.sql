create or replace function f_cerrar_peco (Pidempr int
                                         ,Pmes    int
                                         ,Panno   int
                                         ,Pidusua int) returns varchar(1000) as
$$
declare
  Ves_posible_cerrar_peco varchar(1000);
  Vidpeco                 int;
  Vmes_sgte               int;
  Vanno_sgte              int;
  Vmes_sub_sgte           int;
  Vanno_sub_sgte          int;
  aux                     int;
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
    if    Pmes = 12 then
      Vmes_sgte      := 1        ;
      Vanno_sgte     := Panno + 1;
      Vmes_sub_sgte  := 2        ;
      Vanno_sub_sgte := Panno + 1;
    elsif Pmes = 11 then
      Vmes_sgte      := 12       ;
      Vanno_sgte     := Panno    ;
      Vmes_sub_sgte  := 1        ;
      Vanno_sub_sgte := Panno + 1;
    else
      Vmes_sgte      := Pmes + 1 ;
      Vanno_sgte     := Panno    ;
      Vmes_sub_sgte  := Pmes + 2 ;
      Vanno_sub_sgte := Panno    ;
    end if;
    -- Cierro período contable abierto
    update periodos_contables
    set    idespc = 2
    where  id     = Vidpeco
    ;
    -- Abro período contable sgte.
    select count(*)
    into   aux
    from   periodos_contables
    where  idempr = Pidempr
    and    mes    = Vmes_sgte
    and    anno   = Vanno_sgte
    ;
    if aux = 0 then
      insert into periodos_contables values (nextval('peco_seq'), Pidempr, Vmes_sgte, Vanno_sgte, 1, Pidusua, current_timestamp, null, null, null, null);
    else
      update periodos_contables
      set    idespc = 1
      where  idempr = Pidempr
      and    mes    = Vmes_sgte
      and    anno   = Vanno_sgte
      ;
    end if;
    -- Dejo en estado pendiente período contable sub sgte.
    select count(*)
    into   aux
    from   periodos_contables
    where  idempr = Pidempr
    and    mes    = Vmes_sub_sgte
    and    anno   = Vanno_sub_sgte
    ;
    if aux = 0 then
      insert into periodos_contables values (nextval('peco_seq'), Pidempr, Vmes_sub_sgte, Vanno_sub_sgte, 3, Pidusua, current_timestamp, null, null, null, null);
    else
      update periodos_contables
      set    idespc = 3
      where  idempr = Pidempr
      and    mes    = Vmes_sub_sgte
      and    anno   = Vanno_sub_sgte
      ;
    end if;
    return('S;Período contable cerrado exitosamente');
  end if;
  return(Ves_posible_cerrar_peco);
end;
$$ LANGUAGE plpgsql;

select f_cerrar_peco(2,10,2020,21);

\q
