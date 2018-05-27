create or replace function f_impedir_upd_y_del_en_deve() returns trigger as
$body$
declare
  Videsve  numeric;
  Vmensaje varchar(1000);
begin
  -- NO SE PERMITE HACER UPDATE O DELETE SOBRE LA TABLA detalles_ventas
  --
  select idesve
  into   Videsve
  from   ventas
  where  id = new.idvent
  ;
  if Videsve != 1 then
    Vmensaje := 'No está permitido borrar o actualizar información de detalles de ventas después que la venta ha sido cerrada o anulada';
    raise exception 'Acción inválida'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

