agregar estados

and    uspe.idesre   = 1



select 0                       idgrem
      ,0                       idempr
      ,'No asociado a holding' holding
      ,'No asociado a empresa' empresa
      ,perf.descripcion        perfil
from   personas          pers
      ,usuarios          usua
      ,usuarios_perfiles uspe
      ,perfiles          perf
where  pers.id       = usua.idpers
and    usua.id       = uspe.idusua
and    uspe.idperf   = perf.id
and    usua.username = 'SEAGUIRRE'
and    uspe.idgrem   is null
and    uspe.idempr   is null
and    perf.id       = 1
union
select grem.id
      ,0   
      ,grem.nombre
      ,'No asociado a empresa'
      ,perf.descripcion
from   personas             pers
      ,usuarios             usua
      ,usuarios_perfiles    uspe
      ,perfiles             perf
      ,grupos_empresariales grem
where  pers.id       = usua.idpers
and    usua.id       = uspe.idusua
and    uspe.idperf   = perf.id
and    uspe.idgrem   = grem.id
and    usua.username = 'SEAGUIRRE'
and    uspe.idgrem   is not null
and    uspe.idempr   is null
and    perf.id       = 2
union
select empr.idgrem
      ,empr.id
      ,grem.nombre
      ,empr.nombrefantasia
      ,perf.descripcion
from   personas             pers
      ,usuarios             usua
      ,usuarios_perfiles    uspe
      ,perfiles             perf
      ,empresas             empr
      ,grupos_empresariales grem
where  pers.id       = usua.idpers
and    usua.id       = uspe.idusua
and    uspe.idperf   = perf.id
and    uspe.idempr   = empr.id
and    empr.idgrem   = grem.id
and    usua.username = 'SEAGUIRRE'
and    uspe.idgrem   is null
and    uspe.idempr   is not null
and    perf.id       not in (1,2)
;


