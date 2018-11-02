--set client_min_messages to warning;




/*
estos van en este archivo
tipos_comprobantes_contables: 1 ingreso
                              2 egreso
                              3 traspaso


insert into tipos_contabilizaciones values (1, 'VENTAS'     );
insert into tipos_contabilizaciones values (2, 'COMPRAS'    );
insert into tipos_contabilizaciones values (3, 'RENDICIONES');
insert into tipos_contabilizaciones values (4, 'HONORARIOS' );

estos van en el trigger de creacion de empresas
insert into enlaces_contables values (nextval('enco_seq'), 1, 'valor neto venta'      , 'ventas', 'exento+afecto+montodescuento'
insert into enlaces_contables values (nextval('enco_seq'), 1, 'impuestos obligatorios', 'ventas', 'impuestosobligats'
insert into enlaces_contables values (nextval('enco_seq'), 1, 'impuestos específicos' , 'ventas', 'impuestosespecifs'
insert into enlaces_contables values (nextval('enco_seq'), 1, 'total'                 , 'ventas', 'total'
*/





insert into monedas values (1  , 'PESO CHILENO'             , 'CLP', 1, current_timestamp, null, null, null, null);
insert into monedas values (2  , 'PESO ARGENTINO'           , 'ARS', 1, current_timestamp, null, null, null, null);
insert into monedas values (3  , 'NUEVO SOL'                , 'PEN', 1, current_timestamp, null, null, null, null);
insert into monedas values (4  , 'BOLIVIANO'                , 'BOB', 1, current_timestamp, null, null, null, null);
insert into monedas values (5  , 'GUARANÍ'                  , 'PYG', 1, current_timestamp, null, null, null, null);
insert into monedas values (6  , 'PESO URUGUAYO'            , 'UYU', 1, current_timestamp, null, null, null, null);
insert into monedas values (7  , 'REAL'                     , 'BRL', 1, current_timestamp, null, null, null, null);
insert into monedas values (8  , 'SUCRE'                    , 'ECS', 1, current_timestamp, null, null, null, null);
insert into monedas values (9  , 'BOLIVAR'                  , 'VEB', 1, current_timestamp, null, null, null, null);
insert into monedas values (10 , 'PESO COLOMBIANO'          , 'COP', 1, current_timestamp, null, null, null, null);
insert into monedas values (11 , 'DÓLAR'                    , 'USD', 1, current_timestamp, null, null, null, null);
insert into monedas values (501, 'UNIDAD DE FOMENTO'        , 'UF' , 1, current_timestamp, null, null, null, null);
insert into monedas values (502, 'UNIDAD TRIBUTARIA MENSUAL', 'UTM', 1, current_timestamp, null, null, null, null);

insert into paises values (1 , 'CHILE'    , 1 , 'CHILENA'    , 1, current_timestamp, null, null, null, null);
insert into paises values (2 , 'ARGENTINA', 2 , 'ARGENTINA'  , 1, current_timestamp, null, null, null, null);
insert into paises values (3 , 'PERU'     , 3 , 'PERUANA'    , 1, current_timestamp, null, null, null, null);
insert into paises values (4 , 'BOLIVIA'  , 4 , 'BOLIVIANA'  , 1, current_timestamp, null, null, null, null);
insert into paises values (5 , 'PARAGUAY' , 5 , 'PARAGUAYA'  , 1, current_timestamp, null, null, null, null);
insert into paises values (6 , 'URUGUAY'  , 6 , 'URUGUAYA'   , 1, current_timestamp, null, null, null, null);
insert into paises values (7 , 'BRASIL'   , 7 , 'BRASILENA'  , 1, current_timestamp, null, null, null, null);
insert into paises values (8 , 'ECUADOR'  , 8 , 'ECUATORIANA', 1, current_timestamp, null, null, null, null);
insert into paises values (9 , 'VENEZUELA', 9 , 'VENEZOLANA' , 1, current_timestamp, null, null, null, null);
insert into paises values (10, 'COLOMBIA' , 10, 'COLOMBIANA' , 1, current_timestamp, null, null, null, null);

/* Deshabilito algunas constraints para poder insertar datos iniciales */
alter table usuarios disable trigger all;
alter table personas disable trigger all;

insert into estados_registros values (1, 'ACTIVO'  , 1, current_timestamp, null, null, null, null);
insert into estados_registros values (2, 'INACTIVO', 1, current_timestamp, null, null, null, null);

insert into estados_grem values (1, 'ACTIVO'    , 1, current_timestamp, null, null, null, null);
insert into estados_grem values (2, 'INACTIVO'  , 1, current_timestamp, null, null, null, null);
insert into estados_grem values (3, 'SUSPENDIDO', 1, current_timestamp, null, null, null, null);

insert into estados_civiles values (1, 'S', 'SOLTERO' , 1, current_timestamp, null, null, null, null);
insert into estados_civiles values (2, 'C', 'CASADO'  , 1, current_timestamp, null, null, null, null);
insert into estados_civiles values (3, 'V', 'VIUDO'   , 1, current_timestamp, null, null, null, null);
insert into estados_civiles values (4, 'E', 'SEPARADO', 1, current_timestamp, null, null, null, null);

insert into sexos values (1, 'M', 'MASCULINO', 1, current_timestamp, null, null, null, null);
insert into sexos values (2, 'F', 'FEMENINO' , 1, current_timestamp, null, null, null, null);

insert into tipos_doctos_ventas values (1 , 1, 'NO DEFINIDO'                           , 'NODE',   0, 'NO DEFINIDO'           , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (2 , 1, 'FACTURA ELECTRÓNICA'                   , 'FAEA',  33, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (3 , 1, 'FACTURA NO AFECTA O EXENTA ELECTRÓNICA', 'FAEE',  34, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (4 , 1, 'BOLETA ELECTRÓNICA'                    , 'BVAF',  39, 'CEDIBLE'               , 'S', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (5 , 1, 'LIQUIDACIÓN FACTURA'                   , 'FALI',  40, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (6 , 1, 'LIQUIDACIÓN FACTURA ELECTRÓNICA'       , 'LIFE',  43, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (7 , 1, 'FACTURA DE COMPRA'                     , 'FACC',  45, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (8 , 1, 'FACTURA DE COMPRA ELECTRÓNICA'         , 'FACE',  46, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (9 , 1, 'GUÍA DE DESPACHO ELECTRÓNICA'          , 'GDEL',  52, 'CEDIBLE CON SU FACTURA', 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (10, 1, 'NOTA DE DÉBITO'                        , 'NDEB',  55, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (11, 1, 'NOTA DE DÉBITO ELECTRÓNICA'            , 'NDEL',  56, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (12, 1, 'NOTA DE CRÉDITO'                       , 'NCRD',  60, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (13, 1, 'NOTA DE CRÉDITO ELECTRÓNICA'           , 'NCEL',  61, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (14, 1, 'FACTURA DE EXPORTACIÓN'                , 'EXPE', 110, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (15, 1, 'NOTA DE DÉBITO DE EXPORTACIÓN'         , 'NDEX', 111, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (16, 1, 'NOTA DE CRÉDITO DE EXPORTACIÓN'        , 'NCEE', 112, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (17, 3, 'NO DEFINIDO'                           , 'NODE',   0, 'NO DEFINIDO'           , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (18, 3, 'FACTURA'                               , 'FACT',   1, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (19, 3, 'BOLETA DE VENTA'                       , 'BOLE',   3, 'CEDIBLE'               , 'S', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (20, 3, 'NOTA DE DÉBITO'                        , 'NDEB',   7, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (21, 3, 'NOTA DE CRÉDITO'                       , 'NCRE',   8, 'CEDIBLE'               , 'S', 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (22, 3, 'GUÍA DE REMISIÓN REMITENTE'            , 'GRRE',   9, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (23, 3, 'TICKET DE MÁQUINA REGISTRADORA'        , 'TIMR',  12, 'CEDIBLE'               , 'S', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (24, 3, 'GUÍA DE REMISIÓN TRANSPORTISTA'        , 'GRTR',  31, 'CEDIBLE'               , 'N', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_doctos_ventas values (25, 3, 'COMPROBANTE DE PAGO SEAE'              , 'SEAE',  56, 'CEDIBLE'               , 'S', 'N', 1, current_timestamp, null, null, null, null);

insert into grupos_empresariales values (1, 'BUSINESS & TECHNOLOGY 5 CONSULTING', 'BT5', 'bt5.jpg', 1, 1, 1, current_timestamp, null, null, null, null);

insert into personas values (1, 1, 1, '9', 'ADMINISTRADOR', null, 'SISTEMA', 'AS', null, null, null, null, null, 1, current_timestamp, null, null, null, null);

insert into usuarios values (1, 'ADMIN', '12345', 1, 1, 1, current_timestamp, null, null, null, null);

/* Rehabilito constraints deshabilitadas */
alter table usuarios enable trigger all;
alter table personas enable trigger all;

insert into personas values (2 , 1, 2       , '7', 'ROLANDO'    , null      , 'SILVA'    , '-'        ,  ''                            , null        , 2   , 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (3 , 1, 3       , '5', 'SERGIO'     , null      , 'AGUIRRE'  , '-'        ,  'sergio.aguirre@bt5.cl'       , null        , 1   , 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (4 , 1, 4       , '3', 'JUAN'       , 'JOSE'    , 'MONSALVE' , '-'        ,  'juan.jose.monsalve@bt5.cl'   , null        , null, 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (5 , 1, 5       , '1', 'JUAN'       , 'ANDRES'  , 'BORZONE'  , '-'        ,  ''                            , null        , null, 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (6 , 1, 6       , 'K', 'RODRIGO'    , null      , 'CIFUENTES', '-'        ,  'rodrigo.cifuentes@bt5.cl'    , null        , 1   , 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (7 , 1, 7695503 , '4', 'ROBERTO'    , 'DANIEL'  , 'QUEZADA'  , 'ASTE'     ,  'roberto.quezada@bt5.cl'      , null        , 2   , 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (8 , 1, 8965445 , '9', 'OSCIEL'     , 'SEGUNDO' , 'SOLAR'    , 'MALDONADO',  'solar2design@gmail.com'      , null        , 2   , 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (9 , 1, 13254825, '0', 'NILTON'     , 'PATRICIO', 'SALAZAR'  , 'GONZALEZ' ,  'nilton.salazar@gmail.com'    , null        , 1   , 1, 1, 1, current_timestamp, null, null, null, null);
insert into personas values (10, 1, 10917721, '0', 'G. CRISTIAN', null      , 'PALMA'    , 'ASTE'     ,  'gerardo.palma.aste@gmail.com', '12-11-1968', 1   , 1, 1, 1, current_timestamp, null, null, null, null);

insert into usuarios values (2 , 'ROSILVA'    , '12345', 2 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (3 , 'SEAGUIRRE'  , '12345', 3 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (4 , 'JJMONSALVE' , '12345', 4 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (5 , 'JABORZONE'  , '12345', 5 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (6 , 'ROCIFUENTES', '12345', 6 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (7 , 'RQUEZADAA'  , '12345', 7 , 2, 1, current_timestamp, null, null, null, null);
insert into usuarios values (8 , 'OSOLARM'    , '12345', 8 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (9 , 'NSALAZARG'  , '12345', 9 , 1, 1, current_timestamp, null, null, null, null);
insert into usuarios values (10, 'CPALMAA'    , '12345', 10, 1, 1, current_timestamp, null, null, null, null);

alter table autorizadores_requisiciones drop constraint aure_fk1_perf;
alter table autorizadores_requisiciones drop constraint aure_fk2_perf;
alter table autorizadores_rendiciones   drop constraint aurn_fk1_perf;
alter table autorizadores_rendiciones   drop constraint aurn_fk2_perf;

insert into empresas values (1 , 1, 1, 1, 1, '1', '9', 'BUSINESS & TECHNOLOGY 5 CONSULTING', 'BT5', 'bt5.jpg', 1, current_timestamp, null, null, null, null, null);

insert into valores_paises values (nextval('vapa_seq'), 1 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUT'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUT'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 1 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 2 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'DNI'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUT'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 2 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 3 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 3 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 4 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 4 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 5 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 5 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 6 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 6 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 7 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 7 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 8 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 8 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 9 , 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 9 , 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);
--
insert into valores_paises values (nextval('vapa_seq'), 10, 'IDENTP1', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 1 TABLA PERSONAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'IDENTP2', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS', 'ETIQUETA IDENTIFICADOR 2 TABLA PERSONAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'IDENTE1', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 1 TABLA EMPRESAS'                , 'RUC'       ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'IDENTE2', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS', 'ETIQUETA IDENTIFICADOR 2 TABLA EMPRESAS'                , 'DV'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'RETHON' , 'RETENCIÓN HONORARIOS'                   , '% RETENCIÓN DE HONORARIOS EN ESTE PAIS'                 , '10'        ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'NUMUNIT', 'NRO. UNIDADES TERRITORIALES'            , 'NRO. DE UNIDADES TERRITORIALES EN QUE SE DIVIDE EL PAIS', '3'         ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'UNITER1', 'UNIDAD TERRITORIAL ORDEN 1'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 1'                   , 'REGIÓN'    ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'UNITER2', 'UNIDAD TERRITORIAL ORDEN 2'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 2'                   , 'PROVINCIA' ,  1, current_timestamp, null, null, null, null);
insert into valores_paises values (nextval('vapa_seq'), 10, 'UNITER3', 'UNIDAD TERRITORIAL ORDEN 3'             , 'NOMBRE UNIDAD TERRITORIAL DE ORDEN 3'                   , 'COMUNA'    ,  1, current_timestamp, null, null, null, null);

insert into estados_solics_servs_hono values (1, 'CREADA'                           , 1, current_timestamp, null, null, null, null);
insert into estados_solics_servs_hono values (2, 'TRANSFERIDA A JEFE DE COMPRAS'    , 1, current_timestamp, null, null, null, null);
insert into estados_solics_servs_hono values (3, 'EN PROCESO'                       , 1, current_timestamp, null, null, null, null);
insert into estados_solics_servs_hono values (4, 'ACEPTADA UNA COTIZACIÓN'          , 1, current_timestamp, null, null, null, null);
insert into estados_solics_servs_hono values (5, 'RECHAZADAS TODAS LAS COTIZACIONES', 1, current_timestamp, null, null, null, null);

insert into estados_cotizacs_servs_hono values (1, 'RECIBIDA' , 1, current_timestamp, null, null, null, null);
insert into estados_cotizacs_servs_hono values (2, 'ACEPTADA' , 1, current_timestamp, null, null, null, null);
insert into estados_cotizacs_servs_hono values (3, 'RECHAZADA', 1, current_timestamp, null, null, null, null);

insert into estados_ordenes_servs_hono values (1, 'CREADA'                                          , 1, current_timestamp, null, null, null, null);
insert into estados_ordenes_servs_hono values (2, 'ASIGNADA A PROFESIONAL'                          , 1, current_timestamp, null, null, null, null);
insert into estados_ordenes_servs_hono values (3, 'TERMINADA EXITOSAMENTE (APROBADO EL TRABAJO)'    , 1, current_timestamp, null, null, null, null);
insert into estados_ordenes_servs_hono values (4, 'TERMINADA NO EXITOSAMENTE (RECHAZADO EL TRABAJO)', 1, current_timestamp, null, null, null, null);

insert into estados_pagos_ords_servs_hono values (1, 'CREADO', 1, current_timestamp, null, null, null, null);
insert into estados_pagos_ords_servs_hono values (2, 'PAGADO', 1, current_timestamp, null, null, null, null);

insert into unidades_territoriales values (1  , 1, null, 'REGIÓN DE TARAPACÁ'                                 ,  1  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (2  , 1, null, 'REGIÓN DE ANTOFAGASTA'                              ,  2  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (3  , 1, null, 'REGIÓN DE ATACAMA'                                  ,  3  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (4  , 1, null, 'REGIÓN DE COQUIMBO'                                 ,  4  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (5  , 1, null, 'REGIÓN DE VALPARAÍSO'                               ,  5  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (6  , 1, null, 'REGIÓN DEL LIBERTADOR GENERAL BERNARDO O''HIGGINS'  ,  6  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (7  , 1, null, 'REGIÓN DEL MAULE'                                   ,  7  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (8  , 1, null, 'REGIÓN DEL BIOBÍO'                                  ,  8  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (9  , 1, null, 'REGIÓN DE LA ARAUCANÍA'                             ,  9  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (10 , 1, null, 'REGIÓN DE LOS LAGOS'                                , 10  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (11 , 1, null, 'REGIÓN DE AISÉN DEL GENERAL CARLOS IBAÑEZ DEL CAMPO', 11  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (12 , 1, null, 'REGIÓN DE MAGALLANES Y DE LA ANTÁRTICA CHILENA'     , 12  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (13 , 1, null, 'REGIÓN METROPOLITANA DE SANTIAGO'                   , 13  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (14 , 1, null, 'REGIÓN DE LOS RÍOS'                                 , 14  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (15 , 1, null, 'REGIÓN DE ARICA Y PARINACOTA'                       , 15  , 1, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (16 , 1, null, 'REGIÓN DEL ÑUBLE'                                   , 16  , 1, 1, current_timestamp, null, null, null, null);

insert into unidades_territoriales values (17 , 1, 1   , 'IQUIQUE'                                            , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (18 , 1, 1   , 'TAMARUGAL'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (19 , 1, 2   , 'TOCOPILLA'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (20 , 1, 2   , 'EL LOA'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (21 , 1, 2   , 'ANTOFAGASTA'                                        , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (22 , 1, 3   , 'CHAÑARAL'                                           , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (23 , 1, 3   , 'COPIAPÓ'                                            , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (24 , 1, 3   , 'HUASCO'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (25 , 1, 4   , 'ELQUI'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (26 , 1, 4   , 'LIMARI'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (27 , 1, 4   , 'CHOAPA'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (28 , 1, 5   , 'PETORCA'                                            , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (29 , 1, 5   , 'SAN FELIPE DE ACONCAGUA'                            , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (30 , 1, 5   , 'QUILLOTA'                                           , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (31 , 1, 5   , 'LOS ANDES'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (32 , 1, 5   , 'VALPARAISO'                                         , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (33 , 1, 5   , 'SAN ANTONIO'                                        , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (34 , 1, 5   , 'ISLA DE PASCUA'                                     , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (35 , 1, 6   , 'CACHAPOAL'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (36 , 1, 6   , 'CARDENAL CARO'                                      , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (37 , 1, 6   , 'COLCHAGUA'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (38 , 1, 7   , 'CURICÓ'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (39 , 1, 7   , 'TALCA'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (40 , 1, 7   , 'CAUQUENES'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (41 , 1, 7   , 'LINARES'                                            , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (42 , 1, 8   , 'ÑUBLE'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (43 , 1, 8   , 'CONCEPCIÓN'                                         , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (44 , 1, 8   , 'BIOBÍO'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (45 , 1, 8   , 'ARAUCO'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (46 , 1, 9   , 'MALLECO'                                            , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (47 , 1, 9   , 'CAUTIN'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (48 , 1, 10  , 'OSORNO'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (49 , 1, 10  , 'LLANQUIHUE'                                         , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (50 , 1, 10  , 'CHILOE'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (51 , 1, 10  , 'PALENA'                                             , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (52 , 1, 11  , 'AISÉN'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (53 , 1, 11  , 'COYHAIQUE'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (54 , 1, 11  , 'GENERAL CARRERA'                                    , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (55 , 1, 11  , 'CAPITAN PRAT'                                       , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (56 , 1, 12  , 'ULTIMA ESPERANZA'                                   , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (57 , 1, 12  , 'MAGALLANES'                                         , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (58 , 1, 12  , 'TIERRA DEL FUEGO'                                   , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (59 , 1, 12  , 'ANTARTICA CHILENA'                                  , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (60 , 1, 13  , 'SANTIAGO'                                           , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (61 , 1, 13  , 'CHACABUCO'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (62 , 1, 13  , 'MELIPILLA'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (63 , 1, 13  , 'TALAGANTE'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (64 , 1, 13  , 'MAIPO'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (65 , 1, 13  , 'CORDILLERA'                                         , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (66 , 1, 14  , 'VALDIVIA'                                           , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (67 , 1, 14  , 'RANCO'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (68 , 1, 15  , 'PARINACOTA'                                         , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (69 , 1, 15  , 'ARICA'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (70 , 1, 16  , 'ITATA'                                              , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (71 , 1, 16  , 'DIGUILLIN'                                          , null, 2, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (72 , 1, 16  , 'PUNILLA'                                            , null, 2, 1, current_timestamp, null, null, null, null);

insert into unidades_territoriales values (73 , 1, 17  , 'IQUIQUE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (74 , 1, 17  , 'ALTO HOSPICIO'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (75 , 1, 18  , 'HUARA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (76 , 1, 18  , 'CAMIÑA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (77 , 1, 18  , 'COLCHANE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (78 , 1, 18  , 'POZO ALMONTE'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (79 , 1, 18  , 'PICA'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (80 , 1, 19  , 'TOCOPILLA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (81 , 1, 19  , 'MARIA ELENA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (82 , 1, 20  , 'CALAMA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (83 , 1, 20  , 'OLLAGÜE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (84 , 1, 20  , 'SAN PEDRO DE ATACAMA'                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (85 , 1, 21  , 'MEJILLONES'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (86 , 1, 21  , 'SIERRA GORDA'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (87 , 1, 21  , 'ANTOFAGASTA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (88 , 1, 21  , 'TALTAL'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (89 , 1, 22  , 'CHAÑARAL'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (90 , 1, 22  , 'DIEGO DE ALMAGRO'                                   , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (91 , 1, 23  , 'CALDERA'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (92 , 1, 23  , 'COPIAPÓ'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (93 , 1, 23  , 'TIERRA AMARILLA'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (94 , 1, 24  , 'HUASCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (95 , 1, 24  , 'VALLENAR'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (96 , 1, 24  , 'FREIRINA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (97 , 1, 24  , 'ALTO DEL CARMEN'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (98 , 1, 25  , 'LA HIGUERA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (99 , 1, 25  , 'VICUÑA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (100, 1, 25  , 'LA SERENA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (101, 1, 25  , 'COQUIMBO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (102, 1, 25  , 'ANDACOLLO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (103, 1, 25  , 'PAIHUANO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (104, 1, 26  , 'OVALLE'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (105, 1, 26  , 'RIO HURTADO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (106, 1, 26  , 'PUNITAQUI'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (107, 1, 26  , 'MONTE PATRIA'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (108, 1, 26  , 'COMBARBALÁ'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (109, 1, 27  , 'CANELA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (110, 1, 27  , 'ILLAPEL'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (111, 1, 27  , 'LOS VILOS'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (112, 1, 27  , 'SALAMANCA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (113, 1, 28  , 'PETORCA'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (114, 1, 28  , 'LA LIGUA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (115, 1, 28  , 'CABILDO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (116, 1, 28  , 'PAPUDO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (117, 1, 28  , 'ZAPALLAR'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (118, 1, 29  , 'PUTAENDO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (119, 1, 29  , 'CATEMU'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (120, 1, 29  , 'SAN FELIPE'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (121, 1, 29  , 'SANTA MARIA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (122, 1, 29  , 'PANQUEHUE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (123, 1, 29  , 'LLAILLAY'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (124, 1, 30  , 'NOGALES'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (125, 1, 30  , 'LA CALERA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (126, 1, 30  , 'LA CRUZ'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (127, 1, 30  , 'QUILLOTA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (128, 1, 30  , 'HIJUELAS'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (129, 1, 30  , 'LIMACHE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (130, 1, 30  , 'OLMUE'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (131, 1, 31  , 'SAN ESTEBAN'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (132, 1, 31  , 'RINCONADA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (133, 1, 31  , 'CALLE LARGA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (134, 1, 31  , 'LOS ANDES'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (135, 1, 32  , 'PUCHUNCAVI'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (136, 1, 32  , 'JUAN FERNANDEZ'                                     , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (137, 1, 32  , 'QUINTERO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (138, 1, 32  , 'VINA DEL MAR'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (139, 1, 32  , 'VILLA ALEMANA'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (140, 1, 32  , 'VALPARAISO'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (141, 1, 32  , 'QUILPUE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (142, 1, 32  , 'CASABLANCA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (143, 1, 32  , 'CONCÓN'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (144, 1, 33  , 'ALGARROBO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (145, 1, 33  , 'EL QUISCO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (146, 1, 33  , 'EL TABO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (147, 1, 33  , 'CARTAGENA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (148, 1, 33  , 'SAN ANTONIO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (149, 1, 33  , 'SANTO DOMINGO'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (150, 1, 34  , 'ISLA DE PASCUA'                                     , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (151, 1, 35  , 'MOSTAZAL'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (152, 1, 35  , 'GRANEROS'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (153, 1, 35  , 'CODEGUA'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (154, 1, 35  , 'RANCAGUA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (155, 1, 35  , 'MACHALI'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (156, 1, 35  , 'LAS CABRAS'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (157, 1, 35  , 'COLTAUCO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (158, 1, 35  , 'DONIHUE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (159, 1, 35  , 'OLIVAR'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (160, 1, 35  , 'COINCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (161, 1, 35  , 'REQUINOA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (162, 1, 35  , 'PEUMO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (163, 1, 35  , 'QUINTA DE TILCOCO'                                  , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (164, 1, 35  , 'PICHIDEGUA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (165, 1, 35  , 'SAN VICENTE'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (166, 1, 35  , 'MALLOA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (167, 1, 35  , 'RENGO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (168, 1, 36  , 'NAVIDAD'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (169, 1, 36  , 'LITUECHE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (170, 1, 36  , 'LA ESTRELLA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (171, 1, 36  , 'PICHILEMU'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (172, 1, 36  , 'MARCHIHUE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (173, 1, 36  , 'PAREDONES'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (174, 1, 37  , 'PERALILLO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (175, 1, 37  , 'PALMILLA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (176, 1, 37  , 'SAN FERNANDO'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (177, 1, 37  , 'PUMANQUE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (178, 1, 37  , 'SANTA CRUZ'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (179, 1, 37  , 'NANCAGUA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (180, 1, 37  , 'PLACILLA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (181, 1, 37  , 'LOLOL'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (182, 1, 37  , 'CHEPICA'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (183, 1, 37  , 'CHIMBARONGO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (184, 1, 38  , 'TENO'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (185, 1, 38  , 'VICHUQUÉN'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (186, 1, 38  , 'HUALAÑE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (187, 1, 38  , 'RAUCO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (188, 1, 38  , 'CURICÓ'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (189, 1, 38  , 'ROMERAL'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (190, 1, 38  , 'LICANTÉN'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (191, 1, 38  , 'SAGRADA FAMILIA'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (192, 1, 38  , 'MOLINA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (193, 1, 39  , 'CUREPTO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (194, 1, 39  , 'RIO CLARO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (195, 1, 39  , 'CONSTITUCIÓN'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (196, 1, 39  , 'PENCAHUE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (197, 1, 39  , 'TALCA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (198, 1, 39  , 'PELARCO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (199, 1, 39  , 'SAN CLEMENTE'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (200, 1, 39  , 'MAULE'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (201, 1, 39  , 'EMPEDRADO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (202, 1, 39  , 'SAN RAFAEL'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (203, 1, 40  , 'CHANCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (204, 1, 40  , 'CAUQUENES'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (205, 1, 40  , 'PELLUHUE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (206, 1, 41  , 'SAN JAVIER'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (207, 1, 41  , 'VILLA ALEGRE'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (208, 1, 41  , 'YERBAS BUENAS'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (209, 1, 41  , 'COLBUN'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (210, 1, 41  , 'LINARES'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (211, 1, 41  , 'RETIRO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (212, 1, 41  , 'LONGAVI'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (213, 1, 41  , 'PARRAL'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (214, 1, 43  , 'TOME'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (215, 1, 43  , 'FLORIDA'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (216, 1, 43  , 'TALCAHUANO'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (217, 1, 43  , 'HUALPÉN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (218, 1, 43  , 'PENCO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (219, 1, 43  , 'CONCEPCIÓN'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (220, 1, 43  , 'SAN PEDRO DE LA PAZ'                                , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (221, 1, 43  , 'CHIGUAYANTE'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (222, 1, 43  , 'HUALQUI'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (223, 1, 43  , 'CORONEL'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (224, 1, 43  , 'LOTA'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (225, 1, 43  , 'SANTA JUANA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (226, 1, 43  , 'YUMBEL'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (227, 1, 44  , 'CABRERO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (228, 1, 44  , 'TUCAPEL'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (229, 1, 44  , 'ANTUCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (230, 1, 44  , 'SAN ROSENDO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (231, 1, 44  , 'LAJA'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (232, 1, 44  , 'LOS ANGELES'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (233, 1, 44  , 'QUILLECO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (234, 1, 44  , 'SANTA BÁRBARA'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (235, 1, 44  , 'ALTO BIOBÍO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (236, 1, 44  , 'NACIMIENTO'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (237, 1, 44  , 'NEGRETE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (238, 1, 44  , 'QUILACO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (239, 1, 44  , 'MULCHÉN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (240, 1, 45  , 'ARAUCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (241, 1, 45  , 'CURANILAHUE'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (242, 1, 45  , 'LEBU'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (243, 1, 45  , 'LOS ALAMOS'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (244, 1, 45  , 'CAÑETE'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (245, 1, 45  , 'CONTULMO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (246, 1, 45  , 'TIRUA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (247, 1, 46  , 'ANGOL'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (248, 1, 46  , 'RENAICO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (249, 1, 46  , 'COLLIPULLI'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (250, 1, 46  , 'PURÉN'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (251, 1, 46  , 'LOS SAUCES'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (252, 1, 46  , 'ERCILLA'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (253, 1, 46  , 'LONQUIMAY'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (254, 1, 46  , 'LUMACO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (255, 1, 46  , 'TRAIGUÉN'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (256, 1, 46  , 'VICTORIA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (257, 1, 46  , 'CURACAUTIN'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (258, 1, 47  , 'GALVARINO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (259, 1, 47  , 'PERQUENCO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (260, 1, 47  , 'CARAHUE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (261, 1, 47  , 'NUEVA IMPERIAL'                                     , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (262, 1, 47  , 'CHOLCHOL'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (263, 1, 47  , 'TEMUCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (264, 1, 47  , 'PADRE LAS CASAS'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (265, 1, 47  , 'LAUTARO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (266, 1, 47  , 'VILCUN'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (267, 1, 47  , 'MELIPEUCO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (268, 1, 47  , 'SAAVEDRA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (269, 1, 47  , 'TEODORO SCHMIDT'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (270, 1, 47  , 'FREIRE'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (271, 1, 47  , 'CUNCO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (272, 1, 47  , 'TOLTÉN'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (273, 1, 47  , 'PITRUFQUÉN'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (274, 1, 47  , 'GORBEA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (275, 1, 47  , 'LONCOCHE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (276, 1, 47  , 'VILLARRICA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (277, 1, 47  , 'PUCÓN'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (278, 1, 47  , 'CURARREHUE'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (279, 1, 48  , 'SAN JUAN DE LA COSTA'                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (280, 1, 48  , 'SAN PABLO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (281, 1, 48  , 'OSORNO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (282, 1, 48  , 'PUYEHUE'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (283, 1, 48  , 'RIO NEGRO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (284, 1, 48  , 'PUERTO OCTAY'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (285, 1, 48  , 'PURRANQUE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (286, 1, 49  , 'FRESIA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (287, 1, 49  , 'FRUTILLAR'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (288, 1, 49  , 'PUERTO VARAS'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (289, 1, 49  , 'LLANQUIHUE'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (290, 1, 49  , 'LOS MUERMOS'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (291, 1, 49  , 'PUERTO MONTT'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (292, 1, 49  , 'COCHAMO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (293, 1, 49  , 'MAULLIN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (294, 1, 49  , 'CALBUCO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (295, 1, 50  , 'ANCUD'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (296, 1, 50  , 'QUEMCHI'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (297, 1, 50  , 'DALCAHUE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (298, 1, 50  , 'CASTRO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (299, 1, 50  , 'CURACO DE VELEZ'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (300, 1, 50  , 'QUINCHAO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (301, 1, 50  , 'CHONCHI'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (302, 1, 50  , 'PUQUELDÓN'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (303, 1, 50  , 'QUEILÉN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (304, 1, 50  , 'QUELLÓN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (305, 1, 51  , 'HUALAIHUE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (306, 1, 51  , 'CHAITÉN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (307, 1, 51  , 'FUTALEUFU'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (308, 1, 51  , 'PALENA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (309, 1, 52  , 'GUAITECAS'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (310, 1, 52  , 'CISNES'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (311, 1, 52  , 'AISÉN'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (312, 1, 53  , 'LAGO VERDE'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (313, 1, 53  , 'COYHAIQUE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (314, 1, 54  , 'RIO IBANEZ'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (315, 1, 54  , 'CHILE CHICO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (316, 1, 55  , 'COCHRANE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (317, 1, 55  , 'TORTEL'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (318, 1, 55  , 'O''HIGGINS'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (319, 1, 56  , 'NATALES'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (320, 1, 56  , 'TORRES DEL PAINE'                                   , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (321, 1, 57  , 'LAGUNA BLANCA'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (322, 1, 57  , 'SAN GREGORIO'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (323, 1, 57  , 'RIO VERDE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (324, 1, 57  , 'PUNTA ARENAS'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (325, 1, 58  , 'PRIMAVERA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (326, 1, 58  , 'PORVENIR'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (327, 1, 58  , 'TIMAUKEL'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (328, 1, 59  , 'CABO DE HORNOS'                                     , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (329, 1, 59  , 'ANTARTICA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (330, 1, 60  , 'SANTIAGO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (331, 1, 60  , 'CERRILLOS'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (332, 1, 60  , 'CERRO NAVIA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (333, 1, 60  , 'CONCHALI'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (334, 1, 60  , 'EL BOSQUE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (335, 1, 60  , 'ESTACION CENTRAL'                                   , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (336, 1, 60  , 'HUECHURABA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (337, 1, 60  , 'INDEPENDENCIA'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (338, 1, 60  , 'LA CISTERNA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (339, 1, 60  , 'LA FLORIDA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (340, 1, 60  , 'LA GRANJA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (341, 1, 60  , 'LA PINTANA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (342, 1, 60  , 'LA REINA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (343, 1, 60  , 'LAS CONDES'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (344, 1, 60  , 'LO BARNECHEA'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (345, 1, 60  , 'LO ESPEJO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (346, 1, 60  , 'LO PRADO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (347, 1, 60  , 'MACUL'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (348, 1, 60  , 'MAIPU'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (349, 1, 60  , 'ÑUÑOA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (350, 1, 60  , 'PEDRO AGUIRRE CERDA'                                , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (351, 1, 60  , 'PEÑALOLÉN'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (352, 1, 60  , 'PROVIDENCIA'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (353, 1, 60  , 'PUDAHUEL'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (354, 1, 60  , 'QUILICURA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (355, 1, 60  , 'QUINTA NORMAL'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (356, 1, 60  , 'RECOLETA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (357, 1, 60  , 'RENCA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (358, 1, 60  , 'SAN JOAQUIN'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (359, 1, 60  , 'SAN MIGUEL'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (360, 1, 60  , 'SAN RAMÓN'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (361, 1, 60  , 'VITACURA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (362, 1, 61  , 'TILTIL'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (363, 1, 61  , 'COLINA'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (364, 1, 61  , 'LAMPA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (365, 1, 62  , 'CURACAVI'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (366, 1, 62  , 'MARIA PINTO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (367, 1, 62  , 'MELIPILLA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (368, 1, 62  , 'SAN PEDRO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (369, 1, 62  , 'ALHUE'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (370, 1, 63  , 'PEÑAFLOR'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (371, 1, 63  , 'EL MONTE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (372, 1, 63  , 'TALAGANTE'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (373, 1, 63  , 'ISLA DE MAIPO'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (374, 1, 63  , 'PADRE HURTADO'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (375, 1, 64  , 'CALERA DE TANGO'                                    , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (376, 1, 64  , 'SAN BERNARDO'                                       , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (377, 1, 64  , 'BUIN'                                               , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (378, 1, 64  , 'PAINE'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (379, 1, 65  , 'PUENTE ALTO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (380, 1, 65  , 'PIRQUE'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (381, 1, 65  , 'SAN JOSE DE MAIPO'                                  , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (382, 1, 66  , 'MARIQUINA'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (383, 1, 66  , 'LANCO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (384, 1, 66  , 'PANGUIPULLI'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (385, 1, 66  , 'MAFIL'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (386, 1, 66  , 'VALDIVIA'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (387, 1, 66  , 'LOS LAGOS'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (388, 1, 66  , 'CORRAL'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (389, 1, 66  , 'PAILLACO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (390, 1, 67  , 'FUTRONO'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (391, 1, 67  , 'LA UNIÓN'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (392, 1, 67  , 'LAGO RANCO'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (393, 1, 67  , 'RIO BUENO'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (394, 1, 68  , 'GENERAL LAGOS'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (395, 1, 68  , 'PUTRE'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (396, 1, 69  , 'ARICA'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (397, 1, 69  , 'CAMARONES'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (398, 1, 70  , 'COBQUECURA'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (399, 1, 70  , 'COELEMU'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (400, 1, 70  , 'NINHUE'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (401, 1, 70  , 'PORTEZUELO'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (402, 1, 70  , 'QUIRIHUE'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (403, 1, 70  , 'RANQUIL'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (404, 1, 70  , 'TREGUACO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (405, 1, 71  , 'BULNES'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (406, 1, 71  , 'CHILLAN VIEJO'                                      , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (407, 1, 71  , 'CHILLAN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (408, 1, 71  , 'EL CARMEN'                                          , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (409, 1, 71  , 'PEMUCO'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (410, 1, 71  , 'PINTO'                                              , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (411, 1, 71  , 'QUILLÓN'                                            , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (412, 1, 71  , 'SAN IGNACIO'                                        , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (413, 1, 71  , 'YUNGAY'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (414, 1, 72  , 'COIHUECO'                                           , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (415, 1, 72  , 'ÑIQUÉN'                                             , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (416, 1, 72  , 'SAN CARLOS'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (417, 1, 72  , 'SAN FABIAN'                                         , null, 3, 1, current_timestamp, null, null, null, null);
insert into unidades_territoriales values (418, 1, 72  , 'SAN NICOLAS'                                        , null, 3, 1, current_timestamp, null, null, null, null);
 
insert into tipos_clientes values (1, 'PERSONA NATURAL', 1, current_timestamp, null, null, null, null);
insert into tipos_clientes values (2, 'EMPRESA'        , 1, current_timestamp, null, null, null, null);

insert into tipos_cotizaciones_vtas values (1, 'PRESUPUESTO', 1, current_timestamp, null, null, null, null);
insert into tipos_cotizaciones_vtas values (2, 'PROSPECTO'  , 1, current_timestamp, null, null, null, null);

insert into tipos_movimientos_bodegas values (1, 'SALIDA POR VENTA'                  , -1, 1, current_timestamp, null, null, null, null);
insert into tipos_movimientos_bodegas values (2, 'ENTRADA POR ADQUISICIÓN'           ,  1, 1, current_timestamp, null, null, null, null);
insert into tipos_movimientos_bodegas values (3, 'SALIDA POR TRASPASO ENTRE BODEGAS' , -1, 1, current_timestamp, null, null, null, null);
insert into tipos_movimientos_bodegas values (4, 'ENTRADA POR TRASPASO ENTRE BODEGAS',  1, 1, current_timestamp, null, null, null, null);
insert into tipos_movimientos_bodegas values (5, 'ENTRADA POR DEVOLUCIÓN'            ,  1, 1, current_timestamp, null, null, null, null);

insert into estados_cotizaciones_vtas values (1, 'CREADA'  , 1, current_timestamp, null, null, null, null);
insert into estados_cotizaciones_vtas values (2, 'CERRADA' , 1, current_timestamp, null, null, null, null);
insert into estados_cotizaciones_vtas values (3, 'ACEPTADA', 1, current_timestamp, null, null, null, null);
insert into estados_cotizaciones_vtas values (4, 'CADUCADA', 1, current_timestamp, null, null, null, null);

insert into estados_notas_vtas values (1, 'CREADA'  , 1, current_timestamp, null, null, null, null);
insert into estados_notas_vtas values (2, 'CERRADA' , 1, current_timestamp, null, null, null, null);
insert into estados_notas_vtas values (3, 'EMITIDA' , 1, current_timestamp, null, null, null, null);
insert into estados_notas_vtas values (4, 'CADUCADA', 1, current_timestamp, null, null, null, null);

insert into estados_ventas values (1, 'CREADA' , 1, current_timestamp, null, null, null, null);
insert into estados_ventas values (2, 'CERRADA', 1, current_timestamp, null, null, null, null);
insert into estados_ventas values (3, 'ANULADA', 1, current_timestamp, null, null, null, null);

insert into origenes_productos values (1, 'NACIONAL' , 'NAC', 1, current_timestamp, null, null, null, null);
insert into origenes_productos values (2, 'IMPORTADO', 'IMP', 1, current_timestamp, null, null, null, null);

insert into unidades_medidas_productos values (1, 'MILÍGRAMOS' , 'MG', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (2, 'GRAMOS'     , 'GR', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (3, 'KILÓGRAMOS' , 'KG', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (4, 'MILÍMETROS' , 'MM', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (5, 'CENTÍMETROS', 'CM', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (6, 'METROS'     , 'MT', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (7, 'MILÍLITROS' , 'ML', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (8, 'LITROS'     , 'LT', 1, current_timestamp, null, null, null, null);
insert into unidades_medidas_productos values (9, 'UNIDADES'   , 'UN', 1, current_timestamp, null, null, null, null);

insert into unidades_medidas_servicios values (1, 'HORAS HOMBRE', 'HH', 1, current_timestamp, null, null, null, null);

insert into tipos_productos values (1 , 'ARTICULOS DE ASEO'            , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (2 , 'ARTICULOS DE ESCRITORIO'      , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (3 , 'ARTICULOS DE PERFUMERÍA'      , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (4 , 'BEBIDAS GASEOSAS'             , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (5 , 'BABIDAS ALCOHÓLICAS'          , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (6 , 'CIGARRILLOS'                  , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (7 , 'CARNE'                        , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (8 , 'PETRÓLEO'                     , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (9 , 'BENCINA'                      , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (10, 'PARAFINA'                     , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (11, 'ALIMENTOS NO PERECIBLES'      , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (12, 'ALIMENTOS PERECIBLES FRUTAS'  , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (13, 'ALIMENTOS PERECIBLES VERDURAS', 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (14, 'ALIMENTOS PERECIBLES OTROS'   , 'N', 1, current_timestamp, null, null, null, null);
insert into tipos_productos values (15, 'LIBROS'                       , 'S', 1, current_timestamp, null, null, null, null);

insert into impuestos values (1, 1, 'IMPUESTO AL VALOR AGREGADO'                    , 'IVA' , 'S', 19, 1, current_timestamp, null, null, null, null);
insert into impuestos values (2, 1, 'IMPUESTO ADICIONAL A LAS BEBIDAS ALCOHÓLICAS'  , 'ILA' , 'N', 20, 1, current_timestamp, null, null, null, null);
insert into impuestos values (3, 1, 'IMPUESTO ADICIONAL A LAS BEBIDAS ANALCOHÓLICAS', 'IABA', 'N', 5 , 1, current_timestamp, null, null, null, null);

insert into tipos_productos_impuestos values (1, 4, 3, 1, current_timestamp, null, null, null, null);
insert into tipos_productos_impuestos values (2, 5, 2, 1, current_timestamp, null, null, null, null);

insert into tipos_servicios values (1, 'SERVICIOS PROFESIONALES'   , 'S', 1, current_timestamp, null, null, null, null);
insert into tipos_servicios values (2, 'SERVICIOS NO PROFESIONALES', 'N', 1, current_timestamp, null, null, null, null);

insert into tipos_formas_pagos values (1, 'EFECTIVO'       , 1, current_timestamp, null, null, null, null);
insert into tipos_formas_pagos values (2, 'TARJETA CRÉDITO', 1, current_timestamp, null, null, null, null);
insert into tipos_formas_pagos values (3, 'TARJETA DÉBITO' , 1, current_timestamp, null, null, null, null);
insert into tipos_formas_pagos values (4, 'CHEQUE'         , 1, current_timestamp, null, null, null, null);
insert into tipos_formas_pagos values (5, 'LETRA'          , 1, current_timestamp, null, null, null, null);
insert into tipos_formas_pagos values (6, 'VALE VISTA'     , 1, current_timestamp, null, null, null, null);

insert into estados_requisiciones values (1, 'CREADA'                                                                                             , 1, current_timestamp, null, null, null, null);
insert into estados_requisiciones values (2, 'CERRADA, TRASPASADA A SUPERIOR JERÁRQUICO (ENVIADA A AUTORIZAR)'                                    , 1, current_timestamp, null, null, null, null);
insert into estados_requisiciones values (3, 'RECHAZADA POR SUPERIOR JERÁRQUICO, DEVUELTA A CREADOR DE LA REQUISICIÓN'                            , 1, current_timestamp, null, null, null, null);
insert into estados_requisiciones values (4, 'AUTORIZADA POR SUPERIOR JERÁRQUICO, TRASPASADA A DEPARTAMENTO DE COMPRAS'                           , 1, current_timestamp, null, null, null, null);
insert into estados_requisiciones values (5, 'REQUISICION RECIBIDA POR DEPARTAMENTO DE COMPRAS'                                                   , 1, current_timestamp, null, null, null, null);
insert into estados_requisiciones values (6, 'RECHAZADA POR DEPARTAMENTO DE COMPRAS, DEVUELTA A SUPERIOR JERÁRQUICO DEL CREADOR DE LA REQUISICIÓN', 1, current_timestamp, null, null, null, null);
insert into estados_requisiciones values (7, 'ACEPTADA POR DEPARTAMENTO COMPRAS, ORDEN DE COMPRA CREADA'                                          , 1, current_timestamp, null, null, null, null);

insert into tipos_requisiciones values (1, 'URGENTE'   , 0, 1, current_timestamp, null, null, null, null);
insert into tipos_requisiciones values (2, 'NORMAL'    , 0, 1, current_timestamp, null, null, null, null);
insert into tipos_requisiciones values (3, 'LICITACIÓN', 0, 1, current_timestamp, null, null, null, null);

insert into estados_ordenes_compras values (1, 'CREADA'                       , 1, current_timestamp, null, null, null, null);
insert into estados_ordenes_compras values (2, 'CERRADA'                      , 1, current_timestamp, null, null, null, null);
insert into estados_ordenes_compras values (3, 'EMITIDA (ENVIADA A PROVEEDOR)', 1, current_timestamp, null, null, null, null);
insert into estados_ordenes_compras values (4, 'FINIQUITADA'                  , 1, current_timestamp, null, null, null, null);

insert into estados_detalles_ordenes_compras values (1, 'NO SATISFECHA'          , 1, current_timestamp, null, null, null, null);
insert into estados_detalles_ordenes_compras values (2, 'PARCIALMENTE SATISFECHA', 1, current_timestamp, null, null, null, null);
insert into estados_detalles_ordenes_compras values (3, 'SATISFECHA'             , 1, current_timestamp, null, null, null, null);

insert into tipos_proveedores values (1, 'PERSONA NATURAL', 1, current_timestamp, null, null, null, null);
insert into tipos_proveedores values (2, 'EMPRESA'        , 1, current_timestamp, null, null, null, null);

insert into estados_rendiciones_gastos values (1, 'CREADA'                                                                                            , 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (2, 'CERRADA, TRASPASADA A SUPERIOR JERÁRQUICO (ENVIADA A AUTORIZAR)'                                   , 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (3, 'RECHAZADA POR SUPERIOR JERÁRQUICO, DEVUELTA A CREADOR DE LA RENDICIÓN'                             , 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (4, 'APROBADA POR SUPERIOR JERÁRQUICO, PASA A DEPARTAMENTO DE CONTABILIDAD'                             , 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (5, 'RECHAZADA POR DEPARTAMENTO DE CONTABILIDAD, DEVUELTA A SUPERIOR JERÁRQUICO DEL CREADOR DE LA REND.', 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (6, 'APROBADA POR CONTABILIDAD'                                                                         , 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (7, 'CONTABILIZADA'                                                                                     , 1, current_timestamp, null, null, null, null);
insert into estados_rendiciones_gastos values (8, 'ANULADA'                                                                                           , 1, current_timestamp, null, null, null, null);

insert into tipos_rendiciones_gastos values (1, 'SOLICITUD DE REEMBOLSO', 1, current_timestamp, null, null, null, null);
insert into tipos_rendiciones_gastos values (2, 'RENDICIÓN DE FONDOS'   , 1, current_timestamp, null, null, null, null);

\q
