create trigger trg_before_ins_rega before insert on rendiciones_gastos
for each row
execute procedure f_validar_rega_ins()
;

\q

