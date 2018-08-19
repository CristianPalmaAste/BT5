create or replace function f_validar_denv() returns trigger as
$body$
declare
  Videsnv  numeric;
  aux      numeric;
  Vmensaje varchar(1000);
begin
  -- Se valida que solo sobre una nota de venta abierta se pueden hacer modificaciones (en este caso, en su detalle)
  -- Sobre notas de ventas en estado != 1 no se puede modificar nada (no se pueden ingresar nuevas líneas de detalle
  -- ni modificar las existentes ni borrar alguna)
  --
  select idesnv
  into   Videsnv
  from   notas_ventas
  where  id = new.idnove
  ;
  if Videsnv != 1 then
    Vmensaje := 'No puede agregar nuevas líneas de detalle o modificar o borrar una existente a una ' ||
                'nota de venta que no está abierta';
    raise exception 'Ingreso no permitido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

