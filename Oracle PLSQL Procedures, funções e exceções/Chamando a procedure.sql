create or replace NONEDITIONABLE PROCEDURE incluir_cliente
(p_ID in CLIENTE.ID%type, p_RAZAO_SOCIAL in CLIENTE.RAZAO_SOCIAL%type,
p_CNPJ in CLIENTE.CNPJ%type, p_SEGMERCADO_ID in CLIENTE.SEGMERCADO_ID%type,
p_FATURAMENTO_PREVISTO in CLIENTE.FATURAMENTO_PREVISTO%type)
IS 
    v_CATEGORIA CLIENTE.CATEGORIA%type;
    v_CNPJ CLIENTE.CNPJ%type := p_CNPJ;
BEGIN
    formata_cnpj(v_CNPJ);
    v_CATEGORIA := categoria_cliente (p_FATURAMENTO_PREVISTO);
    
    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO,
    FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES ( p_ID, p_RAZAO_SOCIAL, v_CNPJ, p_SEGMERCADO_ID, SYSDATE, p_FATURAMENTO_PREVISTO,
    v_CATEGORIA);
    COMMIT;
END;

SELECT * FROM CLIENTE;
delete from cliente;

execute incluir_cliente(2, 'SUPERMERCADO IJK','67890' ,1, 90000); 

SELECT * FROM CLIENTE;