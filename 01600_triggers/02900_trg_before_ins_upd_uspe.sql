create trigger trg_before_ins_upd_uspe before insert or update on usuarios_perfiles
for each row
execute procedure f_validar_uspe_ins_upd()
;

\q

