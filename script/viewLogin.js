Ext.onReady(function() {
    Ext.create('Ext.container.Viewport', {
        layout: 'border',
        items: [{
            region: 'center',
            title: 'Ingreso de Usuario',
            items: oGlobal.loginFormPanel(),
            layout: 'fit',
        }]
    });
});