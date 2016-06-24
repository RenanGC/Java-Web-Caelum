<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="cabecalho.jsp"/>
	<!-- cria DAO -->
	<jsp:useBean id="dao" class= "br.com.caelum.agenda.dao.ContatoDao"/>
	
	<table border="3">
		<thead>
			<tr bgcolor = #cccccc>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereço</th>
				<th>Data de Nascimento</th>
			</tr>
		</thead>
		<!-- percorre toda a lista de contatos-->
		<c:forEach var="contato" items="${dao.lista}" varStatus="id">
			<tr bgcolor="#${id.count %2 ==0? '#00FF00' : '#F0FFFF'}"}>
			
			
				<td>${contato.nome}</td>
					<td>
						<c:if test="${not empty contato.email}">
							<a href="mailto:${contato.email}">${contato.email}</a>
						</c:if>
						<c:if test="${empty contato.email}">
							E-mail não informado
						</c:if>
					</td>				
				<td>${contato.endereco}</td>
				<td> <fmt:formatDate value="${contato.dataNascimento.time}"
					pattern= "dd/MM/yyyy"/>
					</td>
			</tr>
		</c:forEach>
	</table>	
<c:import url="rodape.jsp"/>
</body>
</html>