<?php
require_once('config.php');

/**
 * Clase Connection
 * Encagarda de realizar la conexion a la base de datos
 */
class Connection {
    private $con;

    /** Constructor de la clase Connection */
    public function __construct() {
        $this->con = new mysqli(DB_HOST, DB_USER, DB_PWD, DB_NAME);

        if ($this->con->connect_errno) {
            die ("Fallo al conectar con MySQL: " . $this->con->connect_errno);
        }
    }

    /** Destructo de la clase Connection */
    public function __destruct() {
        if ($this->con->close())
            $this->con = null;

        //echo "Se ha cerrado la conexion";
    }

    /** Funcion para hacer un query */
    public function get_query($query) {
        $result = $this->con->query($query);

        if ($this->con->error) {
            die("Fallo al realizar consulta: " . $this->con->error);
        }
        else {
            return $result;
        }
    }
}