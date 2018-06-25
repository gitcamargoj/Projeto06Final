
package br.com.fatecpg.dentist;

import java.util.ArrayList;

public class Usuario {
    
    private long id_usuario;
    private String papel;
    private String nome;
    private String telefone;
    private String login;
    private Long hashSenha;
    
    long fk_dentista;
    Long fk_cliente;

    public Usuario(long id_usuario, long fk_dentista) {
        this.id_usuario = id_usuario;
        this.fk_dentista = fk_dentista;
    }

    public Usuario(long id_usuario, Long fk_cliente) {
        this.id_usuario = id_usuario;
        this.fk_cliente = fk_cliente;
    }

    public long getFk_dentista() {
        return fk_dentista;
    }

    public void setFk_dentista(long fk_dentista) {
        this.fk_dentista = fk_dentista;
    }

    public long getFk_cliente() {
        return fk_cliente;
    }

    public void setFk_cliente(long fk_cliente) {
        this.fk_cliente = fk_cliente;
    }

    public Usuario(long id_usuario, String papel, String nome, String telefone, String login, Long hashSenha) {
        this.id_usuario = id_usuario;
        this.papel = papel;
        this.nome = nome;
        this.telefone = telefone;
        this.login = login;
        this.hashSenha = hashSenha;
    }
    
    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getPapel() {
        return papel;
    }

    public void setPapel(String papel) {
        this.papel = papel;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public Long getHashSenha() {
        return hashSenha;
    }

    public void setHashSenha(Long hashSenha) {
        this.hashSenha = hashSenha;
    }
    
    public static Usuario getUsuario(String login, String senha) throws Exception{
        String SQL = "SELECT * FROM tb_usuario WHERE login = ? AND hashSenha = ?";
        Object parameters[] = {login, senha.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Usuario u = new Usuario(
                    (long) row[0]
                    , (String) row[1]
                    , (String) row[2]
                    , (String) row[3]
                    , (String) row[4]
                    , (long) row[5]);
            return u;
        }
    }
    
    public static ArrayList<Usuario> getUsuarios() throws Exception{
        String SQL = "SELECT * FROM tb_usuario";
        ArrayList<Usuario> usuarios = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++){
            Object row[] = list.get(i);
            Usuario u = new Usuario(
                    (long) row[0]
                    , (String) row[1]
                    , (String) row[2]
                    , (String) row[3]
                    , (String) row[4]
                    , (long) row[5]);
            usuarios.add(u);
        }
        return usuarios;
    }
    
    public static ArrayList<Usuario> getDentistas() throws Exception{
        String SQL = "SELECT a.id_usuario, b.id_dentista FROM tb_usuario a, tb_dentista b WHERE a.id_usuario = b.id_dentista";
        ArrayList<Usuario> usuarios = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++){
            Object row[] = list.get(i);
            Usuario u = new Usuario(
                    (long) row[0]
                    , (long) row[1]);
            usuarios.add(u);
        }
        return usuarios;
    }
    
    public static ArrayList<Usuario> getClientes() throws Exception{
        String SQL = "SELECT a.id_usuario, b.id_cliente FROM tb_usuario a, tb_cliente b WHERE a.id_usuario = b.id_cliente";
        ArrayList<Usuario> usuarios = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++){
            Object row[] = list.get(i);
            Usuario u = new Usuario(
                    (long) row[0]
                    , (Long) row[1]);
            usuarios.add(u);
        }
        return usuarios;
    }
    
    public static void addUsuario(String papel, String nome,String telefone, String login, long hashSenha) throws Exception{
        String SQL = "INSERT INTO tb_usuario VALUES("
                + "default"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ")";
        Object parameters[] = {papel, nome,telefone, login, hashSenha};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeUsuario(long id) throws Exception{
        String SQL = "DELETE FROM tb_usuario WHERE id_usuario = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
    
}
