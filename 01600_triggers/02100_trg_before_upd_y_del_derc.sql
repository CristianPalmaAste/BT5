create trigger trg_before_upd_y_del_derc before update or delete on detalles_recepciones_compras
for each row
execute procedure f_impedir_upd_y_del_en_derc()
;

\q

