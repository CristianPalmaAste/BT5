create trigger trg_before_upd_rega before update on rendiciones_gastos
for each row
execute procedure f_validar_rega_upd()
;

\q

