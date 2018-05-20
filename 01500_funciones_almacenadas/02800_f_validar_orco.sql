create or replace function f_validar_orco() returns trigger as
$body$
declare
  aux                numeric;
  Vmensaje           varchar(1000);
  Vnrocotizacsminimo numeric;
begin
  -- Veo si el cambio de estado es válido
  --
  -- Estados posibles:
  -- 1 | CREADA
  -- 2 | CERRADA
  -- 3 | EMITIDA (ENVIADA A PROVEEDOR)
  -- 4 | FINIQUITADA

  -- los cambios de estado válidos son
  -- 1 -> 2
  -- 2 -> 3
  -- 3 -> 4
  -- y nada más; todo otro posible cambio de estado es error
  --
  if (old.idesoc = 1 and new.idesoc = 2) or
     (old.idesoc = 2 and new.idesoc = 3) or
     (old.idesoc = 3 and new.idesoc = 4) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Orden de compra no puede pasar de estado ' || old.idesoc || ' a ' || new.idesoc;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

