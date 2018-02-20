oGlobal.creaTablaAsientos = function(tabAsiento, prmPEvento, matriz) {
    if (!matriz || !Array.isArray(matriz))
        return;
    // Convierte la matriz en la tabla
    var cFila = [];
    cFila.push('<tbody>');
    for (var i = 0; i < matriz.length; i++) {
        var cCol = [];
        cFila.push('<tr>')
        for (var j = 0; j < matriz[i].length; j++) {
            if(i==0 && j==0){
                // La primera celda se usa para colocar la bajada a Excel
                cCol.push('<td><a href="php/view/eventoCsv.php?pEvento='+prmPEvento+'"><img src="img/microsoft_office_excel.png" alt="Excel CSV" height="42" width="38"></a></td>');
                 
                continue;
            }
            var celda = matriz[i][j];
            var tdClase = 'S_' + celda.fTpAsiento;
            // Si tiene fecha de creacion, es porque está ocupado
            if (celda.tCreacion)
                tdClase += ' ocupado';
            // Crea TD
            cCol.push('<td class="' + tdClase + '" >');
            if (celda.fTpAsiento < 'T') {
                // clsDivAsiento, se utiliza para después asociar un evento click sobre el DIV.
                // El valor de la celda se guarda como atributo 'dataCelda' dentro del DIV
                atob(btoa("aaaa"))
                cCol.push('<div class="clsDivAsiento" id="idAsiento_' + celda.pAsiento + '" dataCelda="' + btoa(Ext.JSON.encode(celda)) + '">');
                cCol.push(celda.cIdFila + ' ' + celda.cIdColumna);
                cCol.push('</div>');
            } else {
                // La celdas tipo >= 'T', no tienen asientos
                cCol.push('<div></div>');

            }
            cCol.push('</td>');
        }
        cFila.push(cCol.join(''));
        cFila.push('</tr>')
    }
    cFila.push('</tbody>');
    tabAsiento.setHTML(cFila.join(''));
    tabAsiento.show();
    // Se agrega un click a todos los asientos
    Ext.select(".clsDivAsiento").on("click", function(evento, elem, ob) {
        var aPos = evento.getXY();
        var celda = Ext.JSON.decode(atob(elem.getAttribute('dataCelda')));
        // Se copia la PK del Evento
        celda.pEvento = prmPEvento;
        if (Array.isArray(aPos) && aPos.length >= 2) {
            // Guarda la posición del evento para posicionar las ventanas flotantes
            celda.x = aPos[0];
            celda.y = aPos[1];
        }
        // Se toma solo la parte numérica que viene despues del Undercore
        oGlobal.listaAsientosWin(celda);
    })
}

oGlobal.listaAsientos = function(prmIdTabla, prmPEvento) {
    if (!prmIdTabla)
        prmIdTabla = 'idTablaListaAsientos';

    var tabAsiento = Ext.get(prmIdTabla);
    // tabAsiento.hide();
    Ext.Ajax.request({
        url: 'php/ajax/listaAsientos.php',
        params: {
            pEvento: prmPEvento
        },
        success: function(response) {
            var resp = Ext.JSON.decode(response.responseText);
            if (!resp.success) {
                Ext.Msg.alert('Error al cargar asientos', resp.message);
                return;
            }
            // Procesa la matriz recibida desde el servidor
            oGlobal.creaTablaAsientos(tabAsiento, prmPEvento, resp.matriz);
        }
    });
};