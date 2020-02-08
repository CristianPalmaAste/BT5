set client_min_messages to warning;

select 'create sequence grem_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from grupos_empresariales;
select 'create sequence empr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from empresas;
select 'create sequence para_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from parametros;
select 'create sequence paem_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from parametros_empresas;
select 'create sequence esge_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_grem;
select 'create sequence rubr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from rubros;
select 'create sequence esre_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_registros;
select 'create sequence vapa_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from valores_paises;
select 'create sequence mone_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from monedas;
select 'create sequence gere_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from gerencias;
select 'create sequence proy_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from proyectos;
select 'create sequence line_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from lineas_negocios;
select 'create sequence ceco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from centros_costos;
select 'create sequence tare_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tareas;
select 'create sequence pais_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from paises;
select 'create sequence pers_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from personas;
select 'create sequence perf_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from perfiles;
select 'create sequence esci_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_civiles;
select 'create sequence sexo_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from sexos;
select 'create sequence prog_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from programas;
select 'create sequence usua_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from usuarios;
select 'create sequence uspe_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from usuarios_perfiles;
select 'create sequence pepr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from perfiles_programas;
select 'create sequence cuco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from cuentas_contables;
select 'create sequence dole_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from documentos_legales;
select 'create sequence tidl_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_documentos_legales;
select 'create sequence esdl_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_documentos_legales;
select 'create sequence sosh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from solicitudes_servs_hono;
select 'create sequence essh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_solics_servs_hono;
select 'create sequence cosh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from cotizaciones_servs_hono;
select 'create sequence dcsh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from doctos_cotizacs_servs_hono;
select 'create sequence ecsh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_cotizacs_servs_hono;
select 'create sequence orsh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from ordenes_servicios_hono;
select 'create sequence dosh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from doctos_ordenes_servs_hono;
select 'create sequence eosh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_ordenes_servs_hono;
select 'create sequence posh_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from pagos_ordenes_servs_hono;
select 'create sequence epos_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_pagos_ords_servs_hono;
select 'create sequence tifp_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_formas_pagos;
select 'create sequence fpnv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from formas_pagos_notas_ventas;
select 'create sequence fpve_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from formas_pagos_ventas;
select 'create sequence unte_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from unidades_territoriales;
select 'create sequence tidi_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_direcciones;
select 'create sequence ticl_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_clientes;
select 'create sequence ticv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_cotizaciones_vtas;
select 'create sequence escv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_cotizaciones_vtas;
select 'create sequence esnv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_notas_vtas;
select 'create sequence esve_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_ventas;
select 'create sequence orpr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from origenes_productos;
select 'create sequence unmp_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from unidades_medidas_productos;
select 'create sequence unms_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from unidades_medidas_servicios;
select 'create sequence tipr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_productos;
select 'create sequence impu_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from impuestos;
select 'create sequence tipi_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_productos_impuestos;
select 'create sequence tidv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_doctos_ventas;
select 'create sequence tise_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_servicios;
select 'create sequence clie_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from clientes;
select 'create sequence dicl_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from direcciones_clientes;
select 'create sequence vent_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from ventas;
select 'create sequence deve_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_ventas;
select 'create sequence nove_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from notas_ventas;
select 'create sequence denv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_notas_vtas;
select 'create sequence cove_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from cotizaciones_ventas;
select 'create sequence decv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_cotizs_vtas;
select 'create sequence prod_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from productos;
select 'create sequence serv_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from servicios;
select 'create sequence domi_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from dominios;
select 'create sequence vado_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from valores_dominios;
select 'create sequence bode_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from bodegas;
select 'create sequence bopr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from bodegas_productos;
select 'create sequence lipr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from listas_precios;
select 'create sequence delp_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_listas_precios;
select 'create sequence fapr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from familias_productos;
select 'create sequence sfpr_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from sub_familias_productos;
select 'create sequence timb_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_movimientos_bodegas;
select 'create sequence mobo_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from movimientos_bodegas;
select 'create sequence demb_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_movtos_bodegas;
select 'create sequence desu_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from descuentos;
select 'create sequence bicp_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from bitacoras_cambios_precios;
select 'create sequence ereq_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_requisiciones;
select 'create sequence tire_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_requisiciones;
select 'create sequence requ_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from requisiciones;
select 'create sequence dere_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_requisiciones;
select 'create sequence aure_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from autorizadores_requisiciones;
select 'create sequence hire_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from historiales_requisiciones;
select 'create sequence esoc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_ordenes_compras;
select 'create sequence edoc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_detalles_ordenes_compras;
select 'create sequence orco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from ordenes_compras;
select 'create sequence deoc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_ordenes_compras;
select 'create sequence coco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from cotizaciones_compras;
select 'create sequence decc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_cotizaciones_compras;
select 'create sequence prov_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from proveedores;
select 'create sequence tipp_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_proveedores;
select 'create sequence reco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from recepciones_compras;
select 'create sequence derc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_recepciones_compras;
select 'create sequence fore_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from fondos_a_rendir;
select 'create sequence esrg_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_rendiciones_gastos;
select 'create sequence tirg_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_rendiciones_gastos;
select 'create sequence rega_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from rendiciones_gastos;
select 'create sequence derg_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_rendiciones_gastos;
select 'create sequence corg_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from conceptos_rendiciones_gastos;
select 'create sequence aurn_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from autorizadores_rendiciones;
select 'create sequence hirn_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from historiales_rendiciones;
select 'create sequence comp_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from compras;
select 'create sequence deco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_compras;
select 'create sequence tacc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_asocs_ctas_ctbles;
select 'create sequence ticc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_cuentas_contables;
select 'create sequence tiec_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_entradas_contables;
select 'create sequence espc_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_periodos_contables;
select 'create sequence tiac_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from tipos_asientos_contables;
select 'create sequence esac_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from estados_asientos_contables;
select 'create sequence peco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from periodos_contables;
select 'create sequence asco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from asientos_contables;
select 'create sequence deac_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_asientos_contables;
select 'create sequence prco_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from procesos_contables;
select 'create sequence prce_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from procesos_contables_empresas;
select 'create sequence coca_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from conceptos_contabilizacs_automats;
select 'create sequence dpce_seq start with ' || (case when MAX(ID) is null then 0 else MAX(ID) end)+1 from detalles_procesos_ctbles_empresas;


\q
