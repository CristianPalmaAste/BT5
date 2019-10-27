drop view if exists busqueda_usuario_v
;

create or replace view busqueda_usuario_v as
select grem.nombre                                                                                                   nombre_holding
      ,grem.alias                                                                                                    alias_holding
      ,empr.razonsocial                                                                                              razon_social
      ,empr.nombrefantasia                                                                                           nombre_fantasia
      ,pers.identificador1 || '-' || pers.identificador2                                                             rut
      ,pers.primernombre || ' ' || pers.segundonombre || ' ' || pers.apellidopaterno || ' ' || pers.apellidomaterno  nombre_persona
      ,pers.email                                                                                                    email
      ,usua.username                                                                                                 username
      ,perf.descripcion                                                                                              perfil
from   grupos_empresariales grem
      ,empresas             empr
      ,personas             pers
      ,usuarios             usua
      ,usuarios_perfiles    uspe
      ,perfiles             perf
where  grem.id     = empr.idgrem
and    grem.id     = pers.idgrem
and    pers.id     = usua.idpers
and    usua.id     = uspe.idusua
and    uspe.idperf = perf.id
;

select *
from   busqueda_usuario_v
where  upper(nombre_holding ) like '%ASTE%'
or     upper(alias_holding  ) like '%ASTE%'
or     upper(razon_social   ) like '%ASTE%'
or     upper(nombre_fantasia) like '%ASTE%'
or     upper(rut            ) like '%ASTE%'
or     upper(nombre_persona ) like '%ASTE%'
or     upper(email          ) like '%ASTE%'
or     upper(username       ) like '%ASTE%'
or     upper(perfil         ) like '%ASTE%'
;
