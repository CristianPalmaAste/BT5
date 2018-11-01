create or replace function f_perfil_padre_requ(Pidempr           numeric
                                              ,Pidperfautorizado numeric) returns numeric as
$$
declare
  Vidperfautorizador numeric;
begin
  select idperfautorizador
  into   Vidperfautorizador
  from   autorizadores_requisiciones
  where  idempr           = Pidempr
  and    idperfautorizado = Pidperfautorizado
  ;
  if Vidperfautorizador is null then
    Vidperfautorizador := 0;
  end if;
  return Vidperfautorizador;
end;
$$LANGUAGE plpgsql;

select f_perfil_padre_requ(1,1);
select f_perfil_padre_requ(2,6);
