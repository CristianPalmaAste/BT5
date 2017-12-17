create trigger trg_before_ins_dove before insert on documentos_ventas
for each row
execute procedure f_validar_dove_ins()
;

\q

