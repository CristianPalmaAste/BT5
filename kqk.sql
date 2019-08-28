alter table familias_productos drop constraint fapr_chk_01
;

alter table familias_productos add constraint fapr_chk_01 check (
                                                                 substr(cod_familia,1,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                 and
                                                                 substr(cod_familia,2,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                )
;

alter table sub_familias_productos drop constraint sfpr_chk_01
;

alter table sub_familias_productos add constraint sfpr_chk_01 check (
                                                                     substr(cod_sub_familia,1,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                     and
                                                                     substr(cod_sub_familia,2,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                    )
;

