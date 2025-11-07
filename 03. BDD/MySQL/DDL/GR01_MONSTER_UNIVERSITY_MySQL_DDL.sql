/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05/11/2025 9:46:10                           */
/*==============================================================*/


drop table if exists FECAF_CABFAC;

drop table if exists FECLI_CLIENT;

drop table if exists FEDET_DETFAC;

drop table if exists FEFOP_FORPAG;

drop table if exists FEPAF_PARFIN;

drop table if exists MEART_ART;

drop table if exists PECAR_CARGO;

drop table if exists PEDEP_DEPAR;

drop table if exists PEEEMP_EMPLE;

drop table if exists PEESC_ESTCIV;

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
   FEFOP_CODIGO         char(1) not null,
   FECLI_CODIGO         char(6) not null,
   PEEEMP_CODIGO        char(9) not null,
   FECAF_FECEMI         date not null,
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
   MEART_CODIGO         char(10) not null,
   FECAF_NUMFAC         char(6) not null,
   FEDET_CANTID         numeric(10,2) not null,
   FEDET_PRECIO         numeric(10,2) not null,
   FEDET_SUBTOT         numeric(10,2) not null,
   FEDET_GENIVA         bool not null,
   FEDET_IVA            numeric(12,2) not null,
   primary key (MEART_CODIGO, FECAF_NUMFAC, FEDET_CANTID)
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
   FEPAF_FECIMP         date not null,
   FEPAF_FEAFIN         date,
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
   MEART_GENERA         bool,
   primary key (MEART_CODIGO)
);

alter table MEART_ART comment 'Entidad utilizada para la gestion de ARTICULOS o SERVICIOS';

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
create table PECAR_CARGO
(
   PEDEP_CODIGO         char(3) not null,
   PECAR_CODIGO         char(3) not null,
   PECAR_NOMBRE         varchar(35) not null,
   PECAR_SALARIO        float(6,0) not null,
   primary key (PEDEP_CODIGO, PECAR_CODIGO)
);

alter table PECAR_CARGO comment 'Entidad utilizada para representar el cargo de una persona';

/*==============================================================*/
/* Table: PEDEP_DEPAR                                           */
/*==============================================================*/
create table PEDEP_DEPAR
(
   PEDEP_CODIGO         char(3) not null,
   PEDEP_NOMBRE         varchar(50) not null,
   PEDEP_DESCRIP        varchar(50) not null,
   primary key (PEDEP_CODIGO)
);

alter table PEDEP_DEPAR comment 'Entidad utilizada para representar el departamento cargo de ';

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
   PEEEMP_FECHANAC      date not null,
   PEEEMP_DIRECCION     varchar(60),
   PEEEMP_TELEFONO      char(8),
   PEEEMP_EMAIL         varchar(50) not null,
   PEEEMP_HIJOS         numeric(2,0) not null,
   PEEEMP_CELULAR       char(10),
   primary key (PEEEMP_CODIGO)
);

alter table PEEEMP_EMPLE comment 'Entidad q se utiliza para almacenar los empleados';

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
   XEOPC_CODIGO         char(3) not null,
   XEPER_CODIGO         char(8) not null,
   XEOXP_FECASI         date not null,
   XEOXP_FECRET         date,
   primary key (XEOPC_CODIGO, XEPER_CODIGO, XEOXP_FECASI)
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
   PEEEMP_CODIGO        char(9) not null,
   XEUSU_PASWD          varchar(16) not null,
   XEPER_CODIGO         char(8) not null,
   XEUXP_FECASI         date not null,
   XEUXP_FECRET         date,
   primary key (PEEEMP_CODIGO, XEUSU_PASWD, XEPER_CODIGO, XEUXP_FECASI)
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

alter table PECAR_CARGO add constraint FK_PR_PEDEP_PECAR foreign key (PEDEP_CODIGO)
      references PEDEP_DEPAR (PEDEP_CODIGO) on delete restrict on update restrict;

alter table PEEEMP_EMPLE add constraint FK_PR_PEESC_PEEEMP foreign key (PEESC_CODIGO)
      references PEESC_ESTCIV (PEESC_CODIGO) on delete restrict on update restrict;

alter table PEEEMP_EMPLE add constraint FK_PR_PESEX_PEEEMP foreign key (PEPSEX_CODIGO)
      references PESEX_SEXO (PEPSEX_CODIGO) on delete restrict on update restrict;

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

