create trigger trg_before_upd_requ before update on requisiciones
for each row
execute procedure f_validar_requ()
;

\q

