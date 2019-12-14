create or replace function f_contabilizar_compras(Pidempr            int
                                                 ,Ptodas_S_N         varchar(1)
                                                 ,Pfecha_ini         int
                                                 ,Pfecha_fin         int
                                                 ,Pidusuacreaasiento int) returns varchar as
$body$
/*
   Funcion que contabiliza compras de una empresa
   Se puede contabilizar todas las compras pendientes o no
   Si es no, se puede contabilizar las compras dentro de un rango de fechas
   Se puede crear un asiento contable para todas las compras involucradas o un asiento por cada compra o uno por dia (para todas las compras de ese dia)
   Parametros:

   Pidempr           : id de la empresa
   Ptodas_S_N        : S si se desea contabilizar todas las compras pendientes, N si no
   Pfecha_ini        : si Ptodas_S_N = N ==> fecha inicial desde cuando se desea contabillizar
   Pfecha_fin        : fecha final hasta cuando se desea contabillizar
   Pidusuacreaasiento: id del usuario que ejecuta la contabilización de compras y con ello crea el asiewnto contable

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
  Vneto                           numeric;
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
  Vservicios                      numeric;
  Votras_compras                  numeric;
/*
  C_compras_pdtes cursor for
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
    from   documentos_compras
    where  idempr                                                  = Pidempr
    and    (Ptodas_S_N                                             = 'S'
            or
            (
             Ptodas_S_N                                            = 'N'
             and
             cast(trim(to_char(fechacompra,'yyyymmdd')) as integer) between Pfecha_ini and Pfecha_fin
            )
           )
    and    idesve                                                  = 2
    and    idasco                                                  is null
    ;
  C_detalles_compras cursor for
    select sfpr.idcuco                    idcuco
          ,sum(deve.afecto + deve.exento) sum_totallinea
    from   detalles_compras        deve
          ,productos              prod
          ,sub_familias_productos sfpr
    where  deve.idprod = prod.id
    and    prod.idsfpr = sfpr.id
    and    deve.idvent = Vidvent
    group  by sfpr.idcuco
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
*/
begin
  /* Validaciones a la invocación a esta función */
  if Pidempr is null then
    Vmensaje := 'N;El parámetro empresa es obligatorio';
    return(Vmensaje);
  end if;
  if Ptodas_S_N is null then
    Vmensaje := 'N;El parámetro Ptodas_S_N es obligatorio';
    return(Vmensaje);
  end if;
  if Pfecha_ini is null then
    Vmensaje := 'N;El parámetro Pfecha_ini es obligatorio';
    return(Vmensaje);
  end if;
  if Pfecha_fin is null then
    Vmensaje := 'N;El parámetro Pfecha_fin es obligatorio';
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
    Vmensaje := 'N;El parámetro Pidempr no existe en la tabla empresas';
    return(Vmensaje);
  end if;
  if Ptodas_S_N not in ('S', 'N')  then
    Vmensaje := 'N;Los valores válidos para el parámetro Ptodas_S_N son S o N: ' || Ptodas_S_N || ' <- error';
    return(Vmensaje);
  end if;
  if Pfecha_ini > Pfecha_fin then
    Vmensaje := 'N;Fecha inicial debe ser menor o igual que fecha final';
    return(Vmensaje);
  end if;
  if Ptodas_S_N = 'S' and (Pfecha_ini != 0 or Pfecha_fin != 0) then
    Vmensaje := 'N;Si Ptodas_S_N = S entonces Pfecha_ini y Pfecha_fin deben ser 0';
    return(Vmensaje);
  end if;
return('S;Contabilización ejecutada exitosamente');
/*
  open C_compras_pdtes;
  loop
    fetch C_compras_pdtes into Vidvent
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
      Vmensaje := 'N;No hay un período contable abierto para esta empresa';
      return(Vmensaje);
    end if;
    select max(numero_asiento)
    into   Vnumero_asiento
    from   asientos_contables
    where  idpeco = Vidpeco
    and    idtiac = 3
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
    values (Vidasco                                                                         -- id                       numeric(20,0)     not null
           ,Vidpeco                                                                         -- idpeco                   numeric(20,0)     not null
           ,3                                                                               -- idtiac                   numeric(20,0)     not null
           ,1                                                                               -- idesac                   numeric(20,0)     not null
           ,Vnumero_asiento                                                                 -- numero_asiento           numeric(20,0)     not null
           ,'CONTABILIZACIÓN AUTOMÁTICA compraS ' || to_char(current_timestamp,'dd-mm-yyyy') -- glosa                    varchar(100)      not null
           ,current_timestamp                                                               -- fecha_asiento            date              not null
           ,'N'                                                                             -- reversible               varchar(1)        not null
           ,Pidusuacreaasiento                                                              -- idusuacreaasiento        numeric(20,0)     not null
           ,null                                                                            -- idusuaautorizaasiento    numeric(20,0)         null
           ,Pidusuacreaasiento                                                              -- idusuacrearegistro       numeric(20,0)     not null
           ,current_timestamp                                                               -- fechacrearegistro        timestamp         not null
           ,null                                                                            -- idusuamodifregistro      numeric(20,0)         null
           ,null                                                                            -- fechamodifregistro       timestamp             null
           ,null                                                                            -- idusuaborraregistro      numeric(20,0)         null
           ,null                                                                            -- fechaborraregistro       timestamp             null
           )
    ;
    i := 0;
    open C_detalles_compras;
    loop
      fetch C_detalles_compras into Vidcuco
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
      values (nextval('deac_seq')                                                             -- id                       numeric(20,0)     not null
             ,Vidasco                                                                         -- idasco                   numeric(20,0)     not null
             ,i                                                                               -- numero_linea             numeric(20,0)     not null
             ,Vidcuco                                                                         -- idcuco                   numeric(20,0)     not null
             ,2                                                                               -- idtiec                   numeric(20,0)     not null
             ,Vidgere                                                                         -- idgere                   numeric(20,0)         null
             ,Vidproy                                                                         -- idproy                   numeric(20,0)         null
             ,Vidline                                                                         -- idline                   numeric(20,0)         null
             ,Vidceco                                                                         -- idceco                   numeric(20,0)         null
             ,Vidtare                                                                         -- idtare                   numeric(20,0)         null
             ,Vsum_totallinea                                                                 -- monto                    numeric(20,0)     not null
             ,'CONTABILIZACIÓN AUTOMÁTICA compraS ' || to_char(current_timestamp,'dd-mm-yyyy') -- glosadet                 varchar(100)      not null
             ,Pidusuacreaasiento                                                              -- idusuacrearegistro       numeric(20,0)     not null
             ,current_timestamp                                                               -- fechacrearegistro        timestamp         not null
             ,null                                                                            -- idusuamodifregistro      numeric(20,0)         null
             ,null                                                                            -- fechamodifregistro       timestamp             null
             ,null                                                                            -- idusuaborraregistro      numeric(20,0)         null
             ,null                                                                            -- fechaborraregistro       timestamp             null
             )
      ;
    end loop;
    close C_detalles_compras;
    update compras
    set    idasco = Vidasco
    where  id     = Vidvent
    ;
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
      elsif Vidcoca = 4 and Vservicios         != 0 then
        Vvalor_linea := Vservicios;
        Vidtiec      := 2;
      elsif Vidcoca = 5 and Votras_compras      != 0 then
        Vvalor_linea := Votras_compras;
        Vidtiec      := 2;
      elsif Vidcoca = 6 and Vdescuentos        != 0 then
        Vvalor_linea := Vdescuentos;
        Vidtiec      := 2;
      else
        Vvalor_linea := 0;
        Vidtiec      := 2;
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
        values (nextval('deac_seq')                                -- id                       numeric(20,0)     not null
               ,Vidasco                                            -- idasco                   numeric(20,0)     not null
               ,i                                                  -- numero_linea             numeric(20,0)     not null
               ,Vidcuco_otros_conceptos                            -- idcuco                   numeric(20,0)     not null
               ,Vidtiec                                            -- idtiec                   numeric(20,0)     not null
               ,Vidgere                                            -- idgere                   numeric(20,0)         null
               ,Vidproy                                            -- idproy                   numeric(20,0)         null
               ,Vidline                                            -- idline                   numeric(20,0)         null
               ,Vidceco                                            -- idceco                   numeric(20,0)         null
               ,Vidtare                                            -- idtare                   numeric(20,0)         null
               ,Vvalor_linea                                       -- monto                    numeric(20,0)     not null
               ,'DETALLA CONTAB. AUT. compraS, LÍNEA ' || i         -- glosadet                 varchar(100)      not null
               ,Pidusuacreaasiento                                 -- idusuacrearegistro       numeric(20,0)     not null
               ,current_timestamp                                  -- fechacrearegistro        timestamp         not null
               ,null                                               -- idusuamodifregistro      numeric(20,0)         null
               ,null                                               -- fechamodifregistro       timestamp             null
               ,null                                               -- idusuaborraregistro      numeric(20,0)         null
               ,null                                               -- fechaborraregistro       timestamp             null
               )
        ;
      end if;
    end loop;
    close C_ctas_ctbles_otros_conceptos;
  end loop;
  close C_compras_pdtes;
  return 'S;Contabilización ejecutada exitosamente';
*/
end;
$body$ LANGUAGE plpgsql;

update documentos_compras
set    idasco = null
;

select f_contabilizar_compras(1, 'N', 20191214, 20191214, 3);

\q

select *
from   asco
;

select *
from   deac
;


