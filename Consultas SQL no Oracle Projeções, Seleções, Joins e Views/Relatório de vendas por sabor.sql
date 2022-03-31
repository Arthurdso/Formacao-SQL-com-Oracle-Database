--Relatório de vendas por sabor

SELECT
    tp.sabor,
    to_char(nf.data_venda, 'YYYY') AS ano,
    SUM(inf.quantidade)            AS quantidade_vendida
FROM
         itens_notas_fiscais inf
    INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
    INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
WHERE
    to_char(nf.data_venda, 'YYYY') = '2016'
GROUP BY
    tp.sabor,
    to_char(nf.data_venda, 'YYYY');

SELECT
    tp.sabor,
    to_char(nf.data_venda, 'YYYY') AS ano,
    SUM(inf.quantidade)            AS quantidade_vendida
FROM
         itens_notas_fiscais inf
    INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
    INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
WHERE
    to_char(nf.data_venda, 'YYYY') = '2016'
GROUP BY
    tp.sabor,
    to_char(nf.data_venda, 'YYYY')
ORDER BY
    SUM(inf.quantidade) DESC;

SELECT
    to_char(nf.data_venda, 'YYYY') AS ano,
    SUM(inf.quantidade)            AS quantidade_vendida
FROM
         itens_notas_fiscais inf
    INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
    INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
WHERE
    to_char(nf.data_venda, 'YYYY') = '2016'
GROUP BY
    to_char(nf.data_venda, 'YYYY')
ORDER BY
    SUM(inf.quantidade) DESC;

SELECT
    venda_sabor.sabor,
    venda_sabor.ano,
    venda_sabor.quantidade_vendida,
    total_venda.quantidade_vendida AS total,
    round((venda_sabor.quantidade_vendida / total_venda.quantidade_vendida) * 100, 2)
    || '%'                         AS participação
FROM
         (
        SELECT
            tp.sabor,
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade_vendida
        FROM
                 itens_notas_fiscais inf
            INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = '2016'
        GROUP BY
            tp.sabor,
            to_char(nf.data_venda, 'YYYY')
        ORDER BY
            SUM(inf.quantidade) DESC
    ) venda_sabor
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade_vendida
        FROM
                 itens_notas_fiscais inf
            INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = '2016'
        GROUP BY
            to_char(nf.data_venda, 'YYYY')
        ORDER BY
            SUM(inf.quantidade) DESC
    ) total_venda ON venda_sabor.ano = total_venda.ano;

SELECT
    venda_sabor.sabor,
    venda_sabor.ano,
    venda_sabor.quantidade_vendida,
    round((venda_sabor.quantidade_vendida / total_venda.quantidade_vendida) * 100, 2)
    || '%' AS participação
FROM
         (
        SELECT
            tp.sabor,
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade_vendida
        FROM
                 itens_notas_fiscais inf
            INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = '2016'
        GROUP BY
            tp.sabor,
            to_char(nf.data_venda, 'YYYY')
        ORDER BY
            SUM(inf.quantidade) DESC
    ) venda_sabor
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade_vendida
        FROM
                 itens_notas_fiscais inf
            INNER JOIN tabela_de_produtos tp ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais      nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = '2016'
        GROUP BY
            to_char(nf.data_venda, 'YYYY')
        ORDER BY
            SUM(inf.quantidade) DESC
    ) total_venda ON venda_sabor.ano = total_venda.ano;

SELECT
    venda_tamanho.tamanho,
    venda_tamanho.ano,
    venda_tamanho.quantidade,
    round((venda_tamanho.quantidade / venda_total.quantidade) * 100, 2) AS participacao
FROM
         (
        SELECT
            tp.tamanho,
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON nf.numero = inf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = 2016
        GROUP BY
            tp.tamanho,
            to_char(nf.data_venda, 'YYYY')
    ) venda_tamanho
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'YYYY') AS ano,
            SUM(inf.quantidade)            AS quantidade
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON nf.numero = inf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = 2016
        GROUP BY
            to_char(nf.data_venda, 'YYYY')
    ) venda_total ON venda_tamanho.ano = venda_total.ano
ORDER BY
    venda_tamanho.quantidade DESC;