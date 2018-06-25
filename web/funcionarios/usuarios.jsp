<%@page import="br.com.fatecpg.dentist.Cliente"%>
<%@page import="br.com.fatecpg.dentist.Dentista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    
    if (request.getParameter("formNewDentista") != null){
        boolean usuarioOk = false;
        boolean dentistaOk = false;
        String cro = request.getParameter("cro");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String login = request.getParameter("login");
        long hashSenha = request.getParameter("senha").hashCode();
        try {
            Usuario.addUsuario("DENTISTA", nome, telefone, login, hashSenha);
            usuarioOk = true;
            Dentista.addDentista(cro, login, hashSenha);
            dentistaOk = true;
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
            if (usuarioOk == true && dentistaOk == false){
                Usuario.removeUsuario();
            }
        }
    }
    
    if(request.getParameter("formNewUsuario") !=null){
        boolean usuarioOk = false;
        boolean clienteOk = false;
        String papel = request.getParameter("papel");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String login = request.getParameter("login");
        long hashSenha = request.getParameter("senha").hashCode();
        try {
            Usuario.addUsuario(papel, nome,telefone, login, hashSenha);
            usuarioOk = true;
            if (papel == "CLIENTE"){
                Cliente.addCliente(login, hashSenha);
                clienteOk = true;
            }
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
            if(papel == "CLIENTE" && usuarioOk == true && clienteOk == false){
                Usuario.removeUsuario();
            }
        }
    }
    
    if (request.getParameter("formUpdateDentista") != null){
        boolean usuarioOk = false;
        boolean dentistaOk = false;
        long id_usuario = Long.parseLong(request.getParameter("id_usuario"));
        long id_dentista = Long.parseLong(request.getParameter("id_dentista"));
        String cro = request.getParameter("cro");
        String papel = request.getParameter("papel");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String login = request.getParameter("login");
        long hashSenha = request.getParameter("senha").hashCode();
        try {
            Usuario.alterUsuario(id_usuario, nome, telefone, login, hashSenha);
            usuarioOk = true;
            Dentista.alterDentista(id_dentista, cro, login, hashSenha);
            dentistaOk = true;
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
            if (usuarioOk == true && dentistaOk == false){
                Usuario.removeUsuario();
            }
        }
    }
    
    if (request.getParameter("formUpdateUsuario") != null){
        boolean usuarioOk = false;
        boolean dentistaOk = false;
        long id_usuario = Long.parseLong(request.getParameter("id_usuario"));
        String papel = request.getParameter("papel");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String login = request.getParameter("login");
        long hashSenha = request.getParameter("senha").hashCode();
        try {
            Usuario.alterUsuario(id_usuario, nome, telefone, login, hashSenha);
            usuarioOk = true;
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
        }
    }

    if (request.getParameter("formDeleteUsuario") != null){
        long id = Long.parseLong(request.getParameter("id"));
        String papel = request.getParameter("papel");
        String login = request.getParameter("login");
        long hashSenha = Long.parseLong(request.getParameter("hashSenha"));
        try {
            if (papel.equals("DENTISTA")){
                Dentista.removeDentista(id);
                Usuario.removeUsuario(id);
            } else if (papel.equals("CLIENTE")){
                Cliente.removeCliente(id);
                Usuario.removeUsuario(id);
            } else {
                Usuario.removeUsuario(id);
            }
        } catch (Exception e){
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
                <br><h3>Cadastro de usuários</h3><br>
                
                                <fieldset>
                <form>
                 Adicionar: &nbsp;<input type="submit" name="AddUsuario" value="DENTISTA"/>&nbsp; 
                 <input type="submit" name="AddUsuario" value="USUARIO"/>  
                </form>
                </fieldset><br>
                
                <% if (request.getParameter("AddUsuario") != null && request.getParameter("AddUsuario").equals("DENTISTA")){ %>
                <h4>Novo Dentista</h4>
                <fieldset>
                    <form>
                        <% if (request.getParameter("formAlterUsuario") != null && request.getParameter("papel").equals("DENTISTA")){ %>
                            <% long id = Long.parseLong(request.getParameter("id"));
                               Usuario u = Usuario.getTempUsuario(id);
                               Dentista d = Dentista.getTempDentista(id); %>
                            <tr>
                            CRO: <input type="text" name="cro" value="<%= d.getCro() %>"/>
                            Nome: <input type="text" name="nome" value="<%= u.getNome() %>"/>
                            Telefone: <input type="text" name="telefone" value="<%= u.getTelefone() %>">
                            Usuário: <input type="text" name="login" value="<%= u.getLogin() %>">
                            Senha: <input type="password" name="senha"/>
                            <input type="hidden" name="id_usuario" value="<%= u.getId_usuario() %>">
                            <input type="hidden" name="id_dentista" value="<%= d.getId_usuario() %>">
                            <input type="submit" name="formUpdateDentista" value="Alterar"/>
                            </tr>
                        <% } else { %>
                            <tr>
                            CRO: <input type="text" name="cro"/>
                            Nome: <input type="text" name="nome"/>
                            Telefone: <input type="text" name="telefone">
                            Usuário: <input type="text" name="login"/>
                            Senha: <input type="password" name="senha"/>
                            <input type="submit" name="formNewDentista" value="Adicionar"/>
                            </tr>
                        <% } %>
                    </form>
                </fieldset> <br>
                <% } %>
                
                <% if (request.getParameter("AddUsuario") != null && !request.getParameter("AddUsuario").equals("DENTISTA")){ %>
                <h4>Novo Usuário</h4>
                <fieldset>
                    <form>
                        <% if (request.getParameter("formAlterUsuario") != null && !request.getParameter("papel").equals("DENTISTA")){ %>
                            <% long id = Long.parseLong(request.getParameter("id"));
                               Usuario u = Usuario.getTempUsuario(id);
                               Cliente c = Cliente.getTempCliente(id); %>
                            <tr>
                            Papel: <%= u.getPapel() %>
                            Nome: <input type="text" name="nome" value="<%= u.getNome() %>"/>
                            Telefone: <input type="text" name="telefone" value="<%= u.getTelefone() %>">
                            Usuário: <input type="text" name="login" value="<%= u.getLogin() %>"/>
                            Senha: <input type="password" name="senha"/>
                            <input type="hidden" name="id_usuario" value="<%= u.getId_usuario() %>">
                            <input type="submit" name="formUpdateUsuario" value="Adicionar"/>
                            </tr>
                        <% } else { %>
                            <tr>
                            Papel:<select name="papel">
                                 <option value="ADMIN">ADMIN</option>
                                 <option value="SECRETÁRIA">Secretária</option>
                                 <option value="SECRETÁRIO">Secretário</option>
                                 <option value="CLIENTE">Cliente</option>
                            </select>
                            Nome: <input type="text" name="nome"/>
                            Telefone: <input type="text" name="telefone">
                            Usuário: <input type="text" name="login"/>
                            Senha: <input type="password" name="senha"/>
                            <input type="submit" name="formNewUsuario" value="Adicionar"/>
                            </tr>
                        <% } %>
                    </form>
                </fieldset> <br>
                <% } %>
                
                
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
                                           <input type="hidden" name="papel" value="<%= u.getPapel() %>">
                                           <input type="hidden" name="login" value="<%= u.getLogin() %>">
                                           <input type="hidden" name="hashSenha" value="<%= u.getHashSenha() %>">
                                           <input type="submit" name="formDeleteUsuario" value="Remover"/>
                                       </form>
                                    </td>
                                    <td>
                                       <form>
                                           <input type="hidden" name="id" value="<%= u.getId_usuario() %>"/>
                                           <input type="hidden" name="papel" value="<%= u.getPapel() %>">
                                           <input type="submit" name="formAlterUsuario" value="Alterar"/>
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
