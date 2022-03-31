SELECT NOME,
(CASE WHEN TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') <= 1990 THEN 'Velho'
      WHEN TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') >= 1990 AND TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') <= 1995 THEN 'Jovens'
      WHEN TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') > 1995 THEN 'Crian�as'
      END) AS CATEGORIA_IDADE
      FROM TABELA_DE_CLIENTES;
      

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS
WHERE TO_CHAR(DATA_VENDA, 'YYYY') = '2016'
GROUP BY CPF
HAVING COUNT(*) > 2000;