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
            <fieldset>
                <legend>Agendar Novas Consultas</legend>
                <form>
                    Nome: <input type="text" name="nome"/>
                    Papel: 
                    <select name="papel">
                        <option value="HR_INICIO">Começa as</option>
                        <option value="HR_FIM">Termina as</option>
                        <option value="STATUS">Secretária</option>
                        <option value="PRECO">Secretário</option>
                        <option value="OBS">Dentista</option>
                        <option value="CLIENTE">Cliente</option>
                        <option value="DENTISTA">Cliente</option>
                    </select>
                    Começa as <input type="text" name="login"/>
                    Termina as <input type="text" name="login"/>
                    Status <input type="text" name="login"/>
                    Preço <input type="text" name="login"/>
                    Observação <input type="text" name="login"/>
                    Cliente <input type="text" name="login"/>
                    Dentista <input type="password" name="senha"/>
                    <input type="submit" name="formNewUsuario" value="Adicionar"/>
                </form>
            </fieldset> <br>
            </center>
    
        <center>
            <div class="table-responsive">
                
                <%if(session.getAttribute("usuario") != null){%>  
                
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
                
                <% } %>
                
            </div>
        </center>
        <% } %>
        
        <%@include file="../WEB-INF/jspf/bootstrap_bottom.jspf" %>
    </body>
</html>
