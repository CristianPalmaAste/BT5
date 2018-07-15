create or replace function f_validar_rega_ins() returns trigger as
$body$
declare
  Vmensaje varchar(1000);
begin
  if new.idesrg != 1 then
    Vmensaje := 'Una nueva rendición sólo puede tener estado 1';
    raise exception 'Estado inválido para nueva rendición'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

