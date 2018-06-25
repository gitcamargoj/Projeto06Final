package br.com.fatecpg.dentist;

import java.util.ArrayList;

public class Dentista {
    
    private long id_dentista;

    public Dentista(long id_dentista, String cro, long id_usuario) {
        this.id_dentista = id_dentista;
        this.cro = cro;
        this.id_usuario = id_usuario;
    }
    private String cro;
    private long id_usuario;

    public long getId_dentista() {
        return id_dentista;
    }

    public void setId_dentista(long id_dentista) {
        this.id_dentista = id_dentista;
    }

    public String getCro() {
        return cro;
    }

    public void setCro(String cro) {
        this.cro = cro;
    }

    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public static Dentista getDentista(String login, String senha) throws Exception{
        String SQL = "SELECT * FROM tb_usuario a inner join tb_dentista b on a.id_usuario = b.id_usuario  WHERE login = ? AND hashSenha = ?";
        Object parameters[] = {login, senha.hashCode()};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Dentista u = new Dentista(
                    (long) row[0]
                    , (String) row[1]
                    , (long) row[2]);
            return u;
        }
    }
    
    public static ArrayList<Dentista> getDentistas() throws Exception{
        String SQL = "SELECT * FROM tb_usuario a inner join tb_dentista b on a.id_usuario = b.id_usuario";
        ArrayList<Dentista> dentistas = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++){
            Object row[] = list.get(i);
            Dentista u = new Dentista(
                    (long) row[0]
                    , (String) row[1]
                    , (long) row[2]);
            dentistas.add(u);
        }
        return dentistas;
    }
    public static void addDentista(String papel, String nome,String telefone, String login, long hashSenha) throws Exception{
        String SQL = "INSERT INTO tb_dentista VALUES("
                + "default"
                + ", ?"
                + ", ?"
                + ")";
        Object parameters[] = {papel, nome,telefone, login, hashSenha};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    public static void removeDentista(long id) throws Exception{
        String SQL = "DELETE FROM tb_dentista WHERE id_dentista = ?";
        Object parameters[] = {id};
        DatabaseConnector.execute(SQL, parameters);
    }
    
    
}

