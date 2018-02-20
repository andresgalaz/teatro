<?php
class Sql {
    private $idConexion;
    
    function __construct($idCnx){
        $this->idConexion = $idCnx;
    }
    
    function getFilas($cSql){
        $res=$this->idConexion->query($cSql);
        /*
        if($res===false)
        return $res;
        */
        $filas = array();
        while($fila=$res->fetch_assoc()){
            array_push($filas, $fila);
        }
        $res->close();
        return $filas;
    }
    
    function getFila($cSql){
        $res=$this->idConexion->query($cSql);
        /*
        if($res===false)
        return $res;
        */
        $fila = $res->fetch_assoc();
        if($res->fetch_assoc()){
            $res->close();
            error_log('Solo se esperaba una fila');
            die('Solo se esperaba una fila');
        }
        $res->close();
        return $fila;
    }
    
    function insert($tabla, $regData){
        $cSqlVal = '';
        $cSqlFld = '';
        $cTipos = '';
        $arrVals = array();
        foreach( $regData as $index => $key){
            $cSqlFld .= ',' . $index;
            $cSqlVal .= ',?';
            // Para el bind
            $cTipos .= 's'; // Fijo tipo String
            array_push($arrVals, $regData->$index );
        }
        $cSql= 'INSERT INTO '.$tabla.'('.substr($cSqlFld,1).') values ('.substr($cSqlVal,1).')';
        $params = array_merge( array( $cTipos ), array_map( function( &$item ) { return $item; }, $arrVals ));        
        $stmt= $this->idConexion->prepare($cSql);
        call_user_func_array(array( $stmt, 'bind_param' ),$this->refValues($params));
        try {
            if(!$stmt->execute()){
                error_log("insert\n".$cSql."\n".print_r($params,true)."\n".$stmt->error,1,'andres.galaz@gmail.com');
                return (object)array( "success" => false, "message" => $stmt->error);
            }
            return (object)array( "success" => true, "message" => "ok", "id" => $this->idConexion->insert_id );
        } finally {
            $stmt->close();
        }
    }
    
    function delete($tabla, $regWhere){
        $cSqlWhe = '';
        $cTipos = '';
        $arrVals = array();
        $bNoWhere = true;
        foreach( $regWhere as $index => $key){
            $bNoWhere = false;
            $cSqlWhe .= 'AND ' . $index. '=? ';
            // Para el bind
            $cTipos .= 's'; // Fijo tipo String
            array_push($arrVals, $regWhere->$index );
        }
        if( $bNoWhere === true){
            return (object)array( "success" => false, "message" => "No hay WHERE para eliminar: " +$tabla);
        }
        $cSql= 'DELETE FROM '.$tabla.' WHERE '.substr($cSqlWhe,3);
        $stmt= $this->idConexion->prepare($cSql);
        $params = array_merge(array( $cTipos ),array_map( function( &$item ) { return $item; }, $arrVals ));
        call_user_func_array(array( $stmt, 'bind_param' ),$this->refValues($params));
        if(!$stmt->execute()){
            error_log("delete\n".$cSql."\n".print_r($params,true)."\n".$stmt->error,1,'andres.galaz@gmail.com');
            return (object)array( "success" => false, "message" => $stmt->error);
        }
        return (object)array( "success" => true, "message" => "ok" );
    }
    
    function update($tabla, $regData, $regWhere){
        $cSqlSet = '';
        $cSqlWhe = '';
        $cTipos = '';
        $arrVals = array();
        // Arma SET con regData
        foreach( $regData as $index => $key){
            $cSqlSet .= ', ' . $index. '=? ';
            // Para el bind
            $cTipos .= 's'; // Fijo tipo String
            array_push($arrVals, $regData->$index );
        }
        // Arma WHERE con regWhere
        $bNoWhere = true;
        foreach( $regWhere as $index => $key){
            $bNoWhere = false;
            $cSqlWhe .= 'AND ' . $index. '=? ';
            // Para el bind
            $cTipos .= 's'; // Fijo tipo String
            array_push($arrVals, $regWhere->$index );
        }
        if( $bNoWhere === true ){
            return (object)array( "success" => false, "message" => "No hay WHERE para actualizar: " +$tabla);
        }
        $cSql= 'UPDATE '.$tabla.' SET '.substr($cSqlSet,1).' WHERE '.substr($cSqlWhe,3);
        $stmt= $this->idConexion->prepare($cSql);
        $params = array_merge(array( $cTipos ),array_map( function( &$item ) { return $item; }, $arrVals ));
        call_user_func_array(array( $stmt, 'bind_param' ),$this->refValues($params));
        if(!$stmt->execute()){
            error_log("update\n".$cSql."\n".print_r($params,true)."\n".$stmt->error,1,'andres.galaz@gmail.com');
            return (object)array( "success" => false, "message" => $stmt->error);
        }
        return (object)array( "success" => true, "message" => "ok" );
    }
  
    function refValues($arr){
        if (strnatcmp(phpversion(),'5.3') >= 0) {
            $refs = array();
            foreach($arr as $key => $value)
                $refs[$key] = &$arr[$key];
            return $refs;
        }
        return $arr;
    }
        
}
?>