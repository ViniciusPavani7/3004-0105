const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'CARROS'
});

connection.connect();

const queryString = "SELECT * FROM CARROS WHERE ESTÁ_DISPONIVEL = 'SIM' AND CÓDIGO NOT IN ( SELECT CODCARRO FROM LOCAÇÕES) ";
connection.query(queryString, (error, results, fields) => {
  if (error) throw error;
  console.log('Resultado da consulta:');
  console.log(results);
  connection.end();
});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'CARROS'
});

connection.connect();

// Query para criar a stored procedure
const createProcedureQuery = `
  DELIMITER //
  CREATE PROCEDURE ConsultarCarrosDisponiveis()
  BEGIN
    SELECT * FROM CARROS 
    WHERE ESTÁ_DISPONIVEL = 'SIM' 
    AND CÓDIGO NOT IN (SELECT CODCARRO FROM LOCAÇÕES);
  END //
  DELIMITER ;
`;

// Executa a query para criar a stored procedure
connection.query(createProcedureQuery, (error, results, fields) => {
  if (error) throw error;
  console.log('Stored procedure criada com sucesso!');
  connection.end();
});


