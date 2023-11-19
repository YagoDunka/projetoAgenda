<%@page import="models.Local"%>
<%@page import="controllers.LocalController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<form action="recebeDadosEditarLocal.jsp" method="POST">

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
					<input class="form-control me-2" type="text" id="nome"
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
					<label for="numero">Informe o número</label>
					<input class="form-control" type="number" id="numero"
						value=<%out.print(local.getNumero());%>>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="numero">Informe o bairro</label>
					<input class="form-control" type="text" id="bairro"
						value=<%out.print(local.getBairro());%>>
				</div>
				<div class="col">
					<label for="numero">Informe o cidade</label>
					<input class="form-control" type="text" id="cidade"
						value=<%out.print(local.getCidade());%>>
				</div>
				<div class="col">
					<label for="numero">Informe o estado</label>
					<input class="form-control" type="text" id="estado"
						value=<%out.print(local.getEstado());%>>
				</div>
			</div>

			<div class="mt-5 d-flex justify-content-around">
				<button onclick="verEndereco()" class="btn btn-outline-secondary">Ver endereço</button>
				<button onclick="validaDados()" class="btn btn-outline-success">Enviar</button>
				<button onclick="cancelar()" class="btn btn-outline-danger">Cancelar</button>
				<input type="reset" class="btn btn-outline-warning" />
			</div>
		</form>
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
       	function cancelar() {
       	    window.location.href = "./consultaLocal.jsp";
       	}
       	function validaDados(){	    	
       		event.preventDefault();
            var inputNome =  document.getElementById("nome");
            var inputCep = document.getElementById("cep");
            var inputRua = document.getElementById("rua");
            var inputNumero = document.getElementById("numero");
            var inputBairro = document.getElementById("bairro");
            var inputCidade = document.getElementById("cidade");
            var inputEstado = document.getElementById("estado");
            
            if(inputNome.value == ''){
                 alert("Informe o nome")
                 inputNome.focus()
                 return
            }
            if(inputCep.value == ''){
            	alert("Informe o CEP")
            	inputEmail.focus()
            	return
            }
          document.getElementsByTagName("form")[0].submit() // Se tudo estiver preenchido, envia o formulário
       }
    </script>
</body>
</html>
