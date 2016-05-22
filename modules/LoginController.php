<?php
require_once('../libs/Login.php');

class LoginController {
    private $login;

    public function __construct() {
        $this->login = new Login();
    }

    public function getData() {
        $data = $this->login->getData($_POST["inputId"], $_POST["inputTipodcto"], $_POST["inputNumdcto"]);
        return $data;
    }

    public function validate() {
        if ($this->getData()) {
            header("Location: ../views/indexEstudiante.phtml");
        }
        else {
            echo 'No se pudo iniciar sesion';
        }
    }
}

$login = new LoginController();
$login->validate();