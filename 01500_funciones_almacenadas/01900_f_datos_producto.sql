create or replace function f_datos_producto (numeric
                                            ,numeric
                                            ) returns varchar as
$$
declare
  Pidprod          numeric := $1;
  Pdato_deseado    numeric := $2;
  aux              numeric;
begin


if      Pdato_deseado = 1 then
return('01');
elsif Pdato_deseado = 2 then
return('01');
elsif Pdato_deseado = 3 then
return('UN');
elsif Pdato_deseado = 4 then
return('NAC');
elsif Pdato_deseado = 5 then
return('COCA COLA');
else
return('-----');
end if;


  /*
     Esta función retorna los sgtes. datos de un producto:

     Flag   Dato retornado
     ----   -----------------
       1    familia
       2    sub familia
       3    unidad de medida
       4    origen
       5    nombre

  */
end;
$$ LANGUAGE plpgsql;

select 'familia         : ' || f_datos_producto(1, 1);
select 'sub familia     : ' || f_datos_producto(1, 2);
select 'unidad de medida: ' || f_datos_producto(1, 3);
select 'origen          : ' || f_datos_producto(1, 4);
select 'nombre          : ' || f_datos_producto(1, 5);
select 'otro dato       : ' || f_datos_producto(1, 6);

