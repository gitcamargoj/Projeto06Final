<%-- 
    Document   : agendamento_de_consultas
    Created on : Jun 23, 2018, 2:08:26 PM
    Author     : junior
--%>

<%@page import="java.util.Date"%>
<%@page import="br.com.fatecpg.dentist.Consulta"%>
<%@page import="java.time.Instant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;

    if(request.getParameter("formNewConsulta") !=null){
        
        String dia = (request.getParameter("data"));
        String horaInicio = request.getParameter("hr_inicio");
        String horaFim = request.getParameter("hr_fim");

        Double preco = Double.parseDouble(request.getParameter("preco"));
        
        String observacao = request.getParameter("obs");
        long dentista = Long.parseLong(request.getParameter("dentista"));
        long cliente = Long.parseLong(request.getParameter("cliente"));
        try {
            Consulta.addConsulta(dia, horaInicio, horaFim, preco, observacao, dentista, cliente);
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
        <title>Agendamento de Consultas - ACO</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("usuario") == null){%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <% }else {%>
            <% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
            
            <% if(error != null){ %>
            <h3><%= error %></h3>
        <% } %>
        <center>                                
            <form>
                <fieldset>
                    Data da Consulta<br>
                    <input type="date" name="date" maxlength="4" size="4"/><br><br>
                </fieldset>

                <fieldset>
                    Horario<br>    
                    I
                    <input type="time" name="hr_inicio" maxlength="4" size="4"/>
                    F
                    <input type="time" name="hr_fim" maxlength="4" size="4"/><br>
                </fieldset>

                <fieldset>
                    <br>Preço<br>
                    <input type="text" name="preco"/><br>
                </fieldset>
                
                <fieldset>
                    <br>Observações<br>
                    <textarea rows="6" cols="20" name="obs">Observações...</textarea><br>
                </fieldset>
                
                <fieldset>
                    <br>Cliente
                    <select name="cliente">
                        <% for(Usuario clientes: Usuario.getClientes()) { %>
                        
                                <option value="<%= clientes.getFkCliente()%>"><%= clientes.getNome() %></option>
                            
                        <% } %>
                    </select>
                    Dentista
                    <select name="dentista">
                        <% for(Usuario dentistas: Usuario.getDentistas()) { %>

                                <option value="<%= dentistas.getFkDentista()%>"><%= dentistas.getNome() %></option>

                        <% } %>
                    </select> 
                    &nbsp;&nbsp;<input class="btn-default" type="submit" name="formNewConsulta" value="Adicionar"/>
                </fieldset>

                <fieldset>
                    
                </fieldset>
                    
                <fieldset>
                    
                </fieldset>
            </form>
        </center>
    <% } %>
        <%@include file="../WEB-INF/jspf/bootstrap_bottom.jspf" %>
    </body>
</html>
