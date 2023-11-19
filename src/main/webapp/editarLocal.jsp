<%@page import="models.Local"%>
<%@page import="controllers.LocalController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Locais</title>
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
		LocalController cc = new LocalController();

		Local local = cc.consultarByID(Integer.parseInt(id));
		%>
		<h1 class="text-center mt-5 mb-5">Editar Local</h1>
		<form action="recebeDadosLocal.jsp?" method="POST">

			<div class="row mb-3">
				<div class="col">
					<label class="form-label">ID</label> <input class="form-control"
						type="text" readonly="readonly" name="id"
						value=<%out.print(local.getId());%>>
				</div>
				<div class="col">
					<label class="form-label" for="cep">Informe cep</label> <input
						class="form-control" maxlength="9" type="text" id="cep"
						value=<%out.print(local.getCep());%> onblur="verEndereco()">
				</div>
				<div class="col">
					<label class="form-label" for="rua">Informe o Nome do Local</label>
					<input class="form-control me-2" type="text" id="local"
						value=<%out.print(local.getNome());%>>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="rua">Informe a rua</label> <input
						class="form-control me-2" type="text" id="rua"
						value=<%out.print(local.getRua());%>>
				</div>
				<div class="col">
					<laber for="numero">Informe o número</laber>
					<input class="form-control" type="number" id="numero"
						value=<%out.print(local.getNumero());%>>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<laber for="numero">Informe o bairro</laber>
					<input class="form-control" type="text" id="bairro"
						value=<%out.print(local.getBairro());%>>
				</div>
				<div class="col">
					<laber for="numero">Informe o cidade</laber>
					<input class="form-control" type="text" id="cidade"
						value=<%out.print(local.getCidade());%>>
				</div>
				<div class="col">
					<laber for="numero">Informe o estado</laber>
					<input class="form-control" type="text" id="estado"
						value=<%out.print(local.getEstado());%>>
				</div>
			</div>

			<div class="mt-5 d-flex justify-content-around">
				<button onclick="verEndereco()" class="btn btn-primary">Ver
					endereço</button>
				<button onclick="validaDados()" class="btn btn-success">Enviar</button>
				<input type="reset" class="btn btn-outline-danger" />
			</div>
	</div>
	<script>
       async function verEndereco(){
            var inputCep = document.getElementById("cep").value;
			var url = "http://viacep.com.br/ws/" + inputCep + "/json/";
            fetch(url)
	        .then(response => response.json())
	        .then(data => {
	            console.log(data);
	            document.getElementById("rua").value = data.logradouro;
	            document.getElementById("bairro").value = data.bairro;
	            document.getElementById("cidade").value = data.localidade;
	            document.getElementById("estado").value = data.uf;
	        })
	        .catch(error => {
	            console.error('Erro:', error);
	        });
        }
       	function validaDados(){	    	
           event.preventDefault();
           var inputNome =  document.getElementById("nome")
           var inputEmail = document.getElementById("local")
           var inputRua = document.getElementById("local")
           
           if(inputNome.value == ''){
                alert("Informe o nome")
                inputNome.focus()
                return
           }
           if(inputEmail.value == ''){
           	alert("Informe o email")
           	inputEmail.focus()
           	return
           }
          document.getElementsByTagName("form")[0].submit() // Se tudo estiver preenchido, envia o formulário
       }
    </script>
</body>
</html>
