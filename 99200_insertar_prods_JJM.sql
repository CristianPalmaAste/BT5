set client_min_messages to error;

drop table if exists tmp_prods_JJM 
;

create table tmp_prods_JJM (
   empresa                      varchar(1000)
  ,descripcion                  varchar(1000)
  ,familia                      varchar(1000)
  ,sub_familia                  varchar(1000)
  ,tipo_de_producto             varchar(1000)
  ,origen                       varchar(1000)
  ,unidad_de_medida             varchar(1000)
  ,peso_unitario                varchar(1000)
  ,sku                          varchar(1000)
  ,ean13                        varchar(1000)
  ,qr                           varchar(1000)
)
;

insert into tmp_prods_JJM values ('14', 'AUTOMATICO LEGRAND 6 AMP', '01', '10', '18', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BOMBA DAB 35/180', '01', '07', '19', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BOMBA DAB 55/180', '01', '07', '19', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BOMBA DAB 65/130', '01', '07', '19', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BOMBA GRUNDFOS UPS 25-55 180', '01', '07', '19', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 1/2 X  1 1/4', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 1/2 X 1  ', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 1/2 X 3/4', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 1/4 X 1', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 1/4 X 1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 X 1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 X 3/4', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 X 3/4 BRONCE', '01', '11', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1 X 3/8', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 1/2 X 1/4', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 2 X 1', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING 3/4 X 1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING BRONCE 1/2 X 3/8', '01', '11', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'BUSHING DE 3/8 X 1/4', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1 1/2 SO 1 1/2 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1 1/4 SO 1 1/4 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1 X 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2 HE X 3/4 TUERCA MOVIL', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2 SO 3/4 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2 SO 3/8 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2 SO 3/8 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 1/2 X 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 16 X 1/2 SO', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 16 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 20 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 25 X 25', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/4 HI X 1 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/4 SO 1/2 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/4 SO X 3/4 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/4 X 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/8 SO 3/8 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 3/8 SO 3/8 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO 32 X 32', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO BASE FIJACION 25 X 3/4 HI ', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO PVC 1 HI X 3/4 HI', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO TERMINAL 16 X 1/2 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO TERMINAL 16 X 1/2 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO TERMINAL 20 X 3/4 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO TERMINAL 25 X 3/4 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'CODO TERMINAL EUROCONO 20 X 3/4 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COLA A MANGUERA 1/2 X 1/2 SO', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1 1/2 X 1  ', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1 1/2 X 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1 1/2 X 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1/2 HI X 3/8 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1/2 X 3/4 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 1/2 X 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 2 1/2 X 2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 2 X 1 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 3/4  ', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 3/4 X 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA 3/8 X 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA HI 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA HI 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA HI 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'COPLA SO 1 X 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'FLEXIBLE 3/4', '01', '06', '20', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'HILO 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'HILO 1 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'HILO 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'HILO 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'HILO 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'HILO 3/4 HI 3/4 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE 1/2 SO SO', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE ANGULAR CALDERA 1/2 HE 1/2 TUERCA MOVIL', '01', '06', '20', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE BOLA 1 HI HI', '01', '12', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE BOLA 1/2 HI HI', '01', '12', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE DE BOLA 1 1/4 HI', '01', '12', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE DE BOLA 3/4 HI', '01', '12', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'LLAVE JARDIN 1/2 HE', '01', '12', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MACHON 1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MACHON 3/4', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 20 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 25', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 25 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 25 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'MANGUITO 32', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'NIPLE 1  ', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'NIPLE 1 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'NIPLE 1/2 X 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'NIPLE 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'PURGADOR AUTOMATICO 1/4', '01', '06', '17', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'PURGADOR AUTOMATICO 3/8', '01', '06', '17', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'PURGADOR AUTOMATICO RINNAI RB', '01', '03', '17', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO BRONCE 3/4', '01', '11', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO FE  1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO FE 1', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO FE 1 1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO PVC 1 ', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO PVC 1/2', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO PVC 3/4', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO SO 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO SO 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO SO 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO SO 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA GORRO SOLDAR 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO 1 1/2 BRONCE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO 2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO BRONCE 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO BRONCE 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO FE 1/2', '01', '09', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILLO PVC 3/4', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPA TORNILO PVC 1/2', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPON 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TAPON 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1 1/2 X 1/2 X 1 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1 1/4 X 1 X 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1 1/4 X 1/2 X 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1 1/4 X 3/4 X 1 1/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1 X 1/2 X 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1 X 3/4 X 1', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1/2 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1/2 X 3/4 X 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 1/2 X 3/8 X 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 16 X 16 X 16', '01', '05', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 2 X 1/2 X 2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 20 X 16 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 20 X 16 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 20 X 25 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 20 X 25 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X 16 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X 16 X 25 ', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X 20 X 25', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X 20 X20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X 25 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X 25 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 25 X25 X25', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 3/4 X 1 X 3/4', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 3/4 X 1/2 X 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 3/4 X 3/4 X 1/2', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 3/8', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 32 X 20 X 32', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 32 X 32 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE 32 X 32 X 32', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE DE 1/2 X 1/2 X 3/8', '01', '05', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE DE 20 X 25 X 16', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TEE DE 32 X 20 X 20', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1 1/2 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1 1/4 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1/2 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1/2 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1/2 SO 3/4 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1/2 SO 3/4 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 1/2 SO 3/8 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 20 X 1/2 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 20 X 1/2 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 20 X 3/4 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 20X 3/4 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 25 X 3/4 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 25 X 3/4 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 3/4 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 3/4 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 3/4 SO 1/2 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 3/4 SO 1/2 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 3/8 HE', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 3/8 HI ', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 32 X 1 1/4 HI ', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 32 X 1 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL 32 X 1 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL EUROCONO 20 X 3/4 HI', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL EUROCONO 25 X 3/4 HE', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL TUERCA MOVIL 16 1/2 HI ', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL TUERCA MOVIL 20 X 1/2', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL TUERCA MOVIL 25 X 3/4', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMINAL TUERCA MOVIL 32 X 1 1/4', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMOSTATO ATP 1', '01', '06', '20', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMOSTATO PROGRAMABLE FLORENCIA', '01', '06', '20', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMOSTATO SIMPLE ANWO', '01', '06', '20', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'TERMOSTATO SPDT HONEYWELL', '01', '06', '20', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'UNION AMERICANA 1 1/4 HI', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'UNION AMERICANA 1/2 SO SO', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'UNION AMERICANA 3/4 SO SO', '01', '05', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'UNION AMERICANA PVC 32', '01', '08', '16', '1', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'UNION PEX 16 X 1/2 SO', '01', '04', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA DE RETENCION 1  ', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA DE RETENCION 1 1/4', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA LLENADO AUTOMATICO 1/2', '01', '06', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA MEZCLADORA 3 VIAS 1', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA MOTORIZADA DE RESORTE 3/4', '01', '06', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA REGULADORA DE PRESION 1/2', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA RETENCION 1 1/2', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA RETENCION 1/2', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA RETENCION 3/4', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA RETENCION HORIZONTAL 1 1/4', '01', '12', '16', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA SEGURIDAD 3 BAR 1/2 HI', '01', '06', '17', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA SEGURIDAD 3 BAR 3/4 HI', '01', '06', '17', '2', '9', '0.1');
insert into tmp_prods_JJM values ('14', 'VALVULA SEGURIDAD 7 BAR 1/2 HE', '01', '06', '17', '2', '9', '0.1');

create or replace function f_prods_JJM () returns varchar(1) as
$$
declare
  C_prods_JJM cursor for
    select *
    from   tmp_prods_JJM
    ;
  Vempresa                      varchar(1000);
  Vdescripcion                  varchar(1000);
  Vfamilia                      varchar(1000);
  Vsub_familia                  varchar(1000);
  Vtipo_de_producto             varchar(1000);
  Vorigen                       varchar(1000);
  Vunidad_de_medida             varchar(1000);
  Vpeso_unitario                varchar(1000);
  Vsku                          varchar(1000);
  Vean13                        varchar(1000);
  Vqr                           varchar(1000);
  Vidsfpr                       int;
  Vcorrelativoflia              int;
  Acorrelativoflia              varchar(1000);
  aux1                          varchar(1000);
begin
  open C_prods_JJM;
  loop
    fetch C_prods_JJM into Vempresa
                          ,Vdescripcion
                          ,Vfamilia
                          ,Vsub_familia
                          ,Vtipo_de_producto
                          ,Vorigen
                          ,Vunidad_de_medida
                          ,Vpeso_unitario
                          ,Vsku
                          ,Vean13
                          ,Vqr
                          ;
    exit when not found;
    select sfpr.id
    into   Vidsfpr
    from   familias_productos     fapr
          ,sub_familias_productos sfpr
    where  fapr.id              = sfpr.idfapr
    and    fapr.idempr          = 14
    and    fapr.cod_familia     = Vfamilia
    and    sfpr.cod_sub_familia = Vsub_familia
    ;
    select max(cast(correlativoflia as integer))
    into   Vcorrelativoflia
    from   productos
    where  idempr = 14
    and    idsfpr = Vidsfpr
    ;
    if Vcorrelativoflia is null then
      Vcorrelativoflia := 1;
    else
      Vcorrelativoflia := Vcorrelativoflia + 1;
    end if;
    Acorrelativoflia := ltrim(rtrim(to_char(Vcorrelativoflia,'0009')));
    insert into productos values (nextval('prod_seq')                   --  id                  | numeric(20,0)               |
                                 ,14                                    --  idempr              | numeric(20,0)               |
                                 ,Vidsfpr                               --  idsfpr              | numeric(20,0)               |
                                 ,cast(Vtipo_de_producto as integer)    --  idtipr              | numeric(20,0)               |
                                 ,cast(Vunidad_de_medida as integer)    --  idunmp              | numeric(20,0)               |
                                 ,cast(Vorigen as integer)              --  idorpr              | numeric(20,0)               |
                                 ,Vdescripcion                          --  nombre              | character varying(1000)     |
                                 ,Acorrelativoflia                      --  correlativoflia     | character varying(4)        |
                                 ,Vsku                                  --  sku                 | character varying(1000)     |
                                 ,Vean13                                --  ean13               | character varying(1000)     |
                                 ,Vqr                                   --  qr                  | character varying(1000)     |
                                 ,cast(Vpeso_unitario as numeric)       --  pesounitariokg      | numeric(20,2)               |
                                 ,1                                     --  idesre              | numeric(20,0)               |
                                 ,16                                    --  idusuacrearegistro  | numeric(20,0)               |
                                 ,current_timestamp                     --  fechacrearegistro   | timestamp without time zone |
                                 ,null                                  --  idusuamodifregistro | numeric(20,0)               |
                                 ,null                                  --  fechamodifregistro  | timestamp without time zone |
                                 ,null                                  --  idusuaborraregistro | numeric(20,0)               |
                                 ,null                                  --  fechaborraregistro  | timestamp without time zone |
                                 )
    ;
  end loop;
  close C_prods_JJM;
  return('S');
end;
$$ LANGUAGE plpgsql;

select f_prods_JJM();

drop function f_prods_JJM ();

drop table if exists tmp_prods_JJM 
;

\q
