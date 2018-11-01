create or replace function f_perfiles_hijo_requ(Pidempr            numeric
                                               ,Pidperfautorizador numeric) returns varchar as
$$
declare
  C_perfiles_hijo cursor for
    select idperfautorizado
    from   autorizadores_requisiciones
    where  idempr            = Pidempr
    and    idperfautorizador = Pidperfautorizador
    union
    select Pidperfautorizador
    order  by 1
    ;
  Vidperfautorizado  numeric;
  Aidperfautorizados varchar(1000);
begin
--  Aidperfautorizados := Pidperfautorizador;
  Aidperfautorizados := '';
  open C_perfiles_hijo;
  loop
    fetch C_perfiles_hijo into Vidperfautorizado;
    exit when not found;
    Aidperfautorizados := Aidperfautorizados || ';' || Vidperfautorizado;
  end loop;
  close C_perfiles_hijo;
  Aidperfautorizados := substr(Aidperfautorizados,2,1000);
  return(Aidperfautorizados);
end;
$$LANGUAGE plpgsql;

select f_perfiles_hijo_requ(1,1);
select f_perfiles_hijo_requ(2,6);
select f_perfiles_hijo_requ(2,7);
