create or replace function f_validar_decv() returns trigger as
$body$
declare
  Videscv  numeric;
  aux      numeric;
  Vmensaje varchar(1000);
begin
  -- Se valida que solo sobre una cotización abierta se pueden hacer modificaciones (en este caso, en su detalle)
  -- Sobre cotizaciones en estado != 1 no se puede modificar nada (no se pueden ingresar nuevas líneas de detalle
  -- ni modificar las existentes ni borrar alguna)
  --
  select idescv
  into   Videscv
  from   cotizaciones_ventas
  where  id = new.idcove
  ;
  if Videscv != 1 then
    Vmensaje := 'No puede agregar nuevas líneas de detalle o modificar o borrar una existente a una ' ||
                'cotización que no está abierta';
    raise exception 'Ingreso no permitido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

