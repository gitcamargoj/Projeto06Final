<%-- 
    Document   : consultas_agendadas
    Created on : Jun 23, 2018, 2:08:51 PM
    Author     : junior
--%>

<%@page import="br.com.fatecpg.dentist.Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/bootstrap_top.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas Agendadas - ACO</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("usuario") == null){%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <% }else {%>
            <% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
            <% if(!usuario.getPapel().equals("ADMIN") & !usuario.getPapel().equals("SECRETÁRIA") & !usuario.getPapel().equals("SECRETÁRIO")){%>
            <h2>Você não tem permissão para acessar este recurso</h2>
            <% }else {%>
            <%-- <% if(error != null){ %>
            <h3><%= error %></h3> --%>
            <% } %>
    
        <center>
            <br><h3>Consultas Agendadas</h3><br>
            <div class="table-responsive">
                
                <%if(session.getAttribute("usuario") != null){%>  
                
                <table class="table table-hover">
                    <caption>Lista de Consultas Agendadas</caption>
                    <thead class="thead-dark">
                            <tr>
                            <th scope="col" rowspan="2">Cliente</th>
                            <th scope="col" rowspan="2">Data</th>
                            <th scope="col" rowspan="2">Entrada</th>
                            <th scope="col" rowspan="2">Saída</th>
                            <th scope="col" rowspan="2">Profissional</th>
                            <th scope="col" rowspan="2">CRO</th>
                            <th scope="col" rowspan="2">Status</th>
                            <th scope="col" rowspan="2">Observação</th>
                            <th scope="col" rowspan="2">Valor da Consulta</th>
                        </tr>
                    </thead>
                    <% for(Consulta c: Consulta.getConsulta()){ %>
                        <tbody>
                            <tr>
                                <td><%= c.getNomeCliente() %></td>
                                <td><%= c.getDia() %></td>
                                <td><%= c.getHr_inicio() %></td>
                                <td><%= c.getHr_fim() %></td>
                                <td><%= c.getNomeDentista() %></td>
                                <td><%= c.getCroDentista() %></td>
                                <td><%= c.getStatus() %></td>
                                <td>
                                    <table class="table-bordered table-sm">
                                        <tr class="table-secondary">
                                        <td>
                                            <p><%= c.getObs() %></p>
                                        </td>
                                        </tr>
                                    </table>
                                </td>
                                <td><%= c.getPreco() %></td>
                            </tr>
                        </tbody>
                    <% } %>
                </table>
                
                <% } %>
                
            </div>
        </center>
        <% } %>
        
        <%@include file="../WEB-INF/jspf/bootstrap_bottom.jspf" %>
    </body>
</html>
