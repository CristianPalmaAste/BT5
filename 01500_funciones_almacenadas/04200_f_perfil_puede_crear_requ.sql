create or replace function f_perfil_puede_crear_requ(Pidempr           numeric
                                                    ,Pidperfautorizado numeric) returns varchar as
$$
declare
  aux numeric;
begin
  select count(*)
  into   aux
  from   autorizadores_requisiciones
  where  idempr           = Pidempr
  and    idperfautorizado = Pidperfautorizado
  ;
  if aux = 0 then
    return('N');
  else
    return('S');
  end if;
end;
$$LANGUAGE plpgsql;

select f_perfil_puede_crear_requ(1,1);
select f_perfil_puede_crear_requ(2,6);
