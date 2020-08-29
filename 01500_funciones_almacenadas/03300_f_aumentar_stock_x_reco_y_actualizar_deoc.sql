create or replace function f_aumentar_stock_x_reco_y_actualizar_deoc() returns trigger as
$body$
declare
  Vidbode             numeric(20,0);
  Vidmobo             numeric(20,0);
  Vcorrelativo        numeric(20,0);
  Vidusuacrearegistro numeric(20,0);
  aux                 numeric(20,0);
  Vidorco             numeric(20,0);
  Vcantidad_deoc      numeric(20,5);
  Vsuma_cantidad_derc numeric(20,5);
  Vnuevo_estado_deoc  numeric(20,0);
begin
  if new.idprod is not null then
    /* Aumento stock y registro movto. */
    select nextval('mobo_seq')
    into   Vidmobo
    ;
    select idbode
          ,idusuacrearegistro
    into   Vidbode
          ,Vidusuacrearegistro
    from   recepciones_compras
    where  id = new.idreco
    ;
    select max(correlativo)
    into   Vcorrelativo
    from   movimientos_bodegas
    where  idbode = Vidbode
    ;
    if Vcorrelativo is null then
      Vcorrelativo := 1;
    else
      Vcorrelativo := Vcorrelativo + 1;
    end if;
    insert into movimientos_bodegas (id                       -- numeric(20,0)   not null
                                    ,idbode                   -- numeric(20,0)   not null
                                    ,correlativo              -- numeric(20,0)   not null
                                    ,idtimb                   -- numeric(20,0)   not null
                                    ,fechamovto               -- date            not null
                                    ,descripcion              -- varchar(100)    not null
                                    ,idusuacrearegistro       -- numeric(20,0)   not null
                                    ,fechacrearegistro        -- timestamp       not null
                                    ,idusuamodifregistro      -- numeric(20,0)       null
                                    ,fechamodifregistro       -- timestamp           null
                                    ,idusuaborraregistro      -- numeric(20,0)       null
                                    ,fechaborraregistro       -- timestamp           null
                                    )
    values(Vidmobo                  -- id                       numeric(20,0)   not null
          ,Vidbode                  -- idbode                   numeric(20,0)   not null
          ,Vcorrelativo             -- correlativo              numeric(20,0)   not null
          ,2                        -- idtimb                   numeric(20,0)   not null
          ,current_date             -- fechamovto               date            not null
          ,'INGRESO DE PRODUCTOS'   -- descripcion              varchar(100)    not null
          ,Vidusuacrearegistro      -- idusuacrearegistro       numeric(20,0)   not null
          ,current_timestamp        -- fechacrearegistro        timestamp       not null
          ,null                     -- idusuamodifregistro      numeric(20,0)       null
          ,null                     -- fechamodifregistro       timestamp           null
          ,null                     -- idusuaborraregistro      numeric(20,0)       null
          ,null                     -- fechaborraregistro       timestamp           null
          )
    ;
    insert into detalles_movtos_bodegas (id                       -- numeric(20,0)   not null
                                        ,idmobo                   -- numeric(20,0)   not null
                                        ,correlativo              -- numeric(20,0)   not null
                                        ,idprod                   -- numeric(20,0)   not null
                                        ,cantidad                 -- numeric(20,0)   not null
                                        ,idusuacrearegistro       -- numeric(20,0)   not null
                                        ,fechacrearegistro        -- timestamp       not null
                                        ,idusuamodifregistro      -- numeric(20,0)       null
                                        ,fechamodifregistro       -- timestamp           null
                                        ,idusuaborraregistro      -- numeric(20,0)       null
                                        ,fechaborraregistro       -- timestamp           null
                                        )
    values(nextval('demb_seq')      -- id                       numeric(20,0)   not null
          ,Vidmobo                  -- idmobo                   numeric(20,0)   not null
          ,1                        -- correlativo              numeric(20,0)   not null
          ,new.idprod               -- idprod                   numeric(20,0)   not null
          ,new.cantidad             -- cantidad                 numeric(20,0)   not null
          ,Vidusuacrearegistro      -- idusuacrearegistro       numeric(20,0)   not null
          ,current_timestamp        -- fechacrearegistro        timestamp       not null
          ,null                     -- idusuamodifregistro      numeric(20,0)       null
          ,null                     -- fechamodifregistro       timestamp           null
          ,null                     -- idusuaborraregistro      numeric(20,0)       null
          ,null                     -- fechaborraregistro       timestamp           null
          )
    ;
    select count(*)
    into   aux
    from   bodegas_productos
    where  idbode = Vidbode
    and    idprod = new.idprod
    ;
    if aux = 0 then
      insert into bodegas_productos (id                       -- numeric(20,0)   not null
                                    ,idbode                   -- numeric(20,0)   not null
                                    ,idprod                   -- numeric(20,0)   not null
                                    ,stock                    -- numeric(20,2)   not null
                                    ,idusuacrearegistro       -- numeric(20,0)   not null
                                    ,fechacrearegistro        -- timestamp       not null
                                    ,idusuamodifregistro      -- numeric(20,0)       null
                                    ,fechamodifregistro       -- timestamp           null
                                    ,idusuaborraregistro      -- numeric(20,0)       null
                                    ,fechaborraregistro       -- timestamp           null
                                    )
      values (nextval('bopr_seq')      -- id                       numeric(20,0)   not null
             ,Vidbode                  -- idbode                   numeric(20,0)   not null
             ,new.idprod               -- idprod                   numeric(20,0)   not null
             ,new.cantidad             -- stock                    numeric(20,2)   not null
             ,Vidusuacrearegistro      -- idusuacrearegistro       numeric(20,0)   not null
             ,current_timestamp        -- fechacrearegistro        timestamp       not null
             ,null                     -- idusuamodifregistro      numeric(20,0)       null
             ,null                     -- fechamodifregistro       timestamp           null
             ,null                     -- idusuaborraregistro      numeric(20,0)       null
             ,null                     -- fechaborraregistro       timestamp           null
             )
      ;
    else
      update bodegas_productos
      set    stock  = stock + new.cantidad
      where  idbode = Vidbode
      and    idprod = new.idprod
      ;
    end if;
    /* Actualizo estado detalle OC */
    select orco.id
    into   Vidorco
    from   recepciones_compras          reco
          ,detalles_recepciones_compras derc
    where  reco.id = derc.idreco
    and    derc.id = new.id
    ;
    select cantidad
    into   Vcantidad_deoc
    from   detalles_ordenes_compras
    where  idorco = Vidorco
    and    idprod = new.idprod
    ;
    select sum(cantidad)
    into   Vsuma_cantidad_derc
    from   recepciones_compras          reco
          ,detalles_recepciones_compras derc
    where  reco.id     = derc.idreco
    and    reco.idorco = Vidorco
    and    derc.idprod = new.idprod
    ;
    if Vsuma_cantidad_derc >= Vcantidad_deoc then
      Vnuevo_estado_deoc := 3; -- SATISFECHA
    else
      Vnuevo_estado_deoc := 2; -- PARCIALMENTE SATISFECHA
    end if;
    update detalles_ordenes_compras
    set    idedoc = Vnuevo_estado_deoc
    where  idorco = Vidorco
    and    idprod = new.idprod
    ;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q
