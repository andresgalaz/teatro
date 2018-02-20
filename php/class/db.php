<?php
class DB {
    private $idConexion;
    private $DB_USUARIO  = Config::DB_USUARIO;
    private $DB_PASSWORD = Config::DB_PASSWORD;
    private $DB_BASE     = Config::DB_BASE;
    private $DB_HOST     = Config::DB_HOST;
    private $DB_PORT     = Config::DB_PORT;
    
    function __construct($host=null, $port=null, $base=null, $usuario=null , $password=null){
        if( is_null($host    )) $host     = Config::DB_HOST;
        if( is_null($port    )) $port     = Config::DB_PORT;
        if( is_null($base    )) $base     = Config::DB_BASE;
        if( is_null($usuario )) $usuario  = Config::DB_USUARIO;
        if( is_null($password)) $password = Config::DB_PASSWORD;
        
        $this->DB_USUARIO  = $usuario;
        $this->DB_PASSWORD = $password;
        $this->DB_BASE     = $base;
        $this->DB_HOST     = $host;
        $this->DB_PORT     = $port;
        $this->conecta();
    }
    
    private function conecta(){
        $this->idConexion = mysqli_init();
        if (!$this->idConexion) {
            die('Falló msql_init');
        }
        if (!$this->idConexion->options(MYSQLI_INIT_COMMAND, 'SET AUTOCOMMIT = 0')) {
            die('Falló la configuración de MYSQLI_INIT_COMMAND');
        }
        if (!$this->idConexion->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5)) {
            die('Falló la configuración de MYSQLI_OPT_CONNECT_TIMEOUT');
        }        
        if( $this->idConexion->real_connect($this->DB_HOST, $this->DB_USUARIO, $this->DB_PASSWORD, $this->DB_BASE, $this->DB_PORT)){
            $this->idConexion->set_charset("utf8");
            return true;
        }
        return false;
    }

    function commit(){
        $this->idConexion->commit();
    }
    
    function close(){
        $this->idConexion->close();
    }

    function getConexion(){
        return $this->idConexion;
    }
    
}
?>