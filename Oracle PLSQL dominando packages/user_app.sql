INSERT INTO user_dev.CLIENTE (ID, RAZAO_SOCIAL) VALUES (5, 'PADARIA DEF');
EXECUTE user_dev.INCLUIR_CLIENTE(5, 'Primeiro Cliente incluido por USER_APP', '23456',2, 100000);

select * from user_dev.CLIENTE;