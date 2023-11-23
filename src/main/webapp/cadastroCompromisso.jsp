<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@page import="java.util.List"%>
<%@ page import="controllers.LocalController"%>
<%@ page import="models.Local"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar compromisso</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body class="bg-dark text-white">
	<div class="container">
		<%@ include file="./menu.jsp"%>

		<h1 class="text-center mt-5 mb-5">Cadastrar Compromissos</h1>
		<form action="recebeDadosLocal.jsp" method="POST">
			<div class="row mb-3">
				<div class="col">
					<label class="form-label" for="date">Data</label> <input
						type="date" class="form-control" id="data" name="data">
				</div>
				<div class="col">
					<label class="form-label" for="horaI">Horário de início</label> <input
						type="time" class="form-control" id="horaI" name="horaI">
				</div>
				<div class="col">
					<label class="form-label" for="tipo">Compromisso</label> <select
						class="form-select" id="floatingSelectGrid">
						<option selected>Tipo</option>
						<option value="1">Reunião</option>
						<option value="2">Atividade</option>
						<option value="3">Apresentação</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label class="form-label" for="tipo">Selecione o Contato</label> <select
						class="form-select " id="contato" name="contato">
						<%
						ContatoController contatoController = new ContatoController();
						List<Contato> contatos = contatoController.getContatos();
						for (Contato contato : contatos) {
						%>
						<option value='<%=contato.getId()%>'><%=contato.getNome()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="col">
					<label class="form-label" for="tipo">Selecione o Local</label> <select
						class="form-select" id="local" name="local">
						<%
						LocalController localController = new LocalController();
						List<Local> locais = localController.getLocais();
						for (Local local : locais) {
						%>
						<option value='<%=local.getId()%>'><%=local.getNome()%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>
			<div class="mt-5 d-flex justify-content-around">
				<button onclick="validaDados()" class="btn btn-outline-success">Enviar</button>
				<input type="reset" class="btn btn-outline-danger" />
			</div>

		</form>
	</div>
</body>
</html>