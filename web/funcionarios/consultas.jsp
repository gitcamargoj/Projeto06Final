<%-- 
    Document   : consultas_agendadas
    Created on : Jun 23, 2018, 2:08:51 PM
    Author     : junior
--%>

<%@page import="br.com.fatecpg.dentist.Consulta"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;

    if(request.getParameter("formNewConsulta") !=null){
        
        String dia = (request.getParameter("dia"));
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
    }else if(request.getParameter("formRemoverConsulta") != null){
        
        Long id_consulta = Long.parseLong(request.getParameter("apagarConsulta"));
        try {
            Consulta.removeConsulta(id_consulta);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
        }
    }else if(request.getParameter("formAlterarConsulta") != null){
        
        Long id_consulta = Long.parseLong(request.getParameter("alterarConsulta"));
        try {
            Consulta.removeConsulta(id_consulta);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
        }
    }else if(request.getParameter("formCancelarConsulta") != null){
        
        Long id_consulta = Long.parseLong(request.getParameter("cancelarConsulta"));
        try {
            Consulta.cancelarConsulta(id_consulta);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e) {
            error = e.getMessage();
        }
    }
%>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/bootstrap_top.jspf" %>
        <style type="text/css">
            .form-style-6{
                font: 95% Arial, Helvetica, sans-serif;
                max-width: 400px;
                margin: 10px auto;
                padding: 16px;
                background: #F7F7F7;
            }
            .form-style-6 h1{
                background: #43D1AF;
                padding: 20px 0;
                font-size: 140%;
                font-weight: 300;
                text-align: center;
                color: #fff;
                margin: -16px -16px 16px -16px;
            }
            .form-style-6 input[type="text"],
            .form-style-6 input[type="date"],
            .form-style-6 input[type="datetime"],
            .form-style-6 input[type="email"],
            .form-style-6 input[type="number"],
            .form-style-6 input[type="search"],
            .form-style-6 input[type="time"],
            .form-style-6 input[type="url"],
            .form-style-6 textarea,
            .form-style-6 select 
            {
                -webkit-transition: all 0.30s ease-in-out;
                -moz-transition: all 0.30s ease-in-out;
                -ms-transition: all 0.30s ease-in-out;
                -o-transition: all 0.30s ease-in-out;
                outline: none;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                width: 100%;
                background: #fff;
                margin-bottom: 4%;
                border: 1px solid #ccc;
                padding: 3%;
                color: #555;
                font: 95% Arial, Helvetica, sans-serif;
            }
            .form-style-6 input[type="text"]:focus,
            .form-style-6 input[type="date"]:focus,
            .form-style-6 input[type="datetime"]:focus,
            .form-style-6 input[type="email"]:focus,
            .form-style-6 input[type="number"]:focus,
            .form-style-6 input[type="search"]:focus,
            .form-style-6 input[type="time"]:focus,
            .form-style-6 input[type="url"]:focus,
            .form-style-6 textarea:focus,
            .form-style-6 select:focus
            {
                box-shadow: 0 0 5px #43D1AF;
                padding: 3%;
                border: 1px solid #43D1AF;
            }

            .form-style-6 input[type="submit"],
            .form-style-6 input[type="button"]{
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                width: 100%;
                padding: 3%;
                background: #43D1AF;
                border-bottom: 2px solid #30C29E;
                border-top-style: none;
                border-right-style: none;
                border-left-style: none;    
                color: #fff;
            }
            .form-style-6 input[type="submit"]:hover,
            .form-style-6 input[type="button"]:hover{
                background: #2EBC99;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas Agendadas - ACO</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <% if(session.getAttribute("usuario") == null) { %>
            
        <% }else {%>
        
            <% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
            
            <center><br><h3>Consultas Agendadas</h3><br></center>
            
            <% if(!usuario.getPapel().equals("CLIENTE")) { %>  
                
            <center>
                <button class="btn btn-primary btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Agendar uma nova consulta
                </button>
            </center>
            <div class="form-style-6 collapse" id="collapseExample">
                <h1>Agendamento de Consultas</h1>
                    <form>
                        Data da Consulta: <input type="date" name="dia" maxlength="4" size="4" value="" required/>
                        Horario Inicio: <input type="time" name="hr_inicio" maxlength="4" size="4" required/>
                        Horario Termino: <input type="time" name="hr_fim" maxlength="4" size="4" required/>
                        Valor em R$: <input type="text" name="preco" placeholder="150.45" required/>
                        Observações: <textarea rows="6" cols="20" name="obs" placeholder="Exemplo: alérgico a anestésicos."></textarea>
                        Cliente:
                            <select name="cliente">
                                <% for(Usuario clientes: Usuario.getClientes()) { %>

                                        <option value="<%= clientes.getFkCliente()%>"><%= clientes.getNome() %></option>

                                <% } %>
                            </select>
                        Dentista:
                            <select name="dentista">
                                <% for(Usuario dentistas: Usuario.getDentistas()) { %>

                                        <option value="<%= dentistas.getFkDentista()%>"><%= dentistas.getNome() %></option>

                                <% } %>
                            </select>
                        <input class="btn-default" type="submit" name="formNewConsulta" value="Adicionar"/>
                    </form>
            </div><hr>
            
            <% } %>
        <center>                
            <div class="table-responsive">
                
                 
                <% if (usuario.getPapel().equals("DENTISTA")) { %>
                        <table class="table table-hover">
                            <caption>Lista de Consultas Agendadas</caption>
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" rowspan="2">Cliente</th>
                                    <th scope="col" rowspan="2">Data</th>
                                    <th scope="col" rowspan="2">Entrada</th>
                                    <th scope="col" rowspan="2">Saída</th>
                                    <th scope="col" rowspan="2">Status</th>
                                    <th scope="col" rowspan="2">Observação</th>
                                    <th scope="col" rowspan="2"><center>Alterar</center></th>
                                    <th scope="col" rowspan="2"><center>Cancelar</center></th>
                                </tr>
                            </thead>
                            <% for(Consulta c: Consulta.getConsulta()){ %>
                            <% if(usuario.getNome().equals(c.getNomeDentista())) { %>
                                <tbody>
                                    <tr>
                                        <td><%= c.getNomeCliente() %></td>
                                        <td><%= c.getDia() %></td>
                                        <td><%= c.getHr_inicio() %></td>
                                        <td><%= c.getHr_fim() %></td>
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
                                        <input type="hidden" name="alterarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <input type="hidden" name="cancelarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <td><center><input type="submit" name="formAlterarConsulta" value="Alterar"/></center></td>
                                        <td><center><input type="submit" name="formCancelarConsulta" value="Cancelar"/></center></td>
                                    </tr>
                                </tbody>
                                <% } %>
                            <% } %>
                        </table>
                    <% }else if (usuario.getPapel().equals("SECRETÁRIA") 
                                    || usuario.getPapel().equals("SECRETÁRIO")) { %>
                        <table class="table table-hover">
                            <caption>Lista de Consultas Agendadas</caption>
                            <thead class="thead-dark">
                                    <tr>
                                    <th scope="col" rowspan="2">Cliente</th>
                                    <th scope="col" rowspan="2">Data</th>
                                    <th scope="col" rowspan="2">Entrada</th>
                                    <th scope="col" rowspan="2">Saída</th>
                                    <th scope="col" rowspan="2">Dentista</th>
                                    <th scope="col" rowspan="2">CRO</th>
                                    <th scope="col" rowspan="2">Status</th>
                                    <th scope="col" rowspan="2">Observação</th>
                                    <th scope="col" rowspan="2">Valor</th>
                                    <th scope="col" rowspan="2"><center>Alterar</center></th>
                                    <th scope="col" rowspan="2"><center>Cancelar</center></th>
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
                                        <td>R$ <%= c.getPreco() %></td>
                                        <input type="hidden" name="alterarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <input type="hidden" name="cancelarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <td><center><input type="submit" name="formAlterarConsulta" value="Alterar"/></center></td>
                                        <td><center><input type="submit" name="formCancelarConsulta" value="Cancelar"/></center></td>
                                    </tr>
                                </tbody>
                            <% } %>
                        </table>
                    <% }else if (usuario.getPapel().equals("ADMIN")) { %>
                    <form>
                        <table class="table table-hover">
                            <caption>Lista de Consultas Agendadas</caption>
                            <thead class="thead-dark">
                                    <tr>
                                    <th scope="col" rowspan="2">Cliente</th>
                                    <th scope="col" rowspan="2">Data</th>
                                    <th scope="col" rowspan="2">Entrada</th>
                                    <th scope="col" rowspan="2">Saída</th>
                                    <th scope="col" rowspan="2">Dentista</th>
                                    <th scope="col" rowspan="2">CRO</th>
                                    <th scope="col" rowspan="2">Status</th>
                                    <th scope="col" rowspan="2">Observação</th>
                                    <th scope="col" rowspan="2">Valor</th>
                                    <th scope="col" rowspan="2"><center>Alterar</center></th>
                                    <th scope="col" rowspan="2"><center>Cancelar</center></th>
                                    <th scope="col" rowspan="2"><center>Apagar</center></th>
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
                                        <td>R$ <%= c.getPreco() %></td>
                                        <input type="hidden" name="alterarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <input type="hidden" name="cancelarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <input type="hidden" name="apagarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <td><center><input type="submit" name="formAlterarConsulta" value="Alterar"/></center></td>
                                        <td><center><input type="submit" name="formCancelarConsulta" value="Cancelar"/></center></td>
                                        <td><center><input type="submit" name="formRemoverConsulta" value="Apagar"/></center></td>
                                    </tr>
                                </tbody>
                            <% } %>
                        </table>
                    </form>
                    <% }else if (usuario.getPapel().equals("CLIENTE")) { %>
                        <table class="table table-hover">
                            <caption>Lista de Consultas Agendadas</caption>
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" rowspan="2">Data</th>
                                    <th scope="col" rowspan="2">Entrada</th>
                                    <th scope="col" rowspan="2">Saída</th>
                                    <th scope="col" rowspan="2">Dentista</th>
                                    <th scope="col" rowspan="2">CRO</th>
                                    <th scope="col" rowspan="2">Status</th>
                                    <th scope="col" rowspan="2">Observação</th>
                                    <th scope="col" rowspan="2">Valor</th>
                                    <th scope="col" rowspan="2"><center>Cancelar</center></th>
                                </tr>
                            </thead>
                            <% for(Consulta c: Consulta.getConsulta()){ %>
                                <% if(usuario.getNome().equals(c.getNomeCliente())) { %>
                                <tbody>
                                    <tr>
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
                                        <td>R$ <%= c.getPreco() %></td>
                                        <input type="hidden" name="alterarConsulta" value="<%= c.getId_consulta() %>"/>
                                        <td><center><input type="submit" name="formCancelarConsulta" value="Cancelar"/></center></td>
                                    </tr>
                                </tbody>
                            <% } %>
                            <% } %>
                        </table>
                    <% } %>
                
                
            </div>
        </center>
        <% } %>
        
        <%@include file="../WEB-INF/jspf/bootstrap_bottom.jspf" %>
    </body>
</html>
