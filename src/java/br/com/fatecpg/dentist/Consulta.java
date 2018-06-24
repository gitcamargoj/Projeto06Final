package br.com.fatecpg.dentist;

import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Consulta {
    private long id_consulta;
    private Date dia;
    private Date hr_inicio;
    private Date hr_fim;
    private String status;
    private double preco;
    private String obs;
    private long id_dentista;
    private long id_cliente;

    public Consulta(long id_consulta, Date dia, Date hr_inicio, Date hr_fim, String status, double preco, String obs, long id_dentista, long id_cliente) {
        this.id_consulta = id_consulta;
        this.dia = dia;
        this.hr_inicio = hr_inicio;
        this.hr_fim = hr_fim;
        this.status = status;
        this.preco = preco;
        this.obs = obs;
        this.id_dentista = id_dentista;
        this.id_cliente = id_cliente;
    }
    
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

    public static ArrayList<Consulta> getConsulta() throws Exception{
        String SQL = "SELECT * FROM tb_consulta";
        ArrayList<Consulta> consultas = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for(int i = 0; i < list.size(); i++){
            Object row[] = list.get(i);
            Consulta c = new Consulta(
                    (long) row[0]
                    , (Date) row[1]
                    , (Date) row[2]
                    , (Date) row[3]
                    , (String) row[4]
                    , (double) row[5]
                    , (String) row[6]
                    , (long) row[7]
                    , (long) row[8]);
            consultas.add(c);
        }
        return consultas;
    }
    
    public static void addConsulta(String dia, String horaInicio, String horaFim, double preco, String observacao, Long dentista, Long cliente) throws Exception{
        String SQL = "INSERT INTO tb_consulta VALUES("
                + "default"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", default"
                + ", ?"
                + ", ?"
                + ", ?"
                + ", ?"
                + ")";
        Object parameters[] = {dia, horaInicio, horaFim, preco, observacao, dentista, cliente};
        DatabaseConnector.execute(SQL, parameters);
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }
    
}
