CREATE PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2)
IS
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO)
    VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
END;

execute incluir_segmercado(3, 'Farmaceuticos');

select * from segmercado;

-- ou 

begin
incluir_segmercado(4, 'industrial');
commit;
end;