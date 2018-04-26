create or replace function f_poblar_unte_profundidad() returns trigger as
$body$
begin
  new.profundidad := f_profundidad_unte(new.id);
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

