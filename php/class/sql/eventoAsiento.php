<?php
include (ROOT.'class/sql.php');
class EventoAsiento extends Sql {
    
    function insert($reg){
        return parent::insert('tEventoAsiento',$reg);
    }
    
    function delete($pEventoAsiento){
        if(! $pEventoAsiento) {
            return (object)array( "success" => false, "message" => "Falta el identificador de la reserva");
        }
        return parent::delete('tEventoAsiento',(object)array( "pEventoAsiento" => $pEventoAsiento ));
    }

    function getReservas($prmPEvento ){
        $cSql="SELECT e.tFecha Fecha_Funcion, a.cIdFila Letra, a.cIdColumna Numero\n"
        ."          , ea.tCreacion Fecha_Reserva, ea.cDescripcion Descripcion\n"
        ."          , u.cUsuario Usuario\n"
        ."  FROM tAsiento a \n"
        ."       INNER JOIN tEvento e         ON e.fTeatro   = a.fTeatro \n"
        ."       INNER JOIN tEventoAsiento ea ON ea.fAsiento = a.pAsiento \n"
        ."                                   AND ea.fEvento  = e.pEvento \n"
        ."       INNER JOIN tUsuario u        ON u.pUsuario  = ea.fUsuario \n"
        ." WHERE a.fTeatro = 1 \n"
        ."   AND e.pEvento = $prmPEvento \n"
        ." ORDER BY cIdFila, cIdColumna \n";
        return parent::getFilas($cSql);
    }
    
}
?>