<?php
require_once('config.php');

/**
 * Clase Connection
 * Encagarda de realizar la conexion a la base de datos
 */
class Connection {
    private $con;

    public function __construct() {
        $this->con = new mysqli(DB_HOST, DB_USER, DB_PWD, DB_NAME);

        if ($this->con->connect_errno) {
            die ("Fallo al conectar con MySQL: " . $this->con->connect_errno);
        }
    }

    public function __destruct() {
        if ($this->con->close()) {
            $this->con = null;
        }
    }

    public function getReturnQuery($sql) {
        $query = $this->con->query($sql);

        if ($this->con->error) {
            die("Fallo al realizar consulta: " . $this->con->error);
        }

        $num_rows = $this->getNumRows($query);

        for ($i = 0; $i < $num_rows; $i++) {
            $query->fetch_array(MYSQLI_ASSOC);
        }

        return $query;
    }

    public function getSimpleQuery($sqly) {
        $this->con->query($sqly);

        if ($this->con->error) {
            die("Fallo al realizar consulta: " . $this->con->error);
        }
    }

    public function getNumRows($sql) {
        return mysqli_num_rows($sql);
    }
}