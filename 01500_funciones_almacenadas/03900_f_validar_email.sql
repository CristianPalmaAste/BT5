create or replace function f_validar_email(text) returns varchar as
$$
declare
  Ves_valido boolean;
  aux        varchar(1);
begin
  select $1 ~ '^[^@\s]+@[^@\s]+(\.[^@\s]+)+$'
  into   Ves_valido
  ;
  if Ves_valido then
    aux := 'S';
  else
    aux := 'N';
  end if;
  return aux;
end;
$$LANGUAGE plpgsql;

select f_validar_email('myemail@address.com');
select f_validar_email('@address.com');
select f_validar_email('i@com');
