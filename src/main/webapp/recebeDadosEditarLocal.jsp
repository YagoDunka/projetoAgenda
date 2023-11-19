<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String id = request.getParameter("id");
	String nome = request.getParameter("nome");
	String rua = request.getParameter("rua");
	String numero = request.getParameter("numero");
	String bairro = request.getParameter("bairro");
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	String cep = request.getParameter("cep");
	
	Local ct = new Local(Integer.parseInt(id), nome, rua, Integer.parseInt(numero), bairro, cidade, estado,
			Integer.parseInt(cep));
	
	LocalController lcController = new LocalController();
	if (lcController.alterar(ct)) {
		response.sendRedirect("./consultaLocal.jsp");
	}
	
	if (lcController.excluir(ct)) {
		response.sendRedirect("./consultaLocal.jsp");
	}
%>