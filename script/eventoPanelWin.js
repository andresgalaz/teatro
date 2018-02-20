oGlobal.eventoWin = null;

/**
 * Recibe un parámetro del tipo objeto. Las propiedades son:
 * {
 * Los datos del evento
 *     - pEvento y tFecha
 * }
 */
oGlobal.eventoPanelWin = function(prm) {

    if (oGlobal.eventoWin == null) {
        // Crea ventana para mostrar los asientos
        oGlobal.eventoWin = new Ext.window.Window({
            title: 'Admnistra Fechas',
            modal: true,
            x: 100,
            y: 100,
            width: 300,
            height: 190,
            layout: 'fit',
            resizable: false,
            items: {
                url: 'php/ajax/evento.php',
                xtype: 'form',
                labelWidth: 40,
                labelAlign: 'top',
                bodyStyle: "padding: 10px;",
                fieldDefaults: {},
                items: [
                    { name: 'pEvento', xtype: 'hidden' },
                    { fieldLabel: 'Fecha', name: 'dFecha', format: 'd/m/Y', submitFormat: 'Y-m-d H:i:s', xtype: 'datefield' },
                    { fieldLabel: 'Hora', name: 'tHora', format: 'H:i', submitFormat: 'Y-m-d H:i:s', minValue: '09:00', increment: 30, xtype: 'timefield' },
                    { fieldLabel: 'Abierto', name: 'bAbierto', xtype: 'checkboxfield', readOnly: true },
                ],
                buttons: [{
                        text: 'Cancela',
                        xtype: 'button',
                        listeners: {
                            click: function() {
                                // Cierra la ventana y activa el refresco nuevamente
                                oGlobal.eventoWin.hide();
                            }
                        }
                    },
                    { text: 'Crea', listeners: { click: oGlobal.eventoPanelWinSubmit }, xtype: 'button' },
                    { text: 'Cierra', listeners: { click: oGlobal.eventoPanelWinSubmit }, xtype: 'button' },
                    { text: 'Re-abre', listeners: { click: oGlobal.eventoPanelWinSubmit }, xtype: 'button' }
                ]
            },
            closeAction: 'hide'
        });
    }

    var form = oGlobal.eventoWin.down("form").getForm();
    var boCrea = oGlobal.eventoWin.down('form').down('button[text="Crea"]');
    var boCierra = oGlobal.eventoWin.down('form').down('button[text="Cierra"]');
    var boReAbre = oGlobal.eventoWin.down('form').down('button[text="Re-abre"]');

    boCrea.hide();
    boCierra.hide();
    boReAbre.hide();
    if (prm) {
        // Si hay parámetro, está reservado y solo puede liberar un administrador
        if (oGlobal.usuario.fTpUsuario == oGlobal.TP_USR_ADMIN) {
            boCierra.show();
            boReAbre.show();
        }
        form.findField('pEvento').setValue(prm.pEvento);
        form.findField('dFecha').setValue(prm.tFecha);
        form.findField('tHora').setValue(prm.tFecha);
        form.findField('bAbierto').setValue(prm.bAbierto);
    } else {
        // Si hay parámetro, está reservado y solo puede liberar un administrador
        if (oGlobal.usuario.fTpUsuario == oGlobal.TP_USR_ADMIN) {
            boCrea.show();
        }
        form.findField('pEvento').setValue(-1);
        form.findField('bAbierto').setValue(true);
    }
    oGlobal.eventoWin.show();
    // Si está definida la posición, la ventana se reposiciona
    if (prm.x && prm.y)
        oGlobal.eventoWin.setPosition(prm.x, prm.y, true);
};

oGlobal.eventoPanelWinSubmit = function(me, ev) {
    var form = me.up('form').getForm();

    if (!form.isValid())
        return;
    // me.text: Contiene el texto del botón que fue presionado
    form.submit({
        params: { cTextoBoton: me.text },
        success: function(form, action) {
            var resp = Ext.JSON.decode(action.response.responseText);
            if (!resp.success)
                Ext.Msg.alert('Falló administración Evento', resp.message);
            else
                location.reload();
            oGlobal.eventoWin.hide();
        },
        failure: function(form, action) {
            if (action.result)
                Ext.Msg.alert('Falló administración Evento', action.result.message);
            else
                Ext.Msg.alert('Falló administración Evento', 'Error inesperado');
            oGlobal.eventoWin.hide();
        }
    });
}