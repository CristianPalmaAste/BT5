set client_min_messages to warning;

/*************************************************************************************************************************/

create table grupos_empresariales (
   id                       numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,alias                    varchar(10)     not null
  ,icono                    varchar(100)        null
  ,idpais                   numeric(20,0)   not null
  ,idesge                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table grupos_empresariales add constraint grem_pk primary key (id)
;

alter table grupos_empresariales add constraint grem_uk_01 unique (nombre)
;

alter table grupos_empresariales add constraint grem_uk_02 unique (alias)
;

/*************************************************************************************************************************/

create table empresas (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,idrubr                   numeric(20,0)   not null
  ,idesre                   numeric(20,0)   not null
  ,identificador1           varchar(50)     not null
  ,identificador2           varchar(50)     not null
  ,razonsocial              varchar(100)    not null
  ,nombrefantasia           varchar(100)    not null
  ,icono                    varchar(100)        null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
  ,xfld                     varchar(250)        null
)
;

alter table empresas add constraint empr_pk primary key (id)
;

alter table empresas add constraint empr_uk_01 unique (identificador1)
;

alter table empresas add constraint empr_uk_02 unique (idgrem, razonsocial)
;

alter table empresas add constraint empr_uk_03 unique (idgrem, nombrefantasia)
;

/*************************************************************************************************************************/

create table parametros (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,nombrecorto              varchar(50)     not null
  ,nombrelargo              varchar(500)    not null
  ,descripcion              varchar(1000)   not null
  ,valor                    varchar(500)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table parametros add constraint para_pk primary key (id)
;

alter table parametros add constraint para_uk_01 unique (idgrem, nombrecorto)
;

alter table parametros add constraint para_uk_02 unique (idgrem, nombrelargo)
;

/*************************************************************************************************************************/

create table parametros_empresas (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombrecorto              varchar(50)     not null
  ,nombrelargo              varchar(500)    not null
  ,descripcion              varchar(1000)   not null
  ,valor                    varchar(500)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table parametros_empresas add constraint paem_pk primary key (id)
;

alter table parametros_empresas add constraint paem_uk_01 unique (idempr, nombrecorto)
;

alter table parametros_empresas add constraint paem_uk_02 unique (idempr, nombrelargo)
;

/*************************************************************************************************************************/

create table estados_grem (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_grem add constraint esge_pk primary key (id)
;

alter table estados_grem add constraint esge_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table rubros (
   id                       numeric(20,0)   not null
  ,codigoalfanum            varchar(50)     not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table rubros add constraint rubr_pk primary key (id)
;

alter table rubros add constraint rubr_uk_01 unique (codigoalfanum)
;

alter table rubros add constraint rubr_uk_02 unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_registros (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_registros add constraint esre_pk primary key (id)
;

alter table estados_registros add constraint esre_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table valores_paises (
   id                       numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,nombrecorto              varchar(10)     not null
  ,nombrelargo              varchar(500)    not null
  ,descripcion              varchar(1000)   not null
  ,valor                    varchar(1000)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table valores_paises add constraint vapa_pk primary key (id)
;

alter table valores_paises add constraint vapa_uk_01 unique (idpais, nombrecorto)
;

alter table valores_paises add constraint vapa_uk_02 unique (idpais, nombrelargo)
;

/*************************************************************************************************************************/

create table monedas (
   id                       numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,nombrecorto              varchar(10)     not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table monedas add constraint mone_pk primary key (id)
;

alter table monedas add constraint mone_uk_01 unique (nombre)
;

alter table monedas add constraint mone_uk_02 unique (nombrecorto)
;

/*************************************************************************************************************************/

create table gerencias (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table gerencias add constraint gere_pk primary key (id)
;

alter table gerencias add constraint gere_uk_01 unique (idempr, nombre)
;

/*************************************************************************************************************************/

create table proyectos (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table proyectos add constraint proy_pk primary key (id)
;

alter table proyectos add constraint proy_uk_01 unique (idempr, nombre)
;

/*************************************************************************************************************************/

create table lineas_negocios (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table lineas_negocios add constraint line_pk primary key (id)
;

alter table lineas_negocios add constraint line_uk_01 unique (idempr, nombre)
;

/*************************************************************************************************************************/

create table centros_costos (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table centros_costos add constraint ceco_pk primary key (id)
;

alter table centros_costos add constraint ceco_uk_01 unique (idempr, nombre)
;

/*************************************************************************************************************************/

create table tareas (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tareas add constraint tare_pk primary key (id)
;

alter table tareas add constraint tare_uk_01 unique (idempr, nombre)
;

/*************************************************************************************************************************/

create table paises (
   id                       numeric(20,0)   not null
  ,nombre                   varchar(100)    not null
  ,idmone                   numeric(20,0)   not null
  ,nacionalidad             varchar(100)    not null
  ,profund_unids_territ     numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table paises add constraint pais_pk primary key (id)
;

alter table paises add constraint pais_uk_01 unique (nombre)
;

alter table paises add constraint pais_uk_02 unique (idmone)
;

alter table paises add constraint pais_uk_03 unique (nacionalidad)
;

/*************************************************************************************************************************/

create table personas (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,identificador1           varchar(50)     not null
  ,identificador2           varchar(50)     not null
  ,primernombre             varchar(100)    not null
  ,segundonombre            varchar(100)        null
  ,apellidopaterno          varchar(100)    not null
  ,apellidomaterno          varchar(100)        null
  ,email                    varchar(100)        null
  ,fechanac                 date                null
  ,idesci                   numeric(20,0)       null
  ,idsexo                   numeric(20,0)       null
  ,idpais                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table personas add constraint pers_pk primary key (id)
;

alter table personas add constraint pers_uk_01 unique (idgrem, identificador1)
;

/*************************************************************************************************************************/

create table perfiles (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table perfiles add constraint perf_pk primary key (id)
;

alter table perfiles add constraint perf_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_civiles (
   id                       numeric(20,0)   not null
  ,alias                    varchar(1)      not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_civiles add constraint esci_pk primary key (id)
;

alter table estados_civiles add constraint esci_uk_01 unique (alias)
;

alter table estados_civiles add constraint esci_uk_02 unique (descripcion)
;

/*************************************************************************************************************************/

create table sexos (
   id                       numeric(20,0)   not null
  ,alias                    varchar(1)      not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table sexos add constraint sexo_pk primary key (id)
;

alter table sexos add constraint sexo_uk_01 unique (alias)
;

alter table sexos add constraint sexo_uk_02 unique (descripcion)
;

/*************************************************************************************************************************/

create table programas (
   id                       numeric(20,0)   not null
  ,idprogpadre              numeric(20,0)       null
  ,titulo                   varchar(100)    not null
  ,link                     varchar(100)        null
  ,etiqueta                 varchar(100)    not null
  ,peso                     numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table programas add constraint prog_pk primary key (id)
;

alter table programas add constraint prog_uk_01 unique (idprogpadre, peso)
;

alter table programas add constraint prog_uk_02 unique (titulo)
;

alter table programas add constraint prog_uk_03 unique (etiqueta)
;

/*************************************************************************************************************************/

create table usuarios (
   id                       numeric(20,0)   not null
  ,username                 varchar(100)    not null
  ,password                 varchar(100)    not null
  ,idpers                   numeric(20,0)   not null
  ,idesre                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table usuarios add constraint usua_pk primary key (id)
;

alter table usuarios add constraint usua_uk_01 unique (username)
;

alter table usuarios add constraint usua_uk_02 unique (idpers)
;

/*************************************************************************************************************************/

create table usuarios_perfiles (
   id                       numeric(20,0)     not null
  ,idusua                   numeric(20,0)     not null
  ,idperf                   numeric(20,0)     not null
  ,idgrem                   numeric(20,0)         null
  ,idempr                   numeric(20,0)         null
  ,idesre                   numeric(20,0)     not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

/*
   La opcionalidad de los campos grem_id y empr_id se debe a que algunos perfiles pueden no estar asociados a holding ni a empresa. Esto seracontrolado a
   traves de una check constraint que luego se declara. La asociacion entre perfiles y holding/empresas es la sgte.:

   Perfil 1 = administrador ERP: no asociado ni a holding ni a empresa
   Perfil 2 = administrador holding: acociado a un holding
   Todos los demas perfiles estan asociados a una empresa
*/

alter table usuarios_perfiles add constraint uspe_pk primary key (id)
;

alter table usuarios_perfiles add constraint uspe_uk_01 unique (idusua, idperf, idgrem)
;

alter table usuarios_perfiles add constraint uspe_uk_02 unique (idusua, idperf, idempr)
;

alter table usuarios_perfiles add constraint uspe_chk_01 check (   (idperf = 1           and idgrem is     null and idempr is     null)
                                                                or
                                                                   (idperf = 2           and idgrem is not null and idempr is     null)
                                                                or
                                                                   (idperf not in (1, 2) and idgrem is     null and idempr is not null)
                                                               )
;

/*************************************************************************************************************************/

create table perfiles_programas (
   id                       numeric(20,0)     not null
  ,idperf                   numeric(20,0)     not null
  ,idprog                   numeric(20,0)     not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table perfiles_programas add constraint pepr_pk primary key (id)
;

alter table perfiles_programas add constraint pepr_uk_01 unique (idperf, idprog)
;

/*************************************************************************************************************************/

create table cuentas_contables (
   id                       numeric(20,0)     not null
  ,idgrem                   numeric(20,0)     not null
  ,segmento1                varchar(100)      not null
  ,segmento2                varchar(100)          null
  ,segmento3                varchar(100)          null
  ,segmento4                varchar(100)          null
  ,segmento5                varchar(100)          null
  ,segmento6                varchar(100)          null
  ,segmento7                varchar(100)          null
  ,segmento8                varchar(100)          null
  ,descripcion              varchar(100)      not null
  ,idticc                   numeric(20,0)     not null
  ,imputable                varchar(1)        not null
  ,cuenta_desplegable       varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table cuentas_contables add constraint cuco_pk primary key (id)
;

alter table cuentas_contables add constraint cuco_uk_01 unique (idgrem, cuenta_desplegable)
;

alter table cuentas_contables add constraint cuco_chk_03 check (imputable in ('S','N'))
;

/*************************************************************************************************************************/

create table documentos_legales (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idtidl                   numeric(20,0)   not null
  ,nombreoriginal           varchar(500)    not null
  ,nombresistema            varchar(100)    not null
  ,idesdl                   numeric(20,0)   not null
  ,fecha                    date            not null
  ,notaria                  varchar(100)        null
  ,foja                     varchar(100)        null
  ,responsable              varchar(100)    not null
  ,comentario               varchar(1000)   not null
  ,fechaaviso               date                null
  ,emailaviso               varchar(100)        null
  ,avisodado                varchar(1)          null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
  ,xfld                     varchar(250)        null
)
;

alter table documentos_legales add constraint dole_pk primary key (id)
;

alter table documentos_legales add constraint dole_uk_01 unique (idempr, nombreoriginal)
;

alter table documentos_legales add constraint dole_uk_02 unique (idempr, nombresistema)
;

alter table documentos_legales add constraint dole_chk_01 check (avisodado in ('S','N'))
;

alter table documentos_legales add constraint dole_chk_02 check (fechaaviso is     null and emailaviso is     null and avisodado is     null
                                                                 or
                                                                 fechaaviso is not null and emailaviso is not null and avisodado is not null
                                                                )
;

alter table documentos_legales add constraint dole_chk_03 check (fecha < fechaaviso)
;

alter table documentos_legales add constraint dole_chk_04 check (fecha <= fechacrearegistro)
;

alter table documentos_legales add constraint dole_chk_05 check (fechaaviso > fechacrearegistro)
;

/*************************************************************************************************************************/

create table tipos_documentos_legales (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,descripcioncorta         varchar(15)     not null
  ,color                    varchar(50)     not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_documentos_legales add constraint tidl_pk primary key (id)
;

alter table tipos_documentos_legales add constraint tidl_uk_01 unique (idgrem, descripcion)
;

alter table tipos_documentos_legales add constraint tidl_uk_02 unique (idgrem, descripcioncorta)
;

alter table tipos_documentos_legales add constraint tidl_uk_03 unique (idgrem, color)
;

/*************************************************************************************************************************/

create table estados_documentos_legales (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_documentos_legales add constraint esdl_pk primary key (id)
;

alter table estados_documentos_legales add constraint esdl_uk_01 unique (idgrem, descripcion)
;

/*************************************************************************************************************************/

create table solicitudes_servs_hono (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idpers                   numeric(20,0)   not null
  ,descripcionsolicserv     varchar(1000)   not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table solicitudes_servs_hono add constraint sosh_pk primary key (id)
;

alter table solicitudes_servs_hono add constraint sosh_uk_01 unique (idempr, correlativo)
;

/*************************************************************************************************************************/

create table estados_solics_servs_hono (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_solics_servs_hono add constraint essh_pk primary key (id)
;

alter table estados_solics_servs_hono add constraint essh_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table cotizaciones_servs_hono (
   id                       numeric(20,0)   not null
  ,idsosh                   numeric(20,0)   not null
  ,idpers                   numeric(20,0)   not null
  ,monto                    numeric(20,0)   not null
  ,descservofrecido         varchar(1000)   not null
  ,informeevaluaccotiz      varchar(1000)       null
  ,idecsh                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table cotizaciones_servs_hono add constraint cosh_pk primary key (id)
;

alter table cotizaciones_servs_hono add constraint cosh_uk_01 unique (idsosh, idpers)
;


alter table cotizaciones_servs_hono add constraint cosh_chk_01 check (informeevaluaccotiz is     null and idecsh = 1
                                                                      or
                                                                      informeevaluaccotiz is not null and idecsh in (2, 3)
                                                                     )
;

/*************************************************************************************************************************/

create table doctos_cotizacs_servs_hono (
   id                       numeric(20,0)   not null
  ,idcosh                   numeric(20,0)   not null
  ,nombrearchivoorig        varchar(100)    not null
  ,nombrearchivomodif       varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table doctos_cotizacs_servs_hono add constraint dcsh_pk primary key (id)
;

alter table doctos_cotizacs_servs_hono add constraint dcsh_uk_01 unique (idcosh, nombrearchivoorig)
;

alter table doctos_cotizacs_servs_hono add constraint dcsh_uk_02 unique (idcosh, nombrearchivomodif)
;

/*************************************************************************************************************************/

create table estados_cotizacs_servs_hono (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_cotizacs_servs_hono add constraint ecsh_pk primary key (id)
;

alter table estados_cotizacs_servs_hono add constraint ecsh_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table ordenes_servicios_hono (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idsosh                   numeric(20,0)       null
  ,correlativo              numeric(20,0)   not null
  ,codigocompra             varchar(100)    not null
  ,idpers                   numeric(20,0)   not null
  ,descripcionordenserv     varchar(1000)   not null
  ,resultadofinal           varchar(1000)       null
  ,ideosh                   numeric(20,0)   not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table ordenes_servicios_hono add constraint orsh_pk primary key (id)
;

alter table ordenes_servicios_hono add constraint orsh_uk_01 unique (idempr, correlativo)
;

alter table ordenes_servicios_hono add constraint orsh_chk_01 check (resultadofinal is     null and ideosh in (1, 2)
                                                                     or
                                                                     resultadofinal is not null and ideosh in (3, 4)
                                                                    )
;

/*************************************************************************************************************************/

create table doctos_ordenes_servs_hono (
   id                       numeric(20,0)   not null
  ,idorsh                   numeric(20,0)   not null
  ,nombrearchivoorig        varchar(100)    not null
  ,nombrearchivomodif       varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table doctos_ordenes_servs_hono add constraint dosh_pk primary key (id)
;

alter table doctos_ordenes_servs_hono add constraint dosh_uk_01 unique (idorsh, nombrearchivoorig)
;

alter table doctos_ordenes_servs_hono add constraint dosh_uk_02 unique (idorsh, nombrearchivomodif)
;

/*************************************************************************************************************************/

create table estados_ordenes_servs_hono (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_ordenes_servs_hono add constraint eosh_pk primary key (id)
;

alter table estados_ordenes_servs_hono add constraint eosh_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table pagos_ordenes_servs_hono (
   id                       numeric(20,0)   not null
  ,idorsh                   numeric(20,0)   not null
  ,fechapago                date            not null
  ,monto                    numeric(20,0)   not null
  ,idtifp                   numeric(20,0)   not null
  ,idepos                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table pagos_ordenes_servs_hono add constraint posh_pk primary key (id)
;

alter table pagos_ordenes_servs_hono add constraint posh_uk_01 unique (idorsh, fechapago)
;

/*************************************************************************************************************************/

create table estados_pagos_ords_servs_hono (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_pagos_ords_servs_hono add constraint epos_pk primary key (id)
;

alter table estados_pagos_ords_servs_hono add constraint epos_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table tipos_formas_pagos (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_formas_pagos add constraint tifp_pk primary key (id)
;

alter table tipos_formas_pagos add constraint tifp_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table formas_pagos_notas_ventas (
   id                       numeric(20,0)   not null
  ,idnove                   numeric(20,0)   not null
  ,idtifp                   numeric(20,0)   not null
  ,monto                    numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table formas_pagos_notas_ventas add constraint fpnv_pk primary key (id)
;

alter table formas_pagos_notas_ventas add constraint fpnv_uk_01 unique (idnove, idtifp)
;

/*************************************************************************************************************************/

create table formas_pagos_ventas (
   id                       numeric(20,0)   not null
  ,idvent                   numeric(20,0)   not null
  ,idtifp                   numeric(20,0)   not null
  ,monto                    numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table formas_pagos_ventas add constraint fpve_pk primary key (id)
;

alter table formas_pagos_ventas add constraint fpve_uk_01 unique (idvent, idtifp)
;

/*************************************************************************************************************************/

create table unidades_territoriales (
   id                       numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,iduntepadre              numeric(20,0)       null
  ,nombre                   varchar(100)    not null
  ,orden                    numeric(20,0)       null
  ,profundidad              numeric(20,0)   not null default 0
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

-- el campo orden se puede usar -en el caso de Chile- para ordenar las regiones por numero o por ubicacion geografica;
-- las provincias y comunas se debieran ordenar por nombre

alter table unidades_territoriales add constraint unte_pk primary key (id)
;

alter table unidades_territoriales add constraint unte_uk_01 unique (idpais, iduntepadre, nombre)
;

alter table unidades_territoriales add constraint unte_uk_02 unique (iduntepadre, orden)
;

/*************************************************************************************************************************/

create table tipos_clientes (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_clientes add constraint ticl_pk primary key (id)
;

alter table tipos_clientes add constraint ticl_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table tipos_cotizaciones_vtas (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_cotizaciones_vtas add constraint ticv_pk primary key (id)
;

alter table tipos_cotizaciones_vtas add constraint ticv_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_cotizaciones_vtas (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_cotizaciones_vtas add constraint escv_pk primary key (id)
;

alter table estados_cotizaciones_vtas add constraint escv_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_notas_vtas (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_notas_vtas add constraint esnv_pk primary key (id)
;

alter table estados_notas_vtas add constraint esnv_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_ventas (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_ventas add constraint esve_pk primary key (id)
;

alter table estados_ventas add constraint esve_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table origenes_productos (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,descripcioncorta         varchar(10)     not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table origenes_productos add constraint orpr_pk primary key (id)
;

alter table origenes_productos add constraint orpr_uk_01 unique (descripcion)
;

alter table origenes_productos add constraint orpr_uk_02 unique (descripcioncorta)
;

/*************************************************************************************************************************/

create table unidades_medidas_productos (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,descripcioncorta         varchar(10)     not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table unidades_medidas_productos add constraint unmp_pk primary key (id)
;

alter table unidades_medidas_productos add constraint unmp_uk_01 unique (descripcion)
;

alter table unidades_medidas_productos add constraint unmp_uk_02 unique (descripcioncorta)
;

/*************************************************************************************************************************/

create table unidades_medidas_servicios (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,descripcioncorta         varchar(10)     not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table unidades_medidas_servicios add constraint unms_pk primary key (id)
;

alter table unidades_medidas_servicios add constraint unms_uk_01 unique (descripcion)
;

alter table unidades_medidas_servicios add constraint unms_uk_02 unique (descripcioncorta)
;

/*************************************************************************************************************************/

create table tipos_productos (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,estaexento               varchar(1)      not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_productos add constraint tipr_pk primary key (id)
;

alter table tipos_productos add constraint tipr_uk_01 unique (descripcion)
;

alter table tipos_productos add constraint tipr_chk_01 check (estaexento in ('S', 'N'))
;

/*************************************************************************************************************************/

create table impuestos (
   id                       numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,descripcioncorta         varchar(10)     not null
  ,obligatorio              varchar(1)      not null
  ,valor                    numeric(20,1)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table impuestos add constraint impu_pk primary key (id)
;

alter table impuestos add constraint impu_uk_01 unique (descripcion)
;

alter table impuestos add constraint impu_uk_02 unique (descripcioncorta)
;

alter table impuestos add constraint impu_chk_01 check (obligatorio in ('S', 'N'))
;

/*************************************************************************************************************************/

create table tipos_productos_impuestos (
   id                       numeric(20,0)   not null
  ,idtipr                   numeric(20,0)   not null
  ,idimpu                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_productos_impuestos add constraint tipi_pk primary key (id)
;

alter table tipos_productos_impuestos add constraint tipi_uk_01 unique (idtipr, idimpu)
;

/*************************************************************************************************************************/

create table tipos_doctos_ventas (
   id                       numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,descripcioncorta         varchar(10)     not null
  ,codigooficial            varchar(10)     not null
  ,textoimpreso             varchar(50)     not null
  ,usable_en_rendicion      varchar(1)      not null
  ,obliga_proveedor         varchar(1)      not null
  ,es_contabilizable        varchar(1)      not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_doctos_ventas add constraint tidv_pk primary key (id)
;

alter table tipos_doctos_ventas add constraint tidv_uk_01 unique (idpais, descripcion)
;

alter table tipos_doctos_ventas add constraint tidv_uk_02 unique (idpais, descripcioncorta)
;

alter table tipos_doctos_ventas add constraint tidv_uk_03 unique (idpais, codigooficial)
;

alter table tipos_doctos_ventas add constraint tidv_chk_01 check (usable_en_rendicion in ('S', 'N'))
;

alter table tipos_doctos_ventas add constraint tidv_chk_02 check (obliga_proveedor in ('S', 'N'))
;

alter table tipos_doctos_ventas add constraint tidv_chk_03 check (es_contabilizable in ('S', 'N'))
;

/*************************************************************************************************************************/

create table tipos_usos_doctos_ventas (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_usos_doctos_ventas add constraint tudv_pk primary key (id)
;

alter table tipos_usos_doctos_ventas add constraint tudv_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table usos_doctos_ventas (
   id                       numeric(20,0)   not null
  ,idtudv                   numeric(20,0)   not null
  ,idtidv                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table usos_doctos_ventas add constraint usdv_pk primary key (id)
;

alter table usos_doctos_ventas add constraint usdv_uk_01 unique (idtudv, idtidv)
;

/*************************************************************************************************************************/

create table tipos_servicios (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,estaexento               varchar(1)      not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_servicios add constraint tise_pk primary key (id)
;

alter table tipos_servicios add constraint tise_uk_01 unique (descripcion)
;

alter table tipos_servicios add constraint tise_chk_01 check (estaexento in ('S', 'N'))
;

/*************************************************************************************************************************/

create table clientes (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,identificador1           varchar(50)     not null
  ,identificador2           varchar(50)     not null
  ,idticl                   numeric(20,0)   not null
  ,razonsocial              varchar(100)        null
  ,nombrefantasia           varchar(100)        null
  ,primernombre             varchar(100)        null
  ,segundonombre            varchar(100)        null
  ,apellidopaterno          varchar(100)        null
  ,apellidomaterno          varchar(100)        null
  ,email                    varchar(100)        null
  ,contacto                 varchar(100)        null
  ,telefono                 varchar(100)        null
  ,calle1                   varchar(100)        null
  ,numero1                  varchar(100)        null
  ,casa_o_depto1            varchar(100)        null
  ,idunte1                  numeric(20,0)       null
  ,calle2                   varchar(100)        null
  ,numero2                  varchar(100)        null
  ,casa_o_depto2            varchar(100)        null
  ,idunte2                  numeric(20,0)       null
  ,calle3                   varchar(100)        null
  ,numero3                  varchar(100)        null
  ,casa_o_depto3            varchar(100)        null
  ,idunte3                  numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table clientes add constraint clie_pk primary key (id)
;

alter table clientes add constraint clie_uk_01 unique (idgrem, identificador1)
;

alter table clientes add constraint clie_chk_01 check (
                                                       (idticl = 1 and razonsocial is     null and nombrefantasia is     null and primernombre is not null and                           apellidopaterno is not null                            )
                                                       or
                                                       (idticl = 2 and razonsocial is not null and nombrefantasia is not null and primernombre is     null and segundonombre is null and apellidopaterno is     null and apellidomaterno is null)
                                                      )
;

/*************************************************************************************************************************/

create table ventas (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idbode                   numeric(20,0)       null
  ,idnove                   numeric(20,0)       null
  ,idtidv                   numeric(20,0)   not null
  ,numero                   numeric(20,0)   not null
  ,idclie                   numeric(20,0)   not null
  ,descripcionventa         varchar(1000)   not null
  ,fechaventa               date            not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,exento                   numeric(20,0)   not null
  ,afecto                   numeric(20,0)   not null
  ,impuestosobligats        numeric(20,0)   not null
  ,impuestosespecifs        numeric(20,0)   not null
  ,porcentajedescuento      numeric(20,5)   not null
  ,montodescuento           numeric(20,0)   not null
  ,total                    numeric(20,0)   not null
  ,idesve                   numeric(20,0)   not null
  ,idasco                   numeric(20,0)       null
  ,idusuavendedor           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table ventas add constraint vent_pk primary key (id)
;

alter table ventas add constraint vent_uk_01 unique (idempr, idtidv, numero)
;

alter table ventas add constraint vent_uk_02 unique (idempr, idnove, idtidv)
;

/*************************************************************************************************************************/

create table detalles_ventas (
   id                       numeric(20,0)   not null
  ,idvent                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,preciounitario           numeric(20,0)   not null
  ,cantidad                 numeric(20,2)   not null
  ,porcentajedescuento1     numeric(20,5)   not null
  ,montodescuento1          numeric(20,0)   not null
  ,porcentajedescuento2     numeric(20,5)   not null
  ,montodescuento2          numeric(20,0)   not null
  ,exento                   numeric(20,0)   not null
  ,afecto                   numeric(20,0)   not null
  ,impuestosobligats        numeric(20,0)   not null
  ,impuestosespecifs        numeric(20,0)   not null
  ,totallinea               numeric(20,2)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_ventas add constraint deve_pk primary key (id)
;

alter table detalles_ventas add constraint deve_uk_01 unique (idvent, correlativo)
;

alter table detalles_ventas add constraint deve_uk_02 unique (idvent, idprod, idserv)
;

alter table detalles_ventas add constraint deve_chk_01 check (
                                                              (idprod is not null and idserv is     null)
                                                              or
                                                              (idprod is     null and idserv is not null)
                                                             )
;

alter table detalles_ventas add constraint deve_chk_02 check (preciounitario > 0)
;

alter table detalles_ventas add constraint deve_chk_03 check (cantidad > 0)
;

/*************************************************************************************************************************/

create table notas_ventas (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idbode                   numeric(20,0)       null
  ,idcove                   numeric(20,0)       null
  ,numero                   numeric(20,0)   not null
  ,idclie                   numeric(20,0)   not null
  ,descripcionnotaventa     varchar(1000)   not null
  ,fechanotaventa           date            not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,exento                   numeric(20,0)   not null
  ,afecto                   numeric(20,0)   not null
  ,impuestosobligats        numeric(20,0)   not null
  ,impuestosespecifs        numeric(20,0)   not null
  ,porcentajedescuento      numeric(20,5)   not null
  ,montodescuento           numeric(20,0)   not null
  ,total                    numeric(20,0)   not null
  ,idesnv                   numeric(20,0)   not null
  ,idusuavendedor           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table notas_ventas add constraint nove_pk primary key (id)
;

alter table notas_ventas add constraint nove_uk_01 unique (idempr, numero)
;

alter table notas_ventas add constraint nove_uk_02 unique (idempr, idcove)
;

/*************************************************************************************************************************/

create table detalles_notas_vtas (
   id                       numeric(20,0)   not null
  ,idnove                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,preciounitario           numeric(20,0)   not null
  ,cantidad                 numeric(20,2)   not null
  ,porcentajedescuento1     numeric(20,5)   not null
  ,montodescuento1          numeric(20,0)   not null
  ,porcentajedescuento2     numeric(20,5)   not null
  ,montodescuento2          numeric(20,0)   not null
  ,exento                   numeric(20,2)   not null
  ,afecto                   numeric(20,2)   not null
  ,impuestosobligats        numeric(20,0)   not null
  ,impuestosespecifs        numeric(20,0)   not null
  ,totallinea               numeric(20,2)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_notas_vtas add constraint denv_pk primary key (id)
;

alter table detalles_notas_vtas add constraint denv_uk_01 unique (idnove, correlativo)
;

alter table detalles_notas_vtas add constraint denv_uk_02 unique (idnove, idprod, idserv)
;

alter table detalles_notas_vtas add constraint denv_chk_01 check (
                                                                   (idprod is not null and idserv is     null)
                                                                   or
                                                                   (idprod is     null and idserv is not null)
                                                                  )
;

alter table detalles_notas_vtas add constraint denv_chk_02 check (preciounitario > 0)
;

alter table detalles_notas_vtas add constraint denv_chk_03 check (cantidad > 0)
;

/*************************************************************************************************************************/

create table cotizaciones_ventas (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idbode                   numeric(20,0)       null
  ,numero                   numeric(20,0)   not null
  ,idclie                   numeric(20,0)   not null
  ,descripcioncotizacion    varchar(1000)   not null
  ,fechacotizacion          date            not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,exento                   numeric(20,0)   not null
  ,afecto                   numeric(20,0)   not null
  ,impuestosobligats        numeric(20,0)   not null
  ,impuestosespecifs        numeric(20,0)   not null
  ,porcentajedescuento      numeric(20,5)   not null
  ,montodescuento           numeric(20,0)   not null
  ,total                    numeric(20,0)   not null
  ,diasvalidez              numeric(20,0)   not null
  ,idescv                   numeric(20,0)   not null
  ,idusuavendedor           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table cotizaciones_ventas add constraint cove_pk primary key (id)
;

alter table cotizaciones_ventas add constraint cove_uk_01 unique (idempr, numero)
;

/*************************************************************************************************************************/

create table detalles_cotizs_vtas (
   id                       numeric(20,0)   not null
  ,idcove                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,preciounitario           numeric(20,0)   not null
  ,cantidad                 numeric(20,2)   not null
  ,porcentajedescuento      numeric(20,5)   not null
  ,montodescuento           numeric(20,0)   not null
  ,exento                   numeric(20,0)   not null
  ,afecto                   numeric(20,0)   not null
  ,impuestosobligats        numeric(20,0)   not null
  ,impuestosespecifs        numeric(20,0)   not null
  ,totallinea               numeric(20,2)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_cotizs_vtas add constraint decv_pk primary key (id)
;

alter table detalles_cotizs_vtas add constraint decv_uk_01 unique (idcove, correlativo)
;

alter table detalles_cotizs_vtas add constraint decv_uk_02 unique (idcove, idprod, idserv)
;

alter table detalles_cotizs_vtas add constraint decv_chk_01 check (
                                                                   (idprod is not null and idserv is     null)
                                                                   or
                                                                   (idprod is     null and idserv is not null)
                                                                  )
;

alter table detalles_cotizs_vtas add constraint decv_chk_02 check (preciounitario > 0)
;

alter table detalles_cotizs_vtas add constraint decv_chk_03 check (cantidad > 0)
;

/*************************************************************************************************************************/

create table productos (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idsfpr                   numeric(20,0)   not null
  ,idtipr                   numeric(20,0)   not null
  ,idunmp                   numeric(20,0)   not null
  ,idorpr                   numeric(20,0)   not null
  ,nombre                   varchar(1000)   not null
  ,correlativoflia          varchar(4)      not null
  ,sku                      varchar(1000)       null
  ,ean13                    varchar(1000)       null
  ,qr                       varchar(1000)       null
  ,pesounitariokg           numeric(20,2)   not null
  ,idesre                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table productos add constraint prod_pk primary key (id)
;

alter table productos add constraint prod_uk_01 unique (idempr, nombre)
;

alter table productos add constraint prod_uk_02 unique (idempr, idsfpr, correlativoflia)
;

/*************************************************************************************************************************/

create table servicios (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idtise                   numeric(20,0)   not null
  ,idunms                   numeric(20,0)   not null
  ,nombre                   varchar(1000)   not null
  ,preciounitario           numeric(20,2)   not null
  ,idmone                   numeric(20,0)   not null
  ,idcuco                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table servicios add constraint serv_pk primary key (id)
;

alter table servicios add constraint serv_uk_01 unique (idempr, nombre)
;

alter table servicios add constraint serv_chk_02 check (preciounitario > 0)
;

/*************************************************************************************************************************/

create table dominios (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table dominios add constraint domi_pk primary key (id)
;

alter table dominios add constraint domi_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table valores_dominios (
   id                       numeric(20,0)   not null
  ,iddomi                   numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table valores_dominios add constraint vado_pk primary key (id)
;

alter table valores_dominios add constraint vado_uk_01 unique (iddomi, descripcion)
;

/*************************************************************************************************************************/

create table bodegas (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,nombre                   varchar(1000)   not null
  ,calle                    varchar(100)        null
  ,numero                   varchar(100)        null
  ,casa_o_depto             varchar(100)        null
  ,idunte                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table bodegas add constraint bode_pk primary key (id)
;

alter table bodegas add constraint bode_uk_01 unique (idempr, nombre)
;

/*************************************************************************************************************************/

create table bodegas_productos (
   id                       numeric(20,0)   not null
  ,idbode                   numeric(20,0)   not null
  ,idprod                   numeric(20,0)   not null
  ,stock                    numeric(20,2)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table bodegas_productos add constraint bopr_pk primary key (id)
;

alter table bodegas_productos add constraint bopr_uk_01 unique (idbode, idprod)
;

alter table bodegas_productos add constraint bopr_chk_01 check (stock >= 0)
;

/*************************************************************************************************************************/

create table listas_precios (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,fechainicio              date            not null
  ,fechafin                 date                null
  ,observaciones            varchar(1000)   not null
  ,idesre                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table listas_precios add constraint lipr_pk primary key (id)
;

alter table listas_precios add constraint lipr_uk_01 unique (idempr, correlativo)
;

alter table listas_precios add constraint lipr_chk_01 check (fechainicio <= fechafin)
;

create unique index lipr_idx_01 on listas_precios (idempr, idesre) where (idesre = 1)
;

/*************************************************************************************************************************/

create table detalles_listas_precios (
   id                       numeric(20,0)   not null
  ,idlipr                   numeric(20,0)   not null
  ,idprod                   numeric(20,0)   not null
  ,preciounitario           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_listas_precios add constraint delp_pk primary key (id)
;

alter table detalles_listas_precios add constraint delp_uk_01 unique (idlipr, idprod)
;

alter table detalles_listas_precios add constraint delp_chk_02 check (preciounitario > 0)
;

/*************************************************************************************************************************/

create table familias_productos (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,cod_familia              varchar(2)      not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table familias_productos add constraint fapr_pk primary key (id)
;

alter table familias_productos add constraint fapr_uk_01 unique (idempr, cod_familia)
;

alter table familias_productos add constraint fapr_uk_02 unique (idempr, descripcion)
;

alter table familias_productos add constraint fapr_chk_01 check (
                                                                 substr(cod_familia,1,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                 and
                                                                 substr(cod_familia,2,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                )
;

/*************************************************************************************************************************/

create table sub_familias_productos (
   id                       numeric(20,0)   not null
  ,idfapr                   numeric(20,0)   not null
  ,cod_sub_familia          varchar(2)      not null
  ,descripcion              varchar(100)    not null
  ,idcuco                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table sub_familias_productos add constraint sfpr_pk primary key (id)
;

alter table sub_familias_productos add constraint sfpr_uk_01 unique (idfapr, cod_sub_familia)
;

alter table sub_familias_productos add constraint sfpr_uk_02 unique (idfapr, descripcion)
;

alter table sub_familias_productos add constraint sfpr_chk_01 check (
                                                                     substr(cod_sub_familia,1,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                     and
                                                                     substr(cod_sub_familia,2,1) in ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
                                                                    )
;

/*************************************************************************************************************************/

create table tipos_movimientos_bodegas (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,signo                    numeric(1,0)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_movimientos_bodegas add constraint timb_pk primary key (id)
;

alter table tipos_movimientos_bodegas add constraint timb_uk_01 unique (descripcion)
;

alter table tipos_movimientos_bodegas add constraint timb_chk_01 check (signo in (1, -1))
;

/*************************************************************************************************************************/

create table movimientos_bodegas (
   id                       numeric(20,0)   not null
  ,idbode                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idtimb                   numeric(20,0)   not null
  ,fechamovto               date            not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table movimientos_bodegas add constraint mobo_pk primary key (id)
;

alter table movimientos_bodegas add constraint mobo_uk_01 unique (idbode, correlativo)
;

/*************************************************************************************************************************/

create table detalles_movtos_bodegas (
   id                       numeric(20,0)   not null
  ,idmobo                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)   not null
  ,cantidad                 numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_movtos_bodegas add constraint demb_pk primary key (id)
;

alter table detalles_movtos_bodegas add constraint demb_uk_01 unique (idmobo, correlativo)
;

alter table detalles_movtos_bodegas add constraint demb_uk_02 unique (idmobo, idprod)
;

alter table detalles_movtos_bodegas add constraint demb_chk_03 check (cantidad > 0)
;

/*************************************************************************************************************************/

-- el alias de descuentos es desu y no desc porque desc es palabra reservada

create table descuentos (
   id                       numeric(20,0)   not null
  ,idfapr                   numeric(20,0)       null
  ,idsfpr                   numeric(20,0)       null
  ,idprod                   numeric(20,0)       null
  ,porcentajedescuento      numeric(20,5)   not null
  ,idesre                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table descuentos add constraint desu_pk primary key (id)
;

alter table descuentos add constraint desu_chk_01 check (porcentajedescuento > 0)
;

alter table descuentos add constraint desu_chk_02 check (   (idfapr is not null and idsfpr is     null and idprod is     null)
                                                         or
                                                            (idfapr is not null and idsfpr is not null and idprod is     null)
                                                         or
                                                            (idfapr is not null and idsfpr is not null and idprod is not null)
                                                        )
;

/*************************************************************************************************************************/

-- en esta tabla se registra cada vez que se fija un precio nuevo a un producto; es decir, en insert y en update, se
-- registra el new.precio

create table bitacoras_cambios_precios (
   id                       numeric(20,0)   not null
  ,idprod                   numeric(20,0)   not null
  ,preciounitario           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
)
;

alter table bitacoras_cambios_precios add constraint bicp_pk primary key (id)
;

/*************************************************************************************************************************/

create table estados_requisiciones (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_requisiciones add constraint ereq_pk primary key (id)
;

alter table estados_requisiciones add constraint ereq_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table tipos_cuentas_bancarias (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_cuentas_bancarias add constraint ticb_pk primary key (id)
;

alter table tipos_cuentas_bancarias add constraint ticb_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table bancos (
   id                       numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,nombrebanco              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table bancos add constraint banc_pk primary key (id)
;

alter table bancos add constraint banc_uk_01 unique (idpais, nombrebanco)
;

/*************************************************************************************************************************/

create table cuentas_bancarias_proveedores (
   id                       numeric(20,0)   not null
  ,idprov                   numeric(20,0)   not null
  ,idbanc                   numeric(20,0)   not null
  ,idticb                   numeric(20,0)   not null
  ,numerocuenta             varchar(100)    not null
  ,cuentapreferida          varchar(1)      not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table cuentas_bancarias_proveedores add constraint cubp_pk primary key (id)
;

alter table cuentas_bancarias_proveedores add constraint cubp_uk_01 unique (idprov, idbanc, idticb, numerocuenta)
;

alter table cuentas_bancarias_proveedores add constraint cubp_chk_01 check (cuentapreferida in ('S','N'))
;

/*************************************************************************************************************************/

create table tipos_requisiciones (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,nrocotizacsminimo        numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_requisiciones add constraint tire_pk primary key (id)
;

alter table tipos_requisiciones add constraint tire_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table requisiciones (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idtire                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idusuasolicitareq        numeric(20,0)   not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,idereq                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table requisiciones add constraint requ_pk primary key (id)
;

alter table requisiciones add constraint requ_uk_01 unique (idempr, correlativo)
;

/*************************************************************************************************************************/

create table detalles_requisiciones (
   id                       numeric(20,0)   not null
  ,idrequ                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,otroinsumo               varchar(1000)       null
  ,cantidad                 numeric(20,0)   not null
  ,preciounitario           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_requisiciones add constraint dere_pk primary key (id)
;

alter table detalles_requisiciones add constraint dere_uk_01 unique (idrequ, correlativo)
;

/*

Creé esta UK, pero "no funciona", parece que los campos null no son bien considerados/tratados en PostgreSQL:

alter table detalles_requisiciones add constraint dere_uk_02 unique (idrequ, idprod, idserv, otroinsumo)
;

*/

alter table detalles_requisiciones add constraint dere_chk_01 check (
                                                                     (idprod is not null and idserv is     null and otroinsumo is     null)
                                                                     or
                                                                     (idprod is     null and idserv is not null and otroinsumo is     null)
                                                                     or
                                                                     (idprod is     null and idserv is     null and otroinsumo is not null)
                                                                    )
;

alter table detalles_requisiciones add constraint dere_chk_03 check (cantidad > 0)
;

/*************************************************************************************************************************/

create table autorizadores_requisiciones (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idperfautorizador        numeric(20,0)   not null
  ,idperfautorizado         numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table autorizadores_requisiciones add constraint aure_pk primary key (id)
;

alter table autorizadores_requisiciones add constraint aure_uk_01 unique (idempr, idperfautorizador, idperfautorizado)
;

/*************************************************************************************************************************/

create table historiales_requisiciones (
   id                       numeric(20,0)   not null
  ,idrequ                   numeric(20,0)   not null
  ,idereq                   numeric(20,0)   not null
  ,idusuacambiaestado       numeric(20,0)   not null
  ,razonrechazo             varchar(500)        null /* este campo solo se debe poblar cuando se produzca un rechazo, ya
                                                        sea del superior jerárquico o bien del jefe de compras */
  ,fechacrearegistro        timestamp       not null
)
;

alter table historiales_requisiciones add constraint hire_pk primary key (id)
;

alter table historiales_requisiciones add constraint hire_chk_01 check (
                                                                        (idereq     in (3,6) and razonrechazo is not null)
                                                                        or
                                                                        (idereq not in (3,6) and razonrechazo is     null)
                                                                       )
;

/*************************************************************************************************************************/

create table estados_ordenes_compras (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_ordenes_compras add constraint esoc_pk primary key (id)
;

alter table estados_ordenes_compras add constraint esoc_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_detalles_ordenes_compras (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_detalles_ordenes_compras add constraint edoc_pk primary key (id)
;

alter table estados_detalles_ordenes_compras add constraint edoc_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table ordenes_compras (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idrequ                   numeric(20,0)       null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,idesoc                   numeric(20,0)       null
  ,idprov                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table ordenes_compras add constraint orco_pk primary key (id)
;

alter table ordenes_compras add constraint orco_uk_01 unique (idempr, correlativo)
;

/*************************************************************************************************************************/

create table detalles_ordenes_compras (
   id                       numeric(20,0)   not null
  ,idorco                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idedoc                   numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,otroinsumo               varchar(1000)       null
  ,cantidad                 numeric(20,0)   not null
  ,preciounitario           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_ordenes_compras add constraint deoc_pk primary key (id)
;

alter table detalles_ordenes_compras add constraint deoc_uk_01 unique (idorco, correlativo)
;

alter table detalles_ordenes_compras add constraint deoc_chk_01 check (
                                                                       (idprod is not null and idserv is     null and otroinsumo is     null)
                                                                       or
                                                                       (idprod is     null and idserv is not null and otroinsumo is     null)
                                                                       or
                                                                       (idprod is     null and idserv is     null and otroinsumo is not null)
                                                                      )
;

alter table detalles_ordenes_compras add constraint deoc_chk_03 check (cantidad > 0)
;

/*************************************************************************************************************************/

create table cotizaciones_compras (
   id                       numeric(20,0)   not null
  ,idrequ                   numeric(20,0)       null
  ,idorco                   numeric(20,0)       null
  ,idprov                   numeric(20,0)   not null
  ,nombreoriginal           varchar(500)    not null
  ,nombresistema            varchar(100)    not null
  ,observaciones            varchar(1000)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table cotizaciones_compras add constraint coco_pk primary key (id)
;

alter table cotizaciones_compras add constraint coco_uk_01 unique (idrequ, idorco, idprov)
;

alter table cotizaciones_compras add constraint coco_uk_02 unique (idrequ, idorco, nombresistema)
;

alter table cotizaciones_compras add constraint coco_chk_01 check (
                                                                   (idrequ is     null and idorco is not null)
                                                                   or
                                                                   (idrequ is not null and idorco is     null)
                                                                  )
;

/*************************************************************************************************************************/

create table detalles_cotizaciones_compras (
   id                       numeric(20,0)   not null
  ,idcoco                   numeric(20,0)       null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,otroinsumo               varchar(1000)       null
  ,cantidad                 numeric(20,0)   not null
  ,preciounitario           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_cotizaciones_compras add constraint decc_pk primary key (id)
;

alter table detalles_cotizaciones_compras add constraint decc_uk_01 unique (idcoco, idprod, idserv, otroinsumo)
;

alter table detalles_cotizaciones_compras add constraint decc_chk_01 check (
                                                                            (idprod is not null and idserv is     null and otroinsumo is     null)
                                                                            or
                                                                            (idprod is     null and idserv is not null and otroinsumo is     null)
                                                                            or
                                                                            (idprod is     null and idserv is     null and otroinsumo is not null)
                                                                           )
;

/*************************************************************************************************************************/

create table proveedores (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,idpais                   numeric(20,0)   not null
  ,identificador1           varchar(50)     not null
  ,identificador2           varchar(50)     not null
  ,idtipp                   numeric(20,0)   not null
  ,razonsocial              varchar(100)        null
  ,nombrefantasia           varchar(100)        null
  ,primernombre             varchar(100)        null
  ,segundonombre            varchar(100)        null
  ,apellidopaterno          varchar(100)        null
  ,apellidomaterno          varchar(100)        null
  ,email                    varchar(100)        null
  ,contacto                 varchar(100)        null
  ,telefono                 varchar(100)        null
  ,calle1                   varchar(100)        null
  ,numero1                  varchar(100)        null
  ,casa_o_depto1            varchar(100)        null
  ,idunte1                  numeric(20,0)       null
  ,calle2                   varchar(100)        null
  ,numero2                  varchar(100)        null
  ,casa_o_depto2            varchar(100)        null
  ,idunte2                  numeric(20,0)       null
  ,calle3                   varchar(100)        null
  ,numero3                  varchar(100)        null
  ,casa_o_depto3            varchar(100)        null
  ,idunte3                  numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table proveedores add constraint prov_pk primary key (id)
;

alter table proveedores add constraint prov_uk_01 unique (idgrem, identificador1)
;

alter table proveedores add constraint prov_chk_01 check (
                                                          (idtipp = 1 and razonsocial is     null and nombrefantasia is     null and primernombre is not null and                           apellidopaterno is not null                            )
                                                          or
                                                          (idtipp = 2 and razonsocial is not null and nombrefantasia is not null and primernombre is     null and segundonombre is null and apellidopaterno is     null and apellidomaterno is null)
                                                         )
;

/*************************************************************************************************************************/

create table tipos_proveedores (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_proveedores add constraint tipp_pk primary key (id)
;

alter table tipos_proveedores add constraint tipp_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table recepciones_compras (
   id                       numeric(20,0)   not null
  ,idorco                   numeric(20,0)   not null
  ,idbode                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table recepciones_compras add constraint reco_pk primary key (id)
;

alter table recepciones_compras add constraint reco_uk_01 unique (idorco, correlativo)
;

/*************************************************************************************************************************/

create table detalles_recepciones_compras (
   id                       numeric(20,0)   not null
  ,idreco                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,otroinsumo               varchar(1000)       null
  ,cantidad                 numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_recepciones_compras add constraint derc_pk primary key (id)
;

alter table detalles_recepciones_compras add constraint derc_uk_01 unique (idreco, correlativo)
;

alter table detalles_recepciones_compras add constraint derc_chk_01 check (
                                                                           (idprod is not null and idserv is     null and otroinsumo is     null)
                                                                           or
                                                                           (idprod is     null and idserv is not null and otroinsumo is     null)
                                                                           or
                                                                           (idprod is     null and idserv is     null and otroinsumo is not null)
                                                                          )
;

alter table detalles_recepciones_compras add constraint derc_chk_02 check (cantidad > 0)
;

/*************************************************************************************************************************/

create table fondos_a_rendir (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,monto                    numeric(20,0)   not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table fondos_a_rendir add constraint fore_pk primary key (id)
;

alter table fondos_a_rendir add constraint fore_uk_01 unique (idempr, correlativo)
;

/*************************************************************************************************************************/

create table estados_rendiciones_gastos (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table estados_rendiciones_gastos add constraint esrg_pk primary key (id)
;

alter table estados_rendiciones_gastos add constraint esrg_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table tipos_rendiciones_gastos (
   id                       numeric(20,0)   not null
  ,descripcion              varchar(100)    not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table tipos_rendiciones_gastos add constraint tirg_pk primary key (id)
;

alter table tipos_rendiciones_gastos add constraint tirg_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table rendiciones_gastos (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idtirg                   numeric(20,0)   not null
  ,idfore                   numeric(20,0)       null
  ,idesrg                   numeric(20,0)   not null
  ,idgere                   numeric(20,0)       null
  ,idproy                   numeric(20,0)       null
  ,idline                   numeric(20,0)       null
  ,idceco                   numeric(20,0)       null
  ,idtare                   numeric(20,0)       null
  ,observaciones            varchar(500)        null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table rendiciones_gastos add constraint rega_pk primary key (id)
;

alter table rendiciones_gastos add constraint rega_uk_01 unique (idempr, correlativo)
;

alter table rendiciones_gastos add constraint rega_chk_01 check (idtirg = 1 and idfore is     null
                                                                 or
                                                                 idtirg = 2 and idfore is not null
                                                                )
;

/*************************************************************************************************************************/

create table detalles_rendiciones_gastos (
   id                       numeric(20,0)   not null
  ,idrega                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprov                   numeric(20,0)   not null
  ,idtidv                   numeric(20,0)   not null
  ,numero                   numeric(20,0)   not null
  ,fecha_docto              date            not null
  ,idcorg                   numeric(20,0)   not null
  ,monto                    numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_rendiciones_gastos add constraint derg_pk primary key (id)
;

alter table detalles_rendiciones_gastos add constraint derg_uk_01 unique (idrega, correlativo)
;

alter table detalles_rendiciones_gastos add constraint derg_uk_02 unique (idrega, idtidv, numero)
;

/*************************************************************************************************************************/

create table conceptos_rendiciones_gastos (
   id                       numeric(20,0)   not null
  ,idgrem                   numeric(20,0)   not null
  ,descripcion              varchar(500)    not null
  ,idcuco                   numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table conceptos_rendiciones_gastos add constraint corg_pk primary key (id)
;

alter table conceptos_rendiciones_gastos add constraint corg_uk_01 unique (idgrem, descripcion)
;

/*************************************************************************************************************************/

create table autorizadores_rendiciones (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idperfautorizador        numeric(20,0)   not null
  ,idperfautorizado         numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table autorizadores_rendiciones add constraint aurn_pk primary key (id)
;

alter table autorizadores_rendiciones add constraint aurn_uk_01 unique (idempr, idperfautorizador, idperfautorizado)
;

/*************************************************************************************************************************/

create table historiales_rendiciones (
   id                       numeric(20,0)   not null
  ,idrega                   numeric(20,0)   not null
  ,idesrg                   numeric(20,0)   not null
  ,idusuacambiaestado       numeric(20,0)   not null
  ,razonrechazo             varchar(500)        null /* este campo solo se debe poblar cuando se produzca un rechazo, ya
                                                        sea del superior jerárquico o bien de contabilidad */
  ,fechacrearegistro        timestamp       not null
)
;

alter table historiales_rendiciones add constraint hirn_pk primary key (id)
;

alter table historiales_rendiciones add constraint hirn_chk_01 check (
                                                                      (idesrg     in (3,5) and razonrechazo is not null)
                                                                      or
                                                                      (idesrg not in (3,5) and razonrechazo is     null)
                                                                     )
;

/*************************************************************************************************************************/

create table compras (
   id                       numeric(20,0)   not null
  ,idempr                   numeric(20,0)   not null
  ,idreco                   numeric(20,0)       null
  ,idbode                   numeric(20,0)       null
  ,idprov                   numeric(20,0)   not null
  ,idtidv                   numeric(20,0)   not null
  ,numero                   numeric(20,0)   not null
  ,fecha                    date            not null
  ,fecha_vencimiento        date                null
  ,afecto                   numeric(20,0)   not null
  ,exento                   numeric(20,0)   not null
  ,impuesto                 numeric(20,0)   not null
  ,total                    numeric(20,0)   not null
  ,idasco                   numeric(20,0)       null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table compras add constraint comp_pk primary key (id)
;

alter table compras add constraint comp_uk_01 unique (idprov, idtidv, numero)
;

/*************************************************************************************************************************/

create table detalles_compras (
   id                       numeric(20,0)   not null
  ,idcomp                   numeric(20,0)   not null
  ,correlativo              numeric(20,0)   not null
  ,idprod                   numeric(20,0)       null
  ,idserv                   numeric(20,0)       null
  ,otroinsumo               varchar(1000)       null
  ,cantidad                 numeric(20,0)   not null
  ,preciounitario           numeric(20,0)   not null
  ,idusuacrearegistro       numeric(20,0)   not null
  ,fechacrearegistro        timestamp       not null
  ,idusuamodifregistro      numeric(20,0)       null
  ,fechamodifregistro       timestamp           null
  ,idusuaborraregistro      numeric(20,0)       null
  ,fechaborraregistro       timestamp           null
)
;

alter table detalles_compras add constraint deco_pk primary key (id)
;

alter table detalles_compras add constraint deco_uk_01 unique (idcomp, correlativo)
;

alter table detalles_compras add constraint deco_chk_01 check (
                                                               (idprod is not null and idserv is     null and otroinsumo is     null)
                                                               or
                                                               (idprod is     null and idserv is not null and otroinsumo is     null)
                                                               or
                                                               (idprod is     null and idserv is     null and otroinsumo is not null)
                                                              )
;

/*************************************************************************************************************************/

create table tipos_asocs_ctas_ctbles (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table tipos_asocs_ctas_ctbles add constraint tacc_pk primary key (id)
;
alter table tipos_asocs_ctas_ctbles add constraint tacc_uk unique (descripcion)
;

/*************************************************************************************************************************/

create table tipos_cuentas_contables (
   id                       numeric(20,0)     not null
  ,idtacc                   numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table tipos_cuentas_contables add constraint ticc_pk primary key (id)
;
alter table tipos_cuentas_contables add constraint ticc_uk unique (idtacc, descripcion)
;

/*************************************************************************************************************************/

create table tipos_entradas_contables (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,descripcion_corta        varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table tipos_entradas_contables add constraint tiec_pk primary key (id)
;
alter table tipos_entradas_contables add constraint tiec_uk_01 unique (descripcion)
;
alter table tipos_entradas_contables add constraint tiec_uk_02 unique (descripcion_corta)
;

/*************************************************************************************************************************/

create table estados_periodos_contables (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table estados_periodos_contables add constraint espc_pk primary key (id)
;
alter table estados_periodos_contables add constraint espc_uk unique (descripcion)
;

/*************************************************************************************************************************/

create table tipos_asientos_contables (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table tipos_asientos_contables add constraint tiac_pk primary key (id)
;
alter table tipos_asientos_contables add constraint tiac_uk unique (descripcion)
;

/*************************************************************************************************************************/

create table origenes_asientos_contables (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table origenes_asientos_contables add constraint orac_pk primary key (id)
;
alter table origenes_asientos_contables add constraint orac_uk unique (descripcion)
;

/*************************************************************************************************************************/

create table estados_asientos_contables (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table estados_asientos_contables add constraint esac_pk primary key (id)
;
alter table estados_asientos_contables add constraint esac_uk unique (descripcion)
;

/*************************************************************************************************************************/

create table periodos_contables (
   id                       numeric(20,0)     not null
  ,idempr                   numeric(20,0)     not null
  ,mes                      numeric(2,0)      not null
  ,anno                     numeric(4,0)      not null
  ,idespc                   numeric(20,0)     not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table periodos_contables add constraint peco_pk primary key (id)
;

alter table periodos_contables add constraint peco_uk unique (idempr, mes, anno)
;

alter table periodos_contables add constraint peco_chk_01 check (mes between 1 and 12)
;

alter table periodos_contables add constraint peco_chk_02 check (anno > 1900)
;

/*************************************************************************************************************************/

create table asientos_contables (
   id                       numeric(20,0)     not null
  ,idpeco                   numeric(20,0)     not null
  ,idtiac                   numeric(20,0)     not null
  ,idesac                   numeric(20,0)     not null
  ,idorac                   numeric(20,0)     not null
  ,numero_asiento           numeric(20,0)     not null
  ,glosa                    varchar(100)      not null
  ,fecha_asiento            date              not null
  ,reversible               varchar(1)        not null
  ,idusuacreaasiento        numeric(20,0)     not null
  ,idusuaautorizaasiento    numeric(20,0)         null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table asientos_contables add constraint asco_pk primary key (id)
;

alter table asientos_contables add constraint asco_uk unique (idpeco, numero_asiento)
;

alter table asientos_contables add constraint asco_chk_01 check (reversible in ('S','N'))
;

/*************************************************************************************************************************/

create table detalles_asientos_contables (
   id                       numeric(20,0)     not null
  ,idasco                   numeric(20,0)     not null
  ,numero_linea             numeric(20,0)     not null
  ,idcuco                   numeric(20,0)     not null
  ,idtiec                   numeric(20,0)     not null
  ,idgere                   numeric(20,0)         null
  ,idproy                   numeric(20,0)         null
  ,idline                   numeric(20,0)         null
  ,idceco                   numeric(20,0)         null
  ,idtare                   numeric(20,0)         null
  ,monto                    numeric(20,0)     not null
  ,glosadet                 varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table detalles_asientos_contables add constraint deac_pk primary key (id)
;
alter table detalles_asientos_contables add constraint deac_uk_01 unique (idasco, numero_linea)
;
alter table detalles_asientos_contables add constraint deac_uk_02 unique (idasco, idcuco)
;

/*************************************************************************************************************************/

create table procesos_contables (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table procesos_contables add constraint prco_pk primary key (id)
;
alter table procesos_contables add constraint prco_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table procesos_contables_empresas (
   id                       numeric(20,0)     not null
  ,idempr                   numeric(20,0)     not null
  ,idprco                   numeric(20,0)     not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table procesos_contables_empresas add constraint prce_pk primary key (id)
;
alter table procesos_contables_empresas add constraint prce_uk_01 unique (idempr, idprco)
;

/*************************************************************************************************************************/

create table conceptos_contabilizacs_automats (
   id                       numeric(20,0)     not null
  ,descripcion              varchar(100)      not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table conceptos_contabilizacs_automats add constraint coca_pk primary key (id)
;
alter table conceptos_contabilizacs_automats add constraint coca_uk_01 unique (descripcion)
;

/*************************************************************************************************************************/

create table detalles_procesos_ctbles_empresas (
   id                       numeric(20,0)     not null
  ,idprce                   numeric(20,0)     not null
  ,idcoca                   numeric(20,0)     not null
  ,idcuco                   numeric(20,0)     not null
  ,idtiec                   numeric(20,0)     not null
  ,idusuacrearegistro       numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
  ,idusuamodifregistro      numeric(20,0)         null
  ,fechamodifregistro       timestamp             null
  ,idusuaborraregistro      numeric(20,0)         null
  ,fechaborraregistro       timestamp             null
)
;

alter table detalles_procesos_ctbles_empresas add constraint dpce_pk primary key (id)
;
alter table detalles_procesos_ctbles_empresas add constraint dpce_uk_01 unique (idprce, idcoca)
;

/*************************************************************************************************************************/





-- Tablas temporales: usadas para obtener informes

/*************************************************************************************************************************/

create table tmp_balance (
   idsesion                 numeric(20,0)     not null
  ,correlativo              numeric(20,0)     not null
  ,cuenta_contable          varchar(100)      not null
  ,descripcion_cuenta       varchar(1000)     not null
  ,debe_o_haber             varchar(1)        not null
  ,valor                    numeric(20,0)     not null
  ,fechacrearegistro        timestamp         not null
)
;

/*************************************************************************************************************************/





-- Sección foreign keys

alter table conceptos_rendiciones_gastos      add constraint corg_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table conceptos_rendiciones_gastos      add constraint corg_fk_cuco  foreign key (idcuco)                 references cuentas_contables                (id);
alter table conceptos_rendiciones_gastos      add constraint corg_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table conceptos_rendiciones_gastos      add constraint corg_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_rendiciones_gastos       add constraint derg_fk_rega  foreign key (idrega)                 references rendiciones_gastos               (id);
alter table detalles_rendiciones_gastos       add constraint derg_fk_tidv  foreign key (idtidv)                 references tipos_doctos_ventas              (id);
alter table detalles_rendiciones_gastos       add constraint derg_fk_corg  foreign key (idcorg)                 references conceptos_rendiciones_gastos     (id);
alter table detalles_rendiciones_gastos       add constraint derg_fk_prov  foreign key (idprov)                 references proveedores                      (id);
alter table detalles_rendiciones_gastos       add constraint derg_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_rendiciones_gastos       add constraint derg_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table fondos_a_rendir                   add constraint fore_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table fondos_a_rendir                   add constraint fore_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table fondos_a_rendir                   add constraint fore_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table fondos_a_rendir                   add constraint fore_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table fondos_a_rendir                   add constraint fore_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table fondos_a_rendir                   add constraint fore_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table fondos_a_rendir                   add constraint fore_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table fondos_a_rendir                   add constraint fore_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table rendiciones_gastos                add constraint rega_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table rendiciones_gastos                add constraint rega_fk_tirg  foreign key (idtirg)                 references tipos_rendiciones_gastos         (id);
alter table rendiciones_gastos                add constraint rega_fk_fore  foreign key (idfore)                 references fondos_a_rendir                  (id);
alter table rendiciones_gastos                add constraint rega_fk_esrg  foreign key (idesrg)                 references estados_rendiciones_gastos       (id);
alter table rendiciones_gastos                add constraint rega_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table rendiciones_gastos                add constraint rega_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table rendiciones_gastos                add constraint rega_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table rendiciones_gastos                add constraint rega_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table rendiciones_gastos                add constraint rega_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table rendiciones_gastos                add constraint rega_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table rendiciones_gastos                add constraint rega_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table historiales_rendiciones           add constraint hirn_fk_rega  foreign key (idrega)                 references rendiciones_gastos               (id);
alter table historiales_rendiciones           add constraint hirn_fk_esrg  foreign key (idesrg)                 references estados_rendiciones_gastos       (id);
alter table historiales_rendiciones           add constraint hirn_fk_usua  foreign key (idusuacambiaestado)     references usuarios                         (id);

alter table cotizaciones_compras              add constraint coco_fk_requ  foreign key (idrequ)                 references requisiciones                    (id);
alter table cotizaciones_compras              add constraint coco_fk_orco  foreign key (idorco)                 references ordenes_compras                  (id);
alter table cotizaciones_compras              add constraint coco_fk_prov  foreign key (idprov)                 references proveedores                      (id);
alter table cotizaciones_compras              add constraint coco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table cotizaciones_compras              add constraint coco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_cotizaciones_compras     add constraint decc_fk_coco  foreign key (idcoco)                 references cotizaciones_compras             (id);
alter table detalles_cotizaciones_compras     add constraint decc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_cotizaciones_compras     add constraint decc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);
alter table detalles_cotizaciones_compras     add constraint decc_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_cotizaciones_compras     add constraint decc_fk_serv  foreign key (idserv)                 references servicios                        (id);

alter table proveedores                       add constraint prov_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table proveedores                       add constraint prov_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table proveedores                       add constraint prov_fk_tipp  foreign key (idtipp)                 references tipos_proveedores                (id);
alter table proveedores                       add constraint prov_fk1_unte foreign key (idunte1)                references unidades_territoriales           (id);
alter table proveedores                       add constraint prov_fk2_unte foreign key (idunte2)                references unidades_territoriales           (id);
alter table proveedores                       add constraint prov_fk3_unte foreign key (idunte3)                references unidades_territoriales           (id);
alter table proveedores                       add constraint prov_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table proveedores                       add constraint prov_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table recepciones_compras               add constraint reco_fk_orco  foreign key (idorco)                 references ordenes_compras                  (id);
alter table recepciones_compras               add constraint reco_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table recepciones_compras               add constraint reco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table recepciones_compras               add constraint reco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_recepciones_compras      add constraint derc_fk_reco  foreign key (idreco)                 references recepciones_compras              (id);
alter table detalles_recepciones_compras      add constraint derc_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_recepciones_compras      add constraint derc_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_recepciones_compras      add constraint derc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_recepciones_compras      add constraint derc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_ordenes_compras          add constraint deoc_fk_orco  foreign key (idorco)                 references ordenes_compras                  (id);
alter table detalles_ordenes_compras          add constraint deoc_fk_edoc  foreign key (idedoc)                 references estados_detalles_ordenes_compras (id);
alter table detalles_ordenes_compras          add constraint deoc_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_ordenes_compras          add constraint deoc_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_ordenes_compras          add constraint deoc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_ordenes_compras          add constraint deoc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table ordenes_compras                   add constraint orco_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table ordenes_compras                   add constraint orco_fk_requ  foreign key (idrequ)                 references requisiciones                    (id);
alter table ordenes_compras                   add constraint orco_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table ordenes_compras                   add constraint orco_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table ordenes_compras                   add constraint orco_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table ordenes_compras                   add constraint orco_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table ordenes_compras                   add constraint orco_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table ordenes_compras                   add constraint orco_fk_esoc  foreign key (idesoc)                 references estados_ordenes_compras          (id);
alter table ordenes_compras                   add constraint orco_fk_prov  foreign key (idprov)                 references proveedores                      (id);
alter table ordenes_compras                   add constraint orco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table ordenes_compras                   add constraint orco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table historiales_requisiciones         add constraint hire_fk_requ  foreign key (idrequ)                 references requisiciones                    (id);
alter table historiales_requisiciones         add constraint hire_fk_ereq  foreign key (idereq)                 references estados_requisiciones            (id);
alter table historiales_requisiciones         add constraint hire_fk_usua  foreign key (idusuacambiaestado)     references usuarios                         (id);

alter table autorizadores_requisiciones       add constraint aure_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table autorizadores_requisiciones       add constraint aure_fk1_perf foreign key (idperfautorizador)      references perfiles                         (id);
alter table autorizadores_requisiciones       add constraint aure_fk2_perf foreign key (idperfautorizado)       references perfiles                         (id);
alter table autorizadores_requisiciones       add constraint aure_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table autorizadores_requisiciones       add constraint aure_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table autorizadores_rendiciones         add constraint aurn_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table autorizadores_rendiciones         add constraint aurn_fk1_perf foreign key (idperfautorizador)      references perfiles                         (id);
alter table autorizadores_rendiciones         add constraint aurn_fk2_perf foreign key (idperfautorizado)       references perfiles                         (id);
alter table autorizadores_rendiciones         add constraint aurn_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table autorizadores_rendiciones         add constraint aurn_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table requisiciones                     add constraint requ_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table requisiciones                     add constraint requ_fk_tire  foreign key (idtire)                 references tipos_requisiciones              (id);
alter table requisiciones                     add constraint requ_fk4_usua foreign key (idusuasolicitareq)      references usuarios                         (id);
alter table requisiciones                     add constraint requ_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table requisiciones                     add constraint requ_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table requisiciones                     add constraint requ_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table requisiciones                     add constraint requ_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table requisiciones                     add constraint requ_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table requisiciones                     add constraint requ_fk_ereq  foreign key (idereq)                 references estados_requisiciones            (id);
alter table requisiciones                     add constraint requ_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table requisiciones                     add constraint requ_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_requisiciones            add constraint dere_fk_requ  foreign key (idrequ)                 references requisiciones                    (id);
alter table detalles_requisiciones            add constraint dere_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_requisiciones            add constraint dere_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_requisiciones            add constraint dere_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_requisiciones            add constraint dere_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table bitacoras_cambios_precios         add constraint bicp_fk_prod  foreign key (idprod)                 references productos                        (id);

alter table descuentos                        add constraint desu_fk_fapr  foreign key (idfapr)                 references familias_productos               (id);
alter table descuentos                        add constraint desu_fk_sfpr  foreign key (idsfpr)                 references sub_familias_productos           (id);
alter table descuentos                        add constraint desu_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table descuentos                        add constraint desu_fk_esre  foreign key (idesre)                 references estados_registros                (id);
alter table descuentos                        add constraint desu_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table descuentos                        add constraint desu_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table movimientos_bodegas               add constraint mobo_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table movimientos_bodegas               add constraint mobo_fk_timb  foreign key (idtimb)                 references tipos_movimientos_bodegas        (id);
alter table movimientos_bodegas               add constraint mobo_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table movimientos_bodegas               add constraint mobo_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_movtos_bodegas           add constraint demb_fk_mobo  foreign key (idmobo)                 references movimientos_bodegas              (id);
alter table detalles_movtos_bodegas           add constraint demb_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_movtos_bodegas           add constraint demb_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_movtos_bodegas           add constraint demb_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table sub_familias_productos            add constraint sfpr_fk_fapr  foreign key (idfapr)                 references familias_productos               (id);
alter table sub_familias_productos            add constraint sfpr_fk_cuco  foreign key (idcuco)                 references cuentas_contables                (id);
alter table sub_familias_productos            add constraint sfpr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table sub_familias_productos            add constraint sfpr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table familias_productos                add constraint fapr_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table familias_productos                add constraint fapr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table familias_productos                add constraint fapr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_listas_precios           add constraint delp_fk_lipr  foreign key (idlipr)                 references listas_precios                   (id);
alter table detalles_listas_precios           add constraint delp_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_listas_precios           add constraint delp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_listas_precios           add constraint delp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table listas_precios                    add constraint lipr_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table listas_precios                    add constraint lipr_fk_esre  foreign key (idesre)                 references estados_registros                (id);
alter table listas_precios                    add constraint lipr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table listas_precios                    add constraint lipr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table bodegas                           add constraint bode_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table bodegas                           add constraint bode_fk_unte  foreign key (idunte)                 references unidades_territoriales           (id);
alter table bodegas                           add constraint bode_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table bodegas                           add constraint bode_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table bodegas_productos                 add constraint bopr_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table bodegas_productos                 add constraint bopr_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table bodegas_productos                 add constraint bopr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table bodegas_productos                 add constraint bopr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table solicitudes_servs_hono            add constraint sosh_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table solicitudes_servs_hono            add constraint sosh_fk_pers  foreign key (idpers)                 references personas                         (id);
alter table solicitudes_servs_hono            add constraint sosh_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table solicitudes_servs_hono            add constraint sosh_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table solicitudes_servs_hono            add constraint sosh_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table solicitudes_servs_hono            add constraint sosh_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table solicitudes_servs_hono            add constraint sosh_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table solicitudes_servs_hono            add constraint sosh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table solicitudes_servs_hono            add constraint sosh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table cotizaciones_servs_hono           add constraint cosh_fk_sosh  foreign key (idsosh)                 references solicitudes_servs_hono           (id);
alter table cotizaciones_servs_hono           add constraint cosh_fk_pers  foreign key (idpers)                 references personas                         (id);
alter table cotizaciones_servs_hono           add constraint cosh_fk_ecsh  foreign key (idecsh)                 references estados_cotizacs_servs_hono      (id);
alter table cotizaciones_servs_hono           add constraint cosh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table cotizaciones_servs_hono           add constraint cosh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table doctos_cotizacs_servs_hono        add constraint dcsh_fk_cosh  foreign key (idcosh)                 references cotizaciones_servs_hono          (id);
alter table doctos_cotizacs_servs_hono        add constraint dcsh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table doctos_cotizacs_servs_hono        add constraint dcsh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table ordenes_servicios_hono            add constraint orsh_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_sosh  foreign key (idsosh)                 references solicitudes_servs_hono           (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_pers  foreign key (idpers)                 references personas                         (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_eosh  foreign key (ideosh)                 references estados_ordenes_servs_hono       (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table ordenes_servicios_hono            add constraint orsh_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table ordenes_servicios_hono            add constraint orsh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table ordenes_servicios_hono            add constraint orsh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table doctos_ordenes_servs_hono         add constraint dosh_fk_orsh  foreign key (idorsh)                 references ordenes_servicios_hono           (id);
alter table doctos_ordenes_servs_hono         add constraint dosh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table doctos_ordenes_servs_hono         add constraint dosh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table pagos_ordenes_servs_hono          add constraint posh_fk_orsh  foreign key (idorsh)                 references ordenes_servicios_hono           (id);
alter table pagos_ordenes_servs_hono          add constraint posh_fk_tifp  foreign key (idtifp)                 references tipos_formas_pagos               (id);
alter table pagos_ordenes_servs_hono          add constraint posh_fk_epos  foreign key (idepos)                 references estados_pagos_ords_servs_hono    (id);
alter table pagos_ordenes_servs_hono          add constraint posh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table pagos_ordenes_servs_hono          add constraint posh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table documentos_legales                add constraint dole_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table documentos_legales                add constraint dole_fk_tidl  foreign key (idtidl)                 references tipos_documentos_legales         (id);
alter table documentos_legales                add constraint dole_fk_esdl  foreign key (idesdl)                 references estados_documentos_legales       (id);
alter table documentos_legales                add constraint dole_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table documentos_legales                add constraint dole_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_documentos_legales        add constraint esdl_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table estados_documentos_legales        add constraint esdl_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_documentos_legales        add constraint esdl_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_documentos_legales          add constraint tidl_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table tipos_documentos_legales          add constraint tidl_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_documentos_legales          add constraint tidl_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table cuentas_contables                 add constraint cuco_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table cuentas_contables                 add constraint cuco_fk_ticc  foreign key (idticc)                 references tipos_cuentas_contables          (id);
alter table cuentas_contables                 add constraint cuco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table cuentas_contables                 add constraint cuco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table perfiles_programas                add constraint pepr_fk_perf  foreign key (idperf)                 references perfiles                         (id);
alter table perfiles_programas                add constraint pepr_fk_prog  foreign key (idprog)                 references programas                        (id);
alter table perfiles_programas                add constraint pepr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table perfiles_programas                add constraint pepr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table paises                            add constraint pais_fk_mone  foreign key (idmone)                 references monedas                          (id);
alter table paises                            add constraint pais_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table paises                            add constraint pais_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table grupos_empresariales              add constraint grem_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table grupos_empresariales              add constraint grem_fk_esge  foreign key (idesge)                 references estados_grem                     (id);
alter table grupos_empresariales              add constraint grem_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table grupos_empresariales              add constraint grem_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table rubros                            add constraint rubr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table rubros                            add constraint rubr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table empresas                          add constraint empr_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table empresas                          add constraint empr_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table empresas                          add constraint empr_fk_rubr  foreign key (idrubr)                 references rubros                           (id);
alter table empresas                          add constraint empr_fk_esre  foreign key (idesre)                 references estados_registros                (id);
alter table empresas                          add constraint empr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table empresas                          add constraint empr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table parametros                        add constraint para_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table parametros                        add constraint para_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table parametros                        add constraint para_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table parametros_empresas               add constraint paem_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table parametros_empresas               add constraint paem_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table parametros_empresas               add constraint paem_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table personas                          add constraint pers_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table personas                          add constraint pers_fk_esci  foreign key (idesci)                 references estados_civiles                  (id);
alter table personas                          add constraint pers_fk_sexo  foreign key (idsexo)                 references sexos                            (id);
alter table personas                          add constraint pers_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table personas                          add constraint pers_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table personas                          add constraint pers_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table programas                         add constraint prog_fk_prog  foreign key (idprogpadre)            references programas                        (id);
alter table programas                         add constraint prog_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table programas                         add constraint prog_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table usuarios                          add constraint usua_fk_esre  foreign key (idesre)                 references estados_registros                (id);
alter table usuarios                          add constraint usua_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table usuarios                          add constraint usua_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table usuarios_perfiles                 add constraint uspe_fk_usua  foreign key (idusua)                 references usuarios                         (id);
alter table usuarios_perfiles                 add constraint uspe_fk_perf  foreign key (idperf)                 references perfiles                         (id);
alter table usuarios_perfiles                 add constraint uspe_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table usuarios_perfiles                 add constraint uspe_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table usuarios_perfiles                 add constraint uspe_fk_esre  foreign key (idesre)                 references estados_registros                (id);
alter table usuarios_perfiles                 add constraint uspe_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table usuarios_perfiles                 add constraint uspe_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table valores_paises                    add constraint vapa_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table valores_paises                    add constraint vapa_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table valores_paises                    add constraint vapa_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table gerencias                         add constraint gere_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table gerencias                         add constraint gere_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table gerencias                         add constraint gere_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table proyectos                         add constraint proy_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table proyectos                         add constraint proy_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table proyectos                         add constraint proy_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table lineas_negocios                   add constraint line_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table lineas_negocios                   add constraint line_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table lineas_negocios                   add constraint line_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table centros_costos                    add constraint ceco_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table centros_costos                    add constraint ceco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table centros_costos                    add constraint ceco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tareas                            add constraint tare_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table tareas                            add constraint tare_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tareas                            add constraint tare_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table unidades_territoriales            add constraint unte_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table unidades_territoriales            add constraint unte_fk_unte  foreign key (iduntepadre)            references unidades_territoriales           (id);
alter table unidades_territoriales            add constraint unte_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table unidades_territoriales            add constraint unte_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table impuestos                         add constraint impu_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table impuestos                         add constraint impu_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table impuestos                         add constraint impu_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_productos_impuestos         add constraint tipi_fk_tipr  foreign key (idtipr)                 references tipos_productos                  (id);
alter table tipos_productos_impuestos         add constraint tipi_fk_impu  foreign key (idimpu)                 references impuestos                        (id);
alter table tipos_productos_impuestos         add constraint tipi_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_productos_impuestos         add constraint tipi_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table clientes                          add constraint clie_fk_grem  foreign key (idgrem)                 references grupos_empresariales             (id);
alter table clientes                          add constraint clie_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table clientes                          add constraint clie_fk_ticl  foreign key (idticl)                 references tipos_clientes                   (id);
alter table clientes                          add constraint clie_fk1_unte foreign key (idunte1)                references unidades_territoriales           (id);
alter table clientes                          add constraint clie_fk2_unte foreign key (idunte2)                references unidades_territoriales           (id);
alter table clientes                          add constraint clie_fk3_unte foreign key (idunte3)                references unidades_territoriales           (id);
alter table clientes                          add constraint clie_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table clientes                          add constraint clie_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table cotizaciones_ventas               add constraint cove_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table cotizaciones_ventas               add constraint cove_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table cotizaciones_ventas               add constraint cove_fk_clie  foreign key (idclie)                 references clientes                         (id);
alter table cotizaciones_ventas               add constraint cove_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table cotizaciones_ventas               add constraint cove_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table cotizaciones_ventas               add constraint cove_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table cotizaciones_ventas               add constraint cove_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table cotizaciones_ventas               add constraint cove_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table cotizaciones_ventas               add constraint cove_fk_escv  foreign key (idescv)                 references estados_cotizaciones_vtas        (id);
alter table cotizaciones_ventas               add constraint cove_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table cotizaciones_ventas               add constraint cove_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);
alter table cotizaciones_ventas               add constraint cove_fk4_usua foreign key (idusuavendedor)         references usuarios                         (id);

alter table detalles_cotizs_vtas              add constraint decv_fk_cove  foreign key (idcove)                 references cotizaciones_ventas              (id);
alter table detalles_cotizs_vtas              add constraint decv_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_cotizs_vtas              add constraint decv_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_cotizs_vtas              add constraint decv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_cotizs_vtas              add constraint decv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_doctos_ventas               add constraint tidv_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table tipos_doctos_ventas               add constraint tidv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_doctos_ventas               add constraint tidv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table ventas                            add constraint vent_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table ventas                            add constraint vent_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table ventas                            add constraint vent_fk_nove  foreign key (idnove)                 references notas_ventas                     (id);
alter table ventas                            add constraint vent_fk_tidv  foreign key (idtidv)                 references tipos_doctos_ventas              (id);
alter table ventas                            add constraint vent_fk_clie  foreign key (idclie)                 references clientes                         (id);
alter table ventas                            add constraint vent_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table ventas                            add constraint vent_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table ventas                            add constraint vent_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table ventas                            add constraint vent_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table ventas                            add constraint vent_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table ventas                            add constraint vent_fk_esve  foreign key (idesve)                 references estados_ventas                   (id);
alter table ventas                            add constraint vent_fk_asco  foreign key (idasco)                 references asientos_contables               (id);
alter table ventas                            add constraint vent_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table ventas                            add constraint vent_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);
alter table ventas                            add constraint vent_fk4_usua foreign key (idusuavendedor)         references usuarios                         (id);

alter table detalles_ventas                   add constraint deve_fk_vent  foreign key (idvent)                 references ventas                           (id);
alter table detalles_ventas                   add constraint deve_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_ventas                   add constraint deve_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_ventas                   add constraint deve_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_ventas                   add constraint deve_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table notas_ventas                      add constraint nove_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table notas_ventas                      add constraint nove_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table notas_ventas                      add constraint nove_fk_cove  foreign key (idcove)                 references cotizaciones_ventas              (id);
alter table notas_ventas                      add constraint nove_fk_clie  foreign key (idclie)                 references clientes                         (id);
alter table notas_ventas                      add constraint nove_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table notas_ventas                      add constraint nove_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table notas_ventas                      add constraint nove_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table notas_ventas                      add constraint nove_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table notas_ventas                      add constraint nove_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table notas_ventas                      add constraint nove_fk_esnv  foreign key (idesnv)                 references estados_notas_vtas               (id);
alter table notas_ventas                      add constraint nove_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table notas_ventas                      add constraint nove_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);
alter table notas_ventas                      add constraint nove_fk4_usua foreign key (idusuavendedor)         references usuarios                         (id);

alter table detalles_notas_vtas               add constraint denv_fk_nove  foreign key (idnove)                 references notas_ventas                     (id);
alter table detalles_notas_vtas               add constraint denv_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_notas_vtas               add constraint denv_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_notas_vtas               add constraint denv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_notas_vtas               add constraint denv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table formas_pagos_notas_ventas         add constraint fpnv_fk_nove  foreign key (idnove)                 references notas_ventas                     (id);
alter table formas_pagos_notas_ventas         add constraint fpnv_fk_tifp  foreign key (idtifp)                 references tipos_formas_pagos               (id);
alter table formas_pagos_notas_ventas         add constraint fpnv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table formas_pagos_notas_ventas         add constraint fpnv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table formas_pagos_ventas               add constraint fpve_fk_vent  foreign key (idvent)                 references ventas                           (id);
alter table formas_pagos_ventas               add constraint fpve_fk_tifp  foreign key (idtifp)                 references tipos_formas_pagos               (id);
alter table formas_pagos_ventas               add constraint fpve_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table formas_pagos_ventas               add constraint fpve_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table productos                         add constraint prod_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table productos                         add constraint prod_fk_sfpr  foreign key (idsfpr)                 references sub_familias_productos           (id);
alter table productos                         add constraint prod_fk_tipr  foreign key (idtipr)                 references tipos_productos                  (id);
alter table productos                         add constraint prod_fk_unmp  foreign key (idunmp)                 references unidades_medidas_productos       (id);
alter table productos                         add constraint prod_fk_orpr  foreign key (idorpr)                 references origenes_productos               (id);
alter table productos                         add constraint prod_fk_esre  foreign key (idesre)                 references estados_registros                (id);
alter table productos                         add constraint prod_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table productos                         add constraint prod_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table servicios                         add constraint serv_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table servicios                         add constraint serv_fk_tise  foreign key (idtise)                 references tipos_servicios                  (id);
alter table servicios                         add constraint serv_fk_unms  foreign key (idunms)                 references unidades_medidas_servicios       (id);
alter table servicios                         add constraint serv_fk_mone  foreign key (idmone)                 references monedas                          (id);
alter table servicios                         add constraint serv_fk_cuco  foreign key (idcuco)                 references cuentas_contables                (id);
alter table servicios                         add constraint serv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table servicios                         add constraint serv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table dominios                          add constraint domi_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table dominios                          add constraint domi_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table valores_dominios                  add constraint vado_fk_domi  foreign key (iddomi)                 references dominios                         (id);
alter table valores_dominios                  add constraint vado_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table valores_dominios                  add constraint vado_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_civiles                   add constraint esci_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_civiles                   add constraint esci_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_cotizaciones_vtas         add constraint escv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_cotizaciones_vtas         add constraint escv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_cotizacs_servs_hono       add constraint ecsh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_cotizacs_servs_hono       add constraint ecsh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_detalles_ordenes_compras  add constraint edoc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_detalles_ordenes_compras  add constraint edoc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_grem                      add constraint esgr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_grem                      add constraint esgr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_notas_vtas                add constraint esnv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_notas_vtas                add constraint esnv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_ordenes_compras           add constraint esoc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_ordenes_compras           add constraint esoc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_ordenes_servs_hono        add constraint eosh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_ordenes_servs_hono        add constraint eosh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_pagos_ords_servs_hono     add constraint epos_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_pagos_ords_servs_hono     add constraint epos_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_registros                 add constraint esre_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_registros                 add constraint esre_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_rendiciones_gastos        add constraint esrg_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_rendiciones_gastos        add constraint esrg_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_requisiciones             add constraint ereq_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_requisiciones             add constraint ereq_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_solics_servs_hono         add constraint essh_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_solics_servs_hono         add constraint essh_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_ventas                    add constraint esve_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_ventas                    add constraint esve_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table monedas                           add constraint mone_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table monedas                           add constraint mone_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table origenes_productos                add constraint orpr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table origenes_productos                add constraint orpr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table perfiles                          add constraint perf_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table perfiles                          add constraint perf_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table sexos                             add constraint sexo_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table sexos                             add constraint sexo_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_clientes                    add constraint ticl_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_clientes                    add constraint ticl_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_cotizaciones_vtas           add constraint ticv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_cotizaciones_vtas           add constraint ticv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_formas_pagos                add constraint tifp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_formas_pagos                add constraint tifp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_movimientos_bodegas         add constraint timb_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_movimientos_bodegas         add constraint timb_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_productos                   add constraint tipr_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_productos                   add constraint tipr_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_proveedores                 add constraint tipp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_proveedores                 add constraint tipp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_rendiciones_gastos          add constraint tirg_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_rendiciones_gastos          add constraint tirg_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_requisiciones               add constraint tire_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_requisiciones               add constraint tire_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_servicios                   add constraint tise_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_servicios                   add constraint tise_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table unidades_medidas_productos        add constraint unmp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table unidades_medidas_productos        add constraint unmp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table unidades_medidas_servicios        add constraint unms_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table unidades_medidas_servicios        add constraint unms_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table compras                           add constraint comp_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table compras                           add constraint comp_fk_reco  foreign key (idreco)                 references recepciones_compras              (id);
alter table compras                           add constraint comp_fk_bode  foreign key (idbode)                 references bodegas                          (id);
alter table compras                           add constraint comp_fk_prov  foreign key (idprov)                 references proveedores                      (id);
alter table compras                           add constraint comp_fk_tidv  foreign key (idtidv)                 references tipos_doctos_ventas              (id);
alter table compras                           add constraint comp_fk_asco  foreign key (idasco)                 references asientos_contables               (id);
alter table compras                           add constraint comp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table compras                           add constraint comp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_compras                  add constraint deco_fk_comp  foreign key (idcomp)                 references compras                          (id);
alter table detalles_compras                  add constraint deco_fk_prod  foreign key (idprod)                 references productos                        (id);
alter table detalles_compras                  add constraint deco_fk_serv  foreign key (idserv)                 references servicios                        (id);
alter table detalles_compras                  add constraint deco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_compras                  add constraint deco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_asientos_contables       add constraint deac_fk_asco  foreign key (idasco)                 references asientos_contables               (id);
alter table detalles_asientos_contables       add constraint deac_fk_cuco  foreign key (idcuco)                 references cuentas_contables                (id);
alter table detalles_asientos_contables       add constraint deac_fk_tiec  foreign key (idtiec)                 references tipos_entradas_contables         (id);
alter table detalles_asientos_contables       add constraint deac_fk_gere  foreign key (idgere)                 references gerencias                        (id);
alter table detalles_asientos_contables       add constraint deac_fk_proy  foreign key (idproy)                 references proyectos                        (id);
alter table detalles_asientos_contables       add constraint deac_fk_line  foreign key (idline)                 references lineas_negocios                  (id);
alter table detalles_asientos_contables       add constraint deac_fk_ceco  foreign key (idceco)                 references centros_costos                   (id);
alter table detalles_asientos_contables       add constraint deac_fk_tare  foreign key (idtare)                 references tareas                           (id);
alter table detalles_asientos_contables       add constraint deac_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_asientos_contables       add constraint deac_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_asocs_ctas_ctbles           add constraint tacc_fk2_usua foreign key (idusuaborraregistro)    references usuarios                         (id);
alter table tipos_asocs_ctas_ctbles           add constraint tacc_fk3_usua foreign key (idusuamodifregistro)    references usuarios                         (id);

alter table tipos_cuentas_contables           add constraint ticc_fk_tacc  foreign key (idtacc)                 references tipos_asocs_ctas_ctbles          (id);
alter table tipos_cuentas_contables           add constraint ticc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_cuentas_contables           add constraint ticc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table asientos_contables                add constraint asco_fk_peco  foreign key (idpeco)                 references periodos_contables               (id);
alter table asientos_contables                add constraint asco_fk_esac  foreign key (idesac)                 references estados_asientos_contables       (id);
alter table asientos_contables                add constraint asco_fk_tiac  foreign key (idtiac)                 references tipos_asientos_contables         (id);
alter table asientos_contables                add constraint asco_fk_orac  foreign key (idorac)                 references origenes_asientos_contables      (id);
alter table asientos_contables                add constraint asco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table asientos_contables                add constraint asco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);
alter table asientos_contables                add constraint asco_fk4_usua foreign key (idusuacreaasiento)      references usuarios                         (id);
alter table asientos_contables                add constraint asco_fk5_usua foreign key (idusuaautorizaasiento)  references usuarios                         (id);

alter table periodos_contables                add constraint peco_fk_espc  foreign key (idespc)                 references estados_periodos_contables       (id);
alter table periodos_contables                add constraint peco_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table periodos_contables                add constraint peco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table periodos_contables                add constraint peco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_entradas_contables          add constraint tiec_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_entradas_contables          add constraint tiec_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_periodos_contables        add constraint espc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_periodos_contables        add constraint espc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table estados_asientos_contables        add constraint esac_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table estados_asientos_contables        add constraint esac_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table origenes_asientos_contables       add constraint orac_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table origenes_asientos_contables       add constraint orac_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_asientos_contables          add constraint tipo_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_asientos_contables          add constraint tipo_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table procesos_contables                add constraint prco_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table procesos_contables                add constraint prco_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table procesos_contables_empresas       add constraint prce_fk_empr  foreign key (idempr)                 references empresas                         (id);
alter table procesos_contables_empresas       add constraint prce_fk_prco  foreign key (idprco)                 references procesos_contables               (id);
alter table procesos_contables_empresas       add constraint prce_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table procesos_contables_empresas       add constraint prce_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table conceptos_contabilizacs_automats  add constraint coca_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table conceptos_contabilizacs_automats  add constraint coca_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table detalles_procesos_ctbles_empresas add constraint dpce_fk_coca  foreign key (idcoca)                 references conceptos_contabilizacs_automats (id);
alter table detalles_procesos_ctbles_empresas add constraint dpce_fk_cuco  foreign key (idcuco)                 references cuentas_contables                (id);
alter table detalles_procesos_ctbles_empresas add constraint dpce_fk_prce  foreign key (idprce)                 references procesos_contables_empresas      (id);
alter table detalles_procesos_ctbles_empresas add constraint dpce_fk_tiec  foreign key (idtiec)                 references tipos_entradas_contables         (id);
alter table detalles_procesos_ctbles_empresas add constraint dpce_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table detalles_procesos_ctbles_empresas add constraint dpce_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_cuentas_bancarias           add constraint ticb_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_cuentas_bancarias           add constraint ticb_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table bancos                            add constraint banc_fk_pais  foreign key (idpais)                 references paises                           (id);
alter table bancos                            add constraint banc_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table bancos                            add constraint banc_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table cuentas_bancarias_proveedores     add constraint cubp_fk_prov  foreign key (idprov)                 references proveedores                      (id);
alter table cuentas_bancarias_proveedores     add constraint cubp_fk_banc  foreign key (idbanc)                 references bancos                           (id);
alter table cuentas_bancarias_proveedores     add constraint cubp_fk_ticb  foreign key (idticb)                 references tipos_cuentas_bancarias          (id);
alter table cuentas_bancarias_proveedores     add constraint cubp_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table cuentas_bancarias_proveedores     add constraint cubp_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table tipos_usos_doctos_ventas          add constraint tudv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table tipos_usos_doctos_ventas          add constraint tudv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

alter table usos_doctos_ventas                add constraint usdv_fk_tudv  foreign key (idtudv)                 references tipos_usos_doctos_ventas         (id);
alter table usos_doctos_ventas                add constraint usdv_fk_tidv  foreign key (idtidv)                 references tipos_doctos_ventas              (id);
alter table usos_doctos_ventas                add constraint usdv_fk2_usua foreign key (idusuamodifregistro)    references usuarios                         (id);
alter table usos_doctos_ventas                add constraint usdv_fk3_usua foreign key (idusuaborraregistro)    references usuarios                         (id);

\q
