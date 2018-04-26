create trigger trg_after_ins_unte after insert on unidades_territoriales
for each row
execute procedure f_poblar_unte_profundidad()
;

\q

