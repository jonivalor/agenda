<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Alta de Personas</title>
	</head>
	<body>
		<form action="/agenda/add/person" method="post">
			<input type="hidden" id="person" name="person" />
			<input type="text" id="dni" placeholder="DNI..." required />
			<input type="text" id="name" placeholder="Nombre..." required />
			<input type="text" id="surname" placeholder="Apellido..." required />
			<input type="text" id="birthday" placeholder="Fecha de Nacimiento..." required />
			<input type="text" id="nationality" placeholder="Nacionalidad..." required />
			<input type="text" id="mobile_phone" placeholder="Telefono Móvil..." required />
			<input type="text" id="land_line" placeholder="Telefono Fijo..." />
			<input type="text" id="email" placeholder="eMail..." required />
			<input type="text" id="address1" placeholder="Direccion..." required />
			<input type="text" id="address2" placeholder="Direccion..." />
			<button id="addPersonButton">Enviar</button>
		</form>
		<form class="Buscar por Apellido" action="/agenda/search/person" method="get">
  <input type="Apellido" placeholder="Apellido..." required/ >
  <button type="Enviar">buscar</button>
</form>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/js/add_person.js"></script>
</html>
