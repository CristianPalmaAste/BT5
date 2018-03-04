create or replace function f_registrar_precio_bitacora() returns trigger as
$body$
declare
  C_detalle_venta cursor for
    select correlativo
          ,idprod
          ,cantidad
          ,f_datos_producto(idprod, 3)
  from     detalles_ventas
  where    idvent = new.id
  and      idserv is null
  ;
begin
  if old.idesve = 1 and new.idesve = 2 then
    select nextval('mobo_seq')
    into   Vidmobo
    ;
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
    values(Vidmobo_seq              -- id                       numeric(20,0)   not null
          ,new.idbode               -- idbode                   numeric(20,0)   not null
          ,                         -- correlativo              numeric(20,0)   not null
          ,1                        -- idtimb                   numeric(20,0)   not null
          ,current_date             -- fechamovto               date            not null
          ,'VENTA'                  -- descripcion              varchar(100)    not null
          ,new.idusuamodifregistro  -- idusuacrearegistro       numeric(20,0)   not null
          ,current_timestamp        -- fechacrearegistro        timestamp       not null
          ,null                     -- idusuamodifregistro      numeric(20,0)       null
          ,null                     -- fechamodifregistro       timestamp           null
          ,null                     -- idusuaborraregistro      numeric(20,0)       null
          ,null                     -- fechaborraregistro       timestamp           null
          )
    ;
    open C_detalle_venta;
    loop
      fetch C_decv into Vcorrelativo
                       ,Vidprod
                       ,Vcantidad
                       ,Vidunmp
                       ;
      insert into detalles_movtos_bodegas (id                       numeric(20,0)   not null
                                          ,idmobo                   numeric(20,0)   not null
                                          ,correlativo              numeric(20,0)   not null
                                          ,idprod                   numeric(20,0)   not null
                                          ,cantidad                 numeric(20,0)   not null
                                          ,idunmp                   numeric(20,0)   not null
                                          ,idusuacrearegistro       numeric(20,0)   not null
                                          ,fechacrearegistro        timestamp       not null
                                          ,idusuamodifregistro      numeric(20,0)       null
                                          ,fechamodifregistro       timestamp           null
                                          ,idusuaborraregistro      numeric(20,0)       null
                                          ,fechaborraregistro       timestamp           null
                                          )
      values(nextval('demb_seq')      -- id                       numeric(20,0)   not null
            ,Vidmobo                  -- idmobo                   numeric(20,0)   not null
            ,Vcorrelativo             -- correlativo              numeric(20,0)   not null
            ,Vidprod                  -- idprod                   numeric(20,0)   not null
            ,Vcantidad                -- cantidad                 numeric(20,0)   not null
            ,Vidunmp                  -- idunmp                   numeric(20,0)   not null
            ,new.idusuamodifregistro  -- idusuacrearegistro       numeric(20,0)   not null
            ,current_timestamp        -- fechacrearegistro        timestamp       not null
            ,null                     -- idusuamodifregistro      numeric(20,0)       null
            ,null                     -- fechamodifregistro       timestamp           null
            ,null                     -- idusuaborraregistro      numeric(20,0)       null
            ,null                     -- fechaborraregistro       timestamp           null
            )
      ;
      update bodegas_productos
      set    stock  = stock - XXXXX
      where  idbode = 
      and    idprod = 
      ;
    end loop;
  end if;

  return new;
end;
$body$ LANGUAGE plpgsql;

\q
