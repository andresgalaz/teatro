oGlobal.eventoPanelGrilla = function() {
    Ext.define('Evento', {
        extend: 'Ext.data.Model',
        fields: [{ name: 'pEvento', type: 'int' },
            { name: 'tFecha', type: 'date', dateFormat: 'Y-m-d H:i:s' },
            { name: 'bAbierto', type: 'bool' }
        ]
    });

    var store = Ext.create('Ext.data.JsonStore', {
        autoDestroy: true,
        model: 'Evento',
        proxy: {
            url: 'php/ajax/listaEventos.php',
            type: 'ajax',
            reader: {
                type: 'json',
                root: 'record'
            }
        },
        remoteSort: false,
        sorters: [{
            property: 'tFecha',
            direction: 'DESC'
        }],
        pageSize: 150
    });

    var grid = Ext.create('Ext.grid.Panel', {
        store: store,
        columns: [{
            header: 'ID',
            dataIndex: 'pEvento',
            hidden: true
        }, {
            xtype: 'datecolumn',
            header: 'Función',
            width: 140,
            dataIndex: 'tFecha',
            renderer: Ext.util.Format.dateRenderer('d/m/Y g:i A')
        }, {
            xtype: 'booleancolumn',
            text: 'Abierto',
            flex: 1,
            trueText: 'Si',
            falseText: 'No',
            dataIndex: 'bAbierto'
        }],
        tbar: [{
            text: 'Nueva',
            handler: function(me, ev) {
                oGlobal.eventoPanelWin();
            }
        }, {
            itemId: 'idEventoPanelGrilla_admin',
            text: 'Admin.',
            disabled: true,
            handler: function(me, ev) {
                var celda = me.up('grid').getSelectionModel().getSelection()[0].getData();
                oGlobal.eventoPanelWin(celda);
            }
        }],
        listeners: {
            'selectionchange': function(view, records) {
                console.log('Admin:', !records.length);
                grid.down('#idEventoPanelGrilla_admin').setDisabled(!records.length);
            },
            'cellclick': function(tblView, tdHtml, columnIndex, reg, trHtml, rowIndex, evento, eOpts) {
                var evento = reg.getData();
                oGlobal.listaAsientos('idTablaListaAsientos', evento.pEvento);
            }
        }
    });

    // Retorna el panel Grilla
    return grid;
}