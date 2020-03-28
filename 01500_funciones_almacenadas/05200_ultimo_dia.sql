create or replace function ultimo_dia(Pfecha date) returns date as
$body$
declare
  Vultimo_dia date;
begin
  select (date_trunc('month', Pfecha) + interval '1 month - 1 day')::date
  into   Vultimo_dia
  ;
  return(Vultimo_dia);
end;
$body$ LANGUAGE plpgsql;

select ultimo_dia('01-01-2020');
select ultimo_dia('01-02-2020');

\q
