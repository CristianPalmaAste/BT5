drop trigger if exists trg_after_upd_nove on notas_ventas
;

create trigger trg_after_upd_nove after update on notas_ventas
for each row
execute procedure f_copiar_nove_a_vent()
;

\q

