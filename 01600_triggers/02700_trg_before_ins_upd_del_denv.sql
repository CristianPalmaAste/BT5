\q

Borrado

--drop trigger if exists trg_before_ins_upd_del_denv on detalles_notas_vtas;

create trigger trg_before_ins_upd_del_denv before insert or update or delete on detalles_notas_vtas
for each row
execute procedure f_validar_denv()
;

\q

