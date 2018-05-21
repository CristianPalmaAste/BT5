create or replace function f_impedir_upd_y_del_en_derc() returns trigger as
$body$
declare
  Vmensaje varchar(1000);
begin
  -- NO SE PERMITE HACER UPDATE O DELETE SOBRE LA TABLA detalles_recepciones_compras
  --
  Vmensaje := 'No está permitido borrar o actualizar información de detalles de recepciones de compras';
  raise exception 'Acción inválida'
  using hint = Vmensaje;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

