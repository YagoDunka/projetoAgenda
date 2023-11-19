<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String nome = request.getParameter("nome");
	int cep = request.getParameter("cep");
	String rua = request.getParameter("rua");
	int numero = request.getParameter("numero");
	String bairro = request.getParameter("bairro");
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	
	
	Local local = new Local();
	local.setNome(nome);
	local.setRua(rua);
	local.setCidade(cidade);
	local.setBairro(bairro);
	local.setCidade(cidade);
	local.setEstado(estado);
	local.setNumero(numero);
	local.setCep(cep);
	
	LocalController localController = new LocalController();
	if (localController.salvar(local)) {
		response.sendRedirect("./consultaLocal.jsp");
	}
%>