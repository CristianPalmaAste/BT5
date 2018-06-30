create or replace function p_buscar_fks_faltan() returns varchar(1) as
$$
declare
  C_campos_id cursor for
    select table_name
          ,column_name
    from   information_schema.columns
    where  table_catalog      = 'erp_bt5_test1'
    and    column_name        like 'id%'
    and    column_name        not like 'identificador%'
    and    ordinal_position   != 1
    and    table_name         not like '%v'
    and    length(table_name) != 4
    and    table_schema       = 'public'
    order  by table_name
             ,column_name
    ;
  Vtable_name  varchar(100);
  Vcolumn_name varchar(100);
  aux          numeric;
begin
  open C_campos_id;
  loop
    fetch C_campos_id into Vtable_name
                          ,Vcolumn_name
                          ;
    exit when not found;
    select count(*)
    into   aux
    from   information_schema.key_column_usage
    where  constraint_name like '%_fk_%'
    and    table_name      = Vtable_name
    and    column_name     = Vcolumn_name
    ;
    if aux != 1 then
      raise notice 'table_name: %; column_name: %', Vtable_name, Vcolumn_name;
    end if;
  end loop;
  close C_campos_id;
  return('1');
end;
$$ LANGUAGE plpgsql;

select p_buscar_fks_faltan();

