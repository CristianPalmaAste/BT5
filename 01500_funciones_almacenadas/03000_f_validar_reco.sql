create or replace function f_validar_reco() returns trigger as
$body$
declare
  Videsoc            numeric;
  aux                numeric;
  Vmensaje           varchar(1000);
  Vnrocotizacsminimo numeric;
begin
  -- Se puede registrar recepciones de compras solo sobre órdenes de compra que se
  -- encuentren en estado 3 EMITIDA (ENVIADA A PROVEEDOR)
  --
  select idesoc
  into   Videsoc
  from   ordenes_compras
  where  id = new.idorco
  ;
  if Videsoc != 3 then
    Vmensaje := 'Sólo se puede registrar recepciones de compras sobre órdenes de compra que se '
                || 'encuentren en estado 3 EMITIDA (ENVIADA A PROVEEDOR)';
    raise exception 'Recepción de compra no permitida'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

