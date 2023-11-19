<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

		<h1 class="text-center mt-5 mb-5">Cadastrar Locais</h1>
		<form action="recebeDadosLocal.jsp" method="POST">

			<div class="row mb-3">
				<div class="col">
					<label class="form-label" for="cep">Informe cep</label> <input
						class="form-control" maxlength="9" type="text" id="cep"
						placeholder="Informe o cep (88000-000)" onblur="verEndereco()">
				</div>
				<div class="col">
					<label class="form-label" for="rua">Informe o Nome do Local</label>
					<input class="form-control me-2" type="text" id="nome"
						placeholder="Nome do local">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="rua">Informe a rua</label> <input
						class="form-control me-2" type="text" id="rua"
						placeholder="Informe a rua">
				</div>
				<div class="col">
					<label for="numero">Informe o número</label>
					<input class="form-control" type="number" id="numero"
						placeholder="Informe o número">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="numero">Informe o bairro</label>
					<input class="form-control" type="text" id="bairro"
						placeholder="Informe o bairro">
				</div>
				<div class="col">
					<label for="numero">Informe o cidade</label>
					<input class="form-control" type="text" id="cidade"
						placeholder="Informe a cidade">
				</div>
				<div class="col">
					<label for="numero">Informe o estado</label>
					<input class="form-control" type="text" id="estado"
						placeholder="UF">
				</div>
			</div>

			<div class="mt-5 d-flex justify-content-around">
				<button onclick="validaDados()" class="btn btn-outline-success">Enviar</button>
				<button onclick="verEndereco()" class="btn btn-outline-secondary">Ver	endereço</button>
				<input type="reset" class="btn btn-outline-danger" />
			</div>
		</form>
		<div class="container-fluid mt-5">
			<div class="row justify-content-center align-items-center"
				style="height: 100vh;">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3551.816880085617!2d-48.909812390262424!3d-27.099069300915808!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94df47f96d105bf5%3A0xb04bb57fad0c19d3!2sFaculdade%20Senac%20Brusque!5e0!3m2!1spt-BR!2sbr!4v1700348066454!5m2!1spt-BR!2sbr"
					width="800" height="600" style="border: 0;" allowfullscreen=""
					loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
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
