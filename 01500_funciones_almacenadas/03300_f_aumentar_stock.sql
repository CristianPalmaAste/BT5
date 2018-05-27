create or replace function f_aumentar_stock() returns trigger as
$body$
declare
  Vidbode             numeric(20,0);
  Vidmobo             numeric(20,0);
  Vcorrelativo        numeric(20,0);
  Vidusuacrearegistro numeric(20,0);
begin
  if new.idprod is not null then
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
          ,1                        -- idtimb                   numeric(20,0)   not null
          ,current_date             -- fechamovto               date            not null
          ,'COMPRA'                 -- descripcion              varchar(100)    not null
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
                                        ,idunmp                   -- numeric(20,0)   not null
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
          ,new.idunmp               -- idunmp                   numeric(20,0)   not null
          ,Vidusuacrearegistro      -- idusuacrearegistro       numeric(20,0)   not null
          ,current_timestamp        -- fechacrearegistro        timestamp       not null
          ,null                     -- idusuamodifregistro      numeric(20,0)       null
          ,null                     -- fechamodifregistro       timestamp           null
          ,null                     -- idusuaborraregistro      numeric(20,0)       null
          ,null                     -- fechaborraregistro       timestamp           null
          )
    ;
    update bodegas_productos
    set    stock  = stock + new.cantidad
    where  idbode = Vidbode
    and    idprod = new.idprod
    ;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q
