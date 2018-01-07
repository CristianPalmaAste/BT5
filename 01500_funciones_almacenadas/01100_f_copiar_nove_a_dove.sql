create or replace function f_copiar_nove_a_vent() returns trigger as
$body$
declare
  Vidvent                   numeric;
  Vnumero                   numeric;
  Vid                       numeric;
  Vcorrelativo              numeric;
  Vidprod                   numeric;
  Vidserv                   numeric;
  Vcantidad                 numeric;
  Vpreciounitario           numeric;
  Vporcentajedescuento      numeric;
  Vmontodescuento           numeric;
  Vimpuestos                numeric;
  Vsubtotal                 numeric;
  Vidusuacrearegistro       numeric;
  Viddedv                   numeric;
  Vidtidv                   numeric;
  Vidpais                   numeric;
  Vexento                   numeric;
  Vafecto                   numeric;
  Vtotallinea               numeric;
  C_denv cursor for
    select id
          ,correlativo
          ,idprod
          ,idserv
          ,preciounitario
          ,cantidad
          ,porcentajedescuento
          ,montodescuento
          ,exento
          ,afecto
          ,impuestos
          ,totallinea
          ,idusuacrearegistro
    from   detalles_notas_vtas
    where  idnove = new.id
    ;
begin
insert into cpalma values (1, 'm1');
  if old.idesnv = 2 and new.idesnv = 3 then
    select idpais
    into   Vidpais
    from   empresas
    where  id = new.idempr
    ;
    select min(id)
    into   Vidtidv
    from   tipos_doctos_ventas
    where  idpais = Vidpais
    ;
    select nextval('nove_seq')
    into   Vidvent
    ;
    select max(numero)
    into   Vnumero
    from   notas_ventas
    where  idempr = new.idempr
    ;
    if Vnumero is null then
      Vnumero := 1;
    end if;
    insert into ventas (id                       -- numeric(20,0)   not null
                       ,idempr                   -- numeric(20,0)   not null
                       ,idnove                   -- numeric(20,0)       null
                       ,idtidv                   -- numeric(20,0)   not null
                       ,numero                   -- numeric(20,0)   not null
                       ,idclie                   -- numeric(20,0)   not null
                       ,descripciondoctoventa    -- varchar(1000)   not null
                       ,idgere                   -- numeric(20,0)       null
                       ,idproy                   -- numeric(20,0)       null
                       ,idline                   -- numeric(20,0)       null
                       ,idceco                   -- numeric(20,0)       null
                       ,idtare                   -- numeric(20,0)       null
                       ,exento                   -- numeric(20,0)   not null
                       ,afecto                   -- numeric(20,0)   not null
                       ,impuestos                -- numeric(20,0)   not null
                       ,porcentajedescuento      -- numeric(20,2)   not null
                       ,montodescuento           -- numeric(20,2)   not null
                       ,total                    -- numeric(20,0)   not null
                       ,idesve                   -- numeric(20,0)   not null
                       ,idusuacrearegistro       -- numeric(20,0)   not null
                       ,fechacrearegistro        -- timestamp       not null
                       ,idusuamodifregistro      -- numeric(20,0)       null
                       ,fechamodifregistro       -- timestamp           null
                       ,idusuaborraregistro      -- numeric(20,0)       null
                       ,fechaborraregistro       -- timestamp           null
                       )
    values (Vidvent                       -- id                       numeric(20,0)   not null
           ,new.idempr                    -- idempr                   numeric(20,0)   not null
           ,new.id                        -- idnove                   numeric(20,0)       null
           ,Vidtidv                       -- idtidv                   numeric(20,0)   not null
           ,Vnumero                       -- numero                   numeric(20,0)   not null
           ,new.idclie                    -- idclie                   numeric(20,0)   not null
           ,new.descripcionnotaventa      -- descripciondoctoventa    varchar(1000)   not null
           ,new.idgere                    -- idgere                   numeric(20,0)       null
           ,new.idproy                    -- idproy                   numeric(20,0)       null
           ,new.idline                    -- idline                   numeric(20,0)       null
           ,new.idceco                    -- idceco                   numeric(20,0)       null
           ,new.idtare                    -- idtare                   numeric(20,0)       null
           ,new.exento                    -- exento                   numeric(20,0)   not null
           ,new.afecto                    -- afecto                   numeric(20,0)   not null
           ,new.impuestos                 -- impuestos                numeric(20,0)   not null
           ,new.porcentajedescuento       -- porcentajedescuento      numeric(20,2)   not null
           ,new.montodescuento            -- montodescuento           numeric(20,2)   not null
           ,new.total                     -- total                    numeric(20,0)   not null
           ,1                             -- idesve                   numeric(20,0)   not null
           ,new.idusuacrearegistro        -- idusuacrearegistro       numeric(20,0)   not null
           ,current_timestamp             -- fechacrearegistro        timestamp       not null
           ,null                          -- idusuamodifregistro      numeric(20,0)       null
           ,null                          -- fechamodifregistro       timestamp           null
           ,null                          -- idusuaborraregistro      numeric(20,0)       null
           ,null                          -- fechaborraregistro       timestamp           null
           )
    ;
    open C_denv;
    loop
      fetch C_denv into Vid
                       ,Vcorrelativo
                       ,Vidprod
                       ,Vidserv
                       ,Vpreciounitario
                       ,Vcantidad
                       ,Vporcentajedescuento
                       ,Vmontodescuento
                       ,Vexento
                       ,Vafecto
                       ,Vimpuestos
                       ,Vtotallinea
                       ,Vidusuacrearegistro
                       ;
      exit when not found;
      select nextval('dedv_seq')
      into   Viddedv
      ;
      insert into detalles_doctos_vtas (id                       -- numeric(20,0)   not null
                                       ,idvent                   -- numeric(20,0)   not null
                                       ,correlativo              -- numeric(20,0)   not null
                                       ,idprod                   -- numeric(20,0)       null
                                       ,idserv                   -- numeric(20,0)       null
                                       ,preciounitario           -- numeric(20,0)   not null
                                       ,cantidad                 -- numeric(20,2)   not null
                                       ,porcentajedescuento      -- numeric(20,2)   not null
                                       ,montodescuento           -- numeric(20,2)   not null
                                       ,exento                   -- numeric(20,2)   not null
                                       ,afecto                   -- numeric(20,2)   not null
                                       ,impuestos                -- numeric(20,2)   not null
                                       ,totallinea               -- numeric(20,2)   not null
                                       ,idusuacrearegistro       -- numeric(20,0)   not null
                                       ,fechacrearegistro        -- timestamp       not null
                                       ,idusuamodifregistro      -- numeric(20,0)       null
                                       ,fechamodifregistro       -- timestamp           null
                                       ,idusuaborraregistro      -- numeric(20,0)       null
                                       ,fechaborraregistro       -- timestamp           null
                                       )
      values (Viddedv                              -- id                       numeric(20,0)   not null
             ,Vidvent                              -- idvent                   numeric(20,0)   not null
             ,Vcorrelativo                         -- correlativo              numeric(20,0)   not null
             ,Vidprod                              -- idprod                   numeric(20,0)       null
             ,Vidserv                              -- idserv                   numeric(20,0)       null
             ,Vpreciounitario                      -- preciounitario           numeric(20,0)   not null
             ,Vcantidad                            -- cantidad                 numeric(20,2)   not null
             ,Vporcentajedescuento                 -- porcentajedescuento      numeric(20,2)   not null
             ,Vmontodescuento                      -- montodescuento           numeric(20,2)   not null
             ,Vexento                              -- impuestos                numeric(20,2)   not null
             ,Vafecto                              -- impuestos                numeric(20,2)   not null
             ,Vimpuestos                           -- impuestos                numeric(20,2)   not null
             ,Vtotallinea                          -- subtotal                 numeric(20,2)   not null
             ,Vidusuacrearegistro                  -- idusuacrearegistro       numeric(20,0)   not null
             ,current_timestamp                    -- fechacrearegistro        timestamp       not null
             ,null                                 -- idusuamodifregistro      numeric(20,0)       null
             ,null                                 -- fechamodifregistro       timestamp           null
             ,null                                 -- idusuaborraregistro      numeric(20,0)       null
             ,null                                 -- fechaborraregistro       timestamp           null
             )
      ;
    end loop;
    close C_denv;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

