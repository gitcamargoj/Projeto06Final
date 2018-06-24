package br.com.fatecpg.dentist;

import java.util.ArrayList;
import java.util.Date;

public class Consulta {

    public Consulta(long id_consulta, Date hr_inicio, Date hr_fim, String status, double preco, String obs, long id_dentista, long id_cliente) {
        this.id_consulta = id_consulta;
        this.hr_inicio = hr_inicio;
        this.hr_fim = hr_fim;
        this.status = status;
        this.preco = preco;
        this.obs = obs;
        this.id_dentista = id_dentista;
        this.id_cliente = id_cliente;
    }
    
    private long id_consulta;
    private Date hr_inicio;
    private Date hr_fim;
    private String status;
    private double preco;
    private String obs;
    private long id_dentista;
    private long id_cliente;

    public long getId_consulta() {
        return id_consulta;
    }

    public void setId_consulta(long id_consulta) {
        this.id_consulta = id_consulta;
    }

    public Date getHr_inicio() {
        return hr_inicio;
    }

    public void setHr_inicio(Date hr_inicio) {
        this.hr_inicio = hr_inicio;
    }

    public Date getHr_fim() {
        return hr_fim;
    }

    public void setHr_fim(Date hr_fim) {
        this.hr_fim = hr_fim;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public long getId_dentista() {
        return id_dentista;
    }

    public void setId_dentista(long id_dentista) {
        this.id_dentista = id_dentista;
    }

    public long getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(long id_cliente) {
        this.id_cliente = id_cliente;
    }
    
}
