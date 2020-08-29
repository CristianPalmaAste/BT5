create trigger trg_after_ins_derc after insert on detalles_recepciones_compras
for each row
execute procedure f_aumentar_stock_x_reco_y_actualizar_deoc()
;

\q

