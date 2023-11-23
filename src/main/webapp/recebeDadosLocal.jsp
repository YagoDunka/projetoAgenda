<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>

<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
try {
    String campox = "";
    
    String nome = request.getParameter("nome");
    String rua = request.getParameter("rua");
    String bairro = request.getParameter("bairro");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");

    // Tratamento para o número e CEP
    int numero = 0;
    int cep = 0;

    campox = "numero";
    String numeroStr = request.getParameter(campox);
    if (numeroStr != null && !numeroStr.trim().isEmpty()) {
        numero = Integer.parseInt(numeroStr.trim());
    }

    campox = "cep";
    String cepStr = request.getParameter(campox);
    if (cepStr != null && !cepStr.trim().isEmpty()) {
        cep = Integer.parseInt(cepStr.replaceAll("-", "").trim());
    }

    Local local = new Local();
    local.setNome(nome);
    local.setRua(rua);
    local.setCidade(cidade);
    local.setBairro(bairro);
    local.setEstado(estado);
    local.setNumero(numero);
    local.setCep(cep);

    LocalController localController = new LocalController();
    if (localController.salvar(local)) {
        response.sendRedirect("./consultaLocal.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().println("Ocorreu um erro ao processar o formulário.");
}
%>
