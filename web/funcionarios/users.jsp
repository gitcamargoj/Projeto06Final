<%-- 
    Document   : home
    Created on : Jun 16, 2018, 1:20:27 PM
    Author     : JOSEANTONIODECAMARGO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    
    if(request.getParameter("formDeleteUser") != null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            User.removeUser(id);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formNewUser") !=null){
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String login = request.getParameter("login");
        long passwordHash = request.getParameter("pass").hashCode();
        try {
            User.addUser(name, role, login, passwordHash);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
        }
    }
%>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/bootstrap_top.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuários - ACO</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("user") == null){%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <% }else {%>
            <% User user = (User) session.getAttribute("user"); %>
            <% if(!user.getRole().equals("ADMIN") & !user.getRole().equals("SECRETÁRIA") & !user.getRole().equals("SECRETÁRIO")){%>
            <h2>Você não tem permissão para acessar este recurso</h2>
            <% }else {%>
            <% if(error != null){ %>
            <h3><%= error %></h3>
            <% } %>
            <center>
            <fieldset>
                <legend>Cadastro de Novos Usuários</legend>
                <form>
                    Nome: <input type="text" name="name"/>
                    Papel: 
                    <select name="role">
                        <option value="ADMIN">ADMIN</option>
                        <option value="SECRETÁRIA">Secretária</option>
                        <option value="SECRETÁRIO">Secretário</option>
                        <option value="DENTISTA">Dentista</option>
                        <option value="CLIENTE">Cliente</option>
                    </select>
                    Usuário: <input type="text" name="login"/>
                    Senha: <input type="password" name="pass"/>
                    <input type="submit" name="formNewUser" value="Adicionar"/>
                </form>
            </fieldset> <br>
            </center>
            <center>
                <% if(user.getRole().equals("SECRETÁRIA") | user.getRole().equals("SECRETÁRIO")) { %>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <caption>Lista de Usuários do Sistema</caption>
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Papel</th>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Login</th>
                                </tr>
                            </thead>
                            <% for(User u: User.getUsers()){ %>
                            <tbody>
                                <tr>
                                    <td><%= u.getId() %></td>
                                    <td><%= u.getRole() %></td>
                                    <td><%= u.getName() %></td>
                                    <td><%= u.getLogin() %></td>
                                </tr>
                            </tbody>
                            <% } %>
                        </table>
                    </div>
                    <% } else if(user.getRole().equals("ADMIN")) { %>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <caption>Lista de Usuários do Sistema</caption>
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Papel</th>
                                        <th scope="col">Nome</th>
                                        <th scope="col">Login</th>
                                        <th scope="col">Remover</th>
                                    </tr>
                                </thead>
                                <% for(User u: User.getUsers()){ %>
                                <tbody>
                                    <tr>
                                        <td><%= u.getId() %></td>
                                        <td><%= u.getRole() %></td>
                                        <td><%= u.getName() %></td>
                                        <td><%= u.getLogin() %></td>
                                        <td>
                                            <form>
                                                <input type="hidden" name="id" value="<%= u.getId() %>"/>
                                                <input type="submit" name="formDeleteUser" value="Remover"/>
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                                <% } %>
                            </table>
                        </div>
                    <% } %>
            </center>
            
            <% } %>
        <% } %>
        
        <%@include file="../WEB-INF/jspf/bootstrap_bottom.jspf" %>
    </body>
</html>
