create or replace function f_puede_borrar_registro (Ptabla varchar(100)
                                                   ,Pid    numeric
                                                   ) returns varchar(100) as
$$
declare
  Vtabla                  varchar(100);
  Valias_tabla            varchar(100);
  Valias_tabla_referencia varchar(100);
  Vquery                  varchar(1000);
  aux                     numeric;
  C_tablas_referencian cursor for
    select lower(substr(constraint_name,1,4))
    from   information_schema.referential_constraints
    where  constraint_name like '%' || Valias_tabla
    ;
begin
  Vtabla := lower(Ptabla);
  if length(Ptabla) != 4 then
    select lower(substr(constraint_name,1,4))
    into   Valias_tabla
    from   information_schema.table_constraints
    where  lower(table_name)      = Vtabla
    and    lower(constraint_type) = 'primary key'
    ;
  else
    Valias_tabla := Vtabla;
  end if;
  open C_tablas_referencian;
  loop
    fetch C_tablas_referencian into Valias_tabla_referencia;
    exit when not found;
    Vquery := 'select count(*) from ' || Valias_tabla_referencia || ' where  id = ' || Pid;
    execute Vquery into aux;
    if aux > 0 then
      return('N');
    end if;
  end loop;
  close C_tablas_referencian;
  return('S');
end;
$$ LANGUAGE plpgsql;

select f_puede_borrar_registro('PERSONAS', 1 );
select f_puede_borrar_registro('personas', 0 );
select f_puede_borrar_registro('sfpr'    , 1 );
select f_puede_borrar_registro('SFPR'    , 0 );
select f_puede_borrar_registro('desu'    , 1 );

