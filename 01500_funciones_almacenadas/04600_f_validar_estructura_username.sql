create or replace function f_validar_estructura_username() returns trigger as
$body$
declare
  aux       numeric;
  Vlargo    numeric;
  Vmensaje  varchar(1000);
begin
  Vlargo := length(new.username);
  for i in 1 .. Vlargo loop
    if substr(new.username,i,1) between 'A' and 'Z' or substr(new.username,i,1) between '0' and '9' or substr(new.username,i,1) = '_' then
      aux := 1; /* está bien */
    else
      Vmensaje := 'Estructura inválida para el username, ésta debe contener letras mayúsculas, números o _';
      raise exception 'username invalido'
      using hint = Vmensaje;
    end if;
  end loop;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

