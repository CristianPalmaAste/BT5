alter table estados_civiles                  add constraint esci_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_civiles                  add constraint esci_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_cotizaciones_vtas        add constraint escv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_cotizaciones_vtas        add constraint escv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_cotizacs_servs_hono      add constraint ecsh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_cotizacs_servs_hono      add constraint ecsh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_detalles_ordenes_compras add constraint edoc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_detalles_ordenes_compras add constraint edoc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_grem                     add constraint esgr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_grem                     add constraint esgr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_notas_vtas               add constraint esnv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_notas_vtas               add constraint esnv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_ordenes_compras          add constraint esoc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_ordenes_compras          add constraint esoc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_ordenes_servs_hono       add constraint eosh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_ordenes_servs_hono       add constraint eosh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_pagos_ords_servs_hono    add constraint epos_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_pagos_ords_servs_hono    add constraint epos_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_registros                add constraint esre_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_registros                add constraint esre_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_rendiciones_gastos       add constraint esrg_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_rendiciones_gastos       add constraint esrg_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_requisiciones            add constraint ereq_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_requisiciones            add constraint ereq_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_solics_servs_hono        add constraint essh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_solics_servs_hono        add constraint essh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_ventas                   add constraint esve_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_ventas                   add constraint esve_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table monedas                          add constraint mone_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table monedas                          add constraint mone_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table origenes_productos               add constraint orpr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table origenes_productos               add constraint orpr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table perfiles                         add constraint perf_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table perfiles                         add constraint perf_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table sexos                            add constraint sexo_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table sexos                            add constraint sexo_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_clientes                   add constraint ticl_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_clientes                   add constraint ticl_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_cotizaciones_vtas          add constraint ticv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_cotizaciones_vtas          add constraint ticv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_formas_pagos               add constraint tifp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_formas_pagos               add constraint tifp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_movimientos_bodegas        add constraint timb_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_movimientos_bodegas        add constraint timb_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_productos                  add constraint tipr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_productos                  add constraint tipr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_proveedores                add constraint tipp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_proveedores                add constraint tipp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_rendiciones_gastos         add constraint tirg_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_rendiciones_gastos         add constraint tirg_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_requisiciones              add constraint tire_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_requisiciones              add constraint tire_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_servicios                  add constraint tise_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_servicios                  add constraint tise_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table unidades_medidas_productos       add constraint unmp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table unidades_medidas_productos       add constraint unmp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table unidades_medidas_servicios       add constraint unms_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table unidades_medidas_servicios       add constraint unms_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

