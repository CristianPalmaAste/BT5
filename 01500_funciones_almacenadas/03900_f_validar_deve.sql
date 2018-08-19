create or replace function f_validar_deve() returns trigger as
$body$
declare
  Videsve  numeric;
  aux      numeric;
  Vmensaje varchar(1000);
begin
  -- Se valida que solo sobre una venta abierta se pueden hacer modificaciones (en este caso, en su detalle)
  -- Sobre ventas en estado != 1 no se puede modificar nada (no se pueden ingresar nuevas líneas de detalle
  -- ni modificar las existentes ni borrar alguna)
  --
  select idesve
  into   Videsve
  from   ventas
  where  id = new.idvent
  ;
  if Videsve != 1 then
    Vmensaje := 'No puede agregar nuevas líneas de detalle o modificar o borrar una existente a una ' ||
                'venta que no está abierta';
    raise exception 'Ingreso no permitido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

