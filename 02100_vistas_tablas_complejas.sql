set client_min_messages to warning;

/*************************************************************************************************************************/

drop view if exists persv
;

create or replace view persv as
select pers.id               id
      ,pers.idgrem           idgrem
      ,grem.alias            holding
      ,pers.identificador1   rut
      ,pers.identificador2   dv
      ,pers.primernombre     primernombre
      ,pers.segundonombre    segundonombre
      ,pers.apellidopaterno  apellidopaterno
      ,pers.apellidomaterno  apellidomaterno
      ,pers.email            email
      ,pers.fechanac         fechanac
      ,pers.idesci           idesci
      ,esci.descripcion      estadocivil
      ,pers.idsexo           idsexo
      ,sexo.descripcion      sexo
      ,pers.idpais           idpais
      ,pais.nacionalidad     nacionalidad
from                   personas             pers
       left       join grupos_empresariales grem on pers.idgrem = grem.id
       left outer join estados_civiles      esci on pers.idesci = esci.id
       left outer join sexos                sexo on pers.idsexo = sexo.id
       left outer join paises               pais on pers.idpais = pais.id
where  pers.idusuaborraregistro is null
and    grem.idusuaborraregistro is null
;

select *
from   persv
;

/*************************************************************************************************************************/

drop view if exists dolev
;

create or replace view dolev as
select dole.id               id
      ,dole.idempr           idempr
      ,empr.nombrefantasia   empresa
      ,dole.idtidl           idtidl
      ,tidl.descripcion      tipodocumentolegal
      ,dole.nombreoriginal   nombreoriginal
      ,dole.nombresistema    nombresistema
      ,dole.idesdl           idesdl
      ,esdl.descripcion      estadodocumentolegal
      ,dole.fecha            fecha
      ,dole.notaria          notaria
      ,dole.foja             foja
      ,dole.responsable      responsable
      ,dole.comentario       comentario
      ,dole.fechaaviso       fechaaviso
      ,dole.emailaviso       emailaviso
      ,dole.avisodado        avisodado
from             documentos_legales         dole
       left join empresas                   empr on dole.idempr = empr.id
       left join tipos_documentos_legales   tidl on dole.idtidl = tidl.id
       left join estados_documentos_legales esdl on dole.idesdl = esdl.id
where  dole.idusuaborraregistro is null
;

select *
from   dolev
;

/*************************************************************************************************************************/

drop view if exists gremv
;

create or replace view gremv as
select grem.id               id
      ,grem.nombre           nombre
      ,grem.alias            alias
      ,grem.icono            icono
      ,grem.idpais           idpais
      ,pais.nombre           pais
      ,grem.idesge           idesge
      ,esge.descripcion      estadoholding
from             grupos_empresariales grem
       left join paises               pais on grem.idpais = pais.id
       left join estados_grem         esge on grem.idesge = esge.id
where  grem.idusuaborraregistro is null
;

select *
from   gremv
;

/*************************************************************************************************************************/

drop view if exists emprv
;

create or replace view emprv as
select empr.id               id
      ,empr.idgrem           idgrem
      ,grem.nombre           holding
      ,empr.idpais           idpais
      ,pais.nombre           pais
      ,empr.idrubr           idrubr
      ,rubr.descripcion      rubro
      ,empr.idesre           idesre
      ,esre.descripcion      estadoregistro
      ,empr.identificador1   identificador1
      ,empr.identificador2   identificador2
      ,empr.razonsocial      razonsocial
      ,empr.nombrefantasia   nombrefantasia
      ,empr.icono            icono
from             empresas                empr
       left join grupos_empresariales    grem on empr.idgrem = grem.id
       left join paises                  pais on empr.idpais = pais.id
       left join rubros                  rubr on empr.idrubr = rubr.id
       left join estados_registros       esre on empr.idesre = esre.id
where  empr.idusuaborraregistro is null
and    grem.idusuaborraregistro is null
;

select *
from   emprv
;

/*************************************************************************************************************************/

drop view if exists uspev
;

create or replace view uspev as
select uspe.id               id
      ,uspe.idusua           idusua
      ,usua.username         username
      ,uspe.idperf           idperf
      ,perf.descripcion      perfil
      ,uspe.idgrem           idgrem
      ,grem.nombre           holding
      ,uspe.idempr           idempr
      ,empr.razonsocial      razonsocial
      ,uspe.idesre           idesre
      ,esre.descripcion      estadoregistro
from                   usuarios_perfiles    uspe
       left       join usuarios             usua on uspe.idusua = usua.id
       left       join perfiles             perf on uspe.idperf = perf.id
       left outer join grupos_empresariales grem on uspe.idgrem = grem.id
       left outer join empresas             empr on uspe.idempr = empr.id
       left       join estados_registros    esre on uspe.idesre = esre.id
where  uspe.idusuaborraregistro is null
and    usua.idusuaborraregistro is null
and    grem.idusuaborraregistro is null
and    empr.idusuaborraregistro is null
;

select *
from   uspev
;

/*************************************************************************************************************************/

drop view if exists peprv
;

create or replace view peprv as
select pepr.id               id
      ,pepr.idperf           idperf
      ,perf.descripcion      perfil
      ,pepr.idprog           idprog
      ,prog.titulo           programa
from             perfiles_programas pepr
       left join perfiles           perf on pepr.idperf = perf.id
       left join programas          prog on pepr.idprog = prog.id
where  pepr.idusuaborraregistro is null
;

select *
from   peprv
;

/*************************************************************************************************************************/

drop view if exists tipiv
;

create or replace view tipiv as
select tipi.id               id
      ,tipr.id               idtipr
      ,tipr.descripcion      tipo_producto
      ,impu.id               idimpu
      ,impu.descripcion      impuesto
      ,impu.descripcioncorta alias_impuesto
      ,impu.valor            valor
from                   tipos_productos_impuestos tipi
       left outer join tipos_productos           tipr on tipi.idtipr = tipr.id
       left outer join impuestos                 impu on tipi.idimpu = impu.id
;

select *
from   tipiv
;

/*************************************************************************************************************************/

drop view if exists cliev
;

create or replace view cliev as
select clie.id               id
      ,clie.idgrem           idgrem
      ,grem.alias            holding
      ,clie.idpais           idpais
      ,pais.nombre           pais
      ,clie.identificador1   identificador1
      ,clie.identificador2   identificador2
      ,clie.idticl           idticl
      ,ticl.descripcion      tipocliente
      ,clie.razonsocial      razonsocial
      ,clie.nombrefantasia   nombrefantasia
      ,clie.primernombre     primernombre
      ,clie.segundonombre    segundonombre
      ,clie.apellidopaterno  apellidopaterno
      ,clie.apellidomaterno  apellidomaterno
from                   clientes             clie
       left outer join grupos_empresariales grem on clie.idgrem = grem.id
       left outer join paises               pais on clie.idpais = pais.id
       left outer join tipos_clientes       ticl on clie.idticl = ticl.id
where  clie.idusuaborraregistro is null
and    grem.idusuaborraregistro is null
;

select *
from   cliev
;

/*************************************************************************************************************************/

drop view if exists prodv
;

create or replace view prodv as
select prod.id                        id
      ,prod.idempr                    idempr
      ,empr.nombrefantasia            empresa
      ,prod.idsfpr                    idsfpr
      ,sfpr.cod_sub_familia           sub_familia
      ,sfpr.descripcion               nombre_sub_familia
      ,sfpr.idfapr                    idfapr
      ,fapr.cod_familia               familia
      ,fapr.descripcion               nombre_familia
      ,prod.idtipr                    idtipr
      ,tipr.descripcion               tipo_producto
      ,prod.idunmp                    idunmp
      ,unmp.descripcion               unidad_de_medida
      ,unmp.descripcioncorta          alias_unidad_de_medida
      ,prod.idorpr                    idorpr
      ,orpr.descripcion               origen
      ,orpr.descripcioncorta          alias_origen
      ,prod.nombre                    nombre
      ,prod.correlativoflia           producto
      ,prod.sku                       sku
      ,prod.ean13                     ean13
      ,prod.qr                        qr
      ,prod.pesounitariokg            pesounitariokg
      ,prod.idesre                    idesre
      ,esre.descripcion               estado_regsitro
      ,f_datos_producto(prod.id,10)   cod_prod_alfanum
from                   productos                  prod
       left outer join empresas                   empr on prod.idempr = empr.id
       left outer join sub_familias_productos     sfpr on prod.idsfpr = sfpr.id
       left outer join familias_productos         fapr on sfpr.idfapr = fapr.id
       left outer join tipos_productos            tipr on prod.idtipr = tipr.id
       left outer join unidades_medidas_productos unmp on prod.idunmp = unmp.id
       left outer join origenes_productos         orpr on prod.idorpr = orpr.id
       left outer join estados_registros          esre on prod.idesre = esre.id
where  prod.idusuaborraregistro is null
and    empr.idusuaborraregistro is null
;

select *
from   prodv
;

/*************************************************************************************************************************/

drop view if exists servv
;

create or replace view servv as
select serv.id                id
      ,serv.idempr            idempr
      ,empr.nombrefantasia    empresa
      ,serv.idtise            idtise
      ,tise.descripcion       tipo_servicio
      ,serv.idunms            idunms
      ,unms.descripcion       unidad_medida_servicio
      ,unms.descripcioncorta  alias_unidad_medida_servicio
      ,serv.nombre            nombre
      ,serv.preciounitario    preciounitario
      ,serv.idmone            idmone
      ,mone.nombre            moneda
      ,mone.nombrecorto       alias_moneda
from                   servicios                  serv
       left outer join empresas                   empr on serv.idempr = empr.id
       left outer join tipos_servicios            tise on serv.idtise = tise.id
       left outer join unidades_medidas_servicios unms on serv.idunms = unms.id
       left outer join monedas                    mone on serv.idmone = mone.id
where  serv.idusuaborraregistro is null
and    empr.idusuaborraregistro is null
;

select *
from   servv
;

/*************************************************************************************************************************/

drop view if exists covev
;

create or replace view covev as
select cove.id                                                                                                                     id
      ,cove.idempr                                                                                                                 idempr
      ,empr.nombrefantasia                                                                                                         empresa
      ,cove.numero                                                                                                                 numero_cotiz
      ,cove.idclie                                                                                                                 idclie
      ,coalesce(clie.nombrefantasia,' ') || ' ' || coalesce(clie.primernombre,' ') || ' ' || coalesce(clie.apellidopaterno,' ')    cliente
      ,cove.descripcioncotizacion                                                                                                  desc_cotiz
      ,cove.idgere                                                                                                                 idgere
      ,gere.nombre                                                                                                                 gerencia
      ,cove.idproy                                                                                                                 idproy
      ,proy.nombre                                                                                                                 proyecto
      ,cove.idline                                                                                                                 idline
      ,line.nombre                                                                                                                 linea_negocio
      ,cove.idceco                                                                                                                 idceco
      ,ceco.nombre                                                                                                                 centro_costo
      ,cove.idtare                                                                                                                 idtare
      ,tare.nombre                                                                                                                 tarea
      ,cove.exento                                                                                                                 exento
      ,cove.afecto                                                                                                                 afecto
      ,cove.impuestosobligats                                                                                                      impuestosobligats
      ,cove.impuestosespecifs                                                                                                      impuestosespecifs
      ,cove.porcentajedescuento                                                                                                    porcentajedescuento
      ,cove.montodescuento                                                                                                         montodescuento
      ,cove.total                                                                                                                  total
      ,cove.diasvalidez                                                                                                            diasvalidez
      ,cove.idescv                                                                                                                 idescv
      ,escv.descripcion                                                                                                            estado_cotiz
from                   cotizaciones_ventas        cove
       left outer join empresas                   empr on cove.idempr = empr.id
       left outer join clientes                   clie on cove.idclie = clie.id
       left outer join gerencias                  gere on cove.idgere = gere.id
       left outer join proyectos                  proy on cove.idproy = proy.id
       left outer join lineas_negocios            line on cove.idline = line.id
       left outer join centros_costos             ceco on cove.idceco = ceco.id
       left outer join tareas                     tare on cove.idtare = tare.id
       left outer join estados_cotizaciones_vtas  escv on cove.idescv = escv.id
where  cove.idusuaborraregistro is null
;

select *
from   covev
;

/*************************************************************************************************************************/

drop view if exists novev
;

create or replace view novev as
select nove.id                                                                                                                     id
      ,nove.idempr                                                                                                                 idempr
      ,empr.nombrefantasia                                                                                                         empresa
      ,nove.idcove                                                                                                                 idcove
      ,cove.numero                                                                                                                 numero_cotizacion
      ,nove.numero                                                                                                                 numero_nota_venta
      ,nove.idclie                                                                                                                 idclie
      ,coalesce(clie.nombrefantasia,' ') || ' ' || coalesce(clie.primernombre,' ') || ' ' || coalesce(clie.apellidopaterno,' ')    cliente
      ,nove.descripcionnotaventa                                                                                                   descripcion_nota_venta
      ,nove.fechanotaventa                                                                                                         fecha_nota_venta
      ,nove.idgere                                                                                                                 idgere
      ,gere.nombre                                                                                                                 gerencia
      ,nove.idproy                                                                                                                 idproy
      ,proy.nombre                                                                                                                 proyecto
      ,nove.idline                                                                                                                 idline
      ,line.nombre                                                                                                                 linea_negocio
      ,nove.idceco                                                                                                                 idceco
      ,ceco.nombre                                                                                                                 centro_costo
      ,nove.idtare                                                                                                                 idtare
      ,tare.nombre                                                                                                                 tarea
      ,nove.exento                                                                                                                 exento
      ,nove.afecto                                                                                                                 afecto
      ,nove.impuestosobligats                                                                                                      impuestosobligats
      ,nove.impuestosespecifs                                                                                                      impuestosespecifs
      ,nove.porcentajedescuento                                                                                                    porc_descto
      ,nove.montodescuento                                                                                                         monto_descto
      ,nove.total                                                                                                                  total
      ,nove.idesnv                                                                                                                 idesnv
      ,esnv.descripcion                                                                                                            estado_nota_venta
from                   notas_ventas            nove
       left outer join empresas                empr on nove.idempr = empr.id
       left outer join cotizaciones_ventas     cove on nove.idcove = cove.id
       left outer join clientes                clie on nove.idclie = clie.id
       left outer join gerencias               gere on nove.idgere = gere.id
       left outer join proyectos               proy on nove.idproy = proy.id
       left outer join lineas_negocios         line on nove.idline = line.id
       left outer join centros_costos          ceco on nove.idceco = ceco.id
       left outer join tareas                  tare on nove.idtare = tare.id
       left outer join estados_notas_vtas      esnv on nove.idesnv = esnv.id
where  nove.idusuaborraregistro is null
;

select *
from   novev
;

/*************************************************************************************************************************/

drop view if exists ventv
;

create or replace view ventv as
select vent.id                                                                                                                     id
      ,vent.idempr                                                                                                                 idempr
      ,empr.nombrefantasia                                                                                                         empresa
      ,vent.idnove                                                                                                                 idnove
      ,nove.numero                                                                                                                 numero_nota_venta
      ,vent.idtidv                                                                                                                 idtidv
      ,tidv.descripcion                                                                                                            tipo_docto_venta
      ,vent.numero                                                                                                                 folio_docto_venta
      ,vent.idclie                                                                                                                 idclie
      ,coalesce(clie.nombrefantasia,' ') || ' ' || coalesce(clie.primernombre,' ') || ' ' || coalesce(clie.apellidopaterno,' ')    cliente
      ,vent.descripcionventa                                                                                                       descripcion_venta
      ,vent.fechaventa                                                                                                             fecha_venta
      ,vent.idgere                                                                                                                 idgere
      ,gere.nombre                                                                                                                 gerencia
      ,vent.idproy                                                                                                                 idproy
      ,proy.nombre                                                                                                                 proyecto
      ,vent.idline                                                                                                                 idline
      ,line.nombre                                                                                                                 linea_negocio
      ,vent.idceco                                                                                                                 idceco
      ,ceco.nombre                                                                                                                 centro_costo
      ,vent.idtare                                                                                                                 idtare
      ,tare.nombre                                                                                                                 tarea
      ,vent.exento                                                                                                                 exento
      ,vent.afecto                                                                                                                 afecto
      ,vent.impuestosobligats                                                                                                      impuestosobligats
      ,vent.impuestosespecifs                                                                                                      impuestosespecifs
      ,vent.porcentajedescuento                                                                                                    porc_descto
      ,vent.montodescuento                                                                                                         monto_descto
      ,vent.total                                                                                                                  total
      ,vent.idesve                                                                                                                 idesve
      ,esve.descripcion                                                                                                            estado_venta
from                   ventas                  vent
       left outer join empresas                empr on vent.idempr = empr.id
       left outer join notas_ventas            nove on vent.idnove = nove.id
       left outer join tipos_doctos_ventas     tidv on vent.idtidv = tidv.id
       left outer join clientes                clie on vent.idclie = clie.id
       left outer join gerencias               gere on vent.idgere = gere.id
       left outer join proyectos               proy on vent.idproy = proy.id
       left outer join lineas_negocios         line on vent.idline = line.id
       left outer join centros_costos          ceco on vent.idceco = ceco.id
       left outer join tareas                  tare on vent.idtare = tare.id
       left outer join estados_ventas          esve on vent.idesve = esve.id
where  vent.idusuaborraregistro is null
;

select *
from   ventv
;

/*************************************************************************************************************************/

drop view if exists faprv
;

create or replace view faprv as
select fapr.id               id
      ,fapr.idempr           idempr
      ,empr.nombrefantasia   empresa
      ,fapr.cod_familia      cod_familia
      ,fapr.descripcion      descripcion
from                   familias_productos         fapr
       left outer join empresas                   empr on fapr.idempr = empr.id
where  fapr.idusuaborraregistro is null
;

select *
from   faprv
;

/*************************************************************************************************************************/

drop view if exists sfprv
;

create or replace view sfprv as
select sfpr.id                       id
      ,sfpr.idfapr                   idfapr
      ,fapr.cod_familia              cod_familia
      ,fapr.descripcion              familia
      ,sfpr.cod_sub_familia          cod_sub_familia
      ,sfpr.descripcion              sub_familia
      ,fapr.idempr                   idempr
      ,empr.nombrefantasia           empresa
from                   sub_familias_productos         sfpr
       left outer join familias_productos             fapr on sfpr.idfapr = fapr.id
       left outer join empresas                       empr on fapr.idempr = empr.id
where  sfpr.idusuaborraregistro is null
;

select *
from   sfprv
;

/*************************************************************************************************************************/

drop view if exists bodev
;

create or replace view bodev as
select bode.id                  id
      ,bode.idempr              idempr
      ,empr.nombrefantasia      empresa
      ,bode.nombre              bodega
from                   bodegas                   bode
       left outer join empresas                  empr on bode.idempr = empr.id
where  bode.idusuaborraregistro is null
;

select *
from   bodev
;

/*************************************************************************************************************************/

drop view if exists boprv
;

create or replace view boprv as
select bopr.id               id
      ,grem.id               idgrem
      ,grem.alias            grupo_empresarial
      ,bode.idempr           idempr
      ,empr.nombrefantasia   empresa
      ,bopr.idbode           idbode
      ,bode.nombre           bodega
      ,bopr.idprod           idprod
      ,prod.nombre           producto
      ,bopr.stock            stock
      ,prod.idunmp           idunmp
      ,unmp.descripcioncorta unidad_medida
from                   bodegas_productos          bopr
       left outer join bodegas                    bode on bopr.idbode = bode.id
       left outer join empresas                   empr on bode.idempr = empr.id
       left outer join grupos_empresariales       grem on empr.idgrem = grem.id
       left outer join productos                  prod on bopr.idprod = prod.id
       left outer join unidades_medidas_productos unmp on prod.idunmp = unmp.id
where  bopr.idusuaborraregistro is null
;

select *
from   boprv
;

/*************************************************************************************************************************/

drop view if exists liprv
;

create or replace view liprv as
select lipr.id               id
      ,lipr.idempr           idempr
      ,empr.nombrefantasia   empresa
      ,lipr.correlativo      correlativo
      ,lipr.fechainicio      fechainicio
      ,lipr.fechafin         fechafin
      ,lipr.observaciones    observaciones
      ,lipr.idesre           idesre
      ,esre.descripcion      estado_regsitro
from                   listas_precios          lipr
       left outer join empresas                empr on lipr.idempr = empr.id
       left outer join estados_registros       esre on lipr.idesre = esre.id
where  lipr.idusuaborraregistro is null
;

select *
from   liprv
;

/*************************************************************************************************************************/

drop view if exists delpv
;

create or replace view delpv as
select delp.id                                           id
      ,delp.idlipr                                       idlipr
      ,lipr.correlativo || ' - ' || lipr.observaciones   lista_precio
      ,lipr.idempr                                       idempr
      ,empr.nombrefantasia                               empresa
      ,delp.idprod                                       idprod
      ,prod.nombre                                       producto
      ,delp.preciounitario                               preciounitario
from                   detalles_listas_precios delp
       left outer join listas_precios          lipr on delp.idlipr = lipr.id
       left outer join empresas                empr on lipr.idempr = empr.id
       left outer join productos               prod on delp.idprod = prod.id
where  delp.idusuaborraregistro is null
;

select *
from   delpv
;

/*************************************************************************************************************************/

drop view if exists desuv
;

create or replace view desuv as
select desu.id                                            id
      ,desu.idfapr                                        idfapr
      ,fapr.cod_familia                                   cod_familia
      ,fapr.descripcion                                   familia
      ,desu.idsfpr                                        idsfpr
      ,fapr2.cod_familia || sfpr.cod_sub_familia          cod_sub_familia
      ,fapr2.descripcion || ' - ' || sfpr.descripcion     sub_familia
      ,desu.idprod                                        idprod
      ,prod.nombre                                        producto
      ,desu.porcentajedescuento                           porcentajedescuento
      ,desu.idesre                                        idesre
      ,esre.descripcion                                   estado_regsitro
from                   descuentos              desu
       left outer join familias_productos      fapr  on desu.idfapr = fapr.id
       left outer join sub_familias_productos  sfpr  on desu.idsfpr = sfpr.id
       left outer join familias_productos      fapr2 on sfpr.idfapr = fapr2.id
       left outer join empresas                empr  on fapr.idempr = empr.id
       left outer join productos               prod  on desu.idprod = prod.id
       left outer join estados_registros       esre  on desu.idesre = esre.id
where  desu.idusuaborraregistro is null
;

select *
from   desuv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists requv
;

create or replace view requv as
select requ.id                                    id
      ,requ.idempr                                idempr
      ,empr.nombrefantasia                        nombrefantasia
      ,requ.idtire                                idtire
      ,tire.descripcion                           tiporequisicion
      ,requ.correlativo                           correlativo
      ,requ.idusuasolicitareq                     idusuasolicitareq
      ,usua.username                              username
      ,requ.idgere                                idgere
      ,gere.nombre                                gerencia
      ,requ.idproy                                idproy
      ,proy.nombre                                proyecto
      ,requ.idline                                idline
      ,line.nombre                                linea_negocio
      ,requ.idceco                                idceco
      ,ceco.nombre                                centro_costo
      ,requ.idtare                                idtare
      ,tare.nombre                                tarea
      ,requ.idereq                                idereq
      ,ereq.descripcion                           estadorequisicion
from                   requisiciones              requ
       left outer join empresas                   empr on requ.idempr            = empr.id
       left outer join tipos_requisiciones        tire on requ.idtire            = tire.id
       left outer join usuarios                   usua on requ.idusuasolicitareq = usua.id
       left outer join gerencias                  gere on requ.idgere            = gere.id
       left outer join proyectos                  proy on requ.idproy            = proy.id
       left outer join lineas_negocios            line on requ.idline            = line.id
       left outer join centros_costos             ceco on requ.idceco            = ceco.id
       left outer join tareas                     tare on requ.idtare            = tare.id
       left outer join estados_requisiciones      ereq on requ.idereq            = ereq.id
where  requ.idusuaborraregistro is null
;

select *
from   requv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists provv
;

create or replace view provv as
select prov.id               id
      ,prov.idgrem           idgrem
      ,grem.alias            holding
      ,prov.idpais           idpais
      ,pais.nombre           pais
      ,prov.identificador1   identificador1
      ,prov.identificador2   identificador2
      ,prov.idtipp           idtipp
      ,tipp.descripcion      tipoproveedor
      ,prov.razonsocial      razonsocial
      ,prov.nombrefantasia   nombrefantasia
      ,prov.primernombre     primernombre
      ,prov.segundonombre    segundonombre
      ,prov.apellidopaterno  apellidopaterno
      ,prov.apellidomaterno  apellidomaterno
from                   proveedores          prov
       left outer join grupos_empresariales grem on prov.idgrem = grem.id
       left outer join paises               pais on prov.idpais = pais.id
       left outer join tipos_proveedores    tipp on prov.idtipp = tipp.id
where  prov.idusuaborraregistro is null
and    grem.idusuaborraregistro is null
;

select *
from   provv
;

/*************************************************************************************************************************/

drop view if exists aurev
;

create or replace view aurev as
select aure.id                    id
      ,aure.idempr                idempr
      ,empr.nombrefantasia        empresa
      ,aure.idperfautorizador     idperfautorizador
      ,perf1.descripcion          autorizador
      ,aure.idperfautorizado      idperfautorizado
      ,perf2.descripcion          autorizado
from                   autorizadores_requisiciones aure
       left outer join empresas                    empr  on aure.idempr            = empr.id
       left outer join perfiles                    perf1 on aure.idperfautorizador = perf1.id
       left outer join perfiles                    perf2 on aure.idperfautorizado  = perf2.id
where  aure.idusuaborraregistro is null
;

select *
from   aurev
order  by 1
;

/*************************************************************************************************************************/

drop view if exists orcov
;

create or replace view orcov as
select orco.id                                    id
      ,orco.idempr                                idempr
      ,empr.nombrefantasia                        empresa
      ,orco.correlativo                           correlativo
      ,orco.idrequ                                idrequ
      ,requ.correlativo                           requisicion
      ,orco.idgere                                idgere
      ,gere.nombre                                gerencia
      ,orco.idproy                                idproy
      ,proy.nombre                                proyecto
      ,orco.idline                                idline
      ,line.nombre                                linea_negocio
      ,orco.idceco                                idceco
      ,ceco.nombre                                centro_costo
      ,orco.idtare                                idtare
      ,tare.nombre                                tarea
      ,orco.idesoc                                idesoc
      ,esoc.descripcion                           estadoordencompra
      ,f_situacion_orco(orco.id,1)                situacionorconum
      ,f_situacion_orco(orco.id,2)                situacionorcotxt
from                   ordenes_compras            orco
       left outer join empresas                   empr on orco.idempr = empr.id
       left outer join requisiciones              requ on orco.idrequ = requ.id
       left outer join gerencias                  gere on orco.idgere = gere.id
       left outer join proyectos                  proy on orco.idproy = proy.id
       left outer join lineas_negocios            line on orco.idline = line.id
       left outer join centros_costos             ceco on orco.idceco = ceco.id
       left outer join tareas                     tare on orco.idtare = tare.id
       left outer join estados_ordenes_compras    esoc on orco.idesoc = esoc.id
where  orco.idusuaborraregistro is null
;

select *
from   orcov
order  by 1
;

/*************************************************************************************************************************/

drop view if exists cocov
;

create or replace view cocov as
select coco.id                                                                                                                     id
      ,coco.idrequ                                                                                                                 idrequ
      ,requ.correlativo                                                                                                            requisicion
      ,coco.idorco                                                                                                                 idorco
      ,orco.correlativo                                                                                                            ordencompra
      ,coco.idprov                                                                                                                 idprov
      ,coalesce(prov.nombrefantasia,' ') || ' ' || coalesce(prov.primernombre,' ') || ' ' || coalesce(prov.apellidopaterno,' ')    proveedor
      ,coco.observaciones                                                                                                          observaciones
from                   cotizaciones_compras    coco
       left outer join requisiciones           requ on coco.idrequ = requ.id
       left outer join ordenes_compras         orco on coco.idorco = orco.id
       left outer join proveedores             prov on coco.idprov = prov.id
where  coco.idusuaborraregistro is null
;

select *
from   cocov
order  by 1
;

/*************************************************************************************************************************/

drop view if exists recov
;

create or replace view recov as
select reco.id               id
      ,reco.idorco           idorco
      ,orco.correlativo      ordencompra
      ,reco.correlativo      correlativo
from                   recepciones_compras     reco
       left outer join ordenes_compras         orco on reco.idorco = orco.id
where  reco.idusuaborraregistro is null
;

select *
from   recov
order  by 1
;

/*************************************************************************************************************************/

drop view if exists forev
;

create or replace view forev as
select fore.id                        id
      ,fore.idempr                    idempr
      ,empr.nombrefantasia            empresa
      ,fore.correlativo               correlativo
      ,fore.monto                     monto
      ,fore.idgere                    idgere
      ,gere.nombre                    gerencia
      ,fore.idproy                    idproy
      ,proy.nombre                    proyecto
      ,fore.idline                    idline
      ,line.nombre                    linea_negocio
      ,fore.idceco                    idceco
      ,ceco.nombre                    centro_costo
      ,fore.idtare                    idtare
      ,tare.nombre                    tarea
from                   fondos_a_rendir            fore
       left outer join empresas                   empr on fore.idempr = empr.id
       left outer join gerencias                  gere on fore.idgere = gere.id
       left outer join proyectos                  proy on fore.idproy = proy.id
       left outer join lineas_negocios            line on fore.idline = line.id
       left outer join centros_costos             ceco on fore.idceco = ceco.id
       left outer join tareas                     tare on fore.idtare = tare.id
where  fore.idusuaborraregistro is null
;

select *
from   forev
order  by 1
;

/*************************************************************************************************************************/

drop view if exists regav
;

create or replace view regav as
select rega.id                        id
      ,rega.idempr                    idempr
      ,empr.nombrefantasia            empresa
      ,rega.correlativo               correlativo
      ,rega.idtirg                    idtirg
      ,tirg.descripcion               tipo_rendicion_gasto
      ,rega.idfore                    idfore
      ,fore.correlativo               fondo_a_rendir
      ,rega.idesrg                    idesrg
      ,esrg.descripcion               estado_rendicion_gasto
      ,rega.idgere                    idgere
      ,gere.nombre                    gerencia
      ,rega.idproy                    idproy
      ,proy.nombre                    proyecto
      ,rega.idline                    idline
      ,line.nombre                    linea_negocio
      ,rega.idceco                    idceco
      ,ceco.nombre                    centro_costo
      ,rega.idtare                    idtare
      ,tare.nombre                    tarea
      ,rega.observaciones             observaciones
from                   rendiciones_gastos          rega
       left outer join empresas                    empr on rega.idempr = empr.id
       left outer join tipos_rendiciones_gastos    tirg on rega.idtirg = tirg.id
       left outer join fondos_a_rendir             fore on rega.idfore = fore.id
       left outer join estados_rendiciones_gastos  esrg on rega.idesrg = esrg.id
       left outer join gerencias                   gere on rega.idgere = gere.id
       left outer join proyectos                   proy on rega.idproy = proy.id
       left outer join lineas_negocios             line on rega.idline = line.id
       left outer join centros_costos              ceco on rega.idceco = ceco.id
       left outer join tareas                      tare on rega.idtare = tare.id
where  rega.idusuaborraregistro is null
;

select *
from   regav
order  by 1
;

/*************************************************************************************************************************/

drop view if exists corgv
;

create or replace view corgv as
select corg.id                                                                                                                                      id
      ,corg.idgrem                                                                                                                                  idgrem
      ,grem.nombre                                                                                                                                  grupo_empresarial
      ,corg.descripcion                                                                                                                             descripcion_concepto_rendicion_gasto
      ,corg.idcuco                                                                                                                                  idcuco
      ,cuco.segmento1 || cuco.segmento2 || cuco.segmento3 || cuco.segmento4 || cuco.segmento5 || cuco.segmento6 || cuco.segmento7 || cuco.segmento8 cuenta_contable
      ,cuco.descripcion                                                                                                                             descripcion_cuenta_contable
from                   conceptos_rendiciones_gastos corg
       left outer join grupos_empresariales         grem on corg.idgrem = grem.id
       left outer join cuentas_contables            cuco on corg.idcuco = cuco.id
where  corg.idusuaborraregistro is null
;

select *
from   corgv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists aurnv
;

create or replace view aurnv as
select aurn.id                           id
      ,aurn.idempr                       idempr
      ,empr.nombrefantasia               empresa
      ,aurn.idperfautorizador            idperfautorizador
      ,perf1.descripcion                 autorizador
      ,aurn.idperfautorizado             idperfautorizado
      ,perf2.descripcion                 autorizado
from                   autorizadores_rendiciones   aurn
       left outer join empresas                    empr  on aurn.idempr = empr.id
       left outer join perfiles                    perf1 on aurn.idperfautorizador = perf1.id
       left outer join perfiles                    perf2 on aurn.idperfautorizado  = perf2.id
where  aurn.idusuaborraregistro is null
;

select *
from   aurnv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists dergv
;

create or replace view dergv as
select derg.id                                                                                                                     id
      ,derg.idrega                                                                                                                 idrega
      ,rega.correlativo                                                                                                            rendicion_gasto
      ,derg.correlativo                                                                                                            correlativo
      ,derg.idprov                                                                                                                 idprov
      ,coalesce(prov.nombrefantasia,' ') || ' ' || coalesce(prov.primernombre,' ') || ' ' || coalesce(prov.apellidopaterno,' ')    proveedor
      ,derg.idtidv                                                                                                                 idtidv
      ,tidv.descripcion                                                                                                            tipo_docto_venta
      ,derg.numero                                                                                                                 numero
      ,derg.fecha_docto                                                                                                            fecha_docto
      ,derg.idcorg                                                                                                                 idcorg
      ,corg.descripcion                                                                                                            concepto_rendicion_gasto
      ,derg.monto                                                                                                                  monto
from                   detalles_rendiciones_gastos   derg
       left outer join rendiciones_gastos            rega on derg.idrega = rega.id
       left outer join proveedores                   prov on derg.idprov = prov.id
       left outer join tipos_doctos_ventas           tidv on derg.idtidv = tidv.id
       left outer join conceptos_rendiciones_gastos  corg on derg.idcorg = corg.id
where  derg.idusuaborraregistro is null
;

select *
from   dergv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists soshv
;

create or replace view soshv as
select sosh.id                                           id
      ,sosh.idempr                                       idempr
      ,empr.nombrefantasia                               empresa
      ,sosh.correlativo                                  correlativo
      ,sosh.idpers                                       idpers
      ,pers.primernombre || ' ' || pers.apellidopaterno  persona
      ,sosh.descripcionsolicserv                         descripcionsolicserv
      ,sosh.idgere                                       idgere
      ,gere.nombre                                       gerencia
      ,sosh.idproy                                       idproy
      ,proy.nombre                                       proyecto
      ,sosh.idline                                       idline
      ,line.nombre                                       linea_negocio
      ,sosh.idceco                                       idceco
      ,ceco.nombre                                       centro_costo
      ,sosh.idtare                                       idtare
      ,tare.nombre                                       tarea
from                   solicitudes_servs_hono  sosh
       left outer join empresas                empr on sosh.idempr = empr.id
       left outer join personas                pers on sosh.idpers = pers.id
       left outer join gerencias               gere on sosh.idgere = gere.id
       left outer join proyectos               proy on sosh.idproy = proy.id
       left outer join lineas_negocios         line on sosh.idline = line.id
       left outer join centros_costos          ceco on sosh.idceco = ceco.id
       left outer join tareas                  tare on sosh.idtare = tare.id
where  sosh.idusuaborraregistro is null
;

select *
from   soshv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists orshv
;

create or replace view orshv as
select orsh.id                                           id
      ,orsh.idempr                                       idempr
      ,empr.nombrefantasia                               empresa
      ,orsh.idsosh                                       idsosh
      ,sosh.correlativo                                  solicitud_serv_honorario
      ,orsh.correlativo                                  correlativo
      ,orsh.codigocompra                                 codigocompra
      ,orsh.idpers                                       idpers
      ,pers.primernombre || ' ' || pers.apellidopaterno  persona
      ,orsh.descripcionordenserv                         descripcionordenserv
      ,orsh.resultadofinal                               resultadofinal
      ,orsh.ideosh                                       ideosh
      ,eosh.descripcion                                  estado_orden_serv_honorario
      ,orsh.idgere                                       idgere
      ,gere.nombre                                       gerencia
      ,orsh.idproy                                       idproy
      ,proy.nombre                                       proyecto
      ,orsh.idline                                       idline
      ,line.nombre                                       linea_negocio
      ,orsh.idceco                                       idceco
      ,ceco.nombre                                       centro_costo
      ,orsh.idtare                                       idtare
      ,tare.nombre                                       tarea
from                   ordenes_servicios_hono     orsh
       left outer join empresas                   empr on orsh.idempr = empr.id
       left outer join solicitudes_servs_hono     sosh on orsh.idsosh = sosh.id
       left outer join personas                   pers on orsh.idpers = pers.id
       left outer join estados_ordenes_servs_hono eosh on orsh.ideosh = eosh.id
       left outer join gerencias                  gere on orsh.idgere = gere.id
       left outer join proyectos                  proy on orsh.idproy = proy.id
       left outer join lineas_negocios            line on orsh.idline = line.id
       left outer join centros_costos             ceco on orsh.idceco = ceco.id
       left outer join tareas                     tare on orsh.idtare = tare.id
where  orsh.idusuaborraregistro is null
;

select *
from   orshv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists poshv
;

create or replace view poshv as
select posh.id                               id
      ,posh.idorsh                           idorsh
      ,orsh.correlativo                      orden_servicio_honorario
      ,posh.fechapago                        fechapago
      ,posh.monto                            monto
      ,posh.idtifp                           idtifp
      ,tifp.descripcion                      tipo_forma_pago
      ,posh.idepos                           idepos
      ,epos.descripcion                      estado_pago_ord_serv_hono
from                   pagos_ordenes_servs_hono      posh
       left outer join ordenes_servicios_hono        orsh on posh.idorsh = orsh.id
       left outer join tipos_formas_pagos            tifp on posh.idtifp = tifp.id
       left outer join estados_pagos_ords_servs_hono epos on posh.idepos = epos.id
where  posh.idusuaborraregistro is null
;

select *
from   poshv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists usuav
;

create or replace view usuav as
select usua.id                                           id
      ,usua.username                                     username
      ,usua.idpers                                       idpers
      ,pers.idgrem                                       idgrem
      ,pers.apellidopaterno              || ' '  ||
       coalesce(pers.apellidomaterno,'') || ', ' ||
       pers.primernombre                 || ' '  ||
       coalesce(pers.segundonombre,'')                   nombre_persona
      ,pers.identificador1 || '-' ||
       pers.identificador2                               doc_ident
      ,usua.idesre                                       idesre
      ,esre.descripcion                                  estado_registro
from                   usuarios          usua
       left outer join personas          pers on usua.idpers = pers.id
       left outer join estados_registros esre on usua.idesre = esre.id
where  usua.idusuaborraregistro is null
;

select *
from   usuav
order  by 1
;

/*************************************************************************************************************************/

drop view if exists bicpv
;

create or replace view bicpv as
select bicp.id                                                      id
      ,empr.id                                                      idempr
      ,empr.nombrefantasia                                          empresa
      ,prod.id                                                      idprod
      ,f_datos_producto(prod.id,10)                                 cod_prod_alfanum
      ,prod.nombre                                                  producto
      ,bicp.preciounitario                                          preciounitario
      ,bicp.idusuacrearegistro                                      idusua
      ,usua.username                                                username
      ,pers.primernombre || ' ' || pers.apellidopaterno             persona
      ,to_char(bicp.fechacrearegistro,'DD-MM-YYYY HH24:mi:ss')      fecha_cambio
from                   bitacoras_cambios_precios  bicp
       left outer join productos                  prod on bicp.idprod             = prod.id
       left outer join empresas                   empr on prod.idempr             = empr.id
       left outer join usuarios                   usua on bicp.idusuacrearegistro = usua.id
       left outer join personas                   pers on usua.idpers             = pers.id
;

select *
from   bicpv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists mobov
;

create or replace view mobov as
select mobo.id                                               id
      ,bode.id                                               idbode
      ,bode.nombre                                           bodega
      ,empr.id                                               idempr
      ,empr.nombrefantasia                                   empresa
      ,mobo.correlativo                                      nro_movto_bodega
      ,timb.id                                               idtimb
      ,timb.descripcion                                      tipo_movto_bodega
      ,to_char(mobo.fechamovto,'DD-MM-YYYY HH24:mi:ss')      fecha_movto
      ,mobo.descripcion                                      movto_bodega
from                   movimientos_bodegas        mobo
       left outer join bodegas                    bode on mobo.idbode = bode.id
       left outer join empresas                   empr on bode.idempr = empr.id
       left outer join tipos_movimientos_bodegas  timb on mobo.idtimb = timb.id
where  mobo.idusuaborraregistro is null
;

select *
from   mobov
order  by 1
;

/*************************************************************************************************************************/

drop view if exists dembv
;

create or replace view dembv as
select demb.id                       id
      ,demb.idmobo                   idmobo
      ,mobo.correlativo              correlativo_movto_bodega
      ,mobo.descripcion              descripcion
      ,demb.correlativo              correlativo_detalle_movto_bodega
      ,demb.idprod                   idprod
      ,f_datos_producto(prod.id,10)  cod_prod_alfanum
      ,prod.nombre                   producto
      ,demb.cantidad                 cantidad
from                   detalles_movtos_bodegas     demb
       left outer join movimientos_bodegas         mobo on demb.idmobo = mobo.id
       left outer join productos                   prod on demb.idprod = prod.id
where  demb.idusuaborraregistro is null
;

select *
from   dembv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists mobov_dembv
;

create or replace view mobov_dembv as
select mobo.id                                               idmobo
      ,bode.id                                               idbode
      ,bode.nombre                                           bodega
      ,empr.id                                               idempr
      ,empr.nombrefantasia                                   empresa
      ,mobo.correlativo                                      nro_movto_bodega
      ,timb.id                                               idtimb
      ,timb.descripcion                                      tipo_movto_bodega
      ,to_char(mobo.fechamovto,'YYYY-MM-DD'::text)           fecha_movto
      ,mobo.descripcion                                      movto_bodega
      ,demb.id                                               iddemb
      ,mobo.correlativo                                      correlativo_movto_bodega
      ,mobo.descripcion                                      descripcion
      ,demb.correlativo                                      correlativo_detalle_movto_bodega
      ,demb.idprod                                           idprod
      ,f_datos_producto(prod.id,10)                          cod_prod_alfanum
      ,prod.nombre                                           producto
      ,demb.cantidad                                         cantidad
from                   detalles_movtos_bodegas     demb
       left outer join movimientos_bodegas         mobo on demb.idmobo = mobo.id
       left outer join bodegas                     bode on mobo.idbode = bode.id
       left outer join empresas                    empr on bode.idempr = empr.id
       left outer join tipos_movimientos_bodegas   timb on mobo.idtimb = timb.id
       left outer join productos                   prod on demb.idprod = prod.id
where  mobo.idusuaborraregistro is null
and    demb.idusuaborraregistro is null
;

select *
from   mobov_dembv
order  by 1
;

/*************************************************************************************************************************/

drop view if exists cucov
;

create or replace view cucov as
select cuco.id                                     id
      ,cuco.idgrem                                 idgrem
      ,grem.alias                                  grupo_empresarial
      ,cuco.segmento1                              segmento1
      ,cuco.segmento2                              segmento2
      ,cuco.segmento3                              segmento3
      ,cuco.segmento4                              segmento4
      ,cuco.segmento5                              segmento5
      ,cuco.segmento6                              segmento6
      ,cuco.segmento7                              segmento7
      ,cuco.segmento8                              segmento8
      ,cuco.descripcion                            descripcion
      ,cuco.idticc                                 idticc
      ,tacc.descripcion || ' ' || ticc.descripcion tipo_cuenta_contable
      ,cuco.imputable                              imputable
      ,cuco.cuenta_desplegable                     cuenta_desplegable
from                   cuentas_contables       cuco
       left outer join grupos_empresariales    grem on cuco.idgrem = grem.id
       left outer join tipos_cuentas_contables ticc on cuco.idticc = ticc.id
       left outer join tipos_asocs_ctas_ctbles tacc on ticc.idtacc = tacc.id
where  cuco.idusuaborraregistro is null
;

select *
from   cucov
order  by 1
;

/*************************************************************************************************************************/

drop view if exists libro_ventas_v
;

create or replace view libro_ventas_v as
select vent.idempr                                                                                                                 idempr
      ,empr.razonsocial                                                                                                            empresa
      ,vent.idbode                                                                                                                 idbode
      ,bode.nombre                                                                                                                 bodega
      ,vent.fechaventa                                                                                                             fechaventa
      ,vent.idtidv                                                                                                                 idtidv
      ,tidv.descripcion                                                                                                            tipo_docto_venta
      ,vent.numero                                                                                                                 folio_docto
      ,vent.idclie                                                                                                                 idclie
      ,coalesce(clie.nombrefantasia,' ') || ' ' || coalesce(clie.primernombre,' ') || ' ' || coalesce(clie.apellidopaterno,' ')    cliente
      ,vent.idgere                                                                                                                 idgere
      ,gere.nombre                                                                                                                 gerencia
      ,vent.idproy                                                                                                                 idproy
      ,proy .nombre                                                                                                                proyecto
      ,vent.idline                                                                                                                 idline
      ,line .nombre                                                                                                                linea_negocio
      ,vent.idceco                                                                                                                 idceco
      ,ceco .nombre                                                                                                                centro_costo
      ,vent.idtare                                                                                                                 idtare
      ,tare .nombre                                                                                                                tarea
      ,vent.exento                                                                                                                 exento
      ,vent.afecto                                                                                                                 afecto
      ,vent.impuestosobligats                                                                                                      impuestos_obligats
      ,vent.impuestosespecifs                                                                                                      impuestos_especifs
      ,vent.montodescuento                                                                                                         monto_descuento
      ,vent.total                                                                                                                  total
from                   ventas               vent
       left       join empresas             empr on vent.idempr = empr.id
       left       join bodegas              bode on vent.idbode = bode.id
       left       join tipos_doctos_ventas  tidv on vent.idtidv = tidv.id
       left       join clientes             clie on vent.idclie = clie.id
       left outer join gerencias            gere on vent.idgere = gere.id
       left outer join proyectos            proy on vent.idproy = proy.id
       left outer join lineas_negocios      line on vent.idline = line.id
       left outer join centros_costos       ceco on vent.idceco = ceco.id
       left outer join tareas               tare on vent.idtare = tare.id
where  vent.idusuaborraregistro is null
and    vent.idesve              = 2
;

select *
from   libro_ventas_v
;

/*************************************************************************************************************************/

drop view if exists libro_compras_v
;

create or replace view libro_compras_v as
select orco.idempr                                                                                                                 idempr
      ,empr.razonsocial                                                                                                            empresa
      ,comp.fecha                                                                                                                  fechadocto
      ,comp.idtidv                                                                                                                 idtidv
      ,tidv.descripcion                                                                                                            tipo_docto_venta
      ,comp.numero                                                                                                                 folio_docto
      ,orco.idprov                                                                                                                 idprov
      ,coalesce(prov.nombrefantasia,' ') || ' ' || coalesce(prov.primernombre,' ') || ' ' || coalesce(prov.apellidopaterno,' ')    proveedor
      ,orco.idgere                                                                                                                 idgere
      ,gere.nombre                                                                                                                 gerencia
      ,orco.idproy                                                                                                                 idproy
      ,proy .nombre                                                                                                                proyecto
      ,orco.idline                                                                                                                 idline
      ,line .nombre                                                                                                                linea_negocio
      ,orco.idceco                                                                                                                 idceco
      ,ceco .nombre                                                                                                                centro_costo
      ,orco.idtare                                                                                                                 idtare
      ,tare .nombre                                                                                                                tarea
      ,comp.exento                                                                                                                 exento
      ,comp.afecto                                                                                                                 afecto
      ,comp.impuesto                                                                                                               impuesto
      ,comp.total                                                                                                                  total
from                   compras              comp
       left       join recepciones_compras  reco on comp.idreco = reco.id
       left       join ordenes_compras      orco on reco.idorco = orco.id
       left       join empresas             empr on orco.idempr = empr.id
       left       join tipos_doctos_ventas  tidv on comp.idtidv = tidv.id
       left       join proveedores          prov on orco.idprov = prov.id
       left outer join gerencias            gere on orco.idgere = gere.id
       left outer join proyectos            proy on orco.idproy = proy.id
       left outer join lineas_negocios      line on orco.idline = line.id
       left outer join centros_costos       ceco on orco.idceco = ceco.id
       left outer join tareas               tare on orco.idtare = tare.id
where  comp.idusuaborraregistro is null
;

select *
from   libro_compras_v
;

/*************************************************************************************************************************/

drop view if exists libro_diario_v
;

create or replace view libro_diario_v as
select asco.id                                               idasco
      ,asco.idpeco                                           idpeco
      ,peco.mes || '-' || peco.anno                          periodo_contable
      ,asco.idtiac                                           idtiac
      ,tiac.descripcion                                      tipo_asiento_contable
      ,asco.idesac                                           idesac
      ,esac.descripcion                                      estado_asiento_contable
      ,asco.numero_asiento                                   numero_asiento
      ,asco.fecha_asiento                                    fecha_asiento
      ,asco.reversible                                       reversible
      ,asco.idusuacreaasiento                                idusuacreaasiento
      ,usua1.username                                        usuario_crea_asiento
      ,pers1.primernombre || ' ' || pers1.apellidopaterno    persona_crea_asiento
      ,asco.idusuaautorizaasiento                            idusuaautorizaasiento
      ,usua2.username                                        usuario_autoriza_asiento
      ,pers2.primernombre || ' ' || pers2.apellidopaterno    persona_autoriza_asiento
      ,asco.idusuacrearegistro                               idusuacrearegistroasco
      ,usua3.username                                        usuario_crea_registro_asco
      ,pers3.primernombre || ' ' || pers3.apellidopaterno    persona_crea_registro_asco
      ,asco.fechacrearegistro                                fechacrearegistroasco
      ,deac.id                                               iddeac
      ,deac.numero_linea                                     numero_linea
      ,deac.idcuco                                           idcuco
      ,cuco.cuenta_desplegable                               cuenta_contable
      ,cuco.descripcion                                      nombre_cuenta_contable
      ,deac.idtiec                                           idtiec
      ,tiec.descripcion                                      tipo_entrada_contable
      ,deac.idgere                                           idgere
      ,gere.nombre                                           gerencia
      ,deac.idproy                                           idproy
      ,proy.nombre                                           proyecto
      ,deac.idline                                           idline
      ,line.nombre                                           linea_negocio
      ,deac.idceco                                           idceco
      ,ceco.nombre                                           centro_costo
      ,deac.idtare                                           idtare
      ,tare.nombre                                           tarea
      ,deac.monto                                            monto
      ,deac.idusuacrearegistro                               idusuacrearegistrodeac
      ,usua4.username                                        usuario_crea_registro_deac
      ,pers4.primernombre || ' ' || pers4.apellidopaterno    persona_crea_registro_deac
      ,deac.fechacrearegistro                                fechacrearegistrodeac
from                   asientos_contables          asco
       left outer join detalles_asientos_contables deac  on deac.idasco                 = asco.id
       left outer join periodos_contables          peco  on asco.idpeco                 = peco.id
       left outer join tipos_asientos_contables    tiac  on asco.idtiac                 = tiac.id
       left outer join estados_asientos_contables  esac  on asco.idesac                 = esac.id
       left outer join usuarios                    usua1 on asco.idusuacreaasiento      = usua1.id
       left outer join personas                    pers1 on usua1.idpers                = pers1.id
       left outer join usuarios                    usua2 on asco.idusuaautorizaasiento  = usua2.id
       left outer join personas                    pers2 on usua2.idpers                = pers2.id
       left outer join usuarios                    usua3 on asco.idusuacrearegistro     = usua3.id
       left outer join personas                    pers3 on usua3.idpers                = pers3.id
       left outer join cuentas_contables           cuco  on deac.idcuco                 = cuco.id
       left outer join tipos_entradas_contables    tiec  on deac.idasco                 = tiec.id
       left outer join gerencias                   gere  on deac.idgere                 = gere.id
       left outer join proyectos                   proy  on deac.idproy                 = proy.id
       left outer join lineas_negocios             line  on deac.idline                 = line.id
       left outer join centros_costos              ceco  on deac.idceco                 = ceco.id
       left outer join tareas                      tare  on deac.idtare                 = tare.id
       left outer join usuarios                    usua4 on deac.idusuacrearegistro     = usua4.id
       left outer join personas                    pers4 on usua4.idpers                = pers4.id
where  asco.idusuaborraregistro is null
and    deac.idusuaborraregistro is null
and    asco.idesac              = 2
;

select *
from   libro_diario_v
order  by 1
;

/*************************************************************************************************************************/

drop view if exists ascov
;

create or replace view ascov as
select asco.id                                  id
      ,asco.idpeco                              idpeco
      ,peco.mes || '-' || peco.anno             periodo_contable
      ,peco.idempr                              idempr
      ,empr.nombrefantasia                      empresa
      ,asco.idtiac                              idtiac
      ,tiac.descripcion                         tipo_asiento_contable
      ,asco.idesac                              idesac
      ,esac.descripcion                         estado_asiento_contable
      ,asco.numero_asiento                      numero_asiento
      ,asco.glosa                               glosa
      ,asco.fecha_asiento                       fecha_asiento
      ,asco.reversible                          reversible
from                   asientos_contables         asco
       left outer join periodos_contables         peco on asco.idpeco = peco.id
       left outer join empresas                   empr on peco.idempr = empr.id
       left outer join tipos_asientos_contables   tiac on asco.idtiac = tiac.id
       left outer join estados_asientos_contables esac on asco.idesac = esac.id
where  asco.idusuaborraregistro is null
;

select *
from   ascov
order  by 1
;

/*************************************************************************************************************************/

drop view if exists buscador_usuarios
;

create or replace view buscador_usuarios as
select grem.id                                                                                                                                  id
      ,grem.nombre                                                                                                                              nombre_grupo_empresarial
      ,grem.alias                                                                                                                               alias_grupo_empresarial
      ,empr.razonsocial                                                                                                                         razon_social
      ,empr.nombrefantasia                                                                                                                      nombre_fantasia
      ,pers.identificador1 || '-' || pers.identificador2                                                                                        rut
      ,pers.primernombre || ' ' || coalesce(pers.segundonombre,' ') || ' ' || pers.apellidopaterno || ' ' || coalesce(pers.apellidomaterno,' ') nombre_persona
      ,pers.email                                                                                                                               email
      ,usua.username                                                                                                                            username
      ,perf.descripcion                                                                                                                         perfil
from   grupos_empresariales grem
      ,empresas             empr
      ,personas             pers
      ,usuarios             usua
      ,usuarios_perfiles    uspe
      ,perfiles             perf
where  grem.id                         = empr.idgrem
and    grem.id                         = pers.idgrem
and    pers.id                         = usua.idpers
and    usua.id                         = uspe.idusua
and    uspe.idperf                     = perf.id
;

/*************************************************************************************************************************/

\q



Plantilla:

/*************************************************************************************************************************/

drop view if exists XXXXv
;

create or replace view XXXXv as
select XXXX.id               id
from                   YYYYY                   XXXX
       left outer join ZZZZZ                   zzzz on XXXX.idzzzz = zzzz.id
where  xxxx.idusuaborraregistro is null
;

select *
from   XXXXv
order  by 1
;

/*************************************************************************************************************************/

