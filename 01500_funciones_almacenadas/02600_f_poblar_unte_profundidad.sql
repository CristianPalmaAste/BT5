create or replace function f_poblar_unte_profundidad() returns trigger as
$body$
begin
  update unidades_territoriales
  set    profundidad = f_profundidad_unte(id)
  where  id          = new.id
  ;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

