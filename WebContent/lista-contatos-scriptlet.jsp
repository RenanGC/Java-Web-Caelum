<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, br.com.caelum.agenda.dao.*, br.com.caelum.agenda.modelo.*, java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
   	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<c:import url="cabecalho.jsp"/>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereço</th>
				<th>Data de Nascimento</th>
			</tr>
		</thead>
		<%
		ContatoDao dao= new ContatoDao();
		List <Contato> contatos = dao.getLista();
		
		SimpleDateFormat sdf= new SimpleDateFormat(" dd,mm,yyyy ");
		
			for(Contato contato: contatos){
			%>
				<tr>
					<td><%=contato.getNome() %></td>
					<td><%=contato.getEmail() %></td>
					<td><%=contato.getEndereco() %></td>
					<td><%=sdf.format(contato.getDataNascimento().getTime())%></td>
					
				</tr>
		<%
			}
		%>
			</table>
	<c:import url="rodape.jsp"/>
		</body>
									
</html>