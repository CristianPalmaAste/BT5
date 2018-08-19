--drop trigger if exists trg_before_ins_upd_del_decv on detalles_cotizs_vtas;

create trigger trg_before_ins_upd_del_decv before insert or update or delete on detalles_cotizs_vtas
for each row
execute procedure f_validar_decv()
;

\q

