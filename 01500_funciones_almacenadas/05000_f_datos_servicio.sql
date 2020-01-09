create or replace function f_datos_servicio (numeric
                                            ,numeric
                                            ) returns varchar as
$$
declare
  Pidserv                    numeric := $1;
  Pdato_deseado              numeric := $2;
  Vcod_familia               varchar(1000);
  Vcod_sub_familia           varchar(1000);
  Vorigen_servicio           varchar(1000);
  Vunidad_medida_servicio    varchar(1000);
  Vnombre_servicio           varchar(1000);
  Vpreciounitario            numeric;
  Vporcentajedescuento       numeric;
  Vidfapr                    numeric;
  Vidsfpr                    numeric;
  Vidpais                    numeric;
  Vidtise                    numeric;
  Vestaexento                varchar(1);
  Vimptos_obligat            numeric;
  Vimptos_especif            numeric;
  Vcod_alfanumerico_serv     varchar(100);
begin
  /*

     Esta función ha sido desarrollada para igualar lo que hace f_datos_producto. Retorna los sgtes. datos de un servicio:

     Flag   Dato retornado
     ----   -----------------
       1    familia -> null
       2    sub familia -> null
       3    unidad de medida
       4    origen -> null
       5    nombre
       6    precio
       7    descuento (expresado como %) -> null
       8    sumatoria de impuestos obligatorios a los que está afecto el servicio
       9    sumatoria de impuestos específicos a los que está afecto el servicio -> null
       10   "código alfanumérico" del servicio, esto es: familia + sub familia + correlativo en 4 dígitos -> null

  */
  if Pdato_deseado not between 1 and 10 then
    return(null);
  end if;
  if    Pdato_deseado between 1 and 5 then
    Vcod_familia     := null;
    Vcod_sub_familia := null;
    Vorigen_servicio := null;
    select unms.descripcioncorta
          ,serv.nombre
    into   Vunidad_medida_servicio
          ,Vnombre_servicio
    from   servicios                  serv
          ,unidades_medidas_servicios unms
    where  serv.idunms = unms.id
    and    serv.id     = Pidserv
    ;
    if    Pdato_deseado = 1 then
      return(Vcod_familia);
    elsif Pdato_deseado = 2 then
      return(Vcod_sub_familia);
    elsif Pdato_deseado = 3 then
      return(Vunidad_medida_servicio);
    elsif Pdato_deseado = 4 then
      return(Vorigen_servicio);
    elsif Pdato_deseado = 5 then
      return(Vnombre_servicio);
    end if;
  elsif Pdato_deseado = 6 then
    select preciounitario
    into   Vpreciounitario
    from   servicios
    where  id = Pidserv
    ;
    return(Vpreciounitario);
  elsif Pdato_deseado = 7 then
    return(0);
  elsif Pdato_deseado = 8 then
    select tise.estaexento
    into   Vestaexento
    from   servicios       serv
          ,tipos_servicios tise
    where  serv.idtise = tise.id
    and    serv.id     = Pidserv
    ;
    if Vestaexento = 'S' then
      return(0);
    else
      select empr.idpais
      into   Vidpais
      from   servicios serv
            ,empresas  empr
      where  serv.idempr = empr.id
      and    serv.id     = Pidserv
      ;
      select coalesce(sum(valor),0)
      into   Vimptos_obligat
      from   impuestos
      where  idpais      = Vidpais
      and    obligatorio = 'S'
      ;
      return(Vimptos_obligat);
    end if;
  elsif Pdato_deseado = 9 then
    Vimptos_especif := 0;
    return(Vimptos_especif);
  elsif Pdato_deseado = 10 then
    Vcod_alfanumerico_serv := null;
    return(Vcod_alfanumerico_serv);
  else
    return('-----');
  end if;
end;
$$ LANGUAGE plpgsql;

select f_datos_servicio(7,1)  "familia"                            ;
select f_datos_servicio(7,2)  "sub familia"                        ;
select f_datos_servicio(7,3)  "unidad de medida"                   ;
select f_datos_servicio(7,4)  "origen"                             ;
select f_datos_servicio(7,5)  "nombre"                             ;
select f_datos_servicio(7,6)  "precio"                             ;
select f_datos_servicio(7,7)  "descuento (expresado como %)"       ;
select f_datos_servicio(7,8)  "sumatoria de impuestos obligatorios";
select f_datos_servicio(7,9)  "sumatoria de impuestos específicos" ;
select f_datos_servicio(7,10) "código alfanumérico del servicio"   ;

\q

select f_datos_servicio(1,0)  "malo"                  ;
select f_datos_servicio(1,1)  "familia"               ;
select f_datos_servicio(1,2)  "sub familia"           ;
select f_datos_servicio(1,3)  "unidad de medida"      ;
select f_datos_servicio(1,4)  "origen"                ;
select f_datos_servicio(1,5)  "nombre"                ;
select f_datos_servicio(1,6)  "precio"                ;
select f_datos_servicio(1,7)  "descuento"             ;
select f_datos_servicio(1,8)  "impuestos obligatorios";
select f_datos_servicio(1,9)  "impuestos específicos" ;
select f_datos_servicio(1,10) "código alfanumérico"   ;
select f_datos_servicio(1,11) "malo"                  ;

