<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8200001.jsp"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<jsp:include page="header_ex3_8200001.jsp"/>
	
	</head>
<body>	

	<div class="container theme-showcase" role="main">

		<div class="alert alert-success text-center" role="alert">Η έξοδος πραγματοποιηθηκε με επιτυχία</div>		

	</div>
	<!-- /container -->

	<jsp:include page="footer_ex3_8200001.jsp"/>

	
</body>
</html>
