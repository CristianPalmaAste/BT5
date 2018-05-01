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
  if (old.idereq = 1 and new.idereq = 2) or
     (old.idereq = 2 and new.idereq = 3) or
     (old.idereq = 3 and new.idereq = 4) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Orden de compra no puede pasar de estado ' || old.idereq || ' a ' || new.idereq;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

