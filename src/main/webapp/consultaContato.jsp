<%@page import="controllers.ContatoController"%>
<%@page import="models.Contato"%>
<%@page import="utils.Conexao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta Contato</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body class="bg-dark text-white">
	<div class="container">
		<%@ include file="./menu.jsp"%>

		<h1 class="text-center mt-5 mb-5">Contatos</h1>

		<table class="table table-dark table-hover">
			<thead class="table-info">
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Email</th>
					<th>A��es</th>
				</tr>
			</thead>
			<tbody>
				<!-- preenche de forma dinamica -->
				<%
				ContatoController contatoController = new ContatoController();
				List<Contato> contatos = contatoController.getContatos();
				for (Contato contato : contatos) {
				%>
				<tr>
					<td><%=contato.getId()%></td>
					<td><%=contato.getNome()%></td>
					<td><%=contato.getEmail()%></td>
					<td>
						<!-- Bot�es de editar e excluir com par�metros --> <a
						href='./editarContato.jsp?id=<%=contato.getId()%>'
						class='btn btn-outline-primary btn-sm'>Editar</a> <a
						href="javascript:void(0);"
						onclick="confirmarExclusao(<%=contato.getId()%>)"
						class='btn btn-outline-danger btn-sm'>Excluir</a>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<script>
		function confirmarExclusao(id) {
			if (confirm('Tem certeza de que deseja excluir este contato?')) {
				window.location.href = './recebeDadosEditar.jsp?id=' + id + '&operacao=excluir';
			}
		}
	</script>
</body>
</html>