Ext.onReady(function() {
    var eventos = oGlobal.eventoPanelGrilla();

    Ext.application({
        name: 'appVendeEntreadas',
        launch: function() {
            Ext.create('Ext.container.Viewport', {
                layout: 'border',
                autroScroll: true,
                items: [{
                    region: 'north',
                    frame: false,
                    border: false,
                    height: 38,
                    html: '<div class="clsDivNorth">Usuario: ' + oGlobal.usuario.cNombre + ' (' + oGlobal.usuario.cUsuario + ') </div>'
                }, {
                    // id: 'menuIzquierda',
                    region: 'west',
                    title: 'Fechas disponibles',
                    width: 250,
                    split: true,
                    collapsible: true,
                    floatable: false,
                    layout: {
                        type: 'vbox',
                        align: 'stretch',
                        pack: 'start',
                    },
                    items: [eventos],
                    buttons: [{
                        text: 'Salir',
                        xtype: 'button',
                        style: {
                            background: '#FF5566'
                        },
                        listeners: {
                            click: function() {
                                location.href = 'appSalir.php';
                            }
                        }
                    }]
                }, {
                    region: 'center',
                    autoScroll: true,
                    html: '<table id="idTablaListaAsientos" style="height:1000px;"><tr><td>Seleccione una fecha ...</td></tr></table>'
                }]
            });
        }
    });

    setTimeout(function() {
        console.log('Listando ...');
        eventos.getStore().load();
    }, 2000);
});