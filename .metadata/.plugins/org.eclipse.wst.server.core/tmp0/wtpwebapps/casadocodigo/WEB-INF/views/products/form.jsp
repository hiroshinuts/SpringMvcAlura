<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro De Produtos</title>
</head>
<body>
	<spring:hasBindErrors name="product">
		<ul>
			<c:forEach var="error" items="${errors.allErrors}">
			<li><spring:message code="${error.code}"
			text="${error.defaultMessage}"/></li>
			</c:forEach>
		</ul>
	</spring:hasBindErrors>

	<form:form action="${spring:mvcUrl('PC#save').build()}" method="post" commandName="product" enctype="multipart/form-data">
		<div>
			<label for="titulo">Titulo</label>
			<form:input path="title"/>
			<form:errors path="title"/>
		</div>
		<div>
			<label for="descricao">Descri��o</label>
			<form:textarea path="description" rows="10" cols="20"/>
			<form:errors path="description"/>
		</div>
		<div>
			<label for="numeroPaginas">N�mero de paginas</label>
			<form:input path="pages"/>
			<form:errors path="pages"/>
		</div>
		<div>
			<label for="releaseDate">Data de lan�amento</label>
			<form:input path="releaseDate" type="date"/>			
			<form:errors path="releaseDate"/>
		</div>	
	
			<c:forEach items="${bookTypes}" var="bookType" varStatus="status">
				<div>
					<label for="preco_${bookType}">${bookType}</label>
					<input type="text" name="prices[${status.index}].value" id="preco_${bookType}"/>
					<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"/>
				</div>
			</c:forEach>
		</div>
		</div>
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form:form>

</body>
</html>