  GNU nano 4.8                                                                                                                       call.js                                                                                                                                    const mysql = require('mysql2');

    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'phpmyadmin',
      password: 'aluno',
      database: 'CARROS'
    });

    connection.connect();

    const queryString  = 'CALL ChamarNomeDOstored()';

    connection.query(queryString, (error, results, fields) => {
      if (error) throw error;
      console.log('Resultado da consulta:');
      console.log(results);
    });

    connection.end();
