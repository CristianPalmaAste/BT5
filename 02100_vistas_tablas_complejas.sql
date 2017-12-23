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
where  empr.idusuaborraregistro is null
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
      ,ticl.descripcion      tipo_cliente
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
      ,prod.idtipr                    idtipr
      ,tipr.descripcion               tipo_producto
      ,prod.idunmp                    idunmp
      ,unmp.descripcion               unidad_de_medida
      ,unmp.descripcioncorta          alias_unidad_de_medida
      ,prod.idorpr                    idorpr
      ,orpr.descripcion               origen
      ,orpr.descripcioncorta          alias_origen
      ,prod.nombre                    nombre
      ,prod.valorunitario             valorunitario
from                   productos                  prod
       left outer join empresas                   empr on prod.idempr = empr.id
       left outer join tipos_productos            tipr on prod.idtipr = tipr.id
       left outer join unidades_medidas_productos unmp on prod.idunmp = unmp.id
       left outer join origenes_productos         orpr on prod.idorpr = orpr.id
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
      ,serv.valorunitario     valorunitario
      ,serv.idmone            idmone
      ,mone.nombre            moneda
      ,mone.nombrecorto       alias_moneda
from                   servicios                  serv
       left outer join empresas                   empr on serv.idempr = empr.id
       left outer join tipos_servicios            tise on serv.idtise = tise.id
       left outer join unidades_medidas_servicios unms on serv.idunms = unms.id
       left outer join monedas                    mone on serv.idmone = mone.id
;

select *
from   servv
;

\q




Más adelante:

/*************************************************************************************************************************/

drop view if exists XXXXv
;

create or replace view XXXXv as
select XXXX.id               id
from                   YYYYY                   XXXX
       left outer join ZZZZZ                   zzzz on XXXX.idzzzz = zzzz.id
;

select *
from   XXXXv
;

soshv
idsov
orshv
poshv
tipiv
cliev
dovev
dedvv
novev
denvv
covev
decvv
prodv
servv

