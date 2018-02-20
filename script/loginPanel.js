oGlobal.loginFormPanel = function(prmPaginaSiguiente) {
    return new Ext.form.Panel({
        url: 'php/ajax/login.php',
        labelWidth: 80,
        bodyStyle: "background-image:url('img/fondoLogin.jpg'); background-repeat: no-repeat; background-position: center; background-size: 100% 100%;",
        frame: false,
        defaultType: 'textfield',
        labelAlign: 'top',
        layout: 'absolute',
        items: [
            { text: 'Username:', xtype: 'label', style: 'color: #FFF; font-weight: bold; font-size: 14px', x: 90, y: 80 },
            { name: 'cUsuario', allowBlank: false, listeners: { specialkey: oGlobal.loginFormEnter }, style: 'font-size: 20px;', x: 85, y: 98, height: 28, width: 200 },
            { text: 'Password:', xtype: 'label', style: 'color: #FFF; font-weight: bold; font-size: 14px', x: 90, y: 136 },
            { name: 'cPassword', allowBlank: false, listeners: { specialkey: oGlobal.loginFormEnter }, style: 'font-size: 20px;', inputType: 'password', height: 28, width: 200, x: 85, y: 154 },
            // { boxLabel: 'Recuerde me', xtype: 'checkbox', name: 'login_remember_me', style: 'font-size: 14px; color: white', inputValue: 1, x: 160, y: 192 },
            {
                xtype: 'button',
                style: 'font-size: 14px; font-weight: bold; color: white;',
                text: 'Ingresar',
                width: 120,
                x: 190,
                y: 210,
                listeners: { click: oGlobal.loginFormSubmit }
            }
        ]
    });
};

oGlobal.loginFormSubmit = function(me, ev) {
    var form = me.up('form').getForm();

    if (!form.isValid())
        return;
    form.submit({
        success: function(form, action) {
            var resp = Ext.JSON.decode(action.response.responseText);
            if (!resp.success) {
                Ext.Msg.alert('Falló conexión', resp.message);
                return;
            }
            // Se carga asi misma, pero ahora la variables de sesión deberían estar definidas
            location = 'appPrincipal.php';
        },
        failure: function(form, action) {
            if (action.result)
                Ext.Msg.alert('Falló conexión', action.result.message);
            else
                Ext.Msg.alert('Falló conexión', 'Error inesperado');
        }
    });
}

/**
 * Detecta tecla enter en los campos Usuario y Password
 */
oGlobal.loginFormEnter = function(field, ev) {
    if (ev.getKey() == ev.ENTER) {
        ev.preventDefault();
        // Submit form
        oGlobal.loginFormSubmit(field, ev);
    }
};