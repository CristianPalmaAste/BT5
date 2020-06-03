create trigger trg_after_ins_deco after insert on detalles_compras
for each row
execute procedure f_aumentar_stock_x_comp()
;

\q

