create or replace function f_validar_requ() returns trigger as
$body$
declare
  aux                numeric;
  Vmensaje           varchar(1000);
  Vnrocotizacsminimo numeric;
begin
  -- Veo si adjuntó el mínimo de cotizaciones exigidas
  if (old.idereq = 1 and new.idereq = 2) then
    select nrocotizacsminimo
    into   Vnrocotizacsminimo
    from   tipos_requisiciones
    where  id = new.idtire
    ;
    select count(*)
    into   aux
    from   cotizaciones_compras
    where  idrequ = new.id
    ;
    if aux < Vnrocotizacsminimo then
      Vmensaje := 'Requisición no puede pasar a estado CERRADA, pues no cuenta con el mínimo ' ||
                  'de cotizaciones exigidas: ' || Vnrocotizacsminimo;
      raise exception 'Cambio de estado inválido'
      using hint = Vmensaje;
    end if;
  end if;

  -- Veo si el cambio de estado es válido
  --
  -- Estados posibles:
  -- 1 | CREADA
  -- 2 | CERRADA, TRASPASADA A SUPERIOR JERÁRQUICO (ENVIADA A AUTORIZAR)
  -- 3 | RECHAZADA POR SUPERIOR JERÁRQUICO, DEVUELTA A CREADOR DE LA REQUISICIÓN
  -- 4 | AUTORIZADA POR SUPERIOR JERÁRQUICO, TRASPASADA A DEPARTAMENTO DE COMPRAS
  -- 5 | REQUISICION RECIBIDA POR DEPARTAMENTO DE COMPRAS
  -- 6 | RECHAZADA POR DEPARTAMENTO DE COMPRAS, DEVUELTA A SUPERIOR JERÁRQUICO DEL CREADOR DE LA REQUISICIÓN
  -- 7 | ACEPTADA POR DEPARTAMENTO COMPRAS, ORDEN DE COMPRA CREADA
  --
  -- los cambios de estado válidos son
  -- 1 -> 2
  -- 2 -> 3
  -- 3 -> 2
  -- 2 -> 4
  -- 4 -> 5
  -- 5 -> 6
  -- 5 -> 7
  -- 6 -> 4
  -- y nada más; todo otro posible cambio de estado es error
  --
  if (old.idereq = 1 and new.idereq = 2) or
     (old.idereq = 2 and new.idereq = 3) or
     (old.idereq = 3 and new.idereq = 2) or
     (old.idereq = 2 and new.idereq = 4) or
     (old.idereq = 4 and new.idereq = 5) or
     (old.idereq = 5 and new.idereq = 6) or
     (old.idereq = 5 and new.idereq = 7) or
     (old.idereq = 6 and new.idereq = 4) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Requisición no puede pasar de estado ' || old.idereq || ' a ' || new.idereq;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

