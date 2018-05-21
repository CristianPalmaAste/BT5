create trigger trg_before_upd_y_del_deve before update or delete on detalles_ventas
for each row
execute procedure f_impedir_upd_y_del_en_deve()
;

\q

