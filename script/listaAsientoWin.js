oGlobal.winAsiento = null;

/**
 * Recibe un parámetro del tipo objeto. Las propiedades son:
 * {
 * x : 100 // <Numerico con la posición X de la ventana>
 * y : 200 // <Numérico con la posición Y de la ventana>
 * Mas todos los datos de la celda de asientos:
 *     - pAsiento, fTpAsiento, nFila, nColumna, cIdFila, cIdColumna
 * Si está reservado además recibe:
 *     - pEventoAsiento, tCreacion, cDescripcion y cUsuario
 * }
 */
oGlobal.listaAsientosWin = function(prm) {
    if (!prm)
        return false;

    if (oGlobal.winAsiento == null) {
        // Crea ventana para mostrar los asientos
        oGlobal.winAsiento = new Ext.window.Window({
            title: 'Reserva Asiento',
            width: 300,
            height: 300,
            layout: 'fit',
            resizable: false,
            items: {
                url: 'php/ajax/reserva.php',
                xtype: 'form',
                labelWidth: 40,
                labelAlign: 'top',
                defaultType: 'textfield',
                bodyStyle: "padding: 10px;",
                fieldDefaults: {},
                items: [
                    { name: 'pEventoAsiento', xtype: 'hidden' },
                    { name: 'pEvento', xtype: 'hidden' },
                    { fieldLabel: 'Asiento', name: 'cIdAsiento', readOnly: true },
                    { fieldLabel: 'Nº', name: 'pAsiento', readOnly: true },
                    { fieldLabel: 'Usuario', name: 'cUsuario', readOnly: true },
                    { fieldLabel: 'Fecha', name: 'tCreacion', readOnly: true },
                    { fieldLabel: 'Observaciones', name: 'cDescripcion', xtype: 'textarea' }
                ],
                buttons: [{
                        text: 'Cancela',
                        listeners: {
                            click: function() {
                                // Cierra la ventana y activa el refresco nuevamente
                                oGlobal.winAsiento.hide();
                            }
                        },
                        xtype: 'button'
                    },
                    { text: 'Libera', listeners: { click: oGlobal.listaAsientosWinSubmit }, xtype: 'button' },
                    { text: 'Reserva', listeners: { click: oGlobal.listaAsientosWinSubmit }, xtype: 'button' }
                ]
            },
            closeAction: 'hide'
        });
    }
    var form = oGlobal.winAsiento.down("form").getForm();
    var boLibera = oGlobal.winAsiento.down('form').down('button[text="Libera"]');
    var boReserva = oGlobal.winAsiento.down('form').down('button[text="Reserva"]');

    boLibera.hide();
    boReserva.hide();
    if (prm.tCreacion) {
        // Si hay tCreacion, está reservado y solo puede liberar un administrador
        if (oGlobal.usuario.fTpUsuario == oGlobal.TP_USR_ADMIN)
            boLibera.show();
    } else {
        // Si no hay tCreacion es porque está libre y se puede reservar
        boReserva.show();
    }

    form.findField('cIdAsiento').setValue(prm.cIdFila + ' ' + prm.cIdColumna);
    form.findField('pEventoAsiento').setValue(prm.pEventoAsiento);
    form.findField('pEvento').setValue(prm.pEvento);
    form.findField('pAsiento').setValue(prm.pAsiento);
    form.findField('cUsuario').setValue(prm.cUsuario);
    form.findField('tCreacion').setValue(prm.tCreacion);
    form.findField('cDescripcion').setValue(prm.cDescripcion);
    oGlobal.winAsiento.show();
    // Si está definida la posición, la ventana se reposiciona
    if (prm.x && prm.y)
        oGlobal.winAsiento.setPosition(prm.x, prm.y, true);
};

oGlobal.listaAsientosWinSubmit = function(me, ev) {
    var form = me.up('form').getForm();

    if (!form.isValid())
        return;
    // me.text: Contiene el texto del botón que fue presionado
    form.submit({
        params: { cTextoBoton: me.text },
        success: function(form, action) {
            var resp = Ext.JSON.decode(action.response.responseText);
            if (!resp.success)
                Ext.Msg.alert('Falló reserva', resp.message);
            oGlobal.listaAsientos('idTablaListaAsientos', form.findField('pEvento').getValue());
            oGlobal.winAsiento.hide();
        },
        failure: function(form, action) {
            if (action.result)
                Ext.Msg.alert('Falló reserva', action.result.message);
            else
                Ext.Msg.alert('Falló reserva', 'Error inesperado');
            oGlobal.listaAsientos('idTablaListaAsientos', form.findField('pEvento').getValue());
            oGlobal.winAsiento.hide();
        }
    });
}