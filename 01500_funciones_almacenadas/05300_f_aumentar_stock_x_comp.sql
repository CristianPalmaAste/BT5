create or replace function f_aumentar_stock_x_comp() returns trigger as
$body$
declare
  Vidreco             numeric(20,0);
  Vidbode             numeric(20,0);
  Vidusuacrearegistro numeric(20,0);
  Vidmobo             numeric(20,0);
  Vcorrelativo        numeric(20,0);
  aux                 numeric(20,0);
begin
  /* Esta fn. satisface el caso de una compra que no pasó por una recepción de compra
     Se debe ir a la cabecera (compras) para ver si ésta tiene idreco (si tiene, entonces noaplica) y idbode (dato necesario para saber dónde
     aumentar stock, en qué bodega)
  */
  select idreco
        ,idbode
        ,idusuacrearegistro
  into   Vidreco
        ,Vidbode
        ,Vidusuacrearegistro
  from   compras
  where  id = new.idcomp
  ;
  if new.idprod is not null and Vidreco is null and Vidbode is not null then
    select nextval('mobo_seq')
    into   Vidmobo
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
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q
