create or replace function f_validar_requ_ins() returns trigger as
$body$
declare
  Vmensaje varchar(1000);
begin
  if new.idereq != 1 then
    Vmensaje := 'Una nueva requisición sólo puede tener estado 1';
    raise exception 'Estado para nueva requisición inválido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

