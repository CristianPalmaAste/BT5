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
  insert into grupos_empresariales values (6, 'CECINAS BENGOA'                 , 'CECINAS BE', '', '1', '1', '3', current_timestamp, null, null, null, null);
  insert into grupos_empresariales values (8, 'SAN MARTIN CLIMATIZACIONES LTDA', 'CLIMASAN'  , '', '1', '1', '4', current_timestamp, null, null, null, null);
  
  insert into empresas values (13, 6, '1', '119', '1', '76005457', '7', 'CECINAS BENGOA'                 , 'CECINAS BENGOA', '', 3, current_timestamp, null, null, null, null);
  insert into empresas values (14, 8, '1', '297', '1', '9037091' , 'K', 'SAN MARTIN CLIMATIZACIONES LTDA', 'CLIMASAN'      , '', 4, current_timestamp, null, null, null, null);

  insert into personas values (15, '6', '8978854', '4', 'VICTORIANO', ''    , 'BENGOA'  , 'ARAVENA', 'AGUISERR@GMAIL.COM'            , null, null, null, null, '3', current_timestamp, null, null, null, null);
  insert into personas values (17, '8', '9037091', 'K', 'JUAN'      , 'JOSE', 'MONSALVE', 'MARIN ' , 'JUAN.JOSE.MONSALVE.M@GMAIL.COM', null, null, null, null, '4', current_timestamp, null, null, null, null);

  insert into usuarios values (15, 'VBENGOA'    , 'agu123', '15', '1', '3', current_timestamp, null, null, null, null);
  insert into usuarios values (16, 'ADMCLIMASAN', 'Abc12' , '17', '1', '4', current_timestamp, null, null, null, null);

  insert into familias_productos values (14, 14, '99', 'XXXXX'             , '16', current_timestamp, null, null, null, null);
  insert into familias_productos values (15, 14, '02', 'AIRE ACONDICIONADO', '16', current_timestamp, null, null, null, null);
  
  select id
  into   Vidcuco
  from   cuco
  where  idgrem      = 8
  and    descripcion = 'EXISTENCIAS'
  ;
  
  insert into sub_familias_productos values (14, '14', '01', 'CALDERAS TRADICIONALES', Vidcuco, '16', current_timestamp, null, null, null, null);
  insert into sub_familias_productos values (15, '14', '02', 'CALDERAS CONDENSACION ', Vidcuco, '16', current_timestamp, null, null, null, null);
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

  insert into proveedores values (13, 8, 1, '99574860', '6', 2, 'COMERCIAL ANWO S.A.'                                   , 'ANWO'     , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (14, 8, 1, '76479542', '3', 2, 'IMPACON SPA'                                           , 'NOVACLIMA', null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (15, 8, 1, '96876330', 'K', 2, 'IMPOVAR S.A.'                                          , 'IMPOVAR'  , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (16, 8, 1, '76360567', '1', 2, 'SERVICIOS DE CLIMATIZACION HVACR CHILE Y CIA. LIMITADA', 'HVACR'    , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (17, 8, 1, '96792430', 'K', 2, 'SODIMAC S.A.'                                          , 'SODIMAC'  , null, null, null, null, 1, current_timestamp, null, null, null, null);
  insert into proveedores values (18, 8, 1, '76568660', '1', 2, 'EASY RETAIL S.A.'                                      , 'EASY'     , null, null, null, null, 1, current_timestamp, null, null, null, null);

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

\q
