    const mysql = require('mysql2');

    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'phpmyadmin',
      password: 'aluno',
      database: 'CARROS'
    });

    connection.connect();

    const queryString = "SELECT * FROM CARROS WHERE CÓDIGO = 3";

    connection.query(queryString, (error, results, fields) => {
      if (error) throw error;
      console.log('Resultado da consulta:');
      console.log(results);
    });

    connection.end



/////////////////////////////////////////////////////////////////////

const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'CARROS'
});

connection.connect();

const createProcedureQuery = `
  CREATE PROCEDURE ConsultarCarro3()
  BEGIN
    SELECT * FROM CARROS WHERE CÓDIGO = 3;
  END`;

connection.query(createProcedureQuery, (error, results, fields) => {
  if (error) throw error;
  console.log('Stored procedure criada com sucesso!');
});

connection.end();
