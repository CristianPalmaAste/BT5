delete from detalles_ventas
where  idprod in (select id
                  from   productos
                  where  idsfpr in (select id
                                    from   sub_familias_productos
                                    where  idfapr in (select id
                                                      from   familias_productos
                                                      where  idempr = 14
                                                     )
                                   )
                 )

;

delete from bodegas_productos
where  idprod in (select id
                  from   productos
                  where  idsfpr in (select id
                                    from   sub_familias_productos
                                    where  idfapr in (select id
                                                      from   familias_productos
                                                      where  idempr = 14
                                                     )
                                   )
                 )

;

delete from detalles_movtos_bodegas
where  idprod in (select id
                  from   productos
                  where  idsfpr in (select id
                                    from   sub_familias_productos
                                    where  idfapr in (select id
                                                      from   familias_productos
                                                      where  idempr = 14
                                                     )
                                   )
                 )

;

delete from productos
where  idsfpr in (select id
                  from   sub_familias_productos
                  where  idfapr in (select id
                                    from   familias_productos
                                    where  idempr = 14
                                   )
                 )

;

delete from sub_familias_productos
where  idfapr in (select id
                  from   familias_productos
                  where  idempr = 14
                 )
;

delete from familias_productos
where  idempr = 14
;

delete from autorizadores_rendiciones
where  idempr = 14
;

delete from autorizadores_requisiciones
where  idempr = 14
;

delete from detalles_ventas
where  idvent in (select id
                  from   ventas
                  where  idbode in (select id
                                    from   bodegas
                                    where  idempr = 14
                                   )
                 )
;

delete from ventas
where  idbode in (select id
                  from   bodegas
                  where  idempr = 14
                 )
;

delete from movimientos_bodegas
where  idbode in (select id
                  from   bodegas
                  where  idempr = 14
                 )
;

delete from bodegas
where  idempr = 14
;

delete from parametros_empresas
where  idempr = 14
;

delete from usuarios_perfiles
where  idempr = 14
;

delete from detalles_procesos_ctbles_empresas
where  idprce in (select id
                  from   procesos_contables_empresas
                  where  idempr = 14
                 )
;

delete from procesos_contables_empresas
where  idempr = 14
;

delete from servicios
where  idempr = 14
;

delete from periodos_contables
where  idempr = 14
;

delete from empresas
where  id = 14
;

delete from direcciones_clientes
where  idclie in (select id
                  from   clientes
                  where  idgrem = 8
                 )
;

delete from clientes
where  idgrem = 8
;

delete from usuarios
where  idpers in (select id
                  from   personas
                  where  idgrem = 8
                 )
;

delete from personas
where  idgrem = 8
;

delete from parametros
where  idgrem = 8
;

delete from tipos_documentos_legales
where  idgrem = 8
;

delete from estados_documentos_legales
where  idgrem = 8
;

delete from proveedores
where  idgrem = 8
;

delete from detalles_rendiciones_gastos
where  idcorg in (select id
                  from   conceptos_rendiciones_gastos
                  where  idgrem = 8
                 )
;

delete from conceptos_rendiciones_gastos
where  idgrem = 8
;

delete from cuentas_contables
where  idgrem = 8
;

delete from grupos_empresariales
where  id = 8
;

