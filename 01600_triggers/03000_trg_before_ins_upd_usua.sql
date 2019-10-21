create trigger trg_before_ins_upd_usua before insert or update on usuarios
for each row
execute procedure f_validar_estructura_username()
;

\q

