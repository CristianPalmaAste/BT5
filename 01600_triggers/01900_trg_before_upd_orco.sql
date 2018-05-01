create trigger trg_before_upd_orco before update on ordenes_compras
for each row
execute procedure f_validar_orco()
;

\q

