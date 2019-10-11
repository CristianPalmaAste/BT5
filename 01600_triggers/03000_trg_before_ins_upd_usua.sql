drop trigger if exists trg_before_ins_upd_usua on usuarios
;

create trigger trg_before_ins_upd_usua before insert or update on usuarios
for each row
execute procedure f_validar_estructura_username()
;

select * from usua where id=10;

update usuarios
set    username = '45CPALMAA_123<>'
where  id       = 10
;

select * from usua where id=10;

update usuarios
set    username = '67CPALMAA_123'
where  id       = 10
;

select * from usua where id=10;

\q

