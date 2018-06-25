<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    
    if(request.getParameter("formDeleteUsuario") != null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            Usuario.removeUsuario(id);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("formNewUsuario") !=null){
        String papel = request.getParameter("papel");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String login = request.getParameter("login");
        long hashSenha = request.getParameter("senha").hashCode();
        try {
            Usuario.addUsuario(papel, nome,telefone, login, hashSenha);
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
        <%if(session.getAttribute("usuario") == null){%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <% }else {%>
            <% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
            <% if(!usuario.getPapel().equals("ADMIN") & !usuario.getPapel().equals("SECRETÁRIA") & !usuario.getPapel().equals("SECRETÁRIO")){%>
            <h2>Você não tem permissão para acessar este recurso</h2>
            <% }else {%>
            <% if(error != null){ %>
            <h3><%= error %></h3>
            <% } %>
            <center>
            <fieldset>
                <legend>Cadastro de Novos Usuários</legend>
                <form>
                    Nome: <input type="text" name="nome"/>
                    Telefone: <input type="text" name="telefone">
                    Papel: 
                    <select name="papel">
                        <option value="ADMIN">ADMIN</option>
                        <option value="SECRETÁRIA">Secretária</option>
                        <option value="SECRETÁRIO">Secretário</option>
                        <option value="DENTISTA">Dentista</option>
                        <option value="CLIENTE">Cliente</option>
                    </select>
                    Usuário: <input type="text" name="login"/>
                    Senha: <input type="password" name="senha"/>
                    <input type="submit" name="formNewUsuario" value="Adicionar"/>
                </form>
            </fieldset> <br>
            </center>
            <center>
                <% if(usuario.getPapel().equals("SECRETÁRIA") || usuario.getPapel().equals("SECRETÁRIO") ||usuario.getPapel().equals("ADMIN")) { %>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <caption>Lista de Usuários do Sistema</caption>
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Papel</th>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Telefone</th>
                                    <th scope="col">Login</th>
                                </tr>
                            </thead>
                            <% for(Usuario u: Usuario.getUsuarios()){ %>
                            <tbody>
                                <tr>
                                    <td><%= u.getId_usuario() %></td>
                                    <td><%= u.getPapel() %></td>
                                    <td><%= u.getNome() %></td>
                                    <td><%= u.getTelefone() %></td>
                                    <td><%= u.getLogin() %></td>
                                    <% if (usuario.getPapel().equals("ADMIN")) { %> 
                                    <td>
                                       <form>
                                           <input type="hidden" name="id" value="<%= u.getId_usuario() %>"/>
                                           <input type="submit" name="formDeleteUsuario" value="Remover"/>
                                       </form>
                                    </td>
                                    <td>
                                       <form>
                                           <input type="hidden" name="id" value="<%= u.getId_usuario() %>"/>
                                           <input type="submit" name="formAddUsuario" value="Alterar"/>
                                       </form>
                                    </td>
                                    <% } %>
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