create or replace function f_contabilizar_ventas(Pidempr            int
                                                ,Pfecha             int
                                                ,Pidusuacreaasiento int) returns varchar as
$body$
/*
   Función que contabiliza ventas de una empresa para un dia dado
   Parámetros:

   Pidempr           : id de la empresa
   Pfecha            : fecha que se desea contabillizar
   Pidusuacreaasiento: id del usuario que ejecuta la contabilización de ventas y con ello crea el asiento contable

   Retorna "exito" si todo el proceso fue exitoso; de lo contrario, retorna un mensaje de error
*/
declare
  Vmensaje                        varchar(1000);
  aux                             int;
  Vidvent                         int;
  Vidgere                         int;
  Vidproy                         int;
  Vidline                         int;
  Vidceco                         int;
  Vidtare                         int;
  Vidtiec                         int;
  Vdescuentos                     numeric;
  Vimpuestosobligats              numeric;
  Vimpuestosespecifs              numeric;
  Vtotal                          numeric;
  Vidpeco                         int;
  Vnumero_asiento                 int;
  Vidasco                         int;
  Vidcuco                         int;
  Vsum_totallinea                 numeric;
  i                               int;
  Vidcoca                         int;
  Vidcuco_otros_conceptos         int;
  Vvalor_linea                    numeric;
  Vfecha_txt                      varchar(100);
  Vmes_actual                     int;
  Vanno_actual                    int;
  Vfecha_asiento                  date;
  Vmes_contab_ventas              int;
  Vanno_contab_ventas             int;
  Vmes_peco                       int;
  Vanno_peco                      int;
  Videsac_default                 int;
  C_ventas_pdtes cursor for
    select id                 idvent
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
    where  idempr                                                = Pidempr
    and    cast(trim(to_char(fechaventa,'yyyymmdd')) as integer) = Pfecha
    and    idesve                                                in (2,4)
    and    idasco                                                is null
    ;
  C_detalles_ventas cursor for
    select sfpr.idcuco                    idcuco
          ,sum(deve.afecto + deve.exento) sum_totallinea
    from   detalles_ventas        deve
          ,productos              prod
          ,sub_familias_productos sfpr
    where  deve.idprod = prod.id
    and    prod.idsfpr = sfpr.id
    and    deve.idvent = Vidvent
    group  by sfpr.idcuco
    union
    select serv.idcuco
          ,sum(deve.afecto + deve.exento)
    from   detalles_ventas deve
          ,servicios       serv
    where  deve.idserv = serv.id
    and    deve.idvent = Vidvent
    group  by serv.idcuco
    ;
  C_ctas_ctbles_otros_conceptos cursor for
    select dpce.idcoca
          ,dpce.idcuco
    from   procesos_contables_empresas       prce
          ,detalles_procesos_ctbles_empresas dpce
    where  prce.id     = dpce.idprce
    and    prce.idempr = Pidempr
    and    prce.idprco = 1
    ;
begin
  /* Validaciones a la invocación a esta función */
  if Pidempr is null then
    Vmensaje := 'N;El parámetro empresa es obligatorio';
    return(Vmensaje);
  end if;
  if Pfecha is null then
    Vmensaje := 'N;El parámetro Pfecha es obligatorio';
    return(Vmensaje);
  end if;
  if Pidusuacreaasiento is null then
    Vmensaje := 'N;El parámetro Pidusuacreaasiento es obligatorio';
    return(Vmensaje);
  end if;
  select count(*)
  into   aux
  from   empresas
  where  id = Pidempr
  ;
  if aux = 0 then
    Vmensaje := 'N;El parámetro ' || Pidempr || ' no existe en la tabla empresas';
    return(Vmensaje);
  end if;
  select count(*)
  into   aux
  from   ventas
  where  idempr                                                = Pidempr
  and    cast(trim(to_char(fechaventa,'yyyymmdd')) as integer) = Pfecha
  and    idesve                                                in (2,4)
  and    idasco                                                is null
  ;
  if aux = 0 then
    Vmensaje := 'N;No hay ventas pendientes de contabilizar para los parámetros indicados';
    return(Vmensaje);
  end if;
  select id
        ,mes
        ,anno
  into   Vidpeco
        ,Vmes_peco
        ,Vanno_peco
  from   periodos_contables
  where  idempr = Pidempr
  and    idespc = 1
  ;
  if Vidpeco is null then
    Vmensaje := 'N;No hay un período contable abierto para esta empresa';
    return(Vmensaje);
  end if;
  Vfecha_txt          := cast(Pfecha as varchar);
  Vfecha_txt          := substr(Vfecha_txt,7,2) || '-' || substr(Vfecha_txt,5,2) || '-' || substr(Vfecha_txt,1,4);
  Vmes_contab_ventas  := substr(Vfecha_txt,4,2);
  Vanno_contab_ventas := substr(Vfecha_txt,7,4);
  if Vmes_peco != Vmes_contab_ventas or Vanno_peco != Vanno_contab_ventas then
    Vmensaje := 'N;La fecha a contabiizar no pertenece al período contable abierto';
    return(Vmensaje);
  end if;
  --
  -- Si se llegó hasta aquí, quiere decir que se pasaron todas las validaciones -> se procede con la generación del asiento contable
  --
  Vmes_actual    := to_char(current_timestamp,'mm');
  Vanno_actual   := to_char(current_timestamp,'yyyy');
  Vfecha_asiento := date(Pfecha::text);
  select valor
  into   Videsac_default
  from   parametros_empresas
  where  idempr      = Pidempr
  and    nombrecorto = 'ESTINIASTOS'
  ;
  if Videsac_default is null then
    Videsac_default := 2;
  end if;
  open C_ventas_pdtes;
  loop
    fetch C_ventas_pdtes into Vidvent
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
    select max(numero_asiento)
    into   Vnumero_asiento
    from   asientos_contables
    where  idpeco = Vidpeco
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
                                   ,idorac                   -- numeric(20,0)     not null
                                   ,numero_asiento           -- numeric(20,0)     not null
                                   ,glosa                    -- varchar(100)      not null
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
    values (Vidasco                                                    -- id                       numeric(20,0)     not null
           ,Vidpeco                                                    -- idpeco                   numeric(20,0)     not null
           ,3                                                          -- idtiac                   numeric(20,0)     not null
           ,Videsac_default                                            -- idesac                   numeric(20,0)     not null
           ,2                                                          -- idorac                   numeric(20,0)     not null
           ,Vnumero_asiento                                            -- numero_asiento           numeric(20,0)     not null
           ,'CONTABILIZACIÓN AUTOMÁTICA VENTAS ' || Vfecha_txt         -- glosa                    varchar(100)      not null
           ,Vfecha_asiento                                             -- fecha_asiento            date              not null
           ,'N'                                                        -- reversible               varchar(1)        not null
           ,Pidusuacreaasiento                                         -- idusuacreaasiento        numeric(20,0)     not null
           ,null                                                       -- idusuaautorizaasiento    numeric(20,0)         null
           ,Pidusuacreaasiento                                         -- idusuacrearegistro       numeric(20,0)     not null
           ,current_timestamp                                          -- fechacrearegistro        timestamp         not null
           ,null                                                       -- idusuamodifregistro      numeric(20,0)         null
           ,null                                                       -- fechamodifregistro       timestamp             null
           ,null                                                       -- idusuaborraregistro      numeric(20,0)         null
           ,null                                                       -- fechaborraregistro       timestamp             null
           )
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
                                              ,glosadet                 -- varchar(100)      not null
                                              ,idusuacrearegistro       -- numeric(20,0)     not null
                                              ,fechacrearegistro        -- timestamp         not null
                                              ,idusuamodifregistro      -- numeric(20,0)         null
                                              ,fechamodifregistro       -- timestamp             null
                                              ,idusuaborraregistro      -- numeric(20,0)         null
                                              ,fechaborraregistro       -- timestamp             null
                                              )
      values (nextval('deac_seq')                                        -- id                       numeric(20,0)     not null
             ,Vidasco                                                    -- idasco                   numeric(20,0)     not null
             ,i                                                          -- numero_linea             numeric(20,0)     not null
             ,Vidcuco                                                    -- idcuco                   numeric(20,0)     not null
             ,2                                                          -- idtiec                   numeric(20,0)     not null
             ,Vidgere                                                    -- idgere                   numeric(20,0)         null
             ,Vidproy                                                    -- idproy                   numeric(20,0)         null
             ,Vidline                                                    -- idline                   numeric(20,0)         null
             ,Vidceco                                                    -- idceco                   numeric(20,0)         null
             ,Vidtare                                                    -- idtare                   numeric(20,0)         null
             ,Vsum_totallinea                                            -- monto                    numeric(20,0)     not null
             ,'CONTABILIZACIÓN AUTOMÁTICA VENTAS ' || Vfecha_txt         -- glosadet                 varchar(100)      not null
             ,Pidusuacreaasiento                                         -- idusuacrearegistro       numeric(20,0)     not null
             ,current_timestamp                                          -- fechacrearegistro        timestamp         not null
             ,null                                                       -- idusuamodifregistro      numeric(20,0)         null
             ,null                                                       -- fechamodifregistro       timestamp             null
             ,null                                                       -- idusuaborraregistro      numeric(20,0)         null
             ,null                                                       -- fechaborraregistro       timestamp             null
             )
      ;
    end loop;
    close C_detalles_ventas;
    open C_ctas_ctbles_otros_conceptos;
    loop
      fetch C_ctas_ctbles_otros_conceptos into Vidcoca
                                              ,Vidcuco_otros_conceptos
                                              ;
      exit when not found;
      if    Vidcoca = 1 and Vimpuestosobligats != 0 then
        Vvalor_linea := Vimpuestosobligats;
        Vidtiec      := 2;
      elsif Vidcoca = 2 and Vimpuestosespecifs != 0 then
        Vvalor_linea := Vimpuestosespecifs;
        Vidtiec      := 2;
      elsif Vidcoca = 3 and Vtotal             != 0 then
        Vvalor_linea := Vtotal;
        Vidtiec      := 1;
      elsif Vidcoca = 6 and Vdescuentos        != 0 then
        Vvalor_linea := Vdescuentos;
        Vidtiec      := 2;
      else
        Vvalor_linea := 0;
      end if;
      if Vvalor_linea != 0 then
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
                                                ,glosadet                 -- varchar(100)      not null
                                                ,idusuacrearegistro       -- numeric(20,0)     not null
                                                ,fechacrearegistro        -- timestamp         not null
                                                ,idusuamodifregistro      -- numeric(20,0)         null
                                                ,fechamodifregistro       -- timestamp             null
                                                ,idusuaborraregistro      -- numeric(20,0)         null
                                                ,fechaborraregistro       -- timestamp             null
                                                )
        values (nextval('deac_seq')                                      -- id                       numeric(20,0)     not null
               ,Vidasco                                                  -- idasco                   numeric(20,0)     not null
               ,i                                                        -- numero_linea             numeric(20,0)     not null
               ,Vidcuco_otros_conceptos                                  -- idcuco                   numeric(20,0)     not null
               ,Vidtiec                                                  -- idtiec                   numeric(20,0)     not null
               ,Vidgere                                                  -- idgere                   numeric(20,0)         null
               ,Vidproy                                                  -- idproy                   numeric(20,0)         null
               ,Vidline                                                  -- idline                   numeric(20,0)         null
               ,Vidceco                                                  -- idceco                   numeric(20,0)         null
               ,Vidtare                                                  -- idtare                   numeric(20,0)         null
               ,Vvalor_linea                                             -- monto                    numeric(20,0)     not null
               ,'CONTABILIZACIÓN AUTOMÁTICA VENTAS ' || Vfecha_txt       -- glosadet                 varchar(100)      not null
               ,Pidusuacreaasiento                                       -- idusuacrearegistro       numeric(20,0)     not null
               ,current_timestamp                                        -- fechacrearegistro        timestamp         not null
               ,null                                                     -- idusuamodifregistro      numeric(20,0)         null
               ,null                                                     -- fechamodifregistro       timestamp             null
               ,null                                                     -- idusuaborraregistro      numeric(20,0)         null
               ,null                                                     -- fechaborraregistro       timestamp             null
               )
        ;
      end if;
    end loop;
    close C_ctas_ctbles_otros_conceptos;
    update ventas
    set    idasco = Vidasco
    where  id     = Vidvent
    ;
  end loop;
  close C_ventas_pdtes;
  return 'S;Contabilización ejecutada exitosamente';
end;
$body$ LANGUAGE plpgsql;

\q

update ventas
set    idasco = null
where  id     = 46
and    idasco is not null
;

update ventas
set    idesve = 2
where  id     = 46
;

select f_contabilizar_ventas(16, 'N' , 20200329, 20200329, 28);

\q

select exento, afecto, impuestosobligats, impuestosespecifs, montodescuento, total from vent where id = 8;

select correlativo, montodescuento1, montodescuento2, exento, afecto, impuestosobligats, impuestosespecifs, totallinea from deve where idvent = 8 order by 1;

select f_contabilizar_ventas(15, 'N' , 20200201, 20200201, 3);

select *
from   asco
where  id = (select max(id)
             from   asco
            )
;

select *
from   deac
where  idasco = (select max(id)
                 from   asco
                )
;








\q

delete from detalles_asientos_contables
;

delete from asientos_contables
;

select f_contabilizar_ventas(1, 'N' , 20200103, 20200103, 3);

select *
from   asco
;

select *
from   deac
;

\q

select cuco.cuenta_desplegable
      ,cuco.descripcion
      ,tiec.descripcion
      ,deac.monto
from   asco
      ,deac
      ,cuco
      ,tiec
where  asco.id     = deac.idasco
and    deac.idcuco = cuco.id
and    deac.idtiec = tiec.id
;

\q

