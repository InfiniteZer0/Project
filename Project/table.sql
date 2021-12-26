CREATE TABLE TECHNIQUE (
	ID integer NOT NULL,
	ID_TECHNOLOGYNAME integer NOT NULL,
	GUARANTEE varchar NOT NULL,
	ID_CONSIGMENT integer NOT NULL,
	QUANTITY_IN_STOCK integer NOT NULL,
	RELEASE_DATE DATE NOT NULL,
	PRICE integer NOT NULL,
	CONSTRAINT TECHNIQUE_pk PRIMARY KEY (ID)
) WITH (
  OIDS=FALSE
);



CREATE TABLE SALE (
	ID integer NOT NULL,
	ID_TECHNIQUE integer NOT NULL,
	NUMBER integer NOT NULL,
	DISCOUNT integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE CONSIGNMENT (
	ID integer NOT NULL,
	ID_SUPPLIERS integer NOT NULL,
	DATE DATE NOT NULL,
	CONSTRAINT CONSIGNMENT_pk PRIMARY KEY (ID)
) WITH (
  OIDS=FALSE
);



CREATE TABLE SUPPLIERS (
	ID integer NOT NULL,
	TITLE varchar NOT NULL,
	CONSTRAINT SUPPLIERS_pk PRIMARY KEY (ID)
) WITH (
  OIDS=FALSE
);



CREATE TABLE ACCOUNTS (
	ID_SALE integer NOT NULL,
	ID_BUYERS integer NOT NULL,
	DISCOUNT integer NOT NULL,
	DATE DATE NOT NULL,
	SUM integer NOT NULL,
	CONSTRAINT ACCOUNTS_pk PRIMARY KEY (ID_SALE)
) WITH (
  OIDS=FALSE
);



CREATE TABLE BUYERS (
	ID integer NOT NULL,
	SURNAME varchar NOT NULL,
	NAME varchar NOT NULL,
	MIDDLENAME varchar NOT NULL,
	PASSPORT_ID integer NOT NULL,
	PASSPORT_SERIES integer NOT NULL,
	TELEPHONE varchar NOT NULL,
	CREDIT_ACCOUNT_NUMBER integer NOT NULL,
	CONSTRAINT BUYERS_pk PRIMARY KEY (ID)
) WITH (
  OIDS=FALSE
);



CREATE TABLE TECHNOLOGYNAME (
	ID integer NOT NULL,
	TECNOLOGY_NAME varchar NOT NULL,
	CONSTRAINT TECHNOLOGYNAME_pk PRIMARY KEY (ID)
) WITH (
  OIDS=FALSE
);



ALTER TABLE TECHNIQUE ADD CONSTRAINT TECHNIQUE_fk0 FOREIGN KEY (ID_TECHNOLOGYNAME) REFERENCES TECHNOLOGYNAME(ID);
ALTER TABLE TECHNIQUE ADD CONSTRAINT TECHNIQUE_fk1 FOREIGN KEY (ID_CONSIGMENT) REFERENCES CONSIGNMENT(ID);
ALTER TABLE SALE ADD CONSTRAINT SALE_fk0 FOREIGN KEY (ID) REFERENCES ACCOUNTS(ID_SALE);
ALTER TABLE SALE ADD CONSTRAINT SALE_fk1 FOREIGN KEY (ID_TECHNIQUE) REFERENCES TECHNIQUE(ID);
ALTER TABLE CONSIGNMENT ADD CONSTRAINT CONSIGNMENT_fk0 FOREIGN KEY (ID_SUPPLIERS) REFERENCES SUPPLIERS(ID);
ALTER TABLE ACCOUNTS ADD CONSTRAINT ACCOUNTS_fk0 FOREIGN KEY (ID_BUYERS) REFERENCES BUYERS(ID);








