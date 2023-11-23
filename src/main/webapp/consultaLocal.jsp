<%@page import="controllers.LocalController"%>
<%@page import="models.Local"%>
<%@page import="utils.Conexao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		
		<h1 class="text-center mt-5 mb-5">Locais</h1>

		<table class="table table-dark table-hover">
			<thead class="table-info">
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Rua</th>
					<th>N�mero</th>
					<th>Bairro</th>
					<th>Cidade</th>
					<th>Estado</th>
					<th>Cep</th>
					<th>A��es</th>
				</tr>
			</thead>
			<tbody>
				<!-- preenche de forma dinamica -->
				<%
				LocalController localController = new LocalController();
				List<Local> locais = localController.getLocais();
				for (Local local : locais) {
				%>
				<tr>
					<td><%=local.getId()%></td>
					<td><%=local.getNome()%></td>
					<td><%=local.getRua()%></td>
					<td><%=local.getNumero()%></td>
					<td><%=local.getBairro()%></td>
					<td><%=local.getCidade()%></td>
					<td><%=local.getEstado()%></td>
					<td><%=local.getCep()%></td>
					<td>
					    <!-- Bot�es de editar e excluir com par�metros -->
					    <a href='./editarLocal.jsp?id=<%= local.getId() %>' class='btn btn-outline-primary btn-sm'>Editar</a>
					    <a href="javascript:void(0);" onclick="confirmarExclusao(<%= local.getId() %>)" class='btn btn-outline-danger btn-sm'>Excluir</a>
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
				window.location.href = './recebeDadosEditarLocal.jsp?id=' + id + '&operacao=excluir';
			}
		}
	</script>
</body>
</html>