<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Alta de Personas</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<body>
		<table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
				<th scope="col">DNI</th>
	      <th scope="col">Nombre</th>
	      <th scope="col">Apellido</th>
	      <th scope="col">Fecha de Nacimiento</th>
				<th scope="col">Nacionalidad</th>
				<th scope="col">Telefono Móvil</th>
				<th scope="col">Telefono Fijo</th>
				<th scope="col">eMail</th>
				<th scope="col">Direccion 1</th>
				<th scope="col">Direccion 2</th>
	    </tr>
	  </thead>
	  <tbody>
	    <%-- <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>@mdo</td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>@fat</td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>
	      <td>Larry</td>
	      <td>the Bird</td>
	      <td>@twitter</td>
	    </tr> --%>
	  </tbody>
	</table>
		<form action="/rest/person/add" method="post">
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
		<form class="Buscar por Apellido" action="/rest/person/search" method="get">
  <input type="Apellido" placeholder="Apellido..." required/ >
  <button type="Enviar">buscar</button>
</form>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/js/add_person.js"></script>
</html>
