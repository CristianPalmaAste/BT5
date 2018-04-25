create or replace function f_profundidad_unte( int ) returns int as
$$
declare
  vIdUnte int;
begin
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

\q

