
package br.com.fatecpg.dentist;

import java.util.ArrayList;


public class Cliente {
    
    private long id_cliente;
    private long id_usuario;

    public Cliente(long id_cliente, long id_usuario) {
        this.id_cliente = id_cliente;
        this.id_usuario = id_usuario;
    }
    
    public static Cliente getTempCliente(long id_usuario) throws Exception {
        String SQL = "SELECT * FROM tb_cliente WHERE id_usuario = ?";
        Object parameters[] = {id_usuario};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Cliente c = new Cliente(
                    (long) row[0]
                    , (long) row[1]);
            return c;
        }
    }
    
    public static Cliente getCliente(String login, String senha) throws Exception{
        String SQL = "SELECT * FROM tb_usuario a inner join tb_cliente b on a.id_usuario = b.id_usuario WHERE login = ? AND hashSenha = ?";
        Object parameters[] = {login, senha.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Cliente c = new Cliente(
                    (long) row[0]
                    , (long) row[1]);
            return c;
        }
    }
    
    public static ArrayList<Cliente> getClientes() throws Exception {
        String SQL = "SELECT * FROM tb_usuario a inner join tb_cliente b on a.id_usuario = b.id_usuario";
        ArrayList<Cliente> clientes = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++){
            Object row[] = list.get(i);
            Cliente c = new Cliente(
                    (long) row[0]
                    , (long) row[1]);
            clientes.add(c);
        }
        return clientes;
    }
    
    public static void addCliente(String login, long hashSenha) throws Exception{
        String SQL = "INSERT INTO tb_dentista VALUES("
                + "default"
                + ", SELECT id_usuario FROM tb_usuario WHERE login = " + login + " AND hashSenha = " + hashSenha
                + ")";
        Object parameters[] = {};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeCliente(long id) throws Exception{
        String SQL = "DELETE FROM tb_cliente WHERE id_usuario = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }

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
