delete from clientes
where  id in (2,3,4)
;

delete from productos
where  idempr in (select id
                  from   empr
                  where  idgrem in (6, 8)
                 )
;

delete from sub_familias_productos
where  idfapr in (select id
                  from   fapr
                  where  idempr in (13, 14)
                 )
;

delete from familias_productos
where  idempr in (13, 14)
;

delete from usuarios
where  idpers in (select id
                  from   pers
                  where  idgrem in (6, 8)
                 )
;

delete from personas
where  idgrem in (6, 8)
;

delete from autorizadores_rendiciones
where  idempr in (13, 14)
;

delete from autorizadores_requisiciones
where  idempr in (13, 14)
;

delete from bodegas
where  idempr in (13, 14)
;

delete from detalles_procesos_ctbles_empresas
where  idprce in (select id
                  from   prce
                  where  idempr in (13, 14)
                 )
;

delete from procesos_contables_empresas
where  idempr in (13, 14)
;

delete from periodos_contables
where  idempr in (13, 14)
;

delete from parametros_empresas
where  idempr in (13, 14)
;

delete from empresas
where  idgrem in (6, 8)
;

delete from parametros
where  idgrem in (6, 8)
;

delete from conceptos_rendiciones_gastos
where  idgrem in (6, 8)
;

delete from cuentas_contables
where  idgrem in (6, 8)
;

delete from tipos_productos
where  id in (16, 17, 18, 19, 20)
;

delete from tipos_documentos_legales
where  idgrem in (6, 8)
;

delete from estados_documentos_legales
where  idgrem in (6, 8)
;

delete from grupos_empresariales
where  id in (6, 8)
;
  
create or replace function f_otros_datos_SA_JJM () returns varchar(1) as
$$
declare
  Vidcuco  int;
begin
  insert into grupos_empresariales values (5, 'PRUEBA GCPA'                    , 'PGCPA'     , '', '1', '1', '3', current_timestamp, null, null, null, null);
  insert into grupos_empresariales values (6, 'CECINAS BENGOA'                 , 'CECINAS BE', '', '1', '1', '3', current_timestamp, null, null, null, null);
  insert into grupos_empresariales values (8, 'SAN MARTIN CLIMATIZACIONES LTDA', 'CLIMASAN'  , '', '1', '1', '4', current_timestamp, null, null, null, null);
  
  insert into empresas values (13, 6, '1', '119', '1', '76005457', '7', 'CECINAS BENGOA'                 , 'CECINAS BENGOA', '', 3, current_timestamp, null, null, null, null);
  insert into empresas values (14, 8, '1', '297', '1', '9037091' , 'K', 'SAN MARTIN CLIMATIZACIONES LTDA', 'CLIMASAN'      , '', 4, current_timestamp, null, null, null, null);

  insert into personas values (14, '5', '4709176' , '4', 'VICTORIA'  , 'ELIANA'          , 'ASTE'      , 'MARTINEZ'  , 'GCPA68@HOTMAIL.COM'            , null        , null, null, null, '3', current_timestamp, null, null, null, null);
  insert into personas values (15, '6', '8978854' , '4', 'VICTORIANO', ''                , 'BENGOA'    , 'ARAVENA'   , 'AGUISERR@GMAIL.COM'            , null        , null, null, null, '3', current_timestamp, null, null, null, null);
  insert into personas values (17, '8', '9037091' , 'K', 'JUAN'      , 'JOSE'            , 'MONSALVE'  , 'MARIN '    , 'JUAN.JOSE.MONSALVE.M@GMAIL.COM', null        , null, null, null, '4', current_timestamp, null, null, null, null);
  insert into personas values (18, '8', '4709176' , '4', 'JUAN'      , 'JOSE'            , 'MONSALVE'  , 'MARIN '    , 'JJM.M@GMAIL.COM'               , null        , null, null, null, '4', current_timestamp, null, null, null, null);
  insert into personas values (19, '8', '17700033', '7', 'JUAN'      , 'JOSE'            , 'MONSALVE'  , 'SAN MARTIN', 'J.MONSALVE.SNM@GMAIL.COM'      , '1991-01-17', '1' , '1' , '1' , '4', current_timestamp, null, null, null, null);
  insert into personas values (21, '8', '17700032', '9', 'CATALINA'  , 'DE LOS ANGELES'  , 'MONSALVE'  , 'SAN MARTIN', 'CATALINA.MONSALVE@GMAIL.COM'   , '1991-01-17', '1' , '2' , '1' , '4', current_timestamp, null, null, null, null);
  insert into personas values (22, '8', '21878885', '8', 'JJ'        , ''                , 'MONSALVE'  , 'SAN MARTIN', 'JJ@GMAIL.COM'                  , '1991-01-17', '1' , '2' , '1' , '4', current_timestamp, null, null, null, null);
  insert into personas values (23, '8', '9580625' , '2', 'LUISA'     , 'MARGARITA'       , 'SAN MARTIN', 'CIFUENTES' , 'LUISA.SANMARTIN.C@GMAIL.COM'   , '1963-05-13', '3' , '2' , '1' , '4', current_timestamp, null, null, null, null);

  insert into usuarios values (14, 'GCPA68'     , 'ABC12' , '14', '1', '3' , current_timestamp, null, null, null, null);
  insert into usuarios values (15, 'VBENGOA'    , 'agu123', '15', '1', '3' , current_timestamp, null, null, null, null);
  insert into usuarios values (16, 'ADMCLIMASAN', 'Abc12' , '17', '1', '4' , current_timestamp, null, null, null, null);
  insert into usuarios values (17, 'UVENDEDOR'  , 'ABC12' , '18', '1', '16', current_timestamp, null, null, null, null);
  insert into usuarios values (18, 'JEFEVENTAS' , 'ABC12' , '19', '1', '16', current_timestamp, null, null, null, null);
  insert into usuarios values (19, 'JEFECOMPRAS', 'ABC12' , '21', '1', '16', current_timestamp, null, null, null, null);
  insert into usuarios values (20, 'GTEADMFIN'  , 'ABC12' , '23', '1', '16', current_timestamp, null, null, null, null);
  insert into usuarios values (21, 'UCONTADOR'  , 'ABC12' , '22', '1', '16', current_timestamp, null, null, null, null);

  insert into usuarios_perfiles values (1027, 15, 4 , null, 13, 1, 3 , current_timestamp, null, null, null, null);
  insert into usuarios_perfiles values (1028, 16, 4 , null, 14, 1, 4 , current_timestamp, null, null, null, null);
  insert into usuarios_perfiles values (1029, 17, 20, null, 14, 1, 16, current_timestamp, null, null, null, null);
  insert into usuarios_perfiles values (1030, 18, 18, null, 14, 1, 16, current_timestamp, null, null, null, null);
  insert into usuarios_perfiles values (1031, 19, 16, null, 14, 1, 16, current_timestamp, null, null, null, null);
  insert into usuarios_perfiles values (1032, 20, 7 , null, 14, 1, 16, current_timestamp, null, null, null, null);
  insert into usuarios_perfiles values (1033, 21, 13, null, 14, 1, 16, current_timestamp, null, null, null, null);

  insert into familias_productos values (14, 14, '99', 'XXXXX'             , '16', current_timestamp, null, null, null, null);
  insert into familias_productos values (15, 14, '02', 'AIRE ACONDICIONADO', '16', current_timestamp, null, null, null, null);
  
  select id
  into   Vidcuco
  from   cuco
  where  idgrem      = 8
  and    descripcion = 'EXISTENCIAS'
  ;
  
  insert into sub_familias_productos values (14, '14', '01', 'CALDERAS TRADICIONALES', Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (15, '14', '02', 'CALDERAS CONDENSACION' , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (16, '14', '03', 'REPUESTOS CALDERAS'    , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (17, '14', '04', 'FITTINGS PEX'          , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (18, '15', '02', 'BOMBAS CONDENSADO'     , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (19, '14', '05', 'FITTINGS COBRE'        , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (20, '14', '06', 'ACCESORIO CALDERAS'    , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (21, '14', '07', 'BOMBAS CIRCULADORAS'   , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (22, '14', '08', 'FITTINGS PVC'          , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (23, '14', '09', 'FITTINGS FE'           , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (24, '14', '10', 'MATERIALES ELECTRICOS' , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (25, '14', '11', 'FITTINGS BRONCE'       , Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (26, '14', '12', 'FITTINGS VARIOS'       , Vidcuco, '16', current_timestamp, null, null, null, null);

  insert into tipos_productos values (16, 'FITTINGS'             , 'N', '4', current_timestamp, null, null, null, null);
  insert into tipos_productos values (17, 'REPUESTOS'            , 'N', '4', current_timestamp, null, null, null, null);
  insert into tipos_productos values (18, 'MATERIALES ELECTRICOS', 'N', '4', current_timestamp, null, null, null, null);
  insert into tipos_productos values (19, 'BOMBAS CIRCULADORAS'  , 'N', '4', current_timestamp, null, null, null, null);
  insert into tipos_productos values (20, 'ACCESORIO CALDERAS'   , 'N', '4', current_timestamp, null, null, null, null);

  insert into productos values (18, '14', '17', '16', '9', '1', 'CODO 16', '0001', 'A', 'B', 'C', '0.10', '1', 16, current_timestamp, null, null, null, null);
  insert into productos values (19, '14', '17', '16', '9', '2', 'CODO 20', '0002', 'A', 'B', 'C', '0.10', '1', 16, current_timestamp, null, null, null, null);

  insert into clientes values (2, '8', '1', '76016770', '3', '2', 'SOC EDUCACIONAL E INMOBILIARIA SANTA TERESITA LIMITADA', 'JARDIN SANTA TERESITA'    , null, null, null, null, 16, current_timestamp, null, null, null, null);
  insert into clientes values (3, '8', '1', '76094408', '4', '2', 'CONSTRUCTORA LCM LIMITADA'                             , 'CONSTRUCTORA LCM LIMITADA', null, null, null, null, 16, current_timestamp, null, null, null, null);
  insert into clientes values (4, '8', '1', '76071730', '4', '2', 'JARDIN INFANTIL MONTESSORI RAYHUE III LIMITADA'        , 'JARDIN LOS TRAPENSES'     , null, null, null, null, 16, current_timestamp, null, null, null, null);

  insert into direcciones_clientes values (nextval('dicl_seq'), 2, 1, 'ALAMEDA'         , '1256', 328, null, 1, current_timestamp, null, null, null, null);
  insert into direcciones_clientes values (nextval('dicl_seq'), 2, 2, 'CAMINO A LONQUEN', '6578', 348, null, 1, current_timestamp, null, null, null, null);
  insert into direcciones_clientes values (nextval('dicl_seq'), 3, 1, 'FRANKLIN'        , '5429', 350, null, 1, current_timestamp, null, null, null, null);
  insert into direcciones_clientes values (nextval('dicl_seq'), 3, 2, 'SAN IGNACIO'     , '1276', 340, null, 1, current_timestamp, null, null, null, null);
  insert into direcciones_clientes values (nextval('dicl_seq'), 4, 1, 'IRARRAZAVAL'     , '6830', 350, null, 1, current_timestamp, null, null, null, null);
  insert into direcciones_clientes values (nextval('dicl_seq'), 4, 1, 'SUECIA'          , '5394', 360, null, 1, current_timestamp, null, null, null, null);
  insert into direcciones_clientes values (nextval('dicl_seq'), 4, 2, 'LAS REJAS'       , '9922', 370, null, 1, current_timestamp, null, null, null, null);

  insert into proveedores values (13, 8, 1, '99574860', '6', 2, 'COMERCIAL ANWO S.A.'                                   , 'ANWO'     , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (14, 8, 1, '76479542', '3', 2, 'IMPACON SPA'                                           , 'NOVACLIMA', null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (15, 8, 1, '96876330', 'K', 2, 'IMPOVAR S.A.'                                          , 'IMPOVAR'  , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (16, 8, 1, '76360567', '1', 2, 'SERVICIOS DE CLIMATIZACION HVACR CHILE Y CIA. LIMITADA', 'HVACR'    , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (17, 8, 1, '96792430', 'K', 2, 'SODIMAC S.A.'                                          , 'SODIMAC'  , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (18, 8, 1, '76568660', '1', 2, 'EASY RETAIL S.A.'                                      , 'EASY'     , null, null, null, null, 1, current_timestamp, null, null, null, null);

  select id
  into   Vidcuco
  from   cuco
  where  idgrem      = 8
  and    descripcion = 'VENTA DE SERVICIOS GENERALES'
  ;

  insert into servicios values (nextval('serv_seq'), 14, 1 , 1, 'INSTALACIÓN AIRE ACONDICIONADO', 85000, 1, Vidcuco, 16, current_timestamp, null, null, null, null);
  insert into servicios values (nextval('serv_seq'), 14, 1 , 1, 'MANTENCIÓN CALDERA'            , 60000, 1, Vidcuco, 16, current_timestamp, null, null, null, null);

  return('S');
end;
$$ LANGUAGE plpgsql;

select f_otros_datos_SA_JJM();

delete from sub_familias_productos
where  idfapr in (select id
                  from   fapr
                  where  idempr          = 14
                  and    cod_sub_familia = '01'
                 )
;

delete from familias_productos
where  idempr      = 14
and    cod_familia = '01'
;

update familias_productos
set    cod_familia = '01'
      ,descripcion = 'CALEFACCIÓN'
where  id          = 14
;

drop function f_otros_datos_SA_JJM ();





create or replace function f_otros_datos_SA_JJM2 () returns varchar(1) as
$$
declare
  Vidcuco  int;
begin
  select id
  into   Vidcuco
  from   cuco
  where  idgrem      = 8
  and    descripcion = 'EXISTENCIAS'
  ;

  insert into clientes values (5, 8, 1, 1, '9', 1, null, null, 'CLIENTE', '.', 'GENERICO', '.', 16, current_timestamp, 16, current_timestamp, null, null);

  insert into bodegas values (18, 14, 'BODEGA M3STORAGE TOBALABA', 1, current_timestamp, 16, current_timestamp, null, null);

  insert into sub_familias_productos values (27, 14, '01', 'CALDERAS TRADICIONALES', Vidcuco,  1, current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (32, 15, '01', 'SPLIT MURO INVERTER'   , Vidcuco, 16, current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (33, 15, '03', 'SPLIT MURO ON-OFF'     , Vidcuco, 16, current_timestamp, null, null, null, null);

  insert into productos values (235, 14, 27, 20, 9, 2, 'CALDERA KD NAVIEN 40/42'     , '0001', 'SKU', 'EAN13', 'QR', 24  , 1, 16, current_timestamp, null, null, null, null);
  insert into productos values (236, 14, 17, 20, 9, 2, 'CODO 16 "'                   , '0055', 'SKU', 'EAN13', 'QR', 0.10, 1, 16, current_timestamp, null, null, null, null);
  insert into productos values (237, 14, 17, 20, 9, 1, 'CODO 20 "'                   , '0056', 'SKU', 'EAN13', 'QR', 0.10, 1, 16, current_timestamp, null, null, null, null);
  insert into productos values (238, 14, 32, 18, 9, 2, 'SPLIT MURO INVERTER 9000 BTU', '0001', 'SKU', 'EAN13', 'QR', 24  , 1, 16, current_timestamp, null, null, null, null);
  insert into productos values (239, 14, 33, 18, 9, 2, 'SPLIT MURO ON-OFF 9000 BTU'  , '0001', 'SKU', 'EAN13', 'QR', 24  , 1, 16, current_timestamp, null, null, null, null);

  insert into bodegas_productos values (44, 18, 235, 998 , 16, current_timestamp, null, null, null, null);
  insert into bodegas_productos values (45, 18, 236, 1000, 16, current_timestamp, null, null, null, null);
  insert into bodegas_productos values (46, 18, 237, 1000, 16, current_timestamp, null, null, null, null);
  insert into bodegas_productos values (47, 18, 238, 1996, 16, current_timestamp, null, null, null, null);
  insert into bodegas_productos values (48, 18, 239, 1000, 16, current_timestamp, null, null, null, null);

  insert into ventas values (4 , 14, 18, null, 2, 2, 5, 'VENTA CALDERA'                         , current_timestamp, null, null, null, null, null, 0     , 1500000, 285000, 0, 0 , 0, 1785000, 1, null, 16, 16, current_timestamp, 16, current_timestamp, null, null);
  insert into ventas values (6 , 14, 18, null, 2, 4, 5, 'INSTALACION AIRE ACONDICIONADO'        , current_timestamp, null, null, null, null, null, 255000, 0      , 0     , 0, 0 , 0, 255000 , 1, null, 16, 16, current_timestamp, 16, current_timestamp, null, null);
  insert into ventas values (8 , 14, 18, null, 2, 6, 5, 'VENTA E INSTALACION AIRE ACONDICIONADO', current_timestamp, null, null, null, null, null, 340000, 1400000, 266000, 0, 0 , 0, 2006000, 1, null, 16, 16, current_timestamp, 16, current_timestamp, null, null);
  insert into ventas values (10, 14, 18, null, 2, 8, 5, 'VENTA DE CALDERA'                      , current_timestamp, null, null, null, null, null, 0     , 607500 , 115425, 0, 10, 0, 722925 , 1, null, 16, 16, current_timestamp, 16, current_timestamp, null, null);

  insert into detalles_ventas values (6 , 4 , 1, 235 , null, 750000, 2, 0, 0, 0, 0, 0     , 1500000, 285000, 0, 1785000, 16, current_timestamp, null, null, null, null);
  insert into detalles_ventas values (8 , 6 , 1, null, 7   , 85000 , 3, 0, 0, 0, 0, 255000, 0      , 0     , 0, 255000 , 16, current_timestamp, null, null, null, null);
  insert into detalles_ventas values (11, 8 , 1, null, 7   , 85000 , 4, 0, 0, 0, 0, 340000, 0      , 0     , 0, 340000 , 16, current_timestamp, null, null, null, null);
  insert into detalles_ventas values (12, 8 , 2, 238 , null, 350000, 4, 0, 0, 0, 0, 0     , 1400000, 266000, 0, 1666000, 16, current_timestamp, null, null, null, null);
  insert into detalles_ventas values (14, 10, 1, 235 , null, 750000, 1, 0, 0, 0, 0, 0     , 607500 , 115425, 0, 722925 , 16, current_timestamp, null, null, null, null);

  update ventas
  set    idesve = 2
  where  idempr = 14
  and    idesve = 1
  ;

  return('S');
end;
$$ LANGUAGE plpgsql;

select f_otros_datos_SA_JJM2();

drop function f_otros_datos_SA_JJM2 ();


\q
