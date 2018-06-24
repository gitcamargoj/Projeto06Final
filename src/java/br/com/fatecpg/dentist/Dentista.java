
package br.com.fatecpg.dentist;


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
    
}
