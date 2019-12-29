create or replace function f_validar_nove() returns trigger as
$body$
declare
  aux      numeric;
  Vmensaje varchar(1000);
begin
  -- Estados posibles:
  -- 1 | CREADA
  -- 2 | EMITIDA
  -- 3 | FACTURADA
  -- 4 | CADUCADA
  --
  -- los cambios de estado válidos son
  -- 1 -> 1
  -- 1 -> 2
  -- 1 -> 4
  -- 2 -> 3
  -- 2 -> 4
  -- y nada más; todo otro posible cambio de estado es error
  --
  if (old.idesnv = 1 and new.idesnv = 1) or
     (old.idesnv = 1 and new.idesnv = 2) or
     (old.idesnv = 1 and new.idesnv = 4) or
     (old.idesnv = 2 and new.idesnv = 3) or
     (old.idesnv = 2 and new.idesnv = 4) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Nota de venta no puede pasar de estado ' || old.idesnv || ' a ' || new.idesnv;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  --
  -- Además, se debe validar que solo sobre una nota de venta abierta se pueden hacer modificaciones
  -- Sobre notas de ventas en estado != 1 no se puede modificar nada
  --
  if old.idesnv != 1 and (   old.idempr                 != new.idempr
                          or old.idbode                 != new.idbode
                          or old.idcove                 != new.idcove
                          or old.numero                 != new.numero
                          or old.idclie                 != new.idclie
                          or old.descripcionnotaventa   != new.descripcionnotaventa
                          or old.fechanotaventa         != new.fechanotaventa
                          or old.idgere                 != new.idgere
                          or old.idproy                 != new.idproy
                          or old.idline                 != new.idline
                          or old.idceco                 != new.idceco
                          or old.idtare                 != new.idtare
                          or old.exento                 != new.exento
                          or old.afecto                 != new.afecto
                          or old.impuestosobligats      != new.impuestosobligats
                          or old.impuestosespecifs      != new.impuestosespecifs
                          or old.porcentajedescuento    != new.porcentajedescuento
                          or old.montodescuento         != new.montodescuento
                          or old.total                  != new.total
                          or old.idusuavendedor         != new.idusuavendedor
                         )
  then
    Vmensaje := 'Nota de venta no está abierta, no se le puede modificar nada';
    raise exception 'Modificaciones no permitidas'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

