set client_min_messages to warning;

create or replace view grem as select * from grupos_empresariales;
create or replace view empr as select * from empresas;
create or replace view para as select * from parametros;
create or replace view paem as select * from parametros_empresas;
create or replace view esge as select * from estados_grem;
create or replace view rubr as select * from rubros;
create or replace view esre as select * from estados_registros;
create or replace view vapa as select * from valores_paises;
create or replace view mone as select * from monedas;
create or replace view gere as select * from gerencias;
create or replace view proy as select * from proyectos;
create or replace view line as select * from lineas_negocios;
create or replace view ceco as select * from centros_costos;
create or replace view tare as select * from tareas;
create or replace view pais as select * from paises;
create or replace view pers as select * from personas;
create or replace view perf as select * from perfiles;
create or replace view esci as select * from estados_civiles;
create or replace view sexo as select * from sexos;
create or replace view prog as select * from programas;
create or replace view usua as select * from usuarios;
create or replace view uspe as select * from usuarios_perfiles;
create or replace view pepr as select * from perfiles_programas;
create or replace view cuco as select * from cuentas_contables;
create or replace view dole as select * from documentos_legales;
create or replace view tidl as select * from tipos_documentos_legales;
create or replace view esdl as select * from estados_documentos_legales;
create or replace view sosh as select * from solicitudes_servs_hono;
create or replace view essh as select * from estados_solics_servs_hono;
create or replace view cosh as select * from cotizaciones_servs_hono;
create or replace view dcsh as select * from doctos_cotizacs_servs_hono;
create or replace view ecsh as select * from estados_cotizacs_servs_hono;
create or replace view orsh as select * from ordenes_servicios_hono;
create or replace view dosh as select * from doctos_ordenes_servs_hono;
create or replace view eosh as select * from estados_ordenes_servs_hono;
create or replace view posh as select * from pagos_ordenes_servs_hono;
create or replace view epos as select * from estados_pagos_ords_servs_hono;
create or replace view tifp as select * from tipos_formas_pagos;
create or replace view fpnv as select * from formas_pagos_notas_ventas;
create or replace view fpve as select * from formas_pagos_ventas;
create or replace view unte as select * from unidades_territoriales;
create or replace view ticl as select * from tipos_clientes;
create or replace view ticv as select * from tipos_cotizaciones_vtas;
create or replace view escv as select * from estados_cotizaciones_vtas;
create or replace view esnv as select * from estados_notas_vtas;
create or replace view esve as select * from estados_ventas;
create or replace view orpr as select * from origenes_productos;
create or replace view unmp as select * from unidades_medidas_productos;
create or replace view unms as select * from unidades_medidas_servicios;
create or replace view tipr as select * from tipos_productos;
create or replace view impu as select * from impuestos;
create or replace view tipi as select * from tipos_productos_impuestos;
create or replace view tidv as select * from tipos_doctos_ventas;
create or replace view tise as select * from tipos_servicios;
create or replace view clie as select * from clientes;
create or replace view vent as select * from ventas;
create or replace view deve as select * from detalles_ventas;
create or replace view nove as select * from notas_ventas;
create or replace view denv as select * from detalles_notas_vtas;
create or replace view cove as select * from cotizaciones_ventas;
create or replace view decv as select * from detalles_cotizs_vtas;
create or replace view prod as select * from productos;
create or replace view serv as select * from servicios;
create or replace view domi as select * from dominios;
create or replace view vado as select * from valores_dominios;
create or replace view bode as select * from bodegas;
create or replace view bopr as select * from bodegas_productos;
create or replace view lipr as select * from listas_precios;
create or replace view delp as select * from detalles_listas_precios;
create or replace view fapr as select * from familias_productos;
create or replace view sfpr as select * from sub_familias_productos;
create or replace view timb as select * from tipos_movimientos_bodegas;
create or replace view mobo as select * from movimientos_bodegas;
create or replace view demb as select * from detalles_movtos_bodegas;
create or replace view desu as select * from descuentos;
create or replace view bicp as select * from bitacoras_cambios_precios;
create or replace view ereq as select * from estados_requisiciones;
create or replace view tire as select * from tipos_requisiciones;
create or replace view requ as select * from requisiciones;
create or replace view dere as select * from detalles_requisiciones;
create or replace view aure as select * from autorizadores_requisiciones;
create or replace view hire as select * from historiales_requisiciones;
create or replace view esoc as select * from estados_ordenes_compras;
create or replace view edoc as select * from estados_detalles_ordenes_compras;
create or replace view orco as select * from ordenes_compras;
create or replace view deoc as select * from detalles_ordenes_compras;
create or replace view coco as select * from cotizaciones_compras;
create or replace view decc as select * from detalles_cotizaciones_compras;
create or replace view prov as select * from proveedores;
create or replace view tipp as select * from tipos_proveedores;
create or replace view reco as select * from recepciones_compras;
create or replace view derc as select * from detalles_recepciones_compras;
create or replace view fore as select * from fondos_a_rendir;
create or replace view esrg as select * from estados_rendiciones_gastos;
create or replace view tirg as select * from tipos_rendiciones_gastos;
create or replace view rega as select * from rendiciones_gastos;
create or replace view derg as select * from detalles_rendiciones_gastos;
create or replace view corg as select * from conceptos_rendiciones_gastos;
create or replace view aurn as select * from autorizadores_rendiciones;
create or replace view hirn as select * from historiales_rendiciones;
create or replace view doco as select * from documentos_compras;
create or replace view dedc as select * from detalles_doctos_compras;


\q
