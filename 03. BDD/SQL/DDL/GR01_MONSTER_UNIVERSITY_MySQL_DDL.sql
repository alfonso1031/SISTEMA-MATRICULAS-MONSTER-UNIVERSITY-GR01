/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     05/11/2025 10:07:31                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FECAF_CABFAC') and o.name = 'FK_FECAF_CA_FR_FECLI__FECLI_CL')
alter table FECAF_CABFAC
   drop constraint FK_FECAF_CA_FR_FECLI__FECLI_CL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FECAF_CABFAC') and o.name = 'FK_FECAF_CA_FR_FEFOP__FEFOP_FO')
alter table FECAF_CABFAC
   drop constraint FK_FECAF_CA_FR_FEFOP__FEFOP_FO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FECAF_CABFAC') and o.name = 'FK_FECAF_CA_PR_PEEEMP_PEEEMP_E')
alter table FECAF_CABFAC
   drop constraint FK_FECAF_CA_PR_PEEEMP_PEEEMP_E
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FEDET_DETFAC') and o.name = 'FK_FEDET_DE_FR_FECAF__FECAF_CA')
alter table FEDET_DETFAC
   drop constraint FK_FEDET_DE_FR_FECAF__FECAF_CA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FEDET_DETFAC') and o.name = 'FK_FEDET_DE_FR_MEART__MEART_AR')
alter table FEDET_DETFAC
   drop constraint FK_FEDET_DE_FR_MEART__MEART_AR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PECAR_CARGO') and o.name = 'FK_PECAR_CA_PR_PEDEP__PEDEP_DE')
alter table PECAR_CARGO
   drop constraint FK_PECAR_CA_PR_PEDEP__PEDEP_DE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PEEEMP_EMPLE') and o.name = 'FK_PEEEMP_E_PR_PEESC__PEESC_ES')
alter table PEEEMP_EMPLE
   drop constraint FK_PEEEMP_E_PR_PEESC__PEESC_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PEEEMP_EMPLE') and o.name = 'FK_PEEEMP_E_PR_PESEX__PESEX_SE')
alter table PEEEMP_EMPLE
   drop constraint FK_PEEEMP_E_PR_PESEX__PESEX_SE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEOPC_OPCIO') and o.name = 'FK_XEOPC_OP_XR_XESIS__XESIS_SI')
alter table XEOPC_OPCIO
   drop constraint FK_XEOPC_OP_XR_XESIS__XESIS_SI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEOXP_OPCPE') and o.name = 'FK_XEOXP_OP_XR_XEOPC__XEOPC_OP')
alter table XEOXP_OPCPE
   drop constraint FK_XEOXP_OP_XR_XEOPC__XEOPC_OP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEOXP_OPCPE') and o.name = 'FK_XEOXP_OP_XR_XEPER__XEPER_PE')
alter table XEOXP_OPCPE
   drop constraint FK_XEOXP_OP_XR_XEPER__XEPER_PE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUSU_USUAR') and o.name = 'FK_XEUSU_US_XR_PEEEMP_PEEEMP_E')
alter table XEUSU_USUAR
   drop constraint FK_XEUSU_US_XR_PEEEMP_PEEEMP_E
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUSU_USUAR') and o.name = 'FK_XEUSU_US_XR_XEEST__XEEST_ES')
alter table XEUSU_USUAR
   drop constraint FK_XEUSU_US_XR_XEEST__XEEST_ES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUXP_USUPE') and o.name = 'FK_XEUXP_US_XR_XEPER__XEPER_PE')
alter table XEUXP_USUPE
   drop constraint FK_XEUXP_US_XR_XEPER__XEPER_PE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XEUXP_USUPE') and o.name = 'FK_XEUXP_US_XR_XEUSU__XEUSU_US')
alter table XEUXP_USUPE
   drop constraint FK_XEUXP_US_XR_XEUSU__XEUSU_US
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FECAF_CABFAC')
            and   name  = 'PR_PEEEMP_FECAF_FK'
            and   indid > 0
            and   indid < 255)
   drop index FECAF_CABFAC.PR_PEEEMP_FECAF_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FECAF_CABFAC')
            and   name  = 'FR_FECLI_FECAF_FK'
            and   indid > 0
            and   indid < 255)
   drop index FECAF_CABFAC.FR_FECLI_FECAF_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FECAF_CABFAC')
            and   name  = 'FR_FEFOP_FORPAG_FK'
            and   indid > 0
            and   indid < 255)
   drop index FECAF_CABFAC.FR_FEFOP_FORPAG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FECAF_CABFAC')
            and   type = 'U')
   drop table FECAF_CABFAC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FECLI_CLIENT')
            and   type = 'U')
   drop table FECLI_CLIENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FEDET_DETFAC')
            and   name  = 'FR_MEART_FEDET_FK'
            and   indid > 0
            and   indid < 255)
   drop index FEDET_DETFAC.FR_MEART_FEDET_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FEDET_DETFAC')
            and   name  = 'FR_FECAF_FEDET_FK'
            and   indid > 0
            and   indid < 255)
   drop index FEDET_DETFAC.FR_FECAF_FEDET_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FEDET_DETFAC')
            and   type = 'U')
   drop table FEDET_DETFAC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FEFOP_FORPAG')
            and   type = 'U')
   drop table FEFOP_FORPAG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FEPAF_PARFIN')
            and   type = 'U')
   drop table FEPAF_PARFIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEART_ART')
            and   type = 'U')
   drop table MEART_ART
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PECAR_CARGO')
            and   name  = 'PR_PEDEP_PECAR_FK'
            and   indid > 0
            and   indid < 255)
   drop index PECAR_CARGO.PR_PEDEP_PECAR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PECAR_CARGO')
            and   type = 'U')
   drop table PECAR_CARGO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEDEP_DEPAR')
            and   type = 'U')
   drop table PEDEP_DEPAR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PEEEMP_EMPLE')
            and   name  = 'PR_PEESC_PEEEMP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PEEEMP_EMPLE.PR_PEESC_PEEEMP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PEEEMP_EMPLE')
            and   name  = 'PR_PESEX_PEEEMP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PEEEMP_EMPLE.PR_PESEX_PEEEMP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEEEMP_EMPLE')
            and   type = 'U')
   drop table PEEEMP_EMPLE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PEESC_ESTCIV')
            and   type = 'U')
   drop table PEESC_ESTCIV
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PESEX_SEXO')
            and   type = 'U')
   drop table PESEX_SEXO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEEST_ESTAD')
            and   type = 'U')
   drop table XEEST_ESTAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEOPC_OPCIO')
            and   name  = 'XR_XESIS_XEOPC_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEOPC_OPCIO.XR_XESIS_XEOPC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEOPC_OPCIO')
            and   type = 'U')
   drop table XEOPC_OPCIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEOXP_OPCPE')
            and   name  = 'XR_XEOPC_XEOXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEOXP_OPCPE.XR_XEOPC_XEOXP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEOXP_OPCPE')
            and   name  = 'XR_XEPER_XEOXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEOXP_OPCPE.XR_XEPER_XEOXP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEOXP_OPCPE')
            and   type = 'U')
   drop table XEOXP_OPCPE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEPER_PERFI')
            and   type = 'U')
   drop table XEPER_PERFI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XESIS_SISTE')
            and   type = 'U')
   drop table XESIS_SISTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUSU_USUAR')
            and   name  = 'XR_PEEEMP_XEUSU_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUSU_USUAR.XR_PEEEMP_XEUSU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUSU_USUAR')
            and   name  = 'XR_XEEST_XEUSU_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUSU_USUAR.XR_XEEST_XEUSU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEUSU_USUAR')
            and   type = 'U')
   drop table XEUSU_USUAR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUXP_USUPE')
            and   name  = 'XR_XEUSU_XEUXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUXP_USUPE.XR_XEUSU_XEUXP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XEUXP_USUPE')
            and   name  = 'XR_XEPER_XEUXP_FK'
            and   indid > 0
            and   indid < 255)
   drop index XEUXP_USUPE.XR_XEPER_XEUXP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XEUXP_USUPE')
            and   type = 'U')
   drop table XEUXP_USUPE
go

/*==============================================================*/
/* Table: FECAF_CABFAC                                          */
/*==============================================================*/
create table FECAF_CABFAC (
   FECAF_NUMFAC         char(6)              not null,
   FEFOP_CODIGO         char(1)              not null,
   FECLI_CODIGO         char(6)              not null,
   PEEEMP_CODIGO        char(9)              not null,
   FECAF_FECEMI         datetime             not null,
   FECAF_AUTSRI         varchar(50)          null,
   FECAF_FEASRI         datetime             null,
   FECAF_TOTAL          numeric(10,2)        not null,
   FECAF_IVA            numeric(10,2)        not null,
   FECAF_DESCUES        numeric(10,2)        null,
   FECAF_TOTPAG         numeric(10,2)        not null,
   FECAF_SUBTOT         numeric(10,2)        not null,
   constraint PK_FECAF_CABFAC primary key nonclustered (FECAF_NUMFAC)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FECAF_CABFAC') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FECAF_CABFAC' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para la gestión de la cabecera de la FACTURA', 
   'user', @CurrentUser, 'table', 'FECAF_CABFAC'
go

/*==============================================================*/
/* Index: FR_FEFOP_FORPAG_FK                                    */
/*==============================================================*/
create index FR_FEFOP_FORPAG_FK on FECAF_CABFAC (
FEFOP_CODIGO ASC
)
go

/*==============================================================*/
/* Index: FR_FECLI_FECAF_FK                                     */
/*==============================================================*/
create index FR_FECLI_FECAF_FK on FECAF_CABFAC (
FECLI_CODIGO ASC
)
go

/*==============================================================*/
/* Index: PR_PEEEMP_FECAF_FK                                    */
/*==============================================================*/
create index PR_PEEEMP_FECAF_FK on FECAF_CABFAC (
PEEEMP_CODIGO ASC
)
go

/*==============================================================*/
/* Table: FECLI_CLIENT                                          */
/*==============================================================*/
create table FECLI_CLIENT (
   FECLI_CODIGO         char(6)              not null,
   FECLI_APELLI         varchar(50)          not null,
   FECLI_NOMBRE         varchar(50)          not null,
   FECLI_DIRECC         varchar(200)         null,
   FECLI_TELEFO         varchar(15)          null,
   FECLI_EMAIL          varchar(100)         not null,
   FECLI_CEDULA         char(10)             null,
   FECLI_RUC            char(13)             null,
   FECLI_RAZON          char(13)             null,
   FECLI_DISCAPA        binary(1)            not null,
   constraint PK_FECLI_CLIENT primary key nonclustered (FECLI_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FECLI_CLIENT') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FECLI_CLIENT' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar la gestión (CRUD) de CLIENTE', 
   'user', @CurrentUser, 'table', 'FECLI_CLIENT'
go

/*==============================================================*/
/* Table: FEDET_DETFAC                                          */
/*==============================================================*/
create table FEDET_DETFAC (
   MEART_CODIGO         char(10)             not null,
   FECAF_NUMFAC         char(6)              not null,
   FEDET_CANTID         numeric(10,2)        not null,
   FEDET_PRECIO         numeric(10,2)        not null,
   FEDET_SUBTOT         numeric(10,2)        not null,
   FEDET_GENIVA         bit                  not null,
   FEDET_IVA            numeric(12,2)        not null,
   constraint PK_FEDET_DETFAC primary key nonclustered (MEART_CODIGO, FECAF_NUMFAC, FEDET_CANTID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FEDET_DETFAC') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FEDET_DETFAC' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para gestionar el detalle de una Factura', 
   'user', @CurrentUser, 'table', 'FEDET_DETFAC'
go

/*==============================================================*/
/* Index: FR_FECAF_FEDET_FK                                     */
/*==============================================================*/
create index FR_FECAF_FEDET_FK on FEDET_DETFAC (
FECAF_NUMFAC ASC
)
go

/*==============================================================*/
/* Index: FR_MEART_FEDET_FK                                     */
/*==============================================================*/
create index FR_MEART_FEDET_FK on FEDET_DETFAC (
MEART_CODIGO ASC
)
go

/*==============================================================*/
/* Table: FEFOP_FORPAG                                          */
/*==============================================================*/
create table FEFOP_FORPAG (
   FEFOP_CODIGO         char(1)              not null,
   FEFOP_DESCRI         varchar(50)          not null,
   constraint PK_FEFOP_FORPAG primary key nonclustered (FEFOP_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FEFOP_FORPAG') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FEFOP_FORPAG' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para gestionar la forma de pago de una FACTURA', 
   'user', @CurrentUser, 'table', 'FEFOP_FORPAG'
go

/*==============================================================*/
/* Table: FEPAF_PARFIN                                          */
/*==============================================================*/
create table FEPAF_PARFIN (
   FEPAF_CODIGO         char(2)              not null,
   FEPAF_DESCRI         varchar(100)         not null,
   FEPAF_VPARFIN        numeric(10,2)        not null,
   FEPAF_FECIMP         datetime             not null,
   FEPAF_FEAFIN         datetime             null,
   FEPAF_OBSER          text                 null,
   constraint PK_FEPAF_PARFIN primary key nonclustered (FEPAF_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('FEPAF_PARFIN') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'FEPAF_PARFIN' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar la gestión de los diferentes parámetros externos al subsistema financiero impuesto por organismos extenos', 
   'user', @CurrentUser, 'table', 'FEPAF_PARFIN'
go

/*==============================================================*/
/* Table: MEART_ART                                             */
/*==============================================================*/
create table MEART_ART (
   MEART_CODIGO         char(10)             not null,
   MEART_DESCRIP        char(50)             not null,
   MEART_STOACT         numeric(10,2)        not null,
   MEART_STOMIN         numeric(10,2)        not null,
   MEART_STOMAX         numeric(10,2)        not null,
   MEART_PRECOM         numeric(10,2)        not null,
   MEART_PREVEN         numeric(10,2)        not null,
   MEART_OBSERV         text                 null,
   MEART_GENERA         bit                  null,
   constraint PK_MEART_ART primary key nonclustered (MEART_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('MEART_ART') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'MEART_ART' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para la gestion de ARTICULOS o SERVICIOS', 
   'user', @CurrentUser, 'table', 'MEART_ART'
go

/*==============================================================*/
/* Table: PECAR_CARGO                                           */
/*==============================================================*/
create table PECAR_CARGO (
   PEDEP_CODIGO         char(3)              not null,
   PECAR_CODIGO         char(3)              not null,
   PECAR_NOMBRE         varchar(35)          not null,
   PECAR_SALARIO        money                not null,
   constraint PK_PECAR_CARGO primary key nonclustered (PEDEP_CODIGO, PECAR_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PECAR_CARGO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PECAR_CARGO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el cargo de una persona', 
   'user', @CurrentUser, 'table', 'PECAR_CARGO'
go

/*==============================================================*/
/* Index: PR_PEDEP_PECAR_FK                                     */
/*==============================================================*/
create index PR_PEDEP_PECAR_FK on PECAR_CARGO (
PEDEP_CODIGO ASC
)
go

/*==============================================================*/
/* Table: PEDEP_DEPAR                                           */
/*==============================================================*/
create table PEDEP_DEPAR (
   PEDEP_CODIGO         char(3)              not null,
   PEDEP_NOMBRE         varchar(50)          not null,
   PEDEP_DESCRIP        varchar(50)          not null,
   constraint PK_PEDEP_DEPAR primary key nonclustered (PEDEP_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEDEP_DEPAR') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEDEP_DEPAR' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el departamento cargo de una persona', 
   'user', @CurrentUser, 'table', 'PEDEP_DEPAR'
go

/*==============================================================*/
/* Table: PEEEMP_EMPLE                                          */
/*==============================================================*/
create table PEEEMP_EMPLE (
   PEEEMP_CODIGO        char(9)              not null,
   PEPSEX_CODIGO        char(1)              not null,
   PEESC_CODIGO         char(3)              null,
   PEEEMP_CEDULA        char(10)             null,
   PEEEMP_NOMBRES       varchar(50)          not null,
   PEEEMP_APELLIDOS     varchar(50)          not null,
   PEEEMP_FECHANAC      datetime             not null,
   PEEEMP_DIRECCION     varchar(60)          null,
   PEEEMP_TELEFONO      char(8)              null,
   PEEEMP_EMAIL         varchar(50)          not null,
   PEEEMP_HIJOS         numeric(2)           not null,
   PEEEMP_CELULAR       char(10)             null,
   constraint PK_PEEEMP_EMPLE primary key nonclustered (PEEEMP_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEEEMP_EMPLE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEEEMP_EMPLE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad q se utiliza para almacenar los empleados', 
   'user', @CurrentUser, 'table', 'PEEEMP_EMPLE'
go

/*==============================================================*/
/* Index: PR_PESEX_PEEEMP_FK                                    */
/*==============================================================*/
create index PR_PESEX_PEEEMP_FK on PEEEMP_EMPLE (
PEPSEX_CODIGO ASC
)
go

/*==============================================================*/
/* Index: PR_PEESC_PEEEMP_FK                                    */
/*==============================================================*/
create index PR_PEESC_PEEEMP_FK on PEEEMP_EMPLE (
PEESC_CODIGO ASC
)
go

/*==============================================================*/
/* Table: PEESC_ESTCIV                                          */
/*==============================================================*/
create table PEESC_ESTCIV (
   PEESC_CODIGO         char(3)              not null,
   PEESC_DESCRIP        varchar(50)          not null,
   constraint PK_PEESC_ESTCIV primary key nonclustered (PEESC_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PEESC_ESTCIV') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PEESC_ESTCIV' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el estado civil de una persona', 
   'user', @CurrentUser, 'table', 'PEESC_ESTCIV'
go

/*==============================================================*/
/* Table: PESEX_SEXO                                            */
/*==============================================================*/
create table PESEX_SEXO (
   PEPSEX_CODIGO        char(1)              not null,
   PEPSEX_DESCR         varchar(50)          not null,
   constraint PK_PESEX_SEXO primary key nonclustered (PEPSEX_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('PESEX_SEXO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'PESEX_SEXO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para representar el sexo o genero de una persona', 
   'user', @CurrentUser, 'table', 'PESEX_SEXO'
go

/*==============================================================*/
/* Table: XEEST_ESTAD                                           */
/*==============================================================*/
create table XEEST_ESTAD (
   XEEST_CODIGO         char(1)              not null,
   XEEST_DESCRI         varchar(50)          not null,
   constraint PK_XEEST_ESTAD primary key nonclustered (XEEST_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEEST_ESTAD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEEST_ESTAD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para gestionar el estado de las difetrentes tablas', 
   'user', @CurrentUser, 'table', 'XEEST_ESTAD'
go

/*==============================================================*/
/* Table: XEOPC_OPCIO                                           */
/*==============================================================*/
create table XEOPC_OPCIO (
   XEOPC_CODIGO         char(3)              not null,
   XESIS_CODIGO         char(1)              not null,
   XEOPC_DESCRI         varchar(100)         not null,
   constraint PK_XEOPC_OPCIO primary key nonclustered (XEOPC_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEOPC_OPCIO') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEOPC_OPCIO' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar el registro de las diferentes opciones de un sistema', 
   'user', @CurrentUser, 'table', 'XEOPC_OPCIO'
go

/*==============================================================*/
/* Index: XR_XESIS_XEOPC_FK                                     */
/*==============================================================*/
create index XR_XESIS_XEOPC_FK on XEOPC_OPCIO (
XESIS_CODIGO ASC
)
go

/*==============================================================*/
/* Table: XEOXP_OPCPE                                           */
/*==============================================================*/
create table XEOXP_OPCPE (
   XEOPC_CODIGO         char(3)              not null,
   XEPER_CODIGO         char(8)              not null,
   XEOXP_FECASI         datetime             not null,
   XEOXP_FECRET         datetime             null,
   constraint PK_XEOXP_OPCPE primary key nonclustered (XEOPC_CODIGO, XEPER_CODIGO, XEOXP_FECASI)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEOXP_OPCPE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEOXP_OPCPE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para llevar el registro de las opciones que pertenecen a un perfil', 
   'user', @CurrentUser, 'table', 'XEOXP_OPCPE'
go

/*==============================================================*/
/* Index: XR_XEPER_XEOXP_FK                                     */
/*==============================================================*/
create index XR_XEPER_XEOXP_FK on XEOXP_OPCPE (
XEPER_CODIGO ASC
)
go

/*==============================================================*/
/* Index: XR_XEOPC_XEOXP_FK                                     */
/*==============================================================*/
create index XR_XEOPC_XEOXP_FK on XEOXP_OPCPE (
XEOPC_CODIGO ASC
)
go

/*==============================================================*/
/* Table: XEPER_PERFI                                           */
/*==============================================================*/
create table XEPER_PERFI (
   XEPER_CODIGO         char(8)              not null,
   XEPER_DESCRI         varchar(100)         not null,
   XEPER_OBSER          text                 null,
   constraint PK_XEPER_PERFI primary key nonclustered (XEPER_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEPER_PERFI') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEPER_PERFI' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar la gestión de los diferentes perfiles', 
   'user', @CurrentUser, 'table', 'XEPER_PERFI'
go

/*==============================================================*/
/* Table: XESIS_SISTE                                           */
/*==============================================================*/
create table XESIS_SISTE (
   XESIS_CODIGO         char(1)              not null,
   XESIS_DESCRI         varchar(50)          not null,
   constraint PK_XESIS_SISTE primary key nonclustered (XESIS_CODIGO)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XESIS_SISTE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XESIS_SISTE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realziar la gestión de los diferentes subsistemas', 
   'user', @CurrentUser, 'table', 'XESIS_SISTE'
go

/*==============================================================*/
/* Table: XEUSU_USUAR                                           */
/*==============================================================*/
create table XEUSU_USUAR (
   PEEEMP_CODIGO        char(9)              not null,
   XEUSU_PASWD          varchar(16)          not null,
   XEEST_CODIGO         char(1)              not null,
   XEUSU_FECCRE         datetime             not null,
   XEUSU_FECMOD         datetime             not null,
   XEUSU_PIEFIR         varchar(100)         not null,
   constraint PK_XEUSU_USUAR primary key nonclustered (PEEEMP_CODIGO, XEUSU_PASWD)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEUSU_USUAR') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEUSU_USUAR' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad relacionada para gentionar los usuario que ingrsan al sistema', 
   'user', @CurrentUser, 'table', 'XEUSU_USUAR'
go

/*==============================================================*/
/* Index: XR_XEEST_XEUSU_FK                                     */
/*==============================================================*/
create index XR_XEEST_XEUSU_FK on XEUSU_USUAR (
XEEST_CODIGO ASC
)
go

/*==============================================================*/
/* Index: XR_PEEEMP_XEUSU_FK                                    */
/*==============================================================*/
create index XR_PEEEMP_XEUSU_FK on XEUSU_USUAR (
PEEEMP_CODIGO ASC
)
go

/*==============================================================*/
/* Table: XEUXP_USUPE                                           */
/*==============================================================*/
create table XEUXP_USUPE (
   PEEEMP_CODIGO        char(9)              not null,
   XEUSU_PASWD          varchar(16)          not null,
   XEPER_CODIGO         char(8)              not null,
   XEUXP_FECASI         datetime             not null,
   XEUXP_FECRET         datetime             null,
   constraint PK_XEUXP_USUPE primary key nonclustered (PEEEMP_CODIGO, XEUSU_PASWD, XEPER_CODIGO, XEUXP_FECASI)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('XEUXP_USUPE') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'XEUXP_USUPE' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Entidad utilizada para realizar el registro de los diferentes usuarios que pertenecen a un perfil', 
   'user', @CurrentUser, 'table', 'XEUXP_USUPE'
go

/*==============================================================*/
/* Index: XR_XEPER_XEUXP_FK                                     */
/*==============================================================*/
create index XR_XEPER_XEUXP_FK on XEUXP_USUPE (
XEPER_CODIGO ASC
)
go

/*==============================================================*/
/* Index: XR_XEUSU_XEUXP_FK                                     */
/*==============================================================*/
create index XR_XEUSU_XEUXP_FK on XEUXP_USUPE (
PEEEMP_CODIGO ASC,
XEUSU_PASWD ASC
)
go

alter table FECAF_CABFAC
   add constraint FK_FECAF_CA_FR_FECLI__FECLI_CL foreign key (FECLI_CODIGO)
      references FECLI_CLIENT (FECLI_CODIGO)
go

alter table FECAF_CABFAC
   add constraint FK_FECAF_CA_FR_FEFOP__FEFOP_FO foreign key (FEFOP_CODIGO)
      references FEFOP_FORPAG (FEFOP_CODIGO)
go

alter table FECAF_CABFAC
   add constraint FK_FECAF_CA_PR_PEEEMP_PEEEMP_E foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO)
go

alter table FEDET_DETFAC
   add constraint FK_FEDET_DE_FR_FECAF__FECAF_CA foreign key (FECAF_NUMFAC)
      references FECAF_CABFAC (FECAF_NUMFAC)
go

alter table FEDET_DETFAC
   add constraint FK_FEDET_DE_FR_MEART__MEART_AR foreign key (MEART_CODIGO)
      references MEART_ART (MEART_CODIGO)
go

alter table PECAR_CARGO
   add constraint FK_PECAR_CA_PR_PEDEP__PEDEP_DE foreign key (PEDEP_CODIGO)
      references PEDEP_DEPAR (PEDEP_CODIGO)
go

alter table PEEEMP_EMPLE
   add constraint FK_PEEEMP_E_PR_PEESC__PEESC_ES foreign key (PEESC_CODIGO)
      references PEESC_ESTCIV (PEESC_CODIGO)
go

alter table PEEEMP_EMPLE
   add constraint FK_PEEEMP_E_PR_PESEX__PESEX_SE foreign key (PEPSEX_CODIGO)
      references PESEX_SEXO (PEPSEX_CODIGO)
go

alter table XEOPC_OPCIO
   add constraint FK_XEOPC_OP_XR_XESIS__XESIS_SI foreign key (XESIS_CODIGO)
      references XESIS_SISTE (XESIS_CODIGO)
go

alter table XEOXP_OPCPE
   add constraint FK_XEOXP_OP_XR_XEOPC__XEOPC_OP foreign key (XEOPC_CODIGO)
      references XEOPC_OPCIO (XEOPC_CODIGO)
go

alter table XEOXP_OPCPE
   add constraint FK_XEOXP_OP_XR_XEPER__XEPER_PE foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO)
go

alter table XEUSU_USUAR
   add constraint FK_XEUSU_US_XR_PEEEMP_PEEEMP_E foreign key (PEEEMP_CODIGO)
      references PEEEMP_EMPLE (PEEEMP_CODIGO)
go

alter table XEUSU_USUAR
   add constraint FK_XEUSU_US_XR_XEEST__XEEST_ES foreign key (XEEST_CODIGO)
      references XEEST_ESTAD (XEEST_CODIGO)
go

alter table XEUXP_USUPE
   add constraint FK_XEUXP_US_XR_XEPER__XEPER_PE foreign key (XEPER_CODIGO)
      references XEPER_PERFI (XEPER_CODIGO)
go

alter table XEUXP_USUPE
   add constraint FK_XEUXP_US_XR_XEUSU__XEUSU_US foreign key (PEEEMP_CODIGO, XEUSU_PASWD)
      references XEUSU_USUAR (PEEEMP_CODIGO, XEUSU_PASWD)
go

