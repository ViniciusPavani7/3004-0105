const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'CARROS'
});

DELIMITER //

CREATE PROCEDURE AdicionarCliente(
    IN NOME_CLIENTE VARCHAR(50),
    IN TELEFONE VARCHAR(50),
    IN SEXO VARCHAR(15),
    IN IDADE INT
)
BEGIN
    DECLARE novo_codigo INT;
    SELECT COALESCE(MAX(CÓDIGO), 0) + 1 INTO novo_codigo FROM CLIENTES;
    
    INSERT INTO CLIENTES (CÓDIGO, NOME_CLIENTE, TELEFONE, SEXO, IDADE) 
    VALUES (novo_codigo, nome_cliente, telefone, sexo, idade);
END //

DELIMITER ;
