<?php
require_once('connection/Connection.php');

class EstudianteModel {
    private $con;

    public function __construct() {
        $this->con = new Connection();
    }

    public function listEstudiantes() {
        try {
            $query = $this->con->getReturnQuery("SELECT * FROM estudiante");
            return $query;
        }
        catch (Exception $ex) {
            echo "Hubo un error: " . $ex->getMessage();
        }
    }
}