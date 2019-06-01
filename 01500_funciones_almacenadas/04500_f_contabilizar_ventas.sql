create or replace function f_contabilizar_ventas(Pidempr       int
                                                ,Ptodas_S_N    varchar(1)
                                                ,Pfecha_ini    int
                                                ,Pfecha_fin    int
                                                ,Ptipo_asiento int) returns varchar as
$body$
/*
   Funcion que contabiliza ventas de una empresa
   Se puede contabilizar todas las ventas pendientes o no
   Si es no, se puede contabilizar las ventas dentro de un rango de fechas
   Se puede crear un asiento contable para todas las ventas involucradas o un asiento por cada venta o uno por dia (para todas las ventas de ese dia)
   Parametros:

   Pidempr      : id de la empresa
   Ptodas_S_N   : S si se desea contabilizar todas las ventas pendientes, N si no
   Pfecha_ini   : si Ptodas_S_N = N ==> fecha inicial desde cuando se desea contabillizar
   Pfecha_fin   : fecha final hasta cuando se desea contabillizar
   Ptipo_asiento: 1 = un asiento contable para todas las ventas involucradas
                  2 = un asiento por cada venta
                  3 = un asiento por dia (para todas las ventas de ese dia)

   Retorna "exito" si todo el proceso fue exitoso; de lo contrario, retorna un mensaje de error
*/
declare
  Vmensaje varchar(1000);
  aux      int;
  C_ventas_pdtes cursor for

aqui voy

    select afecto+exento      neto
          ,impuestosobligats  impuestosobligats
          ,impuestosespecifs  impuestosespecifs
          ,total              total
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
  if Ptipo_asiento is null then
    Vmensaje := 'El parámetro Ptipo_asiento es obligatorio';
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
  if Ptipo_asiento not in (1, 2, 3)  then
    Vmensaje := 'Los valores válidos para el parámetro Ptipo_asiento son 1, 2 o 3: ' || Ptipo_asiento || ' <- error';
    return(Vmensaje);
  end if;
  if Ptodas_S_N = 'S' and (Pfecha_ini != 0 or Pfecha_fin != 0) then
    Vmensaje := 'Si Ptodas_S_N = S entonces Pfecha_ini y Pfecha_fin deben ser 0';
    return(Vmensaje);
  end if;
  return 'exito';
end;
$body$ LANGUAGE plpgsql;

select f_contabilizar_ventas(1    , 'S' , 0       , 0       , 1   );
select f_contabilizar_ventas(null , null, null    , null    , null);
select f_contabilizar_ventas(1    , null, null    , null    , null);
select f_contabilizar_ventas(1    , 'S' , null    , null    , null);
select f_contabilizar_ventas(1    , 'S' , 1       , null    , null);
select f_contabilizar_ventas(1    , 'S' , 1       , 1       , null);
select f_contabilizar_ventas(12345, 'S' , 0       , 0       , 1   );
select f_contabilizar_ventas(1    , 'T' , 0       , 0       , 4   );
select f_contabilizar_ventas(1    , 'S' , 20190520, 20190515, 1   );
select f_contabilizar_ventas(1    , 'S' , 20190515, 20190520, 5   );
select f_contabilizar_ventas(1    , 'S' , 20190515, 20190520, 1   );
select f_contabilizar_ventas(1    , 'N' , 20190515, 20190520, 1   );

\q

