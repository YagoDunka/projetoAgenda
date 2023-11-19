<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

  String id = request.getParameter("id");
  String nome = request.getParameter("nome");
  String email = request.getParameter("email");
  
  Contato ct = new Contato(Integer.parseInt(id), nome, email);
   
  ContatoController ctController = new ContatoController();
  if(ctController.alterar(ct)){
	  response.sendRedirect("./consultaContato.jsp");
  } 
  
  if(ctController.excluir(ct)){
	  response.sendRedirect("./consultaContato.jsp");
  } 
 
%>