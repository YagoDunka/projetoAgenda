<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agenda Eletronica</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<style>
        body {
            max-height: 1000px; /* Defina a altura máxima desejada */
            overflow-y: auto; /* Adiciona a barra de rolagem vertical quando necessário */
        }
         .custom-col {
            width: 250px; /* Defina o tamanho desejado para as colunas */
            height: 100%;
        }
    </style>
</head>

<body class="bg-dark text-white">
	<div class="container">
		<%@ include file="./menu.jsp"%>

		<h1 class="text-center mt-5 mb-5">Minha Agenda Particular!</h1>

		<div class="row justify-content-center">
			<div class="col-sm-3 custom-col mb-3 mb-sm-0">
				<div class="card text-bg-light text-center mb-3">
					<div class="card-body">
						<h5 class="card-title">Adicionar Contato</h5>
						<p class="card-text">Adicione novos contatos a sua agenda.</p>
						<a href="./cadastroContato.jsp" class="btn btn-primary">Cadastrar</a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 custom-col mb-3 mb-sm-0">
				<div class="card text-bg-light text-center mb-3">
					<div class="card-body">
						<h5 class="card-title">Consultar Contato</h5>
						<p class="card-text">Consulte e edite os contatos da sua agenda</p>
						<a href="./consultaContato.jsp" class="btn btn-primary">Consultar</a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 custom-col mb-3 mb-sm-0">
				<div class="card text-bg-light text-center mb-3">
					<div class="card-body">
						<h5 class="card-title">Adicionar Locais</h5>
						<p class="card-text">Adicione locais a sua agenda</p>
						<a href="./cadastroLocal.jsp" class="btn btn-primary">Adicionar</a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 custom-col mb-3 mb-sm-0">
				<div class="card text-bg-light text-center mb-3">
					<div class="card-body">
						<h5 class="card-title">Consultar Locais</h5>
						<p class="card-text">Consulte e edite seus locais</p>
						<a href="./consultaLocal.jsp" class="btn btn-primary">Consultar</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-sm-3 custom-col mb-3 mb-sm-0">
				<div class="card text-bg-light text-center mb-3">
					<div class="card-body">
						<h5 class="card-title">Compromissos</h5>
						<p class="card-text">Agende novos compromissos</p>
						<a href="./cadastroCompromisso.jsp" class="btn btn-primary">Adicionar</a>
					</div>
				</div>
			</div>
			<div class="col-sm-3 custom-col mb-3 mb-sm-0">
				<div class="card text-bg-light text-center mb-3">
					<div class="card-body">
						<h5 class="card-title">Compromissos</h5>
						<p class="card-text">Consulte e edite seus compromissos</p>
						<a href="#" class="btn btn-primary">Consultar</a>
					</div>
				</div>
			</div>
		</div>
		<figure class="text-center mt-5 mb-5">
			<blockquote class="blockquote">
				<p>O homem para ser completo tem que estudar, trabalhar e lutar.</p>
			</blockquote>
			<figcaption class="blockquote-footer">
				<cite title="Source Title">Sócrates</cite>
			</figcaption>
		</figure>
	</div>
	
</body>
</html>