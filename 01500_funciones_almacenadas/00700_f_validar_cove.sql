create or replace function f_validar_cove() returns trigger as
$body$
declare
  aux      numeric;
  Vmensaje varchar(1000);
begin
  -- Estados posibles:
  -- 1 | CREADA
  -- 2 | CERRADA
  -- 3 | ACEPTADA
  -- 4 | CADUCADA
  --
  -- los cambios de estado válidos son
  -- 1 -> 1
  -- 1 -> 2
  -- 1 -> 3
  -- 1 -> 4
  -- 2 -> 3
  -- 2 -> 4
  -- y nada más; todo otro posible cambio de estado es error
  --
  if (old.idescv = 1 and new.idescv = 1) or
     (old.idescv = 1 and new.idescv = 2) or
     (old.idescv = 1 and new.idescv = 3) or
     (old.idescv = 1 and new.idescv = 4) or
     (old.idescv = 2 and new.idescv = 3) or
     (old.idescv = 2 and new.idescv = 4) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Cotización no puede pasar de estado ' || old.idescv || ' a ' || new.idescv;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  --
  -- Además, se debe validar que solo sobre una cotización abierta se pueden hacer modificaciones
  -- Sobre cotizaciones en estado != 1 no se puede modificar nada
  --
  if old.idescv != 1 and (   old.idempr                 != new.idempr
                          or old.idbode                 != new.idbode
                          or old.numero                 != new.numero
                          or old.idclie                 != new.idclie
                          or old.descripcioncotizacion  != new.descripcioncotizacion
                          or old.fechacotizacion        != new.fechacotizacion
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
                          or old.diasvalidez            != new.diasvalidez
                          or old.idusuavendedor         != new.idusuavendedor
                         )
  then
    Vmensaje := 'Cotización no está abierta, no se le puede modificar nada';
    raise exception 'Modificaciones no permitidas'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

