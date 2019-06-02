create or replace function f_contabilizar_ventas(Pidempr            int
                                                ,Ptodas_S_N         varchar(1)
                                                ,Pfecha_ini         int
                                                ,Pfecha_fin         int
                                                ,Pidusuacreaasiento int) returns varchar as
$body$
/*
   Funcion que contabiliza ventas de una empresa
   Se puede contabilizar todas las ventas pendientes o no
   Si es no, se puede contabilizar las ventas dentro de un rango de fechas
   Se puede crear un asiento contable para todas las ventas involucradas o un asiento por cada venta o uno por dia (para todas las ventas de ese dia)
   Parametros:

   Pidempr           : id de la empresa
   Ptodas_S_N        : S si se desea contabilizar todas las ventas pendientes, N si no
   Pfecha_ini        : si Ptodas_S_N = N ==> fecha inicial desde cuando se desea contabillizar
   Pfecha_fin        : fecha final hasta cuando se desea contabillizar
   Pidusuacreaasiento: id del usuario que ejecuta la contabilización de ventas y con ello crea el asiewnto contable

   Retorna "exito" si todo el proceso fue exitoso; de lo contrario, retorna un mensaje de error
*/
declare
  Vmensaje                    varchar(1000);
  aux                         int;
  Vidvent                     int;
  Vidgere                     int;
  Vidproy                     int;
  Vidline                     int;
  Vidceco                     int;
  Vidtare                     int;
  Vneto                       numeric;
  Vdescuentos                 numeric;
  Vimpuestosobligats          numeric;
  Vimpuestosespecifs          numeric;
  Vtotal                      numeric;
  Vidpeco                     int;
  Vnumero_asiento             int;
  Vidasco                     int;
  Vidcuco                     int;
  Vsum_totallinea             numeric;
  i                           int;
  C_ventas_pdtes cursor for
    select id                 idvent
          ,afecto+exento      neto
          ,montodescuento     descuentos
          ,impuestosobligats  impuestosobligats
          ,impuestosespecifs  impuestosespecifs
          ,total              total
          ,idgere             idgere
          ,idproy             idproy
          ,idline             idline
          ,idceco             idceco
          ,idtare             idtare
    from   ventas
    where  idempr                                                  = Pidempr
    and    (Ptodas_S_N                                             = 'S'
            or
            (
             Ptodas_S_N                                            = 'N'
             and
             cast(trim(to_char(fechaventa,'yyyymmdd')) as integer) between Pfecha_ini and Pfecha_fin
            )
           )
    and    idesve                                                  = 2
    and    idasco                                                  is null
    ;
  C_detalles_ventas cursor for
    select sfpr.idcuco                 idcuco
          ,sum(deve.totallinea)        sum_totallinea
    from   detalles_ventas        deve
          ,productos              prod
          ,sub_familias_productos sfpr
    where  deve.idprod = prod.id
    and    prod.idsfpr = sfpr.id
    and    deve.idvent = Vidvent
    group  by sfpr.idcuco
    union

servicios
otras ventas

+

imptos oblig
otros imptos
caja
descuentos

    ;
begin
  /* Validaciones a la invocación a esta función */
  if Pidempr is null then
    Vmensaje := 'El parámetro empresa es obligatorio';
    return(Vmensaje);
  end if;
  if Ptodas_S_N is null then
    Vmensaje := 'El parámetro Ptodas_S_N es obligatorio';
    return(Vmensaje);
  end if;
  if Pfecha_ini is null then
    Vmensaje := 'El parámetro Pfecha_ini es obligatorio';
    return(Vmensaje);
  end if;
  if Pfecha_fin is null then
    Vmensaje := 'El parámetro Pfecha_fin es obligatorio';
    return(Vmensaje);
  end if;
  if Pidusuacreaasiento is null then
    Vmensaje := 'El parámetro Pidusuacreaasiento es obligatorio';
    return(Vmensaje);
  end if;
  select count(*)
  into   aux
  from   empresas
  where  id = Pidempr
  ;
  if aux = 0 then
    Vmensaje := 'El parámetro Pidempr no existe en la tabla empresas';
    return(Vmensaje);
  end if;
  if Ptodas_S_N not in ('S', 'N')  then
    Vmensaje := 'Los valores válidos para el parámetro Ptodas_S_N son S o N: ' || Ptodas_S_N || ' <- error';
    return(Vmensaje);
  end if;
  if Pfecha_ini > Pfecha_fin then
    Vmensaje := 'Fecha inicial debe ser menor o igual que fecha final';
    return(Vmensaje);
  end if;
  if Ptodas_S_N = 'S' and (Pfecha_ini != 0 or Pfecha_fin != 0) then
    Vmensaje := 'Si Ptodas_S_N = S entonces Pfecha_ini y Pfecha_fin deben ser 0';
    return(Vmensaje);
  end if;
  open C_ventas_pdtes;
  loop
    fetch C_ventas_pdtes into Vidvent
                             ,Vneto
                             ,Vdescuentos
                             ,Vimpuestosobligats
                             ,Vimpuestosespecifs
                             ,Vtotal
                             ,Vidgere
                             ,Vidproy
                             ,Vidline
                             ,Vidceco
                             ,Vidtare
                             ;
    exit when not found;
    select id
    into   Vidpeco
    from   periodos_contables
    where  idempr = Pidempr
    and    idespc = 1
    ;
    if Vidpeco is null then
      Vmensaje := 'No hay un período contable abierto para esta empresa';
      return(Vmensaje);
    end if;
    select max(numero_asiento)
    into   Vnumero_asiento
    from   asientos_contables
    where  idpeco = Vidpeco
    and    idtiac = 1
    ;
    if Vnumero_asiento is null then
      Vnumero_asiento := 1;
    else
      Vnumero_asiento := Vnumero_asiento + 1;
    end if;
    Vidasco := nextval('asco_seq');
    insert into asientos_contables (id                       -- numeric(20,0)     not null
                                   ,idpeco                   -- numeric(20,0)     not null
                                   ,idtiac                   -- numeric(20,0)     not null
                                   ,idesac                   -- numeric(20,0)     not null
                                   ,numero_asiento           -- numeric(20,0)     not null
                                   ,fecha_asiento            -- date              not null
                                   ,reversible               -- varchar(1)        not null
                                   ,idusuacreaasiento        -- numeric(20,0)     not null
                                   ,idusuaautorizaasiento    -- numeric(20,0)         null
                                   ,idusuacrearegistro       -- numeric(20,0)     not null
                                   ,fechacrearegistro        -- timestamp         not null
                                   ,idusuamodifregistro      -- numeric(20,0)         null
                                   ,fechamodifregistro       -- timestamp             null
                                   ,idusuaborraregistro      -- numeric(20,0)         null
                                   ,fechaborraregistro       -- timestamp             null
                                   )
    values (Vidasco                           -- id                       numeric(20,0)     not null
           ,Vidpeco                           -- idpeco                   numeric(20,0)     not null
           ,1                                 -- idtiac                   numeric(20,0)     not null
           ,1                                 -- idesac                   numeric(20,0)     not null
           ,Vnumero_asiento                   -- numero_asiento           numeric(20,0)     not null
           ,current_timestamp                 -- fecha_asiento            date              not null
           ,'N'                               -- reversible               varchar(1)        not null
           ,Pidusuacreaasiento                -- idusuacreaasiento        numeric(20,0)     not null
           ,null                              -- idusuaautorizaasiento    numeric(20,0)         null
           ,Pidusuacreaasiento                -- idusuacrearegistro       numeric(20,0)     not null
           ,current_timestamp                 -- fechacrearegistro        timestamp         not null
           ,null                              -- idusuamodifregistro      numeric(20,0)         null
           ,null                              -- fechamodifregistro       timestamp             null
           ,null                              -- idusuaborraregistro      numeric(20,0)         null
           ,null                              -- fechaborraregistro       timestamp             null
           )
    ;
    update ventas
    set    idasco = Vidasco
    where  id     = Vidvent
    ;




    i := 0;
    open C_detalles_ventas;
    loop
      fetch C_detalles_ventas into Vidcuco
                                  ,Vsum_totallinea
                                  ;
      exit when not found;
      i := i + 1;
      insert into detalles_asientos_contables (id                       -- numeric(20,0)     not null
                                              ,idasco                   -- numeric(20,0)     not null
                                              ,numero_linea             -- numeric(20,0)     not null
                                              ,idcuco                   -- numeric(20,0)     not null
                                              ,idtiec                   -- numeric(20,0)     not null
                                              ,idgere                   -- numeric(20,0)         null
                                              ,idproy                   -- numeric(20,0)         null
                                              ,idline                   -- numeric(20,0)         null
                                              ,idceco                   -- numeric(20,0)         null
                                              ,idtare                   -- numeric(20,0)         null
                                              ,monto                    -- numeric(20,0)     not null
                                              ,idusuacrearegistro       -- numeric(20,0)     not null
                                              ,fechacrearegistro        -- timestamp         not null
                                              ,idusuamodifregistro      -- numeric(20,0)         null
                                              ,fechamodifregistro       -- timestamp             null
                                              ,idusuaborraregistro      -- numeric(20,0)         null
                                              ,fechaborraregistro       -- timestamp             null
                                              )
      values (nextval('deac_seq')                   -- id                       numeric(20,0)     not null
             ,Vidasco                               -- idasco                   numeric(20,0)     not null
             ,i                                     -- numero_linea             numeric(20,0)     not null
             ,Vidcuco                               -- idcuco                   numeric(20,0)     not null
             ,2                                     -- idtiec                   numeric(20,0)     not null
             ,Vidgere                               -- idgere                   numeric(20,0)         null
             ,Vidproy                               -- idproy                   numeric(20,0)         null
             ,Vidline                               -- idline                   numeric(20,0)         null
             ,Vidceco                               -- idceco                   numeric(20,0)         null
             ,Vidtare                               -- idtare                   numeric(20,0)         null
             ,Vsum_totallinea                       -- monto                    numeric(20,0)     not null
             ,Pidusuacreaasiento                    -- idusuacrearegistro       numeric(20,0)     not null
             ,current_timestamp                     -- fechacrearegistro        timestamp         not null
             ,null                                  -- idusuamodifregistro      numeric(20,0)         null
             ,null                                  -- fechamodifregistro       timestamp             null
             ,null                                  -- idusuaborraregistro      numeric(20,0)         null
             ,null                                  -- fechaborraregistro       timestamp             null
             )
      ;
    end loop;
    close C_detalles_ventas;
  end loop;
  close C_ventas_pdtes;
  return 'exito';
end;
$body$ LANGUAGE plpgsql;

drop trigger if exists trg_before_upd_vent on ventas cascade
;

update ventas
set    idasco = null
;

delete from detalles_asientos_contables
;

delete from asientos_contables
;

select f_contabilizar_ventas(1, 'N' , 20190601, 20190630, 3);

select *
from   asco
;

select *
from   deac
;

\q

