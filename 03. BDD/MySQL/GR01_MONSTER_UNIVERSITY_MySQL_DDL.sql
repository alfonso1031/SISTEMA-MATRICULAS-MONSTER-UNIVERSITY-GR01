/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     19/11/2025 0:10:50                           */
/*==============================================================*/


drop table if exists FECAF_CABFAC;

drop table if exists FECLI_CLIENT;

drop table if exists FEDET_DETFAC;

drop table if exists FEFOP_FORPAG;

drop table if exists FEPAF_PARFIN;

drop table if exists MEART_ART;

drop table if exists PEAESTU_ESTUD;

drop table if exists PEAMATR_MATRI;

drop table if exists PEAPREQ_PRERQ;

drop table if exists PECAR_CARGO;

drop table if exists PEDEP_DEPAR;

drop table if exists PEEASIG_ASIGN;

drop table if exists PEEAUDI_AUDLOG;

drop table if exists PEECARR_CARRE;

drop table if exists PEEDOCE_DOCEN;

drop table if exists PEEEMP_EMPLE;

drop table if exists PEEGRUP_GRUPO;

drop table if exists PEESC_ESTCIV;

drop table if exists PEPAG_PAG;

drop table if exists PEPER_PER;

drop table if exists PESEX_SEXO;

drop table if exists XEEST_ESTAD;

drop table if exists XEOPC_OPCIO;

drop table if exists XEOXP_OPCPE;

drop table if exists XEPER_PERFI;

drop table if exists XESIS_SISTE;

drop table if exists XEUSU_USUAR;

drop table if exists XEUXP_USUPE;

/*==============================================================*/
/* Table: FECAF_CABFAC                                          */
/*==============================================================*/
create table FECAF_CABFAC
(
   FECAF_NUMFAC         char(6) not null,
   FECLI_CODIGO         char(6) not null,
   PEEEMP_CODIGO        char(9) not null,
   FEFOP_CODIGO         char(1) not null,
   FECAF_FECEMI         datetime not null,
   FECAF_AUTSRI         varchar(50),
   FECAF_FEASRI         datetime,
   FECAF_TOTAL          numeric(10,2) not null,
   FECAF_IVA            numeric(10,2) not null,
   FECAF_DESCUES        numeric(10,2),
   FECAF_TOTPAG         numeric(10,2) not null,
   FECAF_SUBTOT         numeric(10,2) not null,
   primary key (FECAF_NUMFAC)
);

alter table FECAF_CABFAC comment 'Entidad utilizada para la gestión de la cabecera de la FACTU';

/*==============================================================*/
/* Table: FECLI_CLIENT                                          */
/*==============================================================*/
create table FECLI_CLIENT
(
   FECLI_CODIGO         char(6) not null,
   FECLI_APELLI         varchar(50) not null,
   FECLI_NOMBRE         varchar(50) not null,
   FECLI_DIRECC         varchar(200),
   FECLI_TELEFO         varchar(15),
   FECLI_EMAIL          varchar(100) not null,
   FECLI_CEDULA         char(10),
   FECLI_RUC            char(13),
   FECLI_RAZON          char(13),
   FECLI_DISCAPA        blob not null,
   primary key (FECLI_CODIGO)
);

alter table FECLI_CLIENT comment 'Entidad utilizada para realizar la gestión (CRUD) de CLIENTE';

/*==============================================================*/
/* Table: FEDET_DETFAC                                          */
/*==============================================================*/
create table FEDET_DETFAC
(
   FECAF_NUMFAC         char(6) not null,
   MEART_CODIGO         char(10) not null,
   FEDET_CANTID         numeric(10,2) not null,
   FEDET_PRECIO         numeric(10,2) not null,
   FEDET_SUBTOT         numeric(10,2) not null,
   FEDET_GENIVA         smallint not null,
   FEDET_IVA            numeric(12,2) not null,
   primary key (FECAF_NUMFAC, MEART_CODIGO, FEDET_CANTID)
);

alter table FEDET_DETFAC comment 'Entidad utilizada para gestionar el detalle de una Factura';

/*==============================================================*/
/* Table: FEFOP_FORPAG                                          */
/*==============================================================*/
create table FEFOP_FORPAG
(
   FEFOP_CODIGO         char(1) not null,
   FEFOP_DESCRI         varchar(50) not null,
   primary key (FEFOP_CODIGO)
);

alter table FEFOP_FORPAG comment 'Entidad utilizada para gestionar la forma de pago de una FAC';

/*==============================================================*/
/* Table: FEPAF_PARFIN                                          */
/*==============================================================*/
create table FEPAF_PARFIN
(
   FEPAF_CODIGO         char(2) not null,
   FEPAF_DESCRI         varchar(100) not null,
   FEPAF_VPARFIN        numeric(10,2) not null,
   FEPAF_FECIMP         datetime not null,
   FEPAF_FEAFIN         datetime,
   FEPAF_OBSER          text,
   primary key (FEPAF_CODIGO)
);

alter table FEPAF_PARFIN comment 'Entidad utilizada para realizar la gestión de los diferentes';

/*==============================================================*/
/* Table: MEART_ART                                             */
/*==============================================================*/
create table MEART_ART
(
   MEART_CODIGO         char(10) not null,
   MEART_DESCRIP        char(50) not null,
   MEART_STOACT         numeric(10,2) not null,
   MEART_STOMIN         numeric(10,2) not null,
   MEART_STOMAX         numeric(10,2) not null,
   MEART_PRECOM         numeric(10,2) not null,
   MEART_PREVEN         numeric(10,2) not null,
   MEART_OBSERV         text,
   MEART_GENERA         smallint,
   primary key (MEART_CODIGO)
);

alter table MEART_ART comment 'Entidad utilizada para la gestion de ARTICULOS o SERVICIOS';

/*==============================================================*/
/* Table: PEAESTU_ESTUD                                         */
/*==============================================================*/
create table PEAESTU_ESTUD
(
   ID_EST               varchar(15) not null,
   ID_CARR              varchar(15) not null,
   NOMBRE_EST           varchar(10) not null,
   APELLIDO_EST         varchar(10) not null,
   CI_EST               numeric(10,0) not null,
   EMAIL_EST            varchar(50) not null,
   FECHA_NACIMIENTO_EST datetime not null,
   CARRERA_ID_EST       varchar(10) not null,
   PROMEDIO_EST         numeric(5,4) not null,
   ESTADO_PAGO_EST      smallint not null,
   primary key (ID_EST)
);

alter table PEAESTU_ESTUD comment 'Almacena a los estudiantes existentes 
';

/*==============================================================*/
/* Table: PEAMATR_MATRI                                         */
/*==============================================================*/
create table PEAMATR_MATRI
(
   ID_EST               varchar(15) not null,
   ID_GRU               varchar(15) not null,
   ID_MATRI             varchar(15) not null,
   FECHA_MATRI          datetime not null,
   ESTADO               varchar(2) not null comment '00=MATRICULADO
            01=NOMATRICULADO
            02=IMPEDIMENTOS
            ',
   primary key (ID_EST, ID_GRU)
);

/*==============================================================*/
/* Table: PEAPREQ_PRERQ                                         */
/*==============================================================*/
create table PEAPREQ_PRERQ
(
   ID_ASIG              varchar(15) not null,
   PEE_ID_ASIG          varchar(15) not null,
   primary key (ID_ASIG, PEE_ID_ASIG)
);

alter table PEAPREQ_PRERQ comment 'Materia que es prerequisito 
';

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
create table PECAR_CARGO
(
   PEDEP_CODIGO         char(3) not null,
   PECAR_CODIGO         char(3) not null,
   PECAR_NOMBRE         varchar(35) not null,
   PECAR_SALARIO        numeric(6,0) not null,
   primary key (PEDEP_CODIGO, PECAR_CODIGO)
);

alter table PECAR_CARGO comment 'Entidad utilizada para representar el cargo de una persona';

/*==============================================================*/
/* Table: PEDEP_DEPAR                                           */
/*==============================================================*/
create table PEDEP_DEPAR
(
   PEDEP_CODIGO         char(3) not null,
   PEEEMP_CODIGO        char(9),
   PEDEP_NOMBRE         varchar(50) not null,
   PEDEP_DESCRIP        varchar(50) not null,
   primary key (PEDEP_CODIGO)
);

alter table PEDEP_DEPAR comment 'Entidad utilizada para representar el departamento cargo de ';

/*==============================================================*/
/* Table: PEEASIG_ASIGN                                         */
/*==============================================================*/
create table PEEASIG_ASIGN
(
   ID_ASIG              varchar(15) not null,
   ID_GRU               varchar(15) not null,
   CODIGO_ASIG          numeric(10,0) not null,
   NOMBRE_ASIG          varchar(25) not null,
   CREDITOS_ASIG        numeric(10,0) not null,
   DESCRIPCION_ASSIG    varchar(250) not null,
   primary key (ID_ASIG)
);

alter table PEEASIG_ASIGN comment 'Entidad en donde se almacena las asignaturas existentes
                                  -&#';

/*==============================================================*/
/* Table: PEEAUDI_AUDLOG                                        */
/*==============================================================*/
create table PEEAUDI_AUDLOG
(
   ID_LOG               varchar(15) not null,
   ID_DOC               varchar(15) not null,
   USUARIO_ID_LOG       varchar(25) not null,
   ACCION_LOG           varchar(250) not null,
   TABLA_AFECTADA_LOG   varchar(20) not null,
   FILA_ID_LOG          varchar(20) not null,
   TIMESTAMP_LOG        datetime not null,
   DETALLE_LOG          varchar(250) not null,
   primary key (ID_LOG)
);

alter table PEEAUDI_AUDLOG comment 'Entidad que almacena registros para la realizacion de audito';

/*==============================================================*/
/* Table: PEECARR_CARRE                                         */
/*==============================================================*/
create table PEECARR_CARRE
(
   ID_CARR              varchar(15) not null,
   NOMBRE_CARR          varchar(25) not null,
   CODIGO_CARR          varchar(10) not null,
   MAX_CREDITOS_CARR    numeric(10,0) not null,
   MIN_CREDITOS_CARR    numeric(10,0) not null,
   primary key (ID_CARR)
);

alter table PEECARR_CARRE comment 'Entidad utilizada para el almacenamiento de las carreras dis';

/*==============================================================*/
/* Table: PEEDOCE_DOCEN                                         */
/*==============================================================*/
create table PEEDOCE_DOCEN
(
   ID_DOC               varchar(15) not null,
   ID_GRU               varchar(15) not null,
   NOMBRE_DOC           varchar(10) not null,
   APELLIDO_DOC         varchar(10) not null,
   EMAIL_DOC            varchar(50) not null,
   primary key (ID_DOC)
);

alter table PEEDOCE_DOCEN comment 'Entidad utilizada para almacenar los docentes existentes 
                                  -';

/*==============================================================*/
/* Table: PEEEMP_EMPLE                                          */
/*==============================================================*/
create table PEEEMP_EMPLE
(
   PEEEMP_CODIGO        char(9) not null,
   PEPSEX_CODIGO        char(1) not null,
   PEESC_CODIGO         char(3),
   PEEEMP_CEDULA        char(10),
   PEEEMP_NOMBRES       varchar(50) not null,
   PEEEMP_APELLIDOS     varchar(50) not null,
   PEEEMP_FECHANAC      datetime not null,
   PEEEMP_DIRECCION     varchar(60),
   PEEEMP_TELEFONO      char(8),
   PEEEMP_EMAIL         varchar(50) not null,
   PEEEMP_HIJOS         numeric(2,0) not null,
   PEEEMP_CELULAR       char(10),
   primary key (PEEEMP_CODIGO)
);

alter table PEEEMP_EMPLE comment 'Entidad q se utiliza para almacenar los empleados';

/*==============================================================*/
/* Table: PEEGRUP_GRUPO                                         */
/*==============================================================*/
create table PEEGRUP_GRUPO
(
   ID_GRU               varchar(15) not null,
   CODIGO_GRU           varchar(15) not null,
   AULA_GRU             varchar(5) not null,
   CUPO_MAX_GRU         numeric(4,0) not null,
   CUPO_ACTUAL_GRU      numeric(4,0) not null,
   primary key (ID_GRU)
);

alter table PEEGRUP_GRUPO comment 'Entidad que almacena los grupos existentes
';

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
create table PEESC_ESTCIV
(
   PEESC_CODIGO         char(3) not null,
   PEESC_DESCRIP        varchar(50) not null,
   primary key (PEESC_CODIGO)
);

alter table PEESC_ESTCIV comment 'Entidad utilizada para representar el estado civil de una pe';

/*==============================================================*/
/* Table: PEPAG_PAG                                             */
/*==============================================================*/
create table PEPAG_PAG
(
   ID_PAGO              varchar(15) not null,
   ID_EST               varchar(15) not null,
   MONTO_PAGO           numeric(8,2) not null,
   FECHA_PAGO           datetime not null,
   REFERENCIA_PAGO      varchar(250) not null,
   ESTADO_PAGO          varchar(2) not null,
   primary key (ID_PAGO)
);

alter table PEPAG_PAG comment 'Entidad que almacena el monto del pago y la fecha de la real';

/*==============================================================*/
/* Table: PEPER_PER                                             */
/*==============================================================*/
create table PEPER_PER
(
   ID_PER               varchar(15) not null,
   ID_GRU               varchar(15) not null,
   NOMBRE_PER           varchar(25) not null,
   FECHA_INICIO_PER     datetime not null,
   FECHA_FIN_PER        datetime not null,
   ACTIVO_PER           smallint not null,
   primary key (ID_PER)
);

alter table PEPER_PER comment 'Entidad para guardar los periodos cursados o en curso por lo';

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
create table PESEX_SEXO
(
   PEPSEX_CODIGO        char(1) not null,
   PEPSEX_DESCR         varchar(50) not null,
   primary key (PEPSEX_CODIGO)
);

alter table PESEX_SEXO comment 'Entidad utilizada para representar el sexo o genero de una p';

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
create table XEEST_ESTAD
(
   XEEST_CODIGO         char(1) not null,
   XEEST_DESCRI         varchar(50) not null,
   primary key (XEEST_CODIGO)
);

alter table XEEST_ESTAD comment 'Entidad utilizada para gestionar el estado de las difetrente';

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
create table XEOPC_OPCIO
(
   XEOPC_CODIGO         char(3) not null,
   XESIS_CODIGO         char(1) not null,
   XEOPC_DESCRI         varchar(100) not null,
   primary key (XEOPC_CODIGO)
);

alter table XEOPC_OPCIO comment 'Entidad utilizada para realizar el registro de las diferente';

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
create table XEOXP_OPCPE
(
   XEPER_CODIGO         char(8) not null,
   XEOPC_CODIGO         char(3) not null,
   XEOXP_FECASI         datetime not null,
   XEOXP_FECRET         datetime,
   primary key (XEPER_CODIGO, XEOPC_CODIGO, XEOXP_FECASI)
);

alter table XEOXP_OPCPE comment 'Entidad utilizada para llevar el registro de las opciones qu';

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
create table XEPER_PERFI
(
   XEPER_CODIGO         char(8) not null,
   XEPER_DESCRI         varchar(100) not null,
   XEPER_OBSER          text,
   primary key (XEPER_CODIGO)
);

alter table XEPER_PERFI comment 'Entidad utilizada para realizar la gestión de los diferentes';

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
create table XESIS_SISTE
(
   XESIS_CODIGO         char(1) not null,
   XESIS_DESCRI         varchar(50) not null,
   primary key (XESIS_CODIGO)
);

alter table XESIS_SISTE comment 'Entidad utilizada para realziar la gestión de los diferentes';

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
create table XEUSU_USUAR
(
   PEEEMP_CODIGO        char(9) not null,
   XEUSU_PASWD          varchar(16) not null,
   XEEST_CODIGO         char(1) not null,
   XEUSU_FECCRE         datetime not null,
   XEUSU_FECMOD         datetime not null,
   XEUSU_PIEFIR         varchar(100) not null,
   primary key (PEEEMP_CODIGO, XEUSU_PASWD)
);

alter table XEUSU_USUAR comment 'Entidad relacionada para gentionar los usuario que ingrsan a';

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
create table XEUXP_USUPE
(
   XEPER_CODIGO         char(8) not null,
   PEEEMP_CODIGO        char(9) not null,
   XEUSU_PASWD          varchar(16) not null,
   XEUXP_FECASI         datetime not null,
   XEUXP_FECRET         datetime,
   primary key (XEPER_CODIGO, PEEEMP_CODIGO, XEUSU_PASWD, XEUXP_FECASI)
);

alter table XEUXP_USUPE comment 'Entidad utilizada para realizar el registro de los diferente';

alter table FECAF_CABFAC add constraint FK_FR_FECLI_FECAF foreign key (FECLI_CODIGO)
      references FECLI_CLIENT (FECLI_CODIGO) on delete restrict on update restrict;

alter table FECAF_CABFAC add constraint FK_FR_FEFOP_FORPAG foreign key (FEFOP_CODIGO)
      references FEFOP_FORPAG (FEFOP_CODIGO) on delete restrict on update restrict;

alter table FECAF_CABFAC add constraint FK_PR_PEEEMP_FECAF foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO) on delete restrict on update restrict;

alter table FEDET_DETFAC add constraint FK_FR_FECAF_FEDET foreign key (FECAF_NUMFAC)
      references FECAF_CABFAC (FECAF_NUMFAC) on delete restrict on update restrict;

alter table FEDET_DETFAC add constraint FK_FR_MEART_FEDET foreign key (MEART_CODIGO)
      references MEART_ART (MEART_CODIGO) on delete restrict on update restrict;

alter table PEAESTU_ESTUD add constraint FK_XR_PECARR_XEEST foreign key (ID_CARR)
      references PEECARR_CARRE (ID_CARR) on delete restrict on update restrict;

alter table PEAMATR_MATRI add constraint FK_PEAMATR_MATRI foreign key (ID_EST)
      references PEAESTU_ESTUD (ID_EST) on delete restrict on update restrict;

alter table PEAMATR_MATRI add constraint FK_PEAMATR_MATRI2 foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU) on delete restrict on update restrict;

alter table PEAPREQ_PRERQ add constraint FK_PEAPREQ002 foreign key (PEE_ID_ASIG)
      references PEEASIG_ASIGN (ID_ASIG) on delete restrict on update restrict;

alter table PEAPREQ_PRERQ add constraint FK_PEAPREQ_PRERQ foreign key (ID_ASIG)
      references PEEASIG_ASIGN (ID_ASIG) on delete restrict on update restrict;

alter table PECAR_CARGO add constraint FK_PR_PEDEP_PECAR foreign key (PEDEP_CODIGO)
      references PEDEP_DEPAR (PEDEP_CODIGO) on delete restrict on update restrict;

alter table PEDEP_DEPAR add constraint FK_RELATIONSHIP_16 foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO) on delete restrict on update restrict;

alter table PEEASIG_ASIGN add constraint FK_XR_PEASIG_XEGRU foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU) on delete restrict on update restrict;

alter table PEEAUDI_AUDLOG add constraint FK_XR_PEDOC_XEAUDIT foreign key (ID_DOC)
      references PEEDOCE_DOCEN (ID_DOC) on delete restrict on update restrict;

alter table PEEDOCE_DOCEN add constraint FK_XR_PEGRU_XEDOC foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU) on delete restrict on update restrict;

alter table PEEEMP_EMPLE add constraint FK_PR_PEESC_PEEEMP foreign key (PEESC_CODIGO)
      references PEESC_ESTCIV (PEESC_CODIGO) on delete restrict on update restrict;

alter table PEEEMP_EMPLE add constraint FK_PR_PESEX_PEEEMP foreign key (PEPSEX_CODIGO)
      references PESEX_SEXO (PEPSEX_CODIGO) on delete restrict on update restrict;

alter table PEPAG_PAG add constraint FK_XR_PEPAG_XEEST foreign key (ID_EST)
      references PEAESTU_ESTUD (ID_EST) on delete restrict on update restrict;

alter table PEPER_PER add constraint FK_XR_PEGRU_XEPER foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU) on delete restrict on update restrict;

alter table XEOPC_OPCIO add constraint FK_XR_XESIS_XEOPC foreign key (XESIS_CODIGO)
      references XESIS_SISTE (XESIS_CODIGO) on delete restrict on update restrict;

alter table XEOXP_OPCPE add constraint FK_XR_XEOPC_XEOXP foreign key (XEOPC_CODIGO)
      references XEOPC_OPCIO (XEOPC_CODIGO) on delete restrict on update restrict;

alter table XEOXP_OPCPE add constraint FK_XR_XEPER_XEOXP foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO) on delete restrict on update restrict;

alter table XEUSU_USUAR add constraint FK_XR_PEEEMP_XEUSU foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO) on delete restrict on update restrict;

alter table XEUSU_USUAR add constraint FK_XR_XEEST_XEUSU foreign key (XEEST_CODIGO)
      references XEEST_ESTAD (XEEST_CODIGO) on delete restrict on update restrict;

alter table XEUXP_USUPE add constraint FK_XR_XEPER_XEUXP foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO) on delete restrict on update restrict;

alter table XEUXP_USUPE add constraint FK_XR_XEUSU_XEUXP foreign key (PEEEMP_CODIGO, XEUSU_PASWD)
      references XEUSU_USUAR (PEEEMP_CODIGO, XEUSU_PASWD) on delete restrict on update restrict;

