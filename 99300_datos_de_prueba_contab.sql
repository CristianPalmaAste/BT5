create or replace function f_tmp_datos_prueba_contab() returns int as
$body$
declare
  Vmes_actual           int;
  Vanno_actual          int;
  Vidpeco               int;
  Vidasco               int;
  Vidcuco_caja          int;
  Vidcuco_terrenos      int;
  Vidcuco_vehiculos     int;
  aux                   varchar(1000);
  Vlimite               int;
begin
  Vlimite := 9; /* hasta qué mes trabajo con asientos cerrados */
  select cast(trim(to_char(current_timestamp,'mm'  )) as integer)
        ,cast(trim(to_char(current_timestamp,'yyyy')) as integer)
  into   Vmes_actual
        ,Vanno_actual
  ;
  for i in Vmes_actual .. 12 loop
    if i <= Vlimite+1 then
      select id
      into   Vidpeco
      from   peco
      where  idempr = 1
      and    mes    = i
      and    anno   = Vanno_actual
      ;
    else
      Vidpeco := nextval('peco_seq');
      insert into periodos_contables values (Vidpeco, 1, i, Vanno_actual, 1, 1, current_timestamp, null, null, null, null);
    end if;
    select id
    into   Vidcuco_caja
    from   cuentas_contables
    where  idgrem    = 1
    and    segmento1 = '1'
    and    segmento2 = '01'
    and    segmento3 = '01'
    and    segmento4 = '0001'
    ;
    select id
    into   Vidcuco_terrenos
    from   cuentas_contables
    where  idgrem    = 1
    and    segmento1 = '1'
    and    segmento2 = '02'
    and    segmento3 = '02'
    and    segmento4 = '0001'
    ;
    select id
    into   Vidcuco_vehiculos
    from   cuentas_contables
    where  idgrem    = 1
    and    segmento1 = '1'
    and    segmento2 = '02'
    and    segmento3 = '02'
    and    segmento4 = '0004'
    ;
    Vidasco := nextval('asco_seq');
    insert into asientos_contables values (Vidasco, Vidpeco, 3, 1, 1, 'PRUEBA 1', current_timestamp, 'N', 3, null, 3, current_timestamp, null, null, null, null);
    insert into detalles_asientos_contables values (nextval('deac_seq'), Vidasco, 1, Vidcuco_caja    , 1, null, null, null, null, null, i*100, 'PRUEBA 1', 3, current_timestamp, null, null, null, null);
    insert into detalles_asientos_contables values (nextval('deac_seq'), Vidasco, 2, Vidcuco_terrenos, 2, null, null, null, null, null, i*100, 'PRUEBA 1', 3, current_timestamp, null, null, null, null);
    --
    Vidasco := nextval('asco_seq');
    insert into asientos_contables values (Vidasco, Vidpeco, 3, 1, 2, 'PRUEBA 2', current_timestamp, 'N', 3, null, 3, current_timestamp, null, null, null, null);
    insert into detalles_asientos_contables values (nextval('deac_seq'), Vidasco, 1, Vidcuco_caja    , 1, null, null, null, null, null, 2*i*100, 'PRUEBA 2', 3, current_timestamp, null, null, null, null);
    insert into detalles_asientos_contables values (nextval('deac_seq'), Vidasco, 2, Vidcuco_terrenos, 2, null, null, null, null, null, 2*i*100, 'PRUEBA 2', 3, current_timestamp, null, null, null, null);
    if i <= Vlimite then
      aux  := f_contabilizar_ventas(1, 'S', 0, 0, 3);
      update asientos_contables
      set    idesac = 2
      where  idesac = 1
      ;
      aux  := f_cerrar_peco(1, i, 2020, 3);
    end if;
  end loop;
  return(0);
end;
$body$ LANGUAGE plpgsql;

-- Caso 1: cuando estoy probando junto con la recreacion

select f_tmp_datos_prueba_contab();

\q



-- Caso 2: cuando estoy probando post recreacion

delete from detalles_asientos_contables;
delete from asientos_contables;
delete from periodos_contables where idempr = 1 and mes not in (select min(mes) from periodos_contables where idempr = 1);

\set AUTOCOMMIT off

select f_tmp_datos_prueba_contab();

select * from peco where idempr=1;
select * from asco;
select * from deac;

rollback;

drop function f_tmp_datos_prueba_contab();

\q

