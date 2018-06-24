<%-- 
    Document   : consultas_agendadas
    Created on : Jun 23, 2018, 2:08:51 PM
    Author     : junior
--%>

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
        
        <center>
            <div class="table-responsive">
                <table class="table table-hover">
                    <caption>Lista de Consultas Agendadas</caption>
                    <thead class="thead-dark">
                            <tr>
                            <th scope="col" rowspan="2">Data</th>
                            <th scope="col" rowspan="2">Entrada</th>
                            <th scope="col" rowspan="2">Saída</th>
                            <th scope="col" rowspan="2">Profissional</th>
                            <th scope="col" rowspan="2">CRO</th>
                            <th scope="col" rowspan="2">Status</th>
                            <th scope="col" rowspan="2">Observação</th>
                        </tr>
                    </thead>
                    <% for(Usuario u: Usuario.getUsuarios()){ %>
                        <tbody>
                            <tr>
                                <td><%= u.getId_usuario() %></td>
                                <td><%= u.getPapel() %></td>
                                <td><%= u.getNome() %></td>
                                <td><%= u.getLogin() %></td>
                                <td><%= u.getLogin() %></td>
                                <td><%= u.getLogin() %></td>
                                <td>
                                    <table class="table-bordered table-sm">
                                        <tr class="table-secondary">
                                        <td>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br> Nam ultrices porttitor urna quis egestas. <br> Aenean mollis, libero quis consectetur mollis, neque nunc gravida orci, nec consectetur mauris diam sit amet metus. In porta libero turpis, sed porta libero laoreet auctor. </p>
                                        </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    <% } %>
                </table>
            </div>
        </center>
        
        <%@include file="../WEB-INF/jspf/bootstrap_bottom.jspf" %>
    </body>
</html>
