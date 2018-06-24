
package br.com.fatecpg.dentist;

public class Usuario {
    
    private long id_usuario;
    private String papel;
    private String nome;
    private String telefone;
    private String login;

    public Usuario(long id_usuario, String papel, String nome, String telefone, String login, Long hashSenha) {
        this.id_usuario = id_usuario;
        this.papel = papel;
        this.nome = nome;
        this.telefone = telefone;
        this.login = login;
        this.hashSenha = hashSenha;
    }
    private Long hashSenha;

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
    
}
