SELECT * FROM CLIENTE
ORDER BY ID;

EXECUTE atualizar_cli_seg_mercado(15,2);

create or replace NONEDITIONABLE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
(p_ID cliente.ID%type, p_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%TYPE)
IS
    e_CLIENTE_ID_INEXISTENTE exception;
BEGIN
    UPDATE CLIENTE SET SEGMERCADO_ID = p_SEGMERCADO_ID
    WHERE ID = p_ID;
    IF SQL%NOTFOUND THEN
        RAISE e_CLIENTE_ID_INEXISTENTE;
    END IF;
    COMMIT;

EXCEPTION 
    WHEN e_CLIENTE_ID_INEXISTENTE THEN
        RAISE_APPLICATION_ERROR(-20100, 'Cliente inexistente !!!');
END;