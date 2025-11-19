/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     19/11/2025 0:11:27                           */
/*==============================================================*/


alter table FECAF_CABFAC
   drop constraint FK_FECAF_CA_FR_FECLI__FECLI_CL;

alter table FECAF_CABFAC
   drop constraint FK_FECAF_CA_FR_FEFOP__FEFOP_FO;

alter table FECAF_CABFAC
   drop constraint FK_FECAF_CA_PR_PEEEMP_PEEEMP_E;

alter table FEDET_DETFAC
   drop constraint FK_FEDET_DE_FR_FECAF__FECAF_CA;

alter table FEDET_DETFAC
   drop constraint FK_FEDET_DE_FR_MEART__MEART_AR;

alter table PEAESTU_ESTUD
   drop constraint FK_PEAESTU__XR_PECARR_PEECARR_;

alter table PEAMATR_MATRI
   drop constraint FK_PEAMATR__PEAMATR_M_PEAESTU_;

alter table PEAMATR_MATRI
   drop constraint FK_PEAMATR__PEAMATR_M_PEEGRUP_;

alter table PEAPREQ_PRERQ
   drop constraint FK_PEAPREQ__PEAPREQ00_PEEASIG_;

alter table PEAPREQ_PRERQ
   drop constraint FK_PEAPREQ__PEAPREQ_P_PEEASIG_;

alter table PECAR_CARGO
   drop constraint FK_PECAR_CA_PR_PEDEP__PEDEP_DE;

alter table PEDEP_DEPAR
   drop constraint FK_PEDEP_DE_RELATIONS_PEEEMP_E;

alter table PEEASIG_ASIGN
   drop constraint FK_PEEASIG__XR_PEASIG_PEEGRUP_;

alter table PEEAUDI_AUDLOG
   drop constraint FK_PEEAUDI__XR_PEDOC__PEEDOCE_;

alter table PEEDOCE_DOCEN
   drop constraint FK_PEEDOCE__XR_PEGRU__PEEGRUP_;

alter table PEEEMP_EMPLE
   drop constraint FK_PEEEMP_E_PR_PEESC__PEESC_ES;

alter table PEEEMP_EMPLE
   drop constraint FK_PEEEMP_E_PR_PESEX__PESEX_SE;

alter table PEPAG_PAG
   drop constraint FK_PEPAG_PA_XR_PEPAG__PEAESTU_;

alter table PEPER_PER
   drop constraint FK_PEPER_PE_XR_PEGRU__PEEGRUP_;

alter table XEOPC_OPCIO
   drop constraint FK_XEOPC_OP_XR_XESIS__XESIS_SI;

alter table XEOXP_OPCPE
   drop constraint FK_XEOXP_OP_XR_XEOPC__XEOPC_OP;

alter table XEOXP_OPCPE
   drop constraint FK_XEOXP_OP_XR_XEPER__XEPER_PE;

alter table XEUSU_USUAR
   drop constraint FK_XEUSU_US_XR_PEEEMP_PEEEMP_E;

alter table XEUSU_USUAR
   drop constraint FK_XEUSU_US_XR_XEEST__XEEST_ES;

alter table XEUXP_USUPE
   drop constraint FK_XEUXP_US_XR_XEPER__XEPER_PE;

alter table XEUXP_USUPE
   drop constraint FK_XEUXP_US_XR_XEUSU__XEUSU_US;

drop table FECAF_CABFAC cascade constraints;

drop table FECLI_CLIENT cascade constraints;

drop table FEDET_DETFAC cascade constraints;

drop table FEFOP_FORPAG cascade constraints;

drop table FEPAF_PARFIN cascade constraints;

drop table MEART_ART cascade constraints;

drop table PEAESTU_ESTUD cascade constraints;

drop table PEAMATR_MATRI cascade constraints;

drop table PEAPREQ_PRERQ cascade constraints;

drop table PECAR_CARGO cascade constraints;

drop table PEDEP_DEPAR cascade constraints;

drop table PEEASIG_ASIGN cascade constraints;

drop table PEEAUDI_AUDLOG cascade constraints;

drop table PEECARR_CARRE cascade constraints;

drop table PEEDOCE_DOCEN cascade constraints;

drop table PEEEMP_EMPLE cascade constraints;

drop table PEEGRUP_GRUPO cascade constraints;

drop table PEESC_ESTCIV cascade constraints;

drop table PEPAG_PAG cascade constraints;

drop table PEPER_PER cascade constraints;

drop table PESEX_SEXO cascade constraints;

drop table XEEST_ESTAD cascade constraints;

drop table XEOPC_OPCIO cascade constraints;

drop table XEOXP_OPCPE cascade constraints;

drop table XEPER_PERFI cascade constraints;

drop table XESIS_SISTE cascade constraints;

drop table XEUSU_USUAR cascade constraints;

drop table XEUXP_USUPE cascade constraints;

/*==============================================================*/
/* Table: FECAF_CABFAC                                          */
/*==============================================================*/
create table FECAF_CABFAC 
(
   FECAF_NUMFAC         CHAR(6)              not null,
   FECLI_CODIGO         CHAR(6)              not null,
   PEEEMP_CODIGO        CHAR(9)              not null,
   FEFOP_CODIGO         CHAR(1)              not null,
   FECAF_FECEMI         DATE                 not null,
   FECAF_AUTSRI         VARCHAR2(50),
   FECAF_FEASRI         DATE,
   FECAF_TOTAL          NUMBER(10,2)         not null,
   FECAF_IVA            NUMBER(10,2)         not null,
   FECAF_DESCUES        NUMBER(10,2),
   FECAF_TOTPAG         NUMBER(10,2)         not null,
   FECAF_SUBTOT         NUMBER(10,2)         not null,
   constraint PK_FECAF_CABFAC primary key (FECAF_NUMFAC)
);

comment on table FECAF_CABFAC is
'Entidad utilizada para la gestión de la cabecera de la FACTURA';

/*==============================================================*/
/* Table: FECLI_CLIENT                                          */
/*==============================================================*/
create table FECLI_CLIENT 
(
   FECLI_CODIGO         CHAR(6)              not null,
   FECLI_APELLI         VARCHAR2(50)         not null,
   FECLI_NOMBRE         VARCHAR2(50)         not null,
   FECLI_DIRECC         VARCHAR2(200),
   FECLI_TELEFO         VARCHAR2(15),
   FECLI_EMAIL          VARCHAR2(100)        not null,
   FECLI_CEDULA         CHAR(10),
   FECLI_RUC            CHAR(13),
   FECLI_RAZON          CHAR(13),
   FECLI_DISCAPA        BLOB                 not null,
   constraint PK_FECLI_CLIENT primary key (FECLI_CODIGO)
);

comment on table FECLI_CLIENT is
'Entidad utilizada para realizar la gestión (CRUD) de CLIENTE';

/*==============================================================*/
/* Table: FEDET_DETFAC                                          */
/*==============================================================*/
create table FEDET_DETFAC 
(
   FECAF_NUMFAC         CHAR(6)              not null,
   MEART_CODIGO         CHAR(10)             not null,
   FEDET_CANTID         NUMBER(10,2)         not null,
   FEDET_PRECIO         NUMBER(10,2)         not null,
   FEDET_SUBTOT         NUMBER(10,2)         not null,
   FEDET_GENIVA         SMALLINT             not null,
   FEDET_IVA            NUMBER(12,2)         not null,
   constraint PK_FEDET_DETFAC primary key (FECAF_NUMFAC, MEART_CODIGO, FEDET_CANTID)
);

comment on table FEDET_DETFAC is
'Entidad utilizada para gestionar el detalle de una Factura';

/*==============================================================*/
/* Table: FEFOP_FORPAG                                          */
/*==============================================================*/
create table FEFOP_FORPAG 
(
   FEFOP_CODIGO         CHAR(1)              not null,
   FEFOP_DESCRI         VARCHAR2(50)         not null,
   constraint PK_FEFOP_FORPAG primary key (FEFOP_CODIGO)
);

comment on table FEFOP_FORPAG is
'Entidad utilizada para gestionar la forma de pago de una FACTURA';

/*==============================================================*/
/* Table: FEPAF_PARFIN                                          */
/*==============================================================*/
create table FEPAF_PARFIN 
(
   FEPAF_CODIGO         CHAR(2)              not null,
   FEPAF_DESCRI         VARCHAR2(100)        not null,
   FEPAF_VPARFIN        NUMBER(10,2)         not null,
   FEPAF_FECIMP         DATE                 not null,
   FEPAF_FEAFIN         DATE,
   FEPAF_OBSER          CLOB,
   constraint PK_FEPAF_PARFIN primary key (FEPAF_CODIGO)
);

comment on table FEPAF_PARFIN is
'Entidad utilizada para realizar la gestión de los diferentes parámetros externos al subsistema financiero impuesto por organismos extenos';

/*==============================================================*/
/* Table: MEART_ART                                             */
/*==============================================================*/
create table MEART_ART 
(
   MEART_CODIGO         CHAR(10)             not null,
   MEART_DESCRIP        CHAR(50)             not null,
   MEART_STOACT         NUMBER(10,2)         not null,
   MEART_STOMIN         NUMBER(10,2)         not null,
   MEART_STOMAX         NUMBER(10,2)         not null,
   MEART_PRECOM         NUMBER(10,2)         not null,
   MEART_PREVEN         NUMBER(10,2)         not null,
   MEART_OBSERV         CLOB,
   MEART_GENERA         SMALLINT,
   constraint PK_MEART_ART primary key (MEART_CODIGO)
);

comment on table MEART_ART is
'Entidad utilizada para la gestion de ARTICULOS o SERVICIOS';

/*==============================================================*/
/* Table: PEAESTU_ESTUD                                         */
/*==============================================================*/
create table PEAESTU_ESTUD 
(
   ID_EST               VARCHAR2(15)         not null,
   ID_CARR              VARCHAR2(15)         not null,
   NOMBRE_EST           VARCHAR2(10)         not null,
   APELLIDO_EST         VARCHAR2(10)         not null,
   CI_EST               NUMBER(10,0)         not null,
   EMAIL_EST            VARCHAR2(50)         not null,
   FECHA_NACIMIENTO_EST DATE                 not null,
   CARRERA_ID_EST       VARCHAR2(10)         not null,
   PROMEDIO_EST         NUMBER(5,4)          not null,
   ESTADO_PAGO_EST      SMALLINT             not null
      constraint CKC_ESTADO_PAGO_EST_PEAESTU_ check (ESTADO_PAGO_EST in (00,01)),
   constraint PK_PEAESTU_ESTUD primary key (ID_EST)
);

comment on table PEAESTU_ESTUD is
'Almacena a los estudiantes existentes 
';

/*==============================================================*/
/* Table: PEAMATR_MATRI                                         */
/*==============================================================*/
create table PEAMATR_MATRI 
(
   ID_EST               VARCHAR2(15)         not null,
   ID_GRU               VARCHAR2(15)         not null,
   ID_MATRI             VARCHAR2(15)         not null,
   FECHA_MATRI          DATE                 not null,
   ESTADO               VARCHAR2(2)          not null
      constraint CKC_ESTADO_PEAMATR_ check (ESTADO in ('00','01','02') and ESTADO = upper(ESTADO)),
   constraint PK_PEAMATR_MATRI primary key (ID_EST, ID_GRU)
);

comment on column PEAMATR_MATRI.ESTADO is
'00=MATRICULADO
01=NOMATRICULADO
02=IMPEDIMENTOS
';

/*==============================================================*/
/* Table: PEAPREQ_PRERQ                                         */
/*==============================================================*/
create table PEAPREQ_PRERQ 
(
   ID_ASIG              VARCHAR2(15)         not null,
   PEE_ID_ASIG          VARCHAR2(15)         not null,
   constraint PK_PEAPREQ_PRERQ primary key (ID_ASIG, PEE_ID_ASIG)
);

comment on table PEAPREQ_PRERQ is
'Materia que es prerequisito 
';

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
create table PECAR_CARGO 
(
   PEDEP_CODIGO         CHAR(3)              not null,
   PECAR_CODIGO         CHAR(3)              not null,
   PECAR_NOMBRE         VARCHAR2(35)         not null,
   PECAR_SALARIO        NUMBER(6,0)          not null,
   constraint PK_PECAR_CARGO primary key (PEDEP_CODIGO, PECAR_CODIGO)
);

comment on table PECAR_CARGO is
'Entidad utilizada para representar el cargo de una persona';

/*==============================================================*/
/* Table: PEDEP_DEPAR                                           */
/*==============================================================*/
create table PEDEP_DEPAR 
(
   PEDEP_CODIGO         CHAR(3)              not null,
   PEEEMP_CODIGO        CHAR(9),
   PEDEP_NOMBRE         VARCHAR2(50)         not null,
   PEDEP_DESCRIP        VARCHAR2(50)         not null,
   constraint PK_PEDEP_DEPAR primary key (PEDEP_CODIGO)
);

comment on table PEDEP_DEPAR is
'Entidad utilizada para representar el departamento cargo de una persona';

/*==============================================================*/
/* Table: PEEASIG_ASIGN                                         */
/*==============================================================*/
create table PEEASIG_ASIGN 
(
   ID_ASIG              VARCHAR2(15)         not null,
   ID_GRU               VARCHAR2(15)         not null,
   CODIGO_ASIG          NUMBER(10,0)         not null,
   NOMBRE_ASIG          VARCHAR2(25)         not null,
   CREDITOS_ASIG        NUMBER(10,0)         not null,
   DESCRIPCION_ASSIG    VARCHAR2(250)        not null,
   constraint PK_PEEASIG_ASIGN primary key (ID_ASIG)
);

comment on table PEEASIG_ASIGN is
'Entidad en donde se almacena las asignaturas existentes
';

/*==============================================================*/
/* Table: PEEAUDI_AUDLOG                                        */
/*==============================================================*/
create table PEEAUDI_AUDLOG 
(
   ID_LOG               VARCHAR2(15)         not null,
   ID_DOC               VARCHAR2(15)         not null,
   USUARIO_ID_LOG       VARCHAR2(25)         not null,
   ACCION_LOG           VARCHAR2(250)        not null,
   TABLA_AFECTADA_LOG   VARCHAR2(20)         not null,
   FILA_ID_LOG          VARCHAR2(20)         not null,
   TIMESTAMP_LOG        DATE                 not null,
   DETALLE_LOG          VARCHAR2(250)        not null,
   constraint PK_PEEAUDI_AUDLOG primary key (ID_LOG)
);

comment on table PEEAUDI_AUDLOG is
'Entidad que almacena registros para la realizacion de auditorias
';

/*==============================================================*/
/* Table: PEECARR_CARRE                                         */
/*==============================================================*/
create table PEECARR_CARRE 
(
   ID_CARR              VARCHAR2(15)         not null,
   NOMBRE_CARR          VARCHAR2(25)         not null
      constraint CKC_NOMBRE_CARR_PEECARR_ check (NOMBRE_CARR = upper(NOMBRE_CARR)),
   CODIGO_CARR          VARCHAR2(10)         not null,
   MAX_CREDITOS_CARR    NUMBER(10,0)         not null,
   MIN_CREDITOS_CARR    NUMBER(10,0)         not null,
   constraint PK_PEECARR_CARRE primary key (ID_CARR)
);

comment on table PEECARR_CARRE is
'Entidad utilizada para el almacenamiento de las carreras disponibles';

/*==============================================================*/
/* Table: PEEDOCE_DOCEN                                         */
/*==============================================================*/
create table PEEDOCE_DOCEN 
(
   ID_DOC               VARCHAR2(15)         not null,
   ID_GRU               VARCHAR2(15)         not null,
   NOMBRE_DOC           VARCHAR2(10)         not null,
   APELLIDO_DOC         VARCHAR2(10)         not null,
   EMAIL_DOC            VARCHAR2(50)         not null,
   constraint PK_PEEDOCE_DOCEN primary key (ID_DOC)
);

comment on table PEEDOCE_DOCEN is
'Entidad utilizada para almacenar los docentes existentes 
';

/*==============================================================*/
/* Table: PEEEMP_EMPLE                                          */
/*==============================================================*/
create table PEEEMP_EMPLE 
(
   PEEEMP_CODIGO        CHAR(9)              not null,
   PEPSEX_CODIGO        CHAR(1)              not null,
   PEESC_CODIGO         CHAR(3),
   PEEEMP_CEDULA        CHAR(10),
   PEEEMP_NOMBRES       VARCHAR2(50)         not null,
   PEEEMP_APELLIDOS     VARCHAR2(50)         not null,
   PEEEMP_FECHANAC      DATE                 not null,
   PEEEMP_DIRECCION     VARCHAR2(60),
   PEEEMP_TELEFONO      CHAR(8),
   PEEEMP_EMAIL         VARCHAR2(50)         not null,
   PEEEMP_HIJOS         NUMBER(2,0)          not null,
   PEEEMP_CELULAR       CHAR(10),
   constraint PK_PEEEMP_EMPLE primary key (PEEEMP_CODIGO)
);

comment on table PEEEMP_EMPLE is
'Entidad q se utiliza para almacenar los empleados';

/*==============================================================*/
/* Table: PEEGRUP_GRUPO                                         */
/*==============================================================*/
create table PEEGRUP_GRUPO 
(
   ID_GRU               VARCHAR2(15)         not null,
   CODIGO_GRU           VARCHAR2(15)         not null,
   AULA_GRU             VARCHAR2(5)          not null,
   CUPO_MAX_GRU         NUMBER(4,0)          not null,
   CUPO_ACTUAL_GRU      NUMBER(4,0)          not null,
   constraint PK_PEEGRUP_GRUPO primary key (ID_GRU)
);

comment on table PEEGRUP_GRUPO is
'Entidad que almacena los grupos existentes
';

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
create table PEESC_ESTCIV 
(
   PEESC_CODIGO         CHAR(3)              not null,
   PEESC_DESCRIP        VARCHAR2(50)         not null,
   constraint PK_PEESC_ESTCIV primary key (PEESC_CODIGO)
);

comment on table PEESC_ESTCIV is
'Entidad utilizada para representar el estado civil de una persona';

/*==============================================================*/
/* Table: PEPAG_PAG                                             */
/*==============================================================*/
create table PEPAG_PAG 
(
   ID_PAGO              VARCHAR2(15)         not null,
   ID_EST               VARCHAR2(15)         not null,
   MONTO_PAGO           NUMBER(8,2)          not null,
   FECHA_PAGO           DATE                 not null,
   REFERENCIA_PAGO      VARCHAR2(250)        not null,
   ESTADO_PAGO          VARCHAR2(2)          not null,
   constraint PK_PEPAG_PAG primary key (ID_PAGO)
);

comment on table PEPAG_PAG is
'Entidad que almacena el monto del pago y la fecha de la realizacion de la misma';

/*==============================================================*/
/* Table: PEPER_PER                                             */
/*==============================================================*/
create table PEPER_PER 
(
   ID_PER               VARCHAR2(15)         not null,
   ID_GRU               VARCHAR2(15)         not null,
   NOMBRE_PER           VARCHAR2(25)         not null,
   FECHA_INICIO_PER     DATE                 not null,
   FECHA_FIN_PER        DATE                 not null,
   ACTIVO_PER           SMALLINT             not null
      constraint CKC_ACTIVO_PER_PEPER_PE check (ACTIVO_PER in (00,01) and ACTIVO_PER = upper(ACTIVO_PER)),
   constraint PK_PEPER_PER primary key (ID_PER)
);

comment on table PEPER_PER is
'Entidad para guardar los periodos cursados o en curso por los grupos de estudios ';

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
create table PESEX_SEXO 
(
   PEPSEX_CODIGO        CHAR(1)              not null,
   PEPSEX_DESCR         VARCHAR2(50)         not null,
   constraint PK_PESEX_SEXO primary key (PEPSEX_CODIGO)
);

comment on table PESEX_SEXO is
'Entidad utilizada para representar el sexo o genero de una persona';

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
create table XEEST_ESTAD 
(
   XEEST_CODIGO         CHAR(1)              not null,
   XEEST_DESCRI         VARCHAR2(50)         not null,
   constraint PK_XEEST_ESTAD primary key (XEEST_CODIGO)
);

comment on table XEEST_ESTAD is
'Entidad utilizada para gestionar el estado de las difetrentes tablas';

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
create table XEOPC_OPCIO 
(
   XEOPC_CODIGO         CHAR(3)              not null,
   XESIS_CODIGO         CHAR(1)              not null,
   XEOPC_DESCRI         VARCHAR2(100)        not null,
   constraint PK_XEOPC_OPCIO primary key (XEOPC_CODIGO)
);

comment on table XEOPC_OPCIO is
'Entidad utilizada para realizar el registro de las diferentes opciones de un sistema';

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
create table XEOXP_OPCPE 
(
   XEPER_CODIGO         CHAR(8)              not null,
   XEOPC_CODIGO         CHAR(3)              not null,
   XEOXP_FECASI         DATE                 not null,
   XEOXP_FECRET         DATE,
   constraint PK_XEOXP_OPCPE primary key (XEPER_CODIGO, XEOPC_CODIGO, XEOXP_FECASI)
);

comment on table XEOXP_OPCPE is
'Entidad utilizada para llevar el registro de las opciones que pertenecen a un perfil';

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
create table XEPER_PERFI 
(
   XEPER_CODIGO         CHAR(8)              not null,
   XEPER_DESCRI         VARCHAR2(100)        not null,
   XEPER_OBSER          CLOB,
   constraint PK_XEPER_PERFI primary key (XEPER_CODIGO)
);

comment on table XEPER_PERFI is
'Entidad utilizada para realizar la gestión de los diferentes perfiles';

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
create table XESIS_SISTE 
(
   XESIS_CODIGO         CHAR(1)              not null,
   XESIS_DESCRI         VARCHAR2(50)         not null,
   constraint PK_XESIS_SISTE primary key (XESIS_CODIGO)
);

comment on table XESIS_SISTE is
'Entidad utilizada para realziar la gestión de los diferentes subsistemas';

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
create table XEUSU_USUAR 
(
   PEEEMP_CODIGO        CHAR(9)              not null,
   XEUSU_PASWD          VARCHAR2(16)         not null,
   XEEST_CODIGO         CHAR(1)              not null,
   XEUSU_FECCRE         DATE                 not null,
   XEUSU_FECMOD         DATE                 not null,
   XEUSU_PIEFIR         VARCHAR2(100)        not null,
   constraint PK_XEUSU_USUAR primary key (PEEEMP_CODIGO, XEUSU_PASWD)
);

comment on table XEUSU_USUAR is
'Entidad relacionada para gentionar los usuario que ingrsan al sistema';

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
create table XEUXP_USUPE 
(
   XEPER_CODIGO         CHAR(8)              not null,
   PEEEMP_CODIGO        CHAR(9)              not null,
   XEUSU_PASWD          VARCHAR2(16)         not null,
   XEUXP_FECASI         DATE                 not null,
   XEUXP_FECRET         DATE,
   constraint PK_XEUXP_USUPE primary key (XEPER_CODIGO, PEEEMP_CODIGO, XEUSU_PASWD, XEUXP_FECASI)
);

comment on table XEUXP_USUPE is
'Entidad utilizada para realizar el registro de los diferentes usuarios que pertenecen a un perfil';

alter table FECAF_CABFAC
   add constraint FK_FECAF_CA_FR_FECLI__FECLI_CL foreign key (FECLI_CODIGO)
      references FECLI_CLIENT (FECLI_CODIGO);

alter table FECAF_CABFAC
   add constraint FK_FECAF_CA_FR_FEFOP__FEFOP_FO foreign key (FEFOP_CODIGO)
      references FEFOP_FORPAG (FEFOP_CODIGO);

alter table FECAF_CABFAC
   add constraint FK_FECAF_CA_PR_PEEEMP_PEEEMP_E foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO);

alter table FEDET_DETFAC
   add constraint FK_FEDET_DE_FR_FECAF__FECAF_CA foreign key (FECAF_NUMFAC)
      references FECAF_CABFAC (FECAF_NUMFAC);

alter table FEDET_DETFAC
   add constraint FK_FEDET_DE_FR_MEART__MEART_AR foreign key (MEART_CODIGO)
      references MEART_ART (MEART_CODIGO);

alter table PEAESTU_ESTUD
   add constraint FK_PEAESTU__XR_PECARR_PEECARR_ foreign key (ID_CARR)
      references PEECARR_CARRE (ID_CARR);

alter table PEAMATR_MATRI
   add constraint FK_PEAMATR__PEAMATR_M_PEAESTU_ foreign key (ID_EST)
      references PEAESTU_ESTUD (ID_EST);

alter table PEAMATR_MATRI
   add constraint FK_PEAMATR__PEAMATR_M_PEEGRUP_ foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU);

alter table PEAPREQ_PRERQ
   add constraint FK_PEAPREQ__PEAPREQ00_PEEASIG_ foreign key (PEE_ID_ASIG)
      references PEEASIG_ASIGN (ID_ASIG);

alter table PEAPREQ_PRERQ
   add constraint FK_PEAPREQ__PEAPREQ_P_PEEASIG_ foreign key (ID_ASIG)
      references PEEASIG_ASIGN (ID_ASIG);

alter table PECAR_CARGO
   add constraint FK_PECAR_CA_PR_PEDEP__PEDEP_DE foreign key (PEDEP_CODIGO)
      references PEDEP_DEPAR (PEDEP_CODIGO);

alter table PEDEP_DEPAR
   add constraint FK_PEDEP_DE_RELATIONS_PEEEMP_E foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO);

alter table PEEASIG_ASIGN
   add constraint FK_PEEASIG__XR_PEASIG_PEEGRUP_ foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU);

alter table PEEAUDI_AUDLOG
   add constraint FK_PEEAUDI__XR_PEDOC__PEEDOCE_ foreign key (ID_DOC)
      references PEEDOCE_DOCEN (ID_DOC);

alter table PEEDOCE_DOCEN
   add constraint FK_PEEDOCE__XR_PEGRU__PEEGRUP_ foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU);

alter table PEEEMP_EMPLE
   add constraint FK_PEEEMP_E_PR_PEESC__PEESC_ES foreign key (PEESC_CODIGO)
      references PEESC_ESTCIV (PEESC_CODIGO);

alter table PEEEMP_EMPLE
   add constraint FK_PEEEMP_E_PR_PESEX__PESEX_SE foreign key (PEPSEX_CODIGO)
      references PESEX_SEXO (PEPSEX_CODIGO);

alter table PEPAG_PAG
   add constraint FK_PEPAG_PA_XR_PEPAG__PEAESTU_ foreign key (ID_EST)
      references PEAESTU_ESTUD (ID_EST);

alter table PEPER_PER
   add constraint FK_PEPER_PE_XR_PEGRU__PEEGRUP_ foreign key (ID_GRU)
      references PEEGRUP_GRUPO (ID_GRU);

alter table XEOPC_OPCIO
   add constraint FK_XEOPC_OP_XR_XESIS__XESIS_SI foreign key (XESIS_CODIGO)
      references XESIS_SISTE (XESIS_CODIGO);

alter table XEOXP_OPCPE
   add constraint FK_XEOXP_OP_XR_XEOPC__XEOPC_OP foreign key (XEOPC_CODIGO)
      references XEOPC_OPCIO (XEOPC_CODIGO);

alter table XEOXP_OPCPE
   add constraint FK_XEOXP_OP_XR_XEPER__XEPER_PE foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO);

alter table XEUSU_USUAR
   add constraint FK_XEUSU_US_XR_PEEEMP_PEEEMP_E foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO);

alter table XEUSU_USUAR
   add constraint FK_XEUSU_US_XR_XEEST__XEEST_ES foreign key (XEEST_CODIGO)
      references XEEST_ESTAD (XEEST_CODIGO);

alter table XEUXP_USUPE
   add constraint FK_XEUXP_US_XR_XEPER__XEPER_PE foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO);

alter table XEUXP_USUPE
   add constraint FK_XEUXP_US_XR_XEUSU__XEUSU_US foreign key (PEEEMP_CODIGO, XEUSU_PASWD)
      references XEUSU_USUAR (PEEEMP_CODIGO, XEUSU_PASWD);

