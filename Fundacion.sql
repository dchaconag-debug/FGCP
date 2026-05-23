/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     1/12/2025 6:51:43 p. m.                      */
/*==============================================================*/


alter table BENEFICIARIOS
   drop constraint FK_BENEFICI_BENEFICIA_PSIQUIAT;

alter table BENEFICIARIOS
   drop constraint FK_BENEFICI_BENEFICIA_TRABAJAD;

alter table BENEFICIARIOS
   drop constraint FK_BENEFICI_BENEFICIA_TRATAMIE;

alter table BENEFICIARIOS_ACTIVIDADES
   drop constraint FK_BENEFICI_BENEFICIA_ACTIVIDA;

alter table BENEFICIARIOS_ACTIVIDADES
   drop constraint FK_BENEFICI_BENEFICIA_BENEFICI;

alter table BENEFICIARIOS_CONTACTO
   drop constraint FK_BENEFICI_PUEDE_TEN_CONTACTO;

alter table BENEFICIARIOS_CONTACTO
   drop constraint FK_BENEFICI_PUEDE_TEN_BENEFICI;

alter table CONTACTO
   drop constraint FK_CONTACTO_TRABAJADO_TRABAJAD;

alter table DONACION
   drop constraint FK_DONACION_USUARIO_D_USUARIO;

alter table DROGAS_PERSONAS
   drop constraint FK_DROGAS_P_DROGAS_PE_BENEFICI;

alter table DROGAS_PERSONAS
   drop constraint FK_DROGAS_P_DROGAS_PE_DROGAS;

alter table DROGAS_PERSONAS
   drop constraint FK_DROGAS_P_DROGAS_PE_CONTACTO;

alter table INFORME_SEGUIMIENTO
   drop constraint FK_INFORME__INFORME_E_PSIQUIAT;

alter table INFORME_SEGUIMIENTO
   drop constraint FK_INFORME__INFORME_E_TRABAJAD;

alter table INFORME_SEGUIMIENTO
   drop constraint FK_INFORME__INFORME_S_BENEFICI;

alter table INFORME_SEGUIMIENTO
   drop constraint FK_INFORME__INFORME_S_CONTACTO;

alter table INFORME_SEGUIMIENTO
   drop constraint FK_INFORME__INFORME_T_TRATAMIE;

alter table MIEMBRO_DONACION
   drop constraint FK_MIEMBRO__MIEMBRO_D_DONANTE;

alter table MIEMBRO_DONACION
   drop constraint FK_MIEMBRO__MIEMBRO_D_DONACION;

alter table MIEMBRO_DONACION
   drop constraint FK_MIEMBRO__MIEMBRO_D_VOLUNTAR;

alter table PRUEBAS_TOXICOLOGICAS
   drop constraint FK_PRUEBAS__BENEFICIA_BENEFICI;

alter table PRUEBAS_TOXICOLOGICAS
   drop constraint FK_PRUEBAS__PRUEBAS_D_DROGAS;

alter table PRUEBAS_TOXICOLOGICAS
   drop constraint FK_PRUEBAS__PRUEBAS_I_INFORME_;

alter table RED_APOYO_BENEFICIARIOS
   drop constraint FK_RED_APOY_PUEDE_REL_BENEFICI;

alter table TRATAMIENTO
   drop constraint FK_TRATAMIE_EQUIPO_IN_PSIQUIAT;

alter table TRATAMIENTO
   drop constraint FK_TRATAMIE_EQUIPO_IN_TRABAJAD;

alter table USUARIO
   drop constraint FK_USUARIO_MIEMBRO_U_DONANTE;

alter table USUARIO
   drop constraint FK_USUARIO_MIEMBRO_U_VOLUNTAR;

alter table VOLUNTARIO
   drop constraint FK_VOLUNTAR_VOLUNTARI_DONANTE;

drop table ACTIVIDADES cascade constraints;

drop index BENEFICIARIOS_EQUIPO;

drop index BENEFICIARIOS_TRATAMIENTO_FK;

drop table BENEFICIARIOS cascade constraints;

drop index BENEFICIARIOS_ACTIVIDADES2_FK;

drop table BENEFICIARIOS_ACTIVIDADES cascade constraints;

drop index PUEDE_TENER2_FK;

drop table BENEFICIARIOS_CONTACTO cascade constraints;

drop index TRABAJADOR_SOCIAL_CONTACTO_FK;

drop table CONTACTO cascade constraints;

drop table DONACION cascade constraints;

drop table DONANTE cascade constraints;

drop table DROGAS cascade constraints;

drop index DROGAS_PERSONAS3_FK;

drop index DROGAS_PERSONAS2_FK;

drop table DROGAS_PERSONAS cascade constraints;

drop index INFORME_EQUIPO2_FK;

drop index INFORME_PERSONAS;

drop index INFORME_TRATAMIENTO_FK;

drop table INFORME_SEGUIMIENTO cascade constraints;

drop index MIEMBRO_DONACION2_FK;

drop table MIEMBRO_DONACION cascade constraints;

drop index PRUEBAS_INFORME_FK;

drop index PRUEBAS_DROGAS_FK;

drop index BENEFICIARIOS_PRUEBAS_FK;

drop table PRUEBAS_TOXICOLOGICAS cascade constraints;

drop table PSIQUIATRIA cascade constraints;

drop index RED_APOYO;

drop table RED_APOYO_BENEFICIARIOS cascade constraints;

drop table TRABAJADOR_SOCIAL cascade constraints;

drop index EQUIPO_TRATAMIENTO;

drop table TRATAMIENTO cascade constraints;

drop index MIEMBRO_USUARIO2_FK;

drop table USUARIO cascade constraints;

drop table VOLUNTARIO cascade constraints;

/*==============================================================*/
/* Table: ACTIVIDADES                                           */
/*==============================================================*/
create table ACTIVIDADES 
(
   ID_ACTIVIDAD         NUMBER               not null,
   NOMBRE_ACTIVIDAD     VARCHAR2(50)         not null,
   TIPO_ACTIVIDAD_      VARCHAR2(50)         not null,
   FECHA_ACTIVIDAD      DATE                 not null,
   DESCRIPCION_ACTIVIDAD CLOB,
   constraint PK_ACTIVIDADES primary key (ID_ACTIVIDAD)
);

/*==============================================================*/
/* Table: BENEFICIARIOS                                         */
/*==============================================================*/
create table BENEFICIARIOS 
(
   CEDULA               NUMBER               not null,
   NOMBRE_PERSONA       VARCHAR2(20),
   FECHA_NACIMIENTO     DATE,
   SEXO                 VARCHAR2(10),
   TELEFONO             NUMBER,
   DIRECCION            VARCHAR2(20),
   ESCOLARIDAD          VARCHAR2(20),
   ATTRIBUTE_14         NUMBER,
   ID_TRATAMIENTO       NUMBER               not null,
   ESTADO_BENEFICIARIO  VARCHAR2(20)         not null,
   FECHA_INGRESO        DATE                 not null,
   FECHA_RETIRO         DATE,
   constraint PK_BENEFICIARIOS primary key (CEDULA)
);

/*==============================================================*/
/* Index: BENEFICIARIOS_TRATAMIENTO_FK                          */
/*==============================================================*/
create index BENEFICIARIOS_TRATAMIENTO_FK on BENEFICIARIOS (
   ID_TRATAMIENTO ASC
);

/*==============================================================*/
/* Index: BENEFICIARIOS_EQUIPO                                  */
/*==============================================================*/
create index BENEFICIARIOS_EQUIPO on BENEFICIARIOS (
   ATTRIBUTE_14 ASC
);

/*==============================================================*/
/* Table: BENEFICIARIOS_ACTIVIDADES                             */
/*==============================================================*/
create table BENEFICIARIOS_ACTIVIDADES 
(
   ID_ACTIVIDAD         NUMBER               not null,
   CEDULA               NUMBER,
   ROL                  VARCHAR2(20)         not null,
   ASISTENCIA           SMALLINT             not null,
   RECOMENDACION        CLOB,
   constraint PK_BENEFICIARIOS_ACTIVIDADES primary key (ID_ACTIVIDAD)
);

/*==============================================================*/
/* Index: BENEFICIARIOS_ACTIVIDADES2_FK                         */
/*==============================================================*/
create index BENEFICIARIOS_ACTIVIDADES2_FK on BENEFICIARIOS_ACTIVIDADES (
   CEDULA ASC
);

/*==============================================================*/
/* Table: BENEFICIARIOS_CONTACTO                                */
/*==============================================================*/
create table BENEFICIARIOS_CONTACTO 
(
   CON_CEDULA           NUMBER               not null,
   CEDULA               NUMBER               not null,
   NIVEL_RESPONSABILIDAD VARCHAR2(50)         not null,
   CONVIVEN_ACTUALMENTE SMALLINT             not null,
   constraint PK_BENEFICIARIOS_CONTACTO primary key (CON_CEDULA, CEDULA)
);

/*==============================================================*/
/* Index: PUEDE_TENER2_FK                                       */
/*==============================================================*/
create index PUEDE_TENER2_FK on BENEFICIARIOS_CONTACTO (
   CEDULA ASC
);

/*==============================================================*/
/* Table: CONTACTO                                              */
/*==============================================================*/
create table CONTACTO 
(
   CEDULA               NUMBER               not null,
   ATTRIBUTE_14         NUMBER               not null,
   NOMBRE_PERSONA       VARCHAR2(20),
   FECHA_NACIMIENTO     DATE,
   SEXO                 VARCHAR2(10),
   TELEFONO             NUMBER,
   DIRECCION            VARCHAR2(20),
   ESCOLARIDAD          VARCHAR2(20),
   PARENTESCO           VARCHAR2(20)         not null,
   TIPO_CONVIVENCIA     VARCHAR2(20)         not null,
   ANTECEDENTES_CONSUMO_ SMALLINT             not null,
   constraint PK_CONTACTO primary key (CEDULA)
);

/*==============================================================*/
/* Index: TRABAJADOR_SOCIAL_CONTACTO_FK                         */
/*==============================================================*/
create index TRABAJADOR_SOCIAL_CONTACTO_FK on CONTACTO (
   ATTRIBUTE_14 ASC
);

/*==============================================================*/
/* Table: DONACION                                              */
/*==============================================================*/
create table DONACION 
(
   ID_USUARIO           INTEGER              not null,
   ID_DONACION          INTEGER              not null,
   TIPO_DONACION        VARCHAR2(50)         not null,
   VALOR_DONACION       NUMBER(12,2)         not null,
   FECHA_DONACION       DATE                 not null,
   DESCRIPCION_DONACION VARCHAR2(200),
   constraint PK_DONACION primary key (ID_USUARIO, ID_DONACION)
);

/*==============================================================*/
/* Table: DONANTE                                               */
/*==============================================================*/
create table DONANTE 
(
   NUMERO_DOCUMENTO     VARCHAR2(20)         not null,
   NOMBRE_COMPLETO_RAZON_SOCIAL VARCHAR2(120),
   CORREO_MIEMBRO       VARCHAR2(20),
   TELEFONO_MIEMBRO     NUMBER(10),
   BARRIO_MIEMBRO       VARCHAR2(50),
   FECHA_REGISTRO       DATE,
   FECHA_NACIMIENTO     DATE,
   TIPO_DONANTE         VARCHAR2(20)         not null,
   NOTAS_DONANTE        CLOB,
   constraint AK_IDENTIFIER_1_DONANTE unique (NUMERO_DOCUMENTO)
);

/*==============================================================*/
/* Table: DROGAS                                                */
/*==============================================================*/
create table DROGAS 
(
   ID_DROGA             NUMBER               not null,
   NOMBRE_DROGA         VARCHAR2(20)         not null,
   CATEGORIA_           VARCHAR2(20)         not null,
   DESCRIPCION          VARCHAR2(50),
   constraint PK_DROGAS primary key (ID_DROGA)
);

/*==============================================================*/
/* Table: DROGAS_PERSONAS                                       */
/*==============================================================*/
create table DROGAS_PERSONAS 
(
   CEDULA               NUMBER               not null,
   ID_DROGA             NUMBER               not null,
   TIPO_DE_EXPOSICION   VARCHAR2(20)         not null,
   FRECUENCIA           VARCHAR2(50)         not null,
   ULTIMA_EXPOSICION    DATE                 not null,
   constraint PK_DROGAS_PERSONAS primary key (CEDULA, ID_DROGA)
);

/*==============================================================*/
/* Index: DROGAS_PERSONAS2_FK                                   */
/*==============================================================*/
create index DROGAS_PERSONAS2_FK on DROGAS_PERSONAS (
   ID_DROGA ASC
);

/*==============================================================*/
/* Index: DROGAS_PERSONAS3_FK                                   */
/*==============================================================*/
create index DROGAS_PERSONAS3_FK on DROGAS_PERSONAS (
   CEDULA ASC
);

/*==============================================================*/
/* Table: INFORME_SEGUIMIENTO                                   */
/*==============================================================*/
create table INFORME_SEGUIMIENTO 
(
   ID_INFORME           NUMBER               not null,
   CEDULA               NUMBER               not null,
   ATTRIBUTE_14         NUMBER,
   ID_TRATAMIENTO       NUMBER               not null,
   FECHA_INFORME        DATE                 not null,
   RECAIDAS_            SMALLINT             not null,
   AVANCES              VARCHAR2(20),
   OBSERVACIONES        VARCHAR2(50),
   constraint PK_INFORME_SEGUIMIENTO primary key (ID_INFORME)
);

/*==============================================================*/
/* Index: INFORME_TRATAMIENTO_FK                                */
/*==============================================================*/
create index INFORME_TRATAMIENTO_FK on INFORME_SEGUIMIENTO (
   ID_TRATAMIENTO ASC
);

/*==============================================================*/
/* Index: INFORME_PERSONAS                                      */
/*==============================================================*/
create index INFORME_PERSONAS on INFORME_SEGUIMIENTO (
   CEDULA ASC
);

/*==============================================================*/
/* Index: INFORME_EQUIPO2_FK                                    */
/*==============================================================*/
create index INFORME_EQUIPO2_FK on INFORME_SEGUIMIENTO (
   ATTRIBUTE_14 ASC
);

/*==============================================================*/
/* Table: MIEMBRO_DONACION                                      */
/*==============================================================*/
create table MIEMBRO_DONACION 
(
   NUMERO_DOCUMENTO     VARCHAR2(20)         not null,
   ID_USUARIO           INTEGER              not null,
   ID_DONACION          INTEGER              not null,
   FECHA_ASIGNACION     DATE                 not null,
   constraint PK_MIEMBRO_DONACION primary key (NUMERO_DOCUMENTO, ID_USUARIO, ID_DONACION)
);

/*==============================================================*/
/* Index: MIEMBRO_DONACION2_FK                                  */
/*==============================================================*/
create index MIEMBRO_DONACION2_FK on MIEMBRO_DONACION (
   ID_USUARIO ASC,
   ID_DONACION ASC
);

/*==============================================================*/
/* Table: PRUEBAS_TOXICOLOGICAS                                 */
/*==============================================================*/
create table PRUEBAS_TOXICOLOGICAS 
(
   ID_PRUEBA            NUMBER               not null,
   ID_DROGA             NUMBER               not null,
   ID_INFORME           NUMBER               not null,
   CEDULA               NUMBER,
   FECHA_PRUEBA         DATE                 not null,
   TIPO_PRUEBA_         VARCHAR2(20)         not null,
   RESULTADO_           SMALLINT             not null,
   NIVEL_DETECTADO      FLOAT                not null,
   constraint PK_PRUEBAS_TOXICOLOGICAS primary key (ID_PRUEBA)
);

/*==============================================================*/
/* Index: BENEFICIARIOS_PRUEBAS_FK                              */
/*==============================================================*/
create index BENEFICIARIOS_PRUEBAS_FK on PRUEBAS_TOXICOLOGICAS (
   CEDULA ASC
);

/*==============================================================*/
/* Index: PRUEBAS_DROGAS_FK                                     */
/*==============================================================*/
create index PRUEBAS_DROGAS_FK on PRUEBAS_TOXICOLOGICAS (
   ID_DROGA ASC
);

/*==============================================================*/
/* Index: PRUEBAS_INFORME_FK                                    */
/*==============================================================*/
create index PRUEBAS_INFORME_FK on PRUEBAS_TOXICOLOGICAS (
   ID_INFORME ASC
);

/*==============================================================*/
/* Table: PSIQUIATRIA                                           */
/*==============================================================*/
create table PSIQUIATRIA 
(
   ATTRIBUTE_14         NUMBER               not null,
   NOMBRE_EQUIPO        VARCHAR2(20),
   CEDULA_EQUIPO        NUMBER,
   TIPO_CONTRATO        VARCHAR2(20),
   SALARIO_MENSUAL      NUMBER,
   TELEFONO_PROFESIONAL NUMBER,
   CORREO_ELECTRONICO   VARCHAR2(20),
   LINEA_INTERVENCION   VARCHAR2(20),
   DURACION_CONTRATO    NUMBER,
   ANOS_EXPERIENCIA     NUMBER               not null,
   PRESCRIPCION_ADICCIONES SMALLINT             not null,
   constraint AK_IDENTIFIER_1_PSIQUIAT unique (ATTRIBUTE_14)
);

/*==============================================================*/
/* Table: RED_APOYO_BENEFICIARIOS                               */
/*==============================================================*/
create table RED_APOYO_BENEFICIARIOS 
(
   CEDULA               NUMBER               not null,
   TIPO_RELACION        VARCHAR2(50)         not null,
   OBSERVACIONES        VARCHAR2(120)        not null,
   constraint PK_RED_APOYO_BENEFICIARIOS primary key (CEDULA)
);

/*==============================================================*/
/* Index: RED_APOYO                                             */
/*==============================================================*/
create index RED_APOYO on RED_APOYO_BENEFICIARIOS (
   CEDULA ASC
);

/*==============================================================*/
/* Table: TRABAJADOR_SOCIAL                                     */
/*==============================================================*/
create table TRABAJADOR_SOCIAL 
(
   ATTRIBUTE_14         NUMBER               not null,
   NOMBRE_EQUIPO        VARCHAR2(20),
   CEDULA_EQUIPO        NUMBER,
   TIPO_CONTRATO        VARCHAR2(20),
   SALARIO_MENSUAL      NUMBER,
   TELEFONO_PROFESIONAL NUMBER,
   CORREO_ELECTRONICO   VARCHAR2(20),
   LINEA_INTERVENCION   VARCHAR2(20),
   DURACION_CONTRATO    NUMBER,
   INTERVENCION_FAMILIAR_ SMALLINT             not null,
   TALLERES_PREVENCION_ SMALLINT             not null,
   PACIENTES_REINTEGRADOS NUMBER               not null,
   FAMILIAS_ACTIVAS     NUMBER,
   VISITAS_DOMICILIARIAS NUMBER,
   CONVENIOS            NUMBER,
   constraint PK_TRABAJADOR_SOCIAL primary key (ATTRIBUTE_14)
);

/*==============================================================*/
/* Table: TRATAMIENTO                                           */
/*==============================================================*/
create table TRATAMIENTO 
(
   ID_TRATAMIENTO       NUMBER               not null,
   ATTRIBUTE_14         NUMBER               not null,
   TIPO_TRATAMIENTO_    VARCHAR2(20)         not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_FIN            DATE                 not null,
   ESTADO_TRATAMIENTO_  VARCHAR2(20)         not null,
   constraint PK_TRATAMIENTO primary key (ID_TRATAMIENTO)
);

/*==============================================================*/
/* Index: EQUIPO_TRATAMIENTO                                    */
/*==============================================================*/
create index EQUIPO_TRATAMIENTO on TRATAMIENTO (
   ATTRIBUTE_14 ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   ID_USUARIO           INTEGER              not null,
   NUMERO_DOCUMENTO     VARCHAR2(20),
   NOMBRE_USUARIO       VARCHAR2(50)         not null,
   APELLIDO_USUARIO     VARCHAR2(50)         not null,
   CORREO_USUARIO       VARCHAR2(120)        not null,
   CONTRASENA_USUARIO   VARCHAR2(50)         not null,
   ROL_USUARIO          VARCHAR2(50)         not null,
   FECHA_REGISTRO_USUARIO VARCHAR2(50)         not null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: MIEMBRO_USUARIO2_FK                                   */
/*==============================================================*/
create index MIEMBRO_USUARIO2_FK on USUARIO (
   NUMERO_DOCUMENTO ASC
);

/*==============================================================*/
/* Table: VOLUNTARIO                                            */
/*==============================================================*/
create table VOLUNTARIO 
(
   NUMERO_DOCUMENTO     VARCHAR2(20)         not null,
   NOMBRE_COMPLETO_RAZON_SOCIAL VARCHAR2(120),
   CORREO_MIEMBRO       VARCHAR2(20),
   TELEFONO_MIEMBRO     NUMBER(10),
   BARRIO_MIEMBRO       VARCHAR2(50),
   FECHA_REGISTRO       DATE,
   FECHA_NACIMIENTO     DATE,
   ESTADO_VOLUNTARIO    VARCHAR2(50)         not null,
   constraint AK_IDENTIFIER_1_VOLUNTAR unique (NUMERO_DOCUMENTO)
);

alter table BENEFICIARIOS
   add constraint FK_BENEFICI_BENEFICIA_PSIQUIAT foreign key (ATTRIBUTE_14)
      references PSIQUIATRIA (ATTRIBUTE_14);

alter table BENEFICIARIOS
   add constraint FK_BENEFICI_BENEFICIA_TRABAJAD foreign key (ATTRIBUTE_14)
      references TRABAJADOR_SOCIAL (ATTRIBUTE_14);

alter table BENEFICIARIOS
   add constraint FK_BENEFICI_BENEFICIA_TRATAMIE foreign key (ID_TRATAMIENTO)
      references TRATAMIENTO (ID_TRATAMIENTO);

alter table BENEFICIARIOS_ACTIVIDADES
   add constraint FK_BENEFICI_BENEFICIA_ACTIVIDA foreign key (ID_ACTIVIDAD)
      references ACTIVIDADES (ID_ACTIVIDAD);

alter table BENEFICIARIOS_ACTIVIDADES
   add constraint FK_BENEFICI_BENEFICIA_BENEFICI foreign key (CEDULA)
      references BENEFICIARIOS (CEDULA);

alter table BENEFICIARIOS_CONTACTO
   add constraint FK_BENEFICI_PUEDE_TEN_CONTACTO foreign key (CON_CEDULA)
      references CONTACTO (CEDULA);

alter table BENEFICIARIOS_CONTACTO
   add constraint FK_BENEFICI_PUEDE_TEN_BENEFICI foreign key (CEDULA)
      references BENEFICIARIOS (CEDULA);

alter table CONTACTO
   add constraint FK_CONTACTO_TRABAJADO_TRABAJAD foreign key (ATTRIBUTE_14)
      references TRABAJADOR_SOCIAL (ATTRIBUTE_14);

alter table DONACION
   add constraint FK_DONACION_USUARIO_D_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table DROGAS_PERSONAS
   add constraint FK_DROGAS_P_DROGAS_PE_BENEFICI foreign key (CEDULA)
      references BENEFICIARIOS (CEDULA);

alter table DROGAS_PERSONAS
   add constraint FK_DROGAS_P_DROGAS_PE_DROGAS foreign key (ID_DROGA)
      references DROGAS (ID_DROGA);

alter table DROGAS_PERSONAS
   add constraint FK_DROGAS_P_DROGAS_PE_CONTACTO foreign key (CEDULA)
      references CONTACTO (CEDULA);

alter table INFORME_SEGUIMIENTO
   add constraint FK_INFORME__INFORME_E_PSIQUIAT foreign key (ATTRIBUTE_14)
      references PSIQUIATRIA (ATTRIBUTE_14);

alter table INFORME_SEGUIMIENTO
   add constraint FK_INFORME__INFORME_E_TRABAJAD foreign key (ATTRIBUTE_14)
      references TRABAJADOR_SOCIAL (ATTRIBUTE_14);

alter table INFORME_SEGUIMIENTO
   add constraint FK_INFORME__INFORME_S_BENEFICI foreign key (CEDULA)
      references BENEFICIARIOS (CEDULA);

alter table INFORME_SEGUIMIENTO
   add constraint FK_INFORME__INFORME_S_CONTACTO foreign key (CEDULA)
      references CONTACTO (CEDULA);

alter table INFORME_SEGUIMIENTO
   add constraint FK_INFORME__INFORME_T_TRATAMIE foreign key (ID_TRATAMIENTO)
      references TRATAMIENTO (ID_TRATAMIENTO);

alter table MIEMBRO_DONACION
   add constraint FK_MIEMBRO__MIEMBRO_D_DONANTE foreign key (NUMERO_DOCUMENTO)
      references DONANTE (NUMERO_DOCUMENTO);

alter table MIEMBRO_DONACION
   add constraint FK_MIEMBRO__MIEMBRO_D_DONACION foreign key (ID_USUARIO, ID_DONACION)
      references DONACION (ID_USUARIO, ID_DONACION);

alter table MIEMBRO_DONACION
   add constraint FK_MIEMBRO__MIEMBRO_D_VOLUNTAR foreign key (NUMERO_DOCUMENTO)
      references VOLUNTARIO (NUMERO_DOCUMENTO);

alter table PRUEBAS_TOXICOLOGICAS
   add constraint FK_PRUEBAS__BENEFICIA_BENEFICI foreign key (CEDULA)
      references BENEFICIARIOS (CEDULA);

alter table PRUEBAS_TOXICOLOGICAS
   add constraint FK_PRUEBAS__PRUEBAS_D_DROGAS foreign key (ID_DROGA)
      references DROGAS (ID_DROGA);

alter table PRUEBAS_TOXICOLOGICAS
   add constraint FK_PRUEBAS__PRUEBAS_I_INFORME_ foreign key (ID_INFORME)
      references INFORME_SEGUIMIENTO (ID_INFORME);

alter table RED_APOYO_BENEFICIARIOS
   add constraint FK_RED_APOY_PUEDE_REL_BENEFICI foreign key (CEDULA)
      references BENEFICIARIOS (CEDULA);

alter table TRATAMIENTO
   add constraint FK_TRATAMIE_EQUIPO_IN_PSIQUIAT foreign key (ATTRIBUTE_14)
      references PSIQUIATRIA (ATTRIBUTE_14);

alter table TRATAMIENTO
   add constraint FK_TRATAMIE_EQUIPO_IN_TRABAJAD foreign key (ATTRIBUTE_14)
      references TRABAJADOR_SOCIAL (ATTRIBUTE_14);

alter table USUARIO
   add constraint FK_USUARIO_MIEMBRO_U_DONANTE foreign key (NUMERO_DOCUMENTO)
      references DONANTE (NUMERO_DOCUMENTO);

alter table USUARIO
   add constraint FK_USUARIO_MIEMBRO_U_VOLUNTAR foreign key (NUMERO_DOCUMENTO)
      references VOLUNTARIO (NUMERO_DOCUMENTO);

alter table VOLUNTARIO
   add constraint FK_VOLUNTAR_VOLUNTARI_DONANTE foreign key (NUMERO_DOCUMENTO)
      references DONANTE (NUMERO_DOCUMENTO);

