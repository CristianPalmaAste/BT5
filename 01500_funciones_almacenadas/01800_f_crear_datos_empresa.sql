create or replace function f_crear_datos_empresa() returns trigger as
$body$
declare
  Vidfapr               int;
  Vidcuco               int;
  Vidcuco_impto_oblig   int;
  Vidcuco_otros_imptos  int;
  Vidcuco_descuentos    int;
  Vidcuco_caja          int;
  Vidcuco_servicios     int;
  Vidcuco_otras_compras int;
  Vidprce               int;
  Vmes_actual           int;
  Vanno_actual          int;
begin
  insert into parametros_empresas values (nextval('paem_seq'), new.id, 'MAXDSCTOPERM', 'MÁXIMO DESCUENTO PERMITIDO (%)', 'MÁXIMO DESCUENTO PERMITIDO (EXPRESADO EN PORCENTAJE) EN UNA VENTA DE ESTA EMPRESA', '10' , 1, current_timestamp, null, null, null, null);

  insert into bodegas values (nextval('bode_seq'), new.id, 'BODEGA CENTRAL', 1, current_timestamp, null, null, null, null);

  select nextval('fapr_seq')
  into   Vidfapr
  ;

  insert into familias_productos values (Vidfapr, new.id, '01', 'FAMILIA GENÉRICA', 1, current_timestamp, null, null, null, null);

  select id
  into   Vidcuco
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '1'
  and    segmento2 = '01'
  and    segmento3 = '05'
  and    segmento4 = '0003'
  ;

  insert into sub_familias_productos values (nextval('sfpr_seq'), Vidfapr, '01', 'SUB FAMILIA GENÉRICA', Vidcuco, 1, current_timestamp, null, null, null, null);

  select cast(trim(to_char(current_timestamp,'mm'  )) as integer)
        ,cast(trim(to_char(current_timestamp,'yyyy')) as integer)
  into   Vmes_actual
        ,Vanno_actual
  ;
  insert into periodos_contables values (nextval('peco_seq'), new.id, Vmes_actual, Vanno_actual, 1, 1, current_timestamp, null, null, null, null);

  select id
  into   Vidcuco_impto_oblig
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '2'
  and    segmento2 = '01'
  and    segmento3 = '06'
  and    segmento4 = '0001'
  ;
  select id
  into   Vidcuco_otros_imptos
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '2'
  and    segmento2 = '01'
  and    segmento3 = '06'
  and    segmento4 = '0002'
  ;
  select id
  into   Vidcuco_descuentos
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '2'
  and    segmento2 = '01'
  and    segmento3 = '06'
  and    segmento4 = '0003'
  ;
  select id
  into   Vidcuco_caja
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '1'
  and    segmento2 = '01'
  and    segmento3 = '01'
  and    segmento4 = '0001'
  ;
  select id
  into   Vidcuco_servicios
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '4'
  and    segmento2 = '01'
  and    segmento3 = '02'
  and    segmento4 = '0036'
  ;
  select id
  into   Vidcuco_otras_compras
  from   cuentas_contables
  where  idgrem    = new.idgrem
  and    segmento1 = '4'
  and    segmento2 = '01'
  and    segmento3 = '02'
  and    segmento4 = '0037'
  ;
  -- Procesos contables: ventas y compras

    -- Proceso contable ventas
    Vidprce := nextval('prce_seq');

    insert into procesos_contables_empresas values (Vidprce, new.id, 1, 1, current_timestamp, null, null, null, null);

      -- Contabilización automática ventas
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 1, Vidcuco_impto_oblig , 2, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 2, Vidcuco_otros_imptos, 2, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 3, Vidcuco_caja        , 1, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 6, Vidcuco_descuentos  , 1, 1, current_timestamp, null, null, null, null);

    -- Proceso contable compras
    Vidprce := nextval('prce_seq');

    insert into procesos_contables_empresas values (Vidprce, new.id, 2, 1, current_timestamp, null, null, null, null);

      -- Contabilización automática compras
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 1, Vidcuco_impto_oblig  , 1, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 2, Vidcuco_otros_imptos , 1, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 3, Vidcuco_caja         , 2, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 4, Vidcuco_servicios    , 2, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 5, Vidcuco_otras_compras, 2, 1, current_timestamp, null, null, null, null);
      insert into detalles_procesos_ctbles_empresas values (nextval('dpce_seq'), Vidprce, 6, Vidcuco_descuentos   , 2, 1, current_timestamp, null, null, null, null);

  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 5 , 5 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 5 , 6 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 7 , 7 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 7 , 8 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 7 , 9 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 7 , 13, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 7 , 16, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 7 , 18, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 9 , 10, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 9 , 11, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 13, 12, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 13, 14, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 13, 15, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 16, 17, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 18, 19, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_requisiciones values (nextval('aure_seq'), new.id, 18, 20, 1, current_timestamp, null, null, null, null);

  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 5 , 5 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 5 , 6 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 7 , 7 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 7 , 8 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 7 , 9 , 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 7 , 13, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 7 , 16, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 7 , 18, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 9 , 10, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 9 , 11, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 13, 12, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 13, 14, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 13, 15, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 16, 17, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 18, 19, 1, current_timestamp, null, null, null, null);
  insert into autorizadores_rendiciones values (nextval('aurn_seq'), new.id, 18, 20, 1, current_timestamp, null, null, null, null);

  return new;
end;
$body$ LANGUAGE plpgsql;

\q

