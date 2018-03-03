create or replace function f_registrar_precio_bitacora() returns trigger as
$body$
declare
begin
  if old.idesve = 1 and new.idesve = 2 then
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
    values(                         -- id                       numeric(20,0)   not null
          ,                         -- idbode                   numeric(20,0)   not null
          ,                         -- correlativo              numeric(20,0)   not null
          ,                         -- idtimb                   numeric(20,0)   not null
          ,                         -- fechamovto               date            not null
          ,                         -- descripcion              varchar(100)    not null
          ,                         -- idusuacrearegistro       numeric(20,0)   not null
          ,                         -- fechacrearegistro        timestamp       not null
          ,                         -- idusuamodifregistro      numeric(20,0)       null
          ,                         -- fechamodifregistro       timestamp           null
          ,                         -- idusuaborraregistro      numeric(20,0)       null
          ,                         -- fechaborraregistro       timestamp           null
          )
    ;
    recorreo cursor
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
      update bodegas_productos
      set    atock  = atock - XXXXX
      where  idbode = 
      and    idprod = 
      ;
    end loop;
  end if;

  return new;
end;
$body$ LANGUAGE plpgsql;

\q
