--drop trigger if exists trg_before_ins_upd_del_deve on detalles_ventas;

create trigger trg_before_ins_upd_del_deve before insert or update or delete on detalles_ventas
for each row
execute procedure f_validar_deve()
;

\q

