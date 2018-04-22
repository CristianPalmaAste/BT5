create trigger trg_before_ins_requ before insert on requisiciones
for each row
execute procedure f_validar_requ_ins()
;

\q

