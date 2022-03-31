CREATE TABLE SegMercado
(ID NUMBER(5), Descricao varchar2(100));

CREATE TABLE Cliente
(ID NUMBER(5), Razao_Social VARCHAR2(100),
CNPJ VARCHAR2(20), SegMercado_id NUMBER(5),
Data_Inclusao DATE, Faturamento_precisto Number(10,2),
Categoria VARCHAR2(20));

ALTER TABLE SEGMERCADO ADD CONSTRAINT SegMercado_id_pk
PRIMARY KEY (ID);

ALTER TABLE Cliente ADD CONSTRAINT Cliente_id_pk
PRIMARY KEY(ID);

ALTER TABLE Cliente add constraint cliente_segmercado_fk
foreign key (segMercado_id) REFERENCES segMercado (id);

