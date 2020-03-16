create or replace function f_copiar_requ_a_orco() returns trigger as
$body$
declare
  Vidorco                   numeric(20,0);
  Vid                       numeric(20,0);
  Vidrequ                   numeric(20,0);
  Vcorrelativo              numeric(20,0);
  Vidprod                   numeric(20,0);
  Vidserv                   numeric(20,0);
  Votroinsumo               varchar(1000);
  Vcantidad                 numeric(20,0);
  Vpreciounitario           numeric(20,0);
  Viddeoc                   numeric(20,0);
  C_dere cursor for
    select id
          ,idrequ
          ,correlativo
          ,idprod
          ,idserv
          ,otroinsumo
          ,cantidad
          ,preciounitario
    from   detalles_requisiciones
    where  idrequ = new.id
    ;
begin
  if old.idereq in (4,5) and new.idereq = 7 then
    select nextval('orco_seq')
    into   Vidorco
    ;
    select max(correlativo)
    into   Vcorrelativo
    from   ordenes_compras
    where  idempr = new.idempr
    ;
    if Vcorrelativo is null then
      Vcorrelativo := 1;
    else
      Vcorrelativo := Vcorrelativo + 1;
    end if;
    insert into ordenes_compras (id                       -- numeric(20,0)   not null
                                ,idempr                   -- numeric(20,0)   not null
                                ,correlativo              -- numeric(20,0)   not null
                                ,idrequ                   -- numeric(20,0)       null
                                ,idgere                   -- numeric(20,0)       null
                                ,idproy                   -- numeric(20,0)       null
                                ,idline                   -- numeric(20,0)       null
                                ,idceco                   -- numeric(20,0)       null
                                ,idtare                   -- numeric(20,0)       null
                                ,idesoc                   -- numeric(20,0)       null
                                ,idusuacrearegistro       -- numeric(20,0)   not null
                                ,fechacrearegistro        -- timestamp       not null
                                ,idusuamodifregistro      -- numeric(20,0)       null
                                ,fechamodifregistro       -- timestamp           null
                                ,idusuaborraregistro      -- numeric(20,0)       null
                                ,fechaborraregistro       -- timestamp           null
                                )
    values (Vidorco                                 -- id                       numeric(20,0)   not null
           ,new.idempr                              -- idempr                   numeric(20,0)   not null
           ,Vcorrelativo                            -- correlativo              numeric(20,0)   not null
           ,new.id                                  -- idrequ                   numeric(20,0)       null
           ,new.idgere                              -- idgere                   numeric(20,0)       null
           ,new.idproy                              -- idproy                   numeric(20,0)       null
           ,new.idline                              -- idline                   numeric(20,0)       null
           ,new.idceco                              -- idceco                   numeric(20,0)       null
           ,new.idtare                              -- idtare                   numeric(20,0)       null
           ,1                                       -- idesoc                   numeric(20,0)       null
           ,new.idusuacrearegistro                  -- idusuacrearegistro       numeric(20,0)   not null
           ,current_timestamp                       -- fechacrearegistro        timestamp       not null
           ,null                                    -- idusuamodifregistro      numeric(20,0)       null
           ,null                                    -- fechamodifregistro       timestamp           null
           ,null                                    -- idusuaborraregistro      numeric(20,0)       null
           ,null                                    -- fechaborraregistro       timestamp           null
           )
    ;
    open C_dere;
    loop
      fetch C_dere into Vid
                       ,Vidrequ
                       ,Vcorrelativo
                       ,Vidprod
                       ,Vidserv
                       ,Votroinsumo
                       ,Vcantidad
                       ,Vpreciounitario
                       ;
      exit when not found;
      select nextval('deoc_seq')
      into   Viddeoc
      ;

      insert into detalles_ordenes_compras (id                       -- numeric(20,0)   not null
                                           ,idorco                   -- numeric(20,0)   not null
                                           ,correlativo              -- numeric(20,0)   not null
                                           ,idedoc                   -- numeric(20,0)   not null
                                           ,idprod                   -- numeric(20,0)       null
                                           ,idserv                   -- numeric(20,0)       null
                                           ,otroinsumo               -- varchar(1000)       null
                                           ,cantidad                 -- numeric(20,0)   not null
                                           ,preciounitario           -- numeric(20,0)   not null
                                           ,idusuacrearegistro       -- numeric(20,0)   not null
                                           ,fechacrearegistro        -- timestamp       not null
                                           )
      values (Viddeoc                             -- id                       numeric(20,0)   not null
             ,Vidorco                             -- idorco                   numeric(20,0)   not null
             ,Vcorrelativo                        -- correlativo              numeric(20,0)   not null
             ,1                                   -- idedoc                   numeric(20,0)   not null
             ,Vidprod                             -- idprod                   numeric(20,0)       null
             ,Vidserv                             -- idserv                   numeric(20,0)       null
             ,Votroinsumo                         -- otroinsumo               varchar(1000)       null
             ,Vcantidad                           -- cantidad                 numeric(20,0)   not null
             ,Vpreciounitario                     -- preciounitario           numeric(20,0)   not null
             ,new.idusuacrearegistro              -- idusuacrearegistro       numeric(20,0)   not null
             ,current_timestamp                   -- fechacrearegistro        timestamp       not null
             )
      ;
    end loop;
    close C_dere;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

