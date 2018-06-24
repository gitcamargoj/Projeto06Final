
package br.com.fatecpg.dentist;

import java.util.ArrayList;


public class Cliente {

    public Cliente(long id_cliente, long id_usuario) {
        this.id_cliente = id_cliente;
        this.id_usuario = id_usuario;
    }
    
    private long id_cliente;
    private long id_usuario;

    public long getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(long id_cliente) {
        this.id_cliente = id_cliente;
    }

    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }
    
}
