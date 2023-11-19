<%@page import="models.Contato"%>
<%@page import="controllers.ContatoController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadaastro de Contatos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body class="bg-dark text-white">
	<div class="container">
		<%@ include file="./menu.jsp"%>
		<%
		String id = request.getParameter("id");
		ContatoController cc = new ContatoController();

		Contato contato = cc.consultarByID(Integer.parseInt(id));
		%>

		<h1 class="text-center mt-5 mb-5">Editar Contato</h1>
		<form action="recebeDadosEditar.jsp?" method="POST">
			<div>
				<label class="form-label">ID</label> <input class="form-control"
					type="text" readonly="readonly" name="id"
					value=<%out.print(id);%>>
			</div>
			<div>
				<label class="form-label">Informe nome</label> <input
					class="form-control" type="text" placeholder="Informe nome"
					name="nome" id="nome" value=<%out.print(contato.getNome());%>>
			</div>
			<div class="mt-3">
				<label class="form-label">Informe email</label> <input
					class="form-control" type="email" placeholder="Informe email"
					name="email" value=<%out.print(contato.getEmail());%>>
			</div>
			<div class="mt-5 d-flex justify-content-between">
				<button onclick="validaDados()" class="btn btn-outline-primary">Enviar</button>
				<input type="reset" class="btn btn-outline-danger" />
			</div>
		</form>
	</div>
	<script>
	    function validaDados(){	    	
	        event.preventDefault();
	    	
	        var inputNome =  document.getElementById("nome")
	        if(inputNome.value == ''){
	             alert("Informe nome")
	             inputNome.focus()
	             return
	        }
	        if(inputEmail.value == ''){
	        	alert("Informe o email")
	        	inputEmail.focus()
	        	return
	        }
           document.getElementsByTagName("form")[0].submit()
	    }
	        
	        
	</script>
</body>
</html>