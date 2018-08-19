create or replace function f_validar_vent() returns trigger as
$body$
declare
  aux      numeric;
  Vmensaje varchar(1000);
begin
  -- Estados posibles:
  -- 1 | CREADA
  -- 2 | CERRADA
  -- 3 | ANULADA
  --
  -- los cambios de estado válidos son
  -- 1 -> 2
  -- 1 -> 3
  -- y nada más; todo otro posible cambio de estado es error
  --
  if (old.idesve = 1 and new.idesve = 2) or
     (old.idesve = 1 and new.idesve = 3) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Venta no puede pasar de estado ' || old.idesve || ' a ' || new.idesve;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  --
  -- Además, se debe validar que solo sobre una venta abierta se pueden hacer modificaciones
  -- Sobre ventas en estado != 1 no se puede modificar nada
  --
  if old.idesve != 1 and (   old.idempr              != new.idempr
                          or old.idbode              != new.idbode
                          or old.idnove              != new.idnove
                          or old.idtidv              != new.idtidv
                          or old.numero              != new.numero
                          or old.idclie              != new.idclie
                          or old.descripcionventa    != new.descripcionventa
                          or old.fechaventa          != new.fechaventa
                          or old.idgere              != new.idgere
                          or old.idproy              != new.idproy
                          or old.idline              != new.idline
                          or old.idceco              != new.idceco
                          or old.idtare              != new.idtare
                          or old.exento              != new.exento
                          or old.afecto              != new.afecto
                          or old.impuestosobligats   != new.impuestosobligats
                          or old.impuestosespecifs   != new.impuestosespecifs
                          or old.porcentajedescuento != new.porcentajedescuento
                          or old.montodescuento      != new.montodescuento
                          or old.total               != new.total
                          or old.idusuavendedor      != new.idusuavendedor
                         )
  then
    Vmensaje := 'Venta no está abierta, no se le puede modificar nada';
    raise exception 'Modificaciones no permitidas'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

