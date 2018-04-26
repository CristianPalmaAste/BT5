create or replace function f_profundidad_unte( numeric ) returns numeric as
$$
declare
  vIdUnte numeric;
  aux     numeric;
begin
  select count(*)
  into   aux
  from   unidades_territoriales
  where  id = $1
  ;
  if aux = 0 then
    return 0;
  end if;
  select iduntepadre
  into   vIdUnte
  from   unidades_territoriales
  where  id = $1
  ;
  if vIdUnte is null then
    return 1;
  else
    return 1 + f_profundidad_unte( vIdUnte );
  end if;
end;
$$ LANGUAGE plpgsql;

select f_profundidad_unte (1);
select f_profundidad_unte (20);
select f_profundidad_unte (100);
select f_profundidad_unte (1000);

select id, idpais, iduntepadre, nombre, orden, f_profundidad_unte(id) profundidad
from   unte
where  f_profundidad_unte(id) = 1
;

select id, idpais, iduntepadre, nombre, orden, f_profundidad_unte(id) profundidad
from   unte
where  nombre                 like '%CA%'
and    f_profundidad_unte(id) = 2
;

select id, idpais, iduntepadre, nombre, orden, f_profundidad_unte(id) profundidad
from   unte
where  nombre                 like '%MU%'
and    f_profundidad_unte(id) = 3
;

\q

