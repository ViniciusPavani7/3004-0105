const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'CARROS'
});

connection.connect();

const queryString = "SELECT LOCAÇÕES.*, CLIENTES.NOME_CLIENTE, CLIENTES.TELEFONE FROM LOCAÇÕES JOIN CARROS ON LOCAÇÕES.CODCARRO = CARROS.CÓDIGO JOIN CLIENTES ON LOCAÇÕES.CODCLIENTE = CLIENTES.CÓDIGO WHERE CARROS.COMBUSTÍVEL IN ('Gasolina', 'Etanol')";

connection.query(queryString, (error, results, fields) => {
  if (error) throw error;
  console.log('Resultado da consulta:');
  console.log(results);
});

connection.end();


///////////////////////////////////////////////////////////////////

const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'CARROS'
});

connection.connect();

// Chamada da stored procedure
connection.query('CALL ConsultarLocacoesCombustivel()', (error, results, fields) => {
  if (error) throw error;
  console.log('Resultado da consulta:');
  console.log(results[0]); // O resultado será um array, com os dados no índice 0
});

connection.end();
