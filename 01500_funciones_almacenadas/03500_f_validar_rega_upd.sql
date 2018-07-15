create or replace function f_validar_rega_upd() returns trigger as
$body$
declare
  aux                numeric;
  Vmensaje           varchar(1000);
begin
  -- Veo si el cambio de estado es válido
  --
  -- Estados posibles:
  --
  -- 1 | CREADA
  -- 2 | CERRADA, TRASPASADA A SUPERIOR JERÁRQUICO (ENVIADA A AUTORIZAR)
  -- 3 | RECHAZADA POR SUPERIOR JERÁRQUICO, DEVUELTA A CREADOR DE LA RENDICIÓN
  -- 4 | APROBADA POR SUPERIOR JERÁRQUICO, PASA A DEPARTAMENTO DE CONTABILIDAD
  -- 5 | RECHAZADA POR DEPARTAMENTO DE CONTABILIDAD, DEVUELTA A SUPERIOR JERÁRQUICO DEL CREADOR DE LA REND.
  -- 6 | APROBADA POR CONTABILIDAD
  -- 7 | CONTABILIZADA
  -- 8 | ANULADA
  --
  -- los cambios de estado válidos son
  -- 1 -> 2
  -- 2 -> 3
  -- 3 -> 2
  -- 2 -> 4
  -- 4 -> 5
  -- 5 -> 4
  -- 4 -> 6
  -- 6 -> 7
  -- * -> 8
  -- y nada más; todo otro posible cambio de estado es error
  --
  if (old.idesrg = 1 and new.idesrg = 2) or
     (old.idesrg = 2 and new.idesrg = 3) or
     (old.idesrg = 3 and new.idesrg = 2) or
     (old.idesrg = 2 and new.idesrg = 4) or
     (old.idesrg = 4 and new.idesrg = 5) or
     (old.idesrg = 5 and new.idesrg = 4) or
     (old.idesrg = 4 and new.idesrg = 6) or
     (old.idesrg = 6 and new.idesrg = 7) or
     (                   new.idesrg = 8) then
    aux := 1; /* estos son los cambios válidos */
  else
    Vmensaje := 'Rendición no puede pasar de estado ' || old.idesrg || ' a ' || new.idesrg;
    raise exception 'Cambio de estado inválido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

