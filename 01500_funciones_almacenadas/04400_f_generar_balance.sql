drop function f_generar_balance (Pidsesion varchar(100)
                                ,Pidempr   numeric
                                )
;

create or replace function f_generar_balance (Pidsesion varchar(100)
                                             ,Pidempr   numeric
                                             ) returns numeric as
$$
declare
  Vidgrem             numeric;
  Vidcuco             numeric;
  Vsegmento1          varchar(100);
  Vsegmento2          varchar(100);
  Vsegmento3          varchar(100);
  Vsegmento4          varchar(100);
  Vsegmento5          varchar(100);
  Vsegmento6          varchar(100);
  Vsegmento7          varchar(100);
  Vsegmento8          varchar(100);
  Vdescripcion        varchar(1000);
  Vnro_segmentos      numeric;
  Vseparador_niveles  varchar(1);
  Vcuenta_contable    varchar(100);
  aux                 numeric;
  Vtotal              numeric;
  Vdebe_o_haber       varchar(1);
  i                   numeric;
  C_cuco cursor for
    select id
          ,segmento1
          ,segmento2
          ,segmento3
          ,segmento4
          ,segmento5
          ,segmento6
          ,segmento7
          ,segmento8
          ,descripcion
    from   cuentas_contables
    where  idgrem = Vidgrem
    order  by id
    ;
begin
  delete from tmp_balance
  where  fechacrearegistro < current_timestamp + '-1 days'
  ;
  delete from tmp_balance
  where  idsesion = Pidsesion
  ;
  i      := 0;
  Vtotal := 0;
  select idgrem
  into   Vidgrem
  from   empresas
  where  id = Pidempr
  ;
  open C_cuco;
  loop
    fetch C_cuco into Vidcuco
                     ,Vsegmento1
                     ,Vsegmento2
                     ,Vsegmento3
                     ,Vsegmento4
                     ,Vsegmento5
                     ,Vsegmento6
                     ,Vsegmento7
                     ,Vsegmento8
                     ,Vdescripcion
    ;
    exit when not found;
    i := i + 1;
    select valor
    into   Vnro_segmentos
    from   parametros
    where  idgrem      = Vidgrem
    and    nombrecorto = 'NROSEGMSCUCO'
    ;
    select valor
    into   Vseparador_niveles
    from   parametros
    where  idgrem      = Vidgrem
    and    nombrecorto = 'SEPNIVELES'
    ;
    if    Vnro_segmentos = 1 then
      Vcuenta_contable := Vsegmento1;
    elsif Vnro_segmentos = 2 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2;
    elsif Vnro_segmentos = 3 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2 || Vseparador_niveles || Vsegmento3;
    elsif Vnro_segmentos = 4 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2 || Vseparador_niveles || Vsegmento3 || Vseparador_niveles || Vsegmento4;
    elsif Vnro_segmentos = 5 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2 || Vseparador_niveles || Vsegmento3 || Vseparador_niveles || Vsegmento4
                                     || Vseparador_niveles || Vsegmento5;
    elsif Vnro_segmentos = 6 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2 || Vseparador_niveles || Vsegmento3 || Vseparador_niveles || Vsegmento4
                                     || Vseparador_niveles || Vsegmento5 || Vseparador_niveles || Vsegmento6;
    elsif Vnro_segmentos = 7 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2 || Vseparador_niveles || Vsegmento3 || Vseparador_niveles || Vsegmento4
                                     || Vseparador_niveles || Vsegmento5 || Vseparador_niveles || Vsegmento6 || Vseparador_niveles || Vsegmento7;
    elsif Vnro_segmentos = 8 then
      Vcuenta_contable := Vsegmento1 || Vseparador_niveles || Vsegmento2 || Vseparador_niveles || Vsegmento3 || Vseparador_niveles || Vsegmento4
                                     || Vseparador_niveles || Vsegmento5 || Vseparador_niveles || Vsegmento6 || Vseparador_niveles || Vsegmento7
                                     || Vseparador_niveles || Vsegmento8;
    end if;
    select sum(monto * case when idtiec = 1 then 1 else -1 end)
    into   aux
    from   periodos_contables          peco
          ,asientos_contables          asco
          ,detalles_asientos_contables deac
    where  peco.id     = asco.idpeco
    and    asco.id     = deac.idasco
    and    peco.idempr = Pidempr
    and    deac.idcuco = Vidcuco
    ;
    if aux is null then
      aux := 0;
    end if;
    Vtotal := Vtotal + aux;
    if aux < 0 then
      aux           := -1 * aux;
      Vdebe_o_haber := 'D';
    else
      Vtotal        := Vtotal + aux;
      Vdebe_o_haber := 'H';
    end if;
    insert into tmp_balance (idsesion                 -- varchar(100)      not null
                            ,correlativo              -- numeric(20,0)     not null
                            ,cuenta_contable          -- varchar(100)      not null
                            ,descrpcion_cuenta        -- varchar(1000)     not null
                            ,debe_o_haber             -- varchar(1)        not null
                            ,valor                    -- numeric(20,0)     not null
                            ,fechacrearegistro        -- timestamp         not null
                            )
    values (Pidsesion                    -- idsesion                 varchar(100)      not null
           ,i                            -- correlativo              numeric(20,0)     not null
           ,Vcuenta_contable             -- cuenta_contable          varchar(100)      not null
           ,Vdescripcion                 -- descrpcion_cuenta        varchar(1000)     not null
           ,Vdebe_o_haber                -- debe_o_haber             varchar(1)        not null
           ,aux                          -- valor                    numeric(20,0)     not null
           ,current_timestamp            -- fechacrearegistro        timestamp         not null
           )
    ;
  end loop;
  return(Vtotal);
end;
$$ LANGUAGE plpgsql;


\q
delete from tmp_balance
;

select f_generar_balance ('12345', 1);

select *
from   tmp_balance
where  idsesion = '12345'
;

