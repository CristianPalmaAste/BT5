create trigger trg_after_upd_requ after update on requisiciones
for each row
execute procedure f_copiar_requ_a_orco()
;

\q

