create or replace function f_validar_dv_pers() returns trigger as
$body$
declare
  Vidpais         numeric;
  Vdv_correcto    varchar(100);
  Vmensaje        varchar(1000);
  aux             numeric;
begin
  select idpais
  into   Vidpais
  from   grupos_empresariales
  where  id = new.idgrem
  ;
  if Vidpais = 1 then
    -- Primero, valido que la parte correspondiente al RUT sea un numero y, además, mayor que 0
    begin
      aux := cast(trim(new.identificador1) as integer);
    exception
      when others then
        Vmensaje := 'El campo RUT debe ser un número entero y positivo';
        raise exception 'RUT incorrecto'
        using hint = Vmensaje;
    end;
    if aux <= 0 then
      Vmensaje := 'El campo RUT debe ser un número mayor que 0';
      raise exception 'RUT incorrecto'
      using hint = Vmensaje;
    end if;
    -- Segundo, validación módulo 11 del dígito verificador
    select f_dv_rut_cl(new.identificador1)
    into   Vdv_correcto
    ;
    if Vdv_correcto != new.identificador2 then
      Vmensaje := 'DV incorrecto para RUT ' || new.identificador1 || '. Reingrese DV';
      raise exception 'DV incorrecto'
      using hint = Vmensaje;
    end if;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

