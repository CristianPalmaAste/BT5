create or replace function f_validar_uspe_ins_upd() returns trigger as
$body$
declare
  Vidgrem_via_usua   numeric;
  Vidgrem_via_uspe   numeric;
  aux                numeric;
  Vmensaje           varchar(1000);
begin
  -- Valido que el idusua que se esta insertando en uspe nos lleve a un grem igual con el que se inserta en uspe o el de la emrpesa de uspe
  --
  -- Por un lado:
  --
  -- +------+    +------+    +------+    +------+
  -- | GREM |---<| PERS |---<| USUA |---<| USPE |
  -- +------+    +------+    +------+    +------+
  --
  -- Por otro:
  --
  --             +------+
  --         +--<| USPE |
  --         |   +------+
  --         |        V
  --         |        |
  --         |        +---+
  --         |            |
  --       +------+    +------+
  --       | GREM |---<| EMPR |
  --       +------+    +------+
  --
  -- (uspe referencia a grem/empr vía un arco, es decir, a una de las 2)
  --
  select pers.idgrem
  into   Vidgrem_via_usua
  from   personas pers
        ,usuarios usua
  where  pers.id = usua.idpers
  and    usua.id = new.idusua
  ;
  if new.idgrem is not null then
    Vidgrem_via_uspe := new.idgrem;
  else
    select idgrem
    into   Vidgrem_via_uspe
    from   empresas
    where  id = new.idempr
    ;
  end if;
  if Vidgrem_via_usua = Vidgrem_via_uspe then
    aux := 1; /* esta es la situacion esperada, que el grem sea el mismo */
  else
    Vmensaje := 'Error: se esta registrando un usuario_perfil con un usuario de un holding hacia otro holding o empresa de otro holding';
    raise exception 'registro inválido'
    using hint = Vmensaje;
  end if;
  return new;
end;
$body$ LANGUAGE plpgsql;

\q

