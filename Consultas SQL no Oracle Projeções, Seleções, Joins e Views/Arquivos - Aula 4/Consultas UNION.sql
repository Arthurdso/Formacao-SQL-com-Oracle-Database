
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

SELECT DISTINCT BAIRRO AS BAIRRO_CLIENTE FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO AS BAIRRO_VENDEDOR FROM TABELA_DE_VENDEDORES;

SELECT DISTINCT BAIRRO AS BAIRRO, 'CLIENTE' AS TIPO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO AS BAIRRO, 'VENDEDOR' AS TIPO FROM TABELA_DE_VENDEDORES;
