create trigger trg_before_ins_reco before insert on recepciones_compras
for each row
execute procedure f_validar_reco()
;

\q

