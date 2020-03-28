alter table personas disable trigger all;
alter table usuarios disable trigger all;

create or replace function f_borrar_CLIMASAN () returns varchar(1) as
$$
declare
  Vidgrem int;
  Vidempr int;
begin
  select id
  into   Vidgrem
  from   grem
  where  alias = 'CLIMASAN'
  ;
  select id
  into   Vidempr
  from   empr
  where  nombrefantasia = 'CLIMASAN'
  ;
  delete from detalles_ventas
  where  idprod in (select id
                    from   productos
                    where  idsfpr in (select id
                                      from   sub_familias_productos
                                      where  idfapr in (select id
                                                        from   familias_productos
                                                        where  idempr = Vidempr
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
                                                        where  idempr = Vidempr
                                                       )
                                     )
                   )
  ;
  delete from detalles_notas_vtas
  where  idprod in (select id
                    from   productos
                    where  idsfpr in (select id
                                      from   sub_familias_productos
                                      where  idfapr in (select id
                                                        from   familias_productos
                                                        where  idempr = Vidempr
                                                       )
                                     )
                   )
  ;
  delete from detalles_cotizs_vtas
  where  idprod in (select id
                    from   productos
                    where  idsfpr in (select id
                                      from   sub_familias_productos
                                      where  idfapr in (select id
                                                        from   familias_productos
                                                        where  idempr = Vidempr
                                                       )
                                     )
                   )
  ;
  delete from detalles_listas_precios
  where  idprod in (select id
                    from   productos
                    where  idsfpr in (select id
                                      from   sub_familias_productos
                                      where  idfapr in (select id
                                                        from   familias_productos
                                                        where  idempr = Vidempr
                                                       )
                                     )
                   )
  ;
  delete from bitacoras_cambios_precios
  where  idprod in (select id
                    from   productos
                    where  idsfpr in (select id
                                      from   sub_familias_productos
                                      where  idfapr in (select id
                                                        from   familias_productos
                                                        where  idempr = Vidempr
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
                                                        where  idempr = Vidempr
                                                       )
                                     )
                   )
  ;
  delete from productos
  where  idsfpr in (select id
                    from   sub_familias_productos
                    where  idfapr in (select id
                                      from   familias_productos
                                      where  idempr = Vidempr
                                     )
                   )
  ;
  delete from sub_familias_productos
  where  idfapr in (select id
                    from   familias_productos
                    where  idempr = Vidempr
                   )
  ;
  delete from familias_productos
  where  idempr = Vidempr
  ;
  delete from autorizadores_rendiciones
  where  idempr = Vidempr
  ;
  delete from autorizadores_requisiciones
  where  idempr = Vidempr
  ;
  delete from detalles_ventas
  where  idvent in (select id
                    from   ventas
                    where  idbode in (select id
                                      from   bodegas
                                      where  idempr = Vidempr
                                     )
                   )
  ;
  delete from ventas
  where  idbode in (select id
                    from   bodegas
                    where  idempr = Vidempr
                   )
  ;
  delete from movimientos_bodegas
  where  idbode in (select id
                    from   bodegas
                    where  idempr = Vidempr
                   )
  ;
  delete from notas_ventas
  where  idcove in (select id
                    from   cotizaciones_ventas
                    where  idbode in (select id
                                      from   bodegas
                                      where  idempr = Vidempr
                                     )
                   )
  ;
  delete from cotizaciones_ventas
  where  idbode in (select id
                    from   bodegas
                    where  idempr = Vidempr
                   )
  ;
  delete from bodegas
  where  idempr = Vidempr
  ;
  delete from parametros_empresas
  where  idempr = Vidempr
  ;
  delete from usuarios_perfiles
  where  idempr = Vidempr
  ;
  delete from detalles_procesos_ctbles_empresas
  where  idprce in (select id
                    from   procesos_contables_empresas
                    where  idempr = Vidempr
                   )
  ;
  delete from procesos_contables_empresas
  where  idempr = Vidempr
  ;
  delete from detalles_notas_vtas
  where  idserv in (select id
                    from   servicios
                    where  idempr = Vidempr
                   )
  ;
  delete from detalles_ventas
  where  idserv in (select id
                    from   servicios
                    where  idempr = Vidempr
                   )
  ;
  delete from detalles_cotizs_vtas
  where  idserv in (select id
                    from   servicios
                    where  idempr = Vidempr
                   )
  ;
  delete from servicios
  where  idempr = Vidempr
  ;
  delete from ventas
  where  idasco in (select id
                    from   asientos_contables
                    where  idpeco in (select id
                                      from   periodos_contables
                                      where  idempr = Vidempr
                                     )
                   )
  ;
  delete from detalles_asientos_contables
  where  idasco in (select id
                    from   asientos_contables
                    where  idpeco in (select id
                                      from   periodos_contables
                                      where  idempr = Vidempr
                                     )
                   )
  ;
  delete from asientos_contables
  where  idpeco in (select id
                    from   periodos_contables
                    where  idempr = Vidempr
                   )
  ;
  delete from periodos_contables
  where  idempr = Vidempr
  ;
  delete from ventas
  where  idnove in (select id
                    from   notas_ventas
                    where  idcove in (select id
                                      from   cotizaciones_ventas
                                      where  idempr in (select id
                                                        from   empresas
                                                        where  id = Vidempr
                                                       )
                                     )
                   )
  ;
  delete from notas_ventas
  where  idcove in (select id
                    from   cotizaciones_ventas
                    where  idempr in (select id
                                      from   empresas
                                      where  id = Vidempr
                                     )
                   )
  ;
  delete from cotizaciones_ventas
  where  idempr in (select id
                    from   empresas
                    where  id = Vidempr
                   )
  ;
  delete from listas_precios
  where  idempr in (select id
                    from   empresas
                    where  id = Vidempr
                   )
  ;
  delete from ventas
  where  idempr in (select id
                    from   empresas
                    where  id = Vidempr
                   )
  ;
  delete from empresas
  where  id = Vidempr
  ;
  delete from direcciones_clientes
  where  idclie in (select id
                    from   clientes
                    where  idgrem = Vidgrem
                   )
  ;
  delete from clientes
  where  idgrem = Vidgrem
  ;
  delete from usuarios
  where  idpers in (select id
                    from   personas
                    where  idgrem = Vidgrem
                   )
  ;
  delete from personas
  where  idgrem = Vidgrem
  ;
  delete from parametros
  where  idgrem = Vidgrem
  ;
  delete from tipos_documentos_legales
  where  idgrem = Vidgrem
  ;
  delete from estados_documentos_legales
  where  idgrem = Vidgrem
  ;
  delete from proveedores
  where  idgrem = Vidgrem
  ;
  delete from detalles_rendiciones_gastos
  where  idcorg in (select id
                    from   conceptos_rendiciones_gastos
                    where  idgrem = Vidgrem
                   )
  ;
  delete from conceptos_rendiciones_gastos
  where  idgrem = Vidgrem
  ;
  delete from cuentas_contables
  where  idgrem = Vidgrem
  ;
  delete from grupos_empresariales
  where  id = Vidgrem
  ;
  delete from usuarios
  where  id > 15
  ;
  return('S');
end;
$$ LANGUAGE plpgsql;

alter table personas enable trigger all;
alter table usuarios enable trigger all;

select f_borrar_CLIMASAN();

drop function f_borrar_CLIMASAN ();
