-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2023-03-23 20:04:07 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Brod_Vez
  (
    Datum_Od        DATE NOT NULL ,
    Datum_Do        DATE NOT NULL ,
    Vezovi_ID_Vez   NUMBER NOT NULL ,
    Brodovi_ID_Brod NUMBER NOT NULL
  ) ;


CREATE TABLE Brodovi
  (
    ID_Brod             NUMBER NOT NULL ,
    Ime                 VARCHAR2 (50) NOT NULL ,
    Registracija        VARCHAR2 (20) NOT NULL ,
    Godina_Proizvodnje  VARCHAR2 (7) NOT NULL ,
    Modeli_ID_Model     NUMBER NOT NULL ,
    Charteri_ID_Charter NUMBER NOT NULL
  ) ;
ALTER TABLE Brodovi ADD CONSTRAINT Brodovi_PK PRIMARY KEY ( ID_Brod ) ;
ALTER TABLE Brodovi ADD CONSTRAINT Brodovi_Registracija_UN UNIQUE ( Registracija ) ;


CREATE TABLE Charter_Vez
  (
    Datum_Od            DATE NOT NULL ,
    Datum_Do            DATE NOT NULL ,
    Vezovi_ID_Vez       NUMBER NOT NULL ,
    Charteri_ID_Charter NUMBER NOT NULL
  ) ;


CREATE TABLE Charteri
  (
    ID_Charter NUMBER NOT NULL ,
    Naziv      VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Charteri ADD CONSTRAINT Charteri_PK PRIMARY KEY ( ID_Charter ) ;


CREATE TABLE Drzave
  (
    ID_Drzava NUMBER NOT NULL ,
    Naziv     VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Drzave ADD CONSTRAINT Drzave_PK PRIMARY KEY ( ID_Drzava ) ;


CREATE TABLE Klijenti
  (
    ID_Klijent       NUMBER NOT NULL ,
    Ime              VARCHAR2 (50) NOT NULL ,
    Prezime          VARCHAR2 (50) NOT NULL ,
    Identifikator    VARCHAR2 (15) NOT NULL ,
    Drzave_ID_Drzava NUMBER NOT NULL
  ) ;
ALTER TABLE Klijenti ADD CONSTRAINT Klijenti_PK PRIMARY KEY ( ID_Klijent ) ;
ALTER TABLE Klijenti ADD CONSTRAINT Klijenti_Identifikator_UN UNIQUE ( Identifikator ) ;


CREATE TABLE Marine
  (
    ID_Marina        NUMBER NOT NULL ,
    Naziv            VARCHAR2 (50) NOT NULL ,
    Broj_Vezova      VARCHAR2 (4) NOT NULL ,
    Mjesta_ID_Mjesto NUMBER NOT NULL
  ) ;
ALTER TABLE Marine ADD CONSTRAINT Marine_PK PRIMARY KEY ( ID_Marina ) ;


CREATE TABLE Marke
  (
    ID_Marka NUMBER NOT NULL ,
    Naziv    VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Marke ADD CONSTRAINT Marke_PK PRIMARY KEY ( ID_Marka ) ;


CREATE TABLE Mjesta
  (
    ID_Mjesto        NUMBER NOT NULL ,
    Naziv            VARCHAR2 (50) NOT NULL ,
    Drzave_ID_Drzava NUMBER NOT NULL
  ) ;
ALTER TABLE Mjesta ADD CONSTRAINT Mjesta_PK PRIMARY KEY ( ID_Mjesto ) ;


CREATE TABLE Modeli
  (
    ID_Model       NUMBER NOT NULL ,
    Naziv          VARCHAR2 (50) NOT NULL ,
    Marke_ID_Marka NUMBER NOT NULL
  ) ;
ALTER TABLE Modeli ADD CONSTRAINT Modeli_PK PRIMARY KEY ( ID_Model ) ;


CREATE TABLE Osoblje
  (
    ID_Osoblje          NUMBER NOT NULL ,
    Ime                 VARCHAR2 (50) NOT NULL ,
    Prezime             VARCHAR2 (50) NOT NULL ,
    Placa               VARCHAR2 (7) NOT NULL ,
    Oib                 NUMBER NOT NULL ,
    Poslovi_ID_Posao    NUMBER NOT NULL ,
    Charteri_ID_Charter NUMBER NOT NULL
  ) ;
ALTER TABLE Osoblje ADD CONSTRAINT Osoblje_PK PRIMARY KEY ( ID_Osoblje ) ;
ALTER TABLE Osoblje ADD CONSTRAINT Osoblje_Oib_UN UNIQUE ( Oib ) ;


CREATE TABLE Poslovi
  (
    ID_Posao NUMBER NOT NULL ,
    Naziv    VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Poslovi ADD CONSTRAINT Poslovi_PK PRIMARY KEY ( ID_Posao ) ;


CREATE TABLE Rezervacije
  (
    ID_Rezervacija      NUMBER NOT NULL ,
    Cijena              VARCHAR2 (7) NOT NULL ,
    Datum_Od            DATE NOT NULL ,
    Datum_Do            DATE NOT NULL ,
    Sifra               VARCHAR2 (15) NOT NULL ,
    Klijenti_ID_Klijent NUMBER NOT NULL ,
    Usluge_ID_Usluga    NUMBER NOT NULL ,
    Osoblje_ID_Osoblje  NUMBER NOT NULL ,
    Brodovi_ID_Brod     NUMBER NOT NULL
  ) ;
ALTER TABLE Rezervacije ADD CONSTRAINT Rezervacije_PK PRIMARY KEY ( ID_Rezervacija ) ;
ALTER TABLE Rezervacije ADD CONSTRAINT Rezervacije_Sifra_UN UNIQUE ( Sifra ) ;


CREATE TABLE Usluge
  (
    ID_Usluga    NUMBER NOT NULL ,
    Vrsta_Usluge VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE Usluge ADD CONSTRAINT Usluge_PK PRIMARY KEY ( ID_Usluga ) ;


CREATE TABLE Vezovi
  (
    ID_Vez           NUMBER NOT NULL ,
    Redni_Broj       VARCHAR2 (4) NOT NULL ,
    Marine_ID_Marina NUMBER NOT NULL
  ) ;
ALTER TABLE Vezovi ADD CONSTRAINT Vezovi_PK PRIMARY KEY ( ID_Vez ) ;


ALTER TABLE Brod_Vez ADD CONSTRAINT Brod_Vez_Brodovi_FK FOREIGN KEY ( Brodovi_ID_Brod ) REFERENCES Brodovi ( ID_Brod ) ;

ALTER TABLE Brod_Vez ADD CONSTRAINT Brod_Vez_Vezovi_FK FOREIGN KEY ( Vezovi_ID_Vez ) REFERENCES Vezovi ( ID_Vez ) ;

ALTER TABLE Brodovi ADD CONSTRAINT Brodovi_Charteri_FK FOREIGN KEY ( Charteri_ID_Charter ) REFERENCES Charteri ( ID_Charter ) ;

ALTER TABLE Brodovi ADD CONSTRAINT Brodovi_Modeli_FK FOREIGN KEY ( Modeli_ID_Model ) REFERENCES Modeli ( ID_Model ) ;

ALTER TABLE Charter_Vez ADD CONSTRAINT Charter_Vez_Charteri_FK FOREIGN KEY ( Charteri_ID_Charter ) REFERENCES Charteri ( ID_Charter ) ;

ALTER TABLE Charter_Vez ADD CONSTRAINT Charter_Vez_Vezovi_FK FOREIGN KEY ( Vezovi_ID_Vez ) REFERENCES Vezovi ( ID_Vez ) ;

ALTER TABLE Klijenti ADD CONSTRAINT Klijenti_Drzave_FK FOREIGN KEY ( Drzave_ID_Drzava ) REFERENCES Drzave ( ID_Drzava ) ;

ALTER TABLE Marine ADD CONSTRAINT Marine_Mjesta_FK FOREIGN KEY ( Mjesta_ID_Mjesto ) REFERENCES Mjesta ( ID_Mjesto ) ;

ALTER TABLE Mjesta ADD CONSTRAINT Mjesta_Drzave_FK FOREIGN KEY ( Drzave_ID_Drzava ) REFERENCES Drzave ( ID_Drzava ) ;

ALTER TABLE Modeli ADD CONSTRAINT Modeli_Marke_FK FOREIGN KEY ( Marke_ID_Marka ) REFERENCES Marke ( ID_Marka ) ;

ALTER TABLE Osoblje ADD CONSTRAINT Osoblje_Charteri_FK FOREIGN KEY ( Charteri_ID_Charter ) REFERENCES Charteri ( ID_Charter ) ;

ALTER TABLE Osoblje ADD CONSTRAINT Osoblje_Poslovi_FK FOREIGN KEY ( Poslovi_ID_Posao ) REFERENCES Poslovi ( ID_Posao ) ;

ALTER TABLE Rezervacije ADD CONSTRAINT Rezervacije_Brodovi_FK FOREIGN KEY ( Brodovi_ID_Brod ) REFERENCES Brodovi ( ID_Brod ) ;

ALTER TABLE Rezervacije ADD CONSTRAINT Rezervacije_Klijenti_FK FOREIGN KEY ( Klijenti_ID_Klijent ) REFERENCES Klijenti ( ID_Klijent ) ;

ALTER TABLE Rezervacije ADD CONSTRAINT Rezervacije_Osoblje_FK FOREIGN KEY ( Osoblje_ID_Osoblje ) REFERENCES Osoblje ( ID_Osoblje ) ;

ALTER TABLE Rezervacije ADD CONSTRAINT Rezervacije_Usluge_FK FOREIGN KEY ( Usluge_ID_Usluga ) REFERENCES Usluge ( ID_Usluga ) ;

ALTER TABLE Vezovi ADD CONSTRAINT Vezovi_Marine_FK FOREIGN KEY ( Marine_ID_Marina ) REFERENCES Marine ( ID_Marina ) ;

CREATE SEQUENCE BROD_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER BROD_TRG BEFORE
  INSERT ON Brodovi FOR EACH ROW WHEN (NEW.ID_Brod IS NULL) BEGIN :NEW.ID_Brod := BROD_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE CHARTER_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER CHARTER_TRG BEFORE
  INSERT ON Charteri FOR EACH ROW WHEN (NEW.ID_Charter IS NULL) BEGIN :NEW.ID_Charter := CHARTER_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE DRZAVA_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER DRZAVA_TRG BEFORE
  INSERT ON Drzave FOR EACH ROW WHEN (NEW.ID_Drzava IS NULL) BEGIN :NEW.ID_Drzava := DRZAVA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE KLIJENT_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER KLIJENT_TRG BEFORE
  INSERT ON Klijenti FOR EACH ROW WHEN (NEW.ID_Klijent IS NULL) BEGIN :NEW.ID_Klijent := KLIJENT_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MARINA_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MARINA_TRG BEFORE
  INSERT ON Marine FOR EACH ROW WHEN (NEW.ID_Marina IS NULL) BEGIN :NEW.ID_Marina := MARINA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MARKA_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MARKA_TRG BEFORE
  INSERT ON Marke FOR EACH ROW WHEN (NEW.ID_Marka IS NULL) BEGIN :NEW.ID_Marka := MARKA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MJESTO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MJESTO_TRG BEFORE
  INSERT ON Mjesta FOR EACH ROW WHEN (NEW.ID_Mjesto IS NULL) BEGIN :NEW.ID_Mjesto := MJESTO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE MODEL_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER MODEL_TRG BEFORE
  INSERT ON Modeli FOR EACH ROW WHEN (NEW.ID_Model IS NULL) BEGIN :NEW.ID_Model := MODEL_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE OSOBLJE_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER OSOBLJE_TRG BEFORE
  INSERT ON Osoblje FOR EACH ROW WHEN (NEW.ID_Osoblje IS NULL) BEGIN :NEW.ID_Osoblje := OSOBLJE_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE POSAO_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER POSAO_TRG BEFORE
  INSERT ON Poslovi FOR EACH ROW WHEN (NEW.ID_Posao IS NULL) BEGIN :NEW.ID_Posao := POSAO_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE REZERVACIJA_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER REZERVACIJA_TRG BEFORE
  INSERT ON Rezervacije FOR EACH ROW WHEN (NEW.ID_Rezervacija IS NULL) BEGIN :NEW.ID_Rezervacija := REZERVACIJA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE USLUGA_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER USLUGA_TRG BEFORE
  INSERT ON Usluge FOR EACH ROW WHEN (NEW.ID_Usluga IS NULL) BEGIN :NEW.ID_Usluga := USLUGA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE VEZ_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER BEZ_TRG BEFORE
  INSERT ON Vezovi FOR EACH ROW WHEN (NEW.ID_Vez IS NULL) BEGIN :NEW.ID_Vez := VEZ_SEQ.NEXTVAL;
END;
/


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          13
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
-- CREATE SEQUENCE                         13
-- CREATE MATERIALIZED VIEW                 0
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
