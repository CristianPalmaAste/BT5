select prod.id                                                           id
      ,fapr.cod_familia || sfpr.cod_sub_familia || prod.correlativoflia  producto
      ,prod.nombre                                                       desprod
      ,bopr.idbode                                                       idbode
      ,prod.idempr                                                       idempr
      ,unpr.descripcioncorta                                             unidad_producto
      ,delp.preciounitario                                               preciounitario
from   familias_productos          fapr
      ,sub_familias_productos      sfpr
      ,productos                   prod
      ,bodegas_productos           bopr
      ,unidades_medidas_productos  unpr
      ,detalles_listas_precios     delp
      ,listas_precios              lipr
where  fapr.id                 = sfpr.idfapr
and    sfpr.id                 = prod.idsfpr
and    prod.id                 = bopr.idprod
and    prod.idunmp             = unpr.id
and    prod.id                 = delp.idprod
and    delp.idlipr             = lipr.id
and    prod.idempr             = 14
and    prod.fechaborraregistro is null
and    bopr.idbode             = 18
and    lipr.idempr             = 14
and    lipr.fechafin           is null
