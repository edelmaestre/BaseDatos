-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2019-11-22 00:10:29 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE abogado (
    cedula_abogado   VARCHAR2(12) NOT NULL,
    nombre           VARCHAR2(30),
    apellido         VARCHAR2(30),
    email            VARCHAR2(30),
    usu_nousu        VARCHAR2(5) NOT NULL
);

ALTER TABLE abogado ADD CONSTRAINT abog_pk PRIMARY KEY ( cedula_abogado );

CREATE TABLE demandado (
    id_demandado        VARCHAR2(12) NOT NULL,
    nomb_demandado      VARCHAR2(30),
    apell_demandado     VARCHAR2(30),
    direccion           VARCHAR2(30),
    email               VARCHAR2(50),
    telefono            VARCHAR2(10),
    fecha_nacimiento    DATE,
    genero              CHAR(10),
    ge_id_ge            CHAR(2) NOT NULL,
    pro_de_pro_dem_id   NUMBER NOT NULL
);

ALTER TABLE demandado ADD CONSTRAINT demdo_pk PRIMARY KEY ( id_demandado );

CREATE TABLE demandante (
    id_demandante             VARCHAR2(12) NOT NULL,
    nom_demandante            VARCHAR2(30),
    apell_demandant           VARCHAR2(30),
    direccion                 VARCHAR2(30),
    email                     VARCHAR2(50),
    telefono                  VARCHAR2(12),
    fechanaci                 DATE,
    genero                    CHAR(10),
    gen_id_gen                CHAR(2) NOT NULL,
    proc_demte_proc_dete_id   NUMBER NOT NULL
);

ALTER TABLE demandante ADD CONSTRAINT demte_pk PRIMARY KEY ( id_demandante );

CREATE TABLE departamento (
    id_departamento    VARCHAR2(5) NOT NULL,
    nombre_municipio   VARCHAR2(30)
);

ALTER TABLE departamento ADD CONSTRAINT depa_pk PRIMARY KEY ( id_departamento );

CREATE TABLE estado_proc (
    id_estado       VARCHAR2(2) NOT NULL,
    nomb_est_proc   VARCHAR2(20)
);

ALTER TABLE estado_proc ADD CONSTRAINT estado_proc_pk PRIMARY KEY ( id_estado );

CREATE TABLE expediente (
    id_expediente   INTEGER NOT NULL,
    id_radicado     VARCHAR2(20),
    juz_id_juz      VARCHAR2(5) NOT NULL
);

ALTER TABLE expediente ADD CONSTRAINT exped_pk PRIMARY KEY ( id_expediente );

CREATE TABLE genero (
    id_genero     CHAR(2) NOT NULL,
    nomb_genero   VARCHAR2(12)
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( id_genero );

CREATE TABLE juzgado (
    id_juzgado       VARCHAR2(5) NOT NULL,
    nombre_juzgado   VARCHAR2(20),
    id_expediente    VARCHAR2(5)
);

ALTER TABLE juzgado ADD CONSTRAINT juzgado_pk PRIMARY KEY ( id_juzgado );

CREATE TABLE municipio (
    id_municipio       VARCHAR2(5) NOT NULL,
    nombre_municipio   VARCHAR2(30),
    id_departamento    VARCHAR2(5),
    dep_id_dep         VARCHAR2(5) NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT muni_pk PRIMARY KEY ( id_municipio );

CREATE TABLE proceso (
    id_radicado         VARCHAR2(40) NOT NULL,
    id_demandado        VARCHAR2(12),
    id_demandadnte      VARCHAR2(12),
    asunto              VARCHAR2(50),
    id_estado           VARCHAR2(5),
    id_tipo_proceso     VARCHAR2(5),
    id_departamento     VARCHAR2(5),
    fecha_inicial       DATE,
    id_juzgado          VARCHAR2(5),
    id_abogado          VARCHAR2(12),
    ex_id_ex            INTEGER NOT NULL,
    mu_id_mun           VARCHAR2(5) NOT NULL,
    abo_ce_abo          VARCHAR2(12) NOT NULL,
    ti_pr_id_pro        VARCHAR2(5) NOT NULL,
    es_pro_id_es        VARCHAR2(2) NOT NULL,
    pr_de_pro_dete_id   NUMBER NOT NULL,
    pr_dem_pr_dem_id    NUMBER NOT NULL
);

ALTER TABLE proceso ADD CONSTRAINT proc_pk PRIMARY KEY ( id_radicado );

CREATE TABLE proceso_demandado (
    id_radicado     VARCHAR2(40) NOT NULL,
    id_demandado    VARCHAR2(12) NOT NULL,
    proc_demdo_id   NUMBER NOT NULL
);

ALTER TABLE proceso_demandado ADD CONSTRAINT proc_dedo_pk PRIMARY KEY ( proc_demdo_id );

CREATE TABLE proceso_demandante (
    id_radicado     VARCHAR2(40) NOT NULL,
    id_demandante   VARCHAR2(12) NOT NULL,
    proc_demte_id   NUMBER NOT NULL
);

ALTER TABLE proceso_demandante ADD CONSTRAINT proc_dete_pk PRIMARY KEY ( proc_demte_id );

CREATE TABLE tipo_proceso (
    id_proceso     VARCHAR2(5) NOT NULL,
    nomb_proceso   VARCHAR2(20)
);

ALTER TABLE tipo_proceso ADD CONSTRAINT tipo_proceso_pk PRIMARY KEY ( id_proceso );

CREATE TABLE usuario (
    cedula_abogado   VARCHAR2(12),
    nombre_usuario   VARCHAR2(20),
    password         VARCHAR2(20),
    nousuario        VARCHAR2(5) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( nousuario );

ALTER TABLE abogado
    ADD CONSTRAINT abo_us_fk FOREIGN KEY ( usu_nousu )
        REFERENCES usuario ( nousuario );

ALTER TABLE demandado
    ADD CONSTRAINT de_pro_ddo_fk FOREIGN KEY ( pro_de_pro_dem_id )
        REFERENCES proceso_demandado ( proc_demdo_id );

ALTER TABLE demandado
    ADD CONSTRAINT demdo_gen_fk FOREIGN KEY ( ge_id_ge )
        REFERENCES genero ( id_genero );

ALTER TABLE demandante
    ADD CONSTRAINT demte_gen_fk FOREIGN KEY ( gen_id_gen )
        REFERENCES genero ( id_genero );

ALTER TABLE demandante
    ADD CONSTRAINT demte_proc_demte_fk FOREIGN KEY ( proc_demte_proc_dete_id )
        REFERENCES proceso_demandante ( proc_demte_id );

ALTER TABLE expediente
    ADD CONSTRAINT exp_juz_fk FOREIGN KEY ( juz_id_juz )
        REFERENCES juzgado ( id_juzgado );

ALTER TABLE municipio
    ADD CONSTRAINT mun_dep_fk FOREIGN KEY ( dep_id_dep )
        REFERENCES departamento ( id_departamento );

ALTER TABLE proceso
    ADD CONSTRAINT pr_ab_fk FOREIGN KEY ( abo_ce_abo )
        REFERENCES abogado ( cedula_abogado );

ALTER TABLE proceso
    ADD CONSTRAINT pr_ex_fk FOREIGN KEY ( ex_id_ex )
        REFERENCES expediente ( id_expediente );

ALTER TABLE proceso
    ADD CONSTRAINT pro_est_proc_fk FOREIGN KEY ( es_pro_id_es )
        REFERENCES estado_proc ( id_estado );

ALTER TABLE proceso
    ADD CONSTRAINT pro_muni_fk FOREIGN KEY ( mu_id_mun )
        REFERENCES municipio ( id_municipio );

ALTER TABLE proceso
    ADD CONSTRAINT pro_pro_dedo_fk FOREIGN KEY ( pr_dem_pr_dem_id )
        REFERENCES proceso_demandado ( proc_demdo_id );

ALTER TABLE proceso
    ADD CONSTRAINT pro_proc_dete_fk FOREIGN KEY ( pr_de_pro_dete_id )
        REFERENCES proceso_demandante ( proc_demte_id );

ALTER TABLE proceso
    ADD CONSTRAINT pro_ti_pro_fk FOREIGN KEY ( ti_pr_id_pro )
        REFERENCES tipo_proceso ( id_proceso );

CREATE SEQUENCE proceso_demandado_proc_demdo_i START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER proceso_demandado_proc_demdo_i BEFORE
    INSERT ON proceso_demandado
    FOR EACH ROW
    WHEN ( new.proc_demdo_id IS NULL )
BEGIN
    :new.proc_demdo_id := proceso_demandado_proc_demdo_i.nextval;
END;
/

CREATE SEQUENCE proceso_demandante_proc_demte_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER proceso_demandante_proc_demte_ BEFORE
    INSERT ON proceso_demandante
    FOR EACH ROW
    WHEN ( new.proc_demte_id IS NULL )
BEGIN
    :new.proc_demte_id := proceso_demandante_proc_demte_.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             28
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          2
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
