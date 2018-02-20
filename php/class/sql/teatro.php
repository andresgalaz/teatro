<?php
include (ROOT.'class/sql.php');
class Teatro extends Sql {
    
    function getAsientos($prmPEvento, $prmFTpUsuario ){
        $cSql="SELECT a.pAsiento, a.fTpAsiento, a.nFila, a.nColumna, a.cIdFila, a.cIdColumna \n"
        ."          , ea.pEventoAsiento, ea.tCreacion, ea.cDescripcion, u.cUsuario \n"
        ."  FROM tAsiento a \n"
        ."       LEFT OUTER JOIN tEvento e  ON e.fTeatro = a.fTeatro \n"
        ."       LEFT OUTER JOIN tEventoAsiento ea ON ea.fAsiento = a.pAsiento \n"
        ."                                        AND ea.fEvento  = e.pEvento \n"
        ."       LEFT OUTER JOIN tUsuario u ON u.pUsuario = ea.fUsuario \n"
        ." WHERE a.fTeatro = 1 \n"
        ."   AND e.pEvento = $prmPEvento \n"
        // Los administradores pueden ver cualquier evento
        . ( $prmFTpUsuario == Config::TP_USR_ADMIN ? "" : " AND e.bAbierto = '1' \n" )
        ." ORDER BY nFila, nColumna \n";
        
        return parent::getFilas($cSql);
    }
}
?>