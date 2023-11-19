<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String nome = request.getParameter("nome");
	String email = request.getParameter("email");
	out.print(nome + " " + email);
	
	Contato ct = new Contato();
	ct.setNome(nome);
	ct.setEmail(email);
	
	ContatoController ctController = new ContatoController();
	if (ctController.salvar(ct)) {
		response.sendRedirect("./consultaContato.jsp");
	}
%>