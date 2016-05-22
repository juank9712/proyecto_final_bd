<?php
require_once('connection/Connection.php');

class Login {
    private $con;

    public function __construct() {
        $this->con = new Connection();
    }

    public function getData($id, $tipodcto, $numdcto) {
        try {
            $sql = "SELECT *
                 FROM persona
                 WHERE id_persona = '" . $id . "'" .
                "AND per_tipodcto = '" . strtoupper($tipodcto) . "'" .
                "AND per_numdcto = '" . $numdcto . "';";

            return $this->con->getReturnQuery($sql);
        }
        catch (Exception $ex) {
            $ex->getMessage();
        }
    }
}