create trigger trg_before_upd_dove before update on documentos_ventas
for each row
execute procedure f_validar_dove()
;

\q

